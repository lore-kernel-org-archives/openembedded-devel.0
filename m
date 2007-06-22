Received: from [202.173.155.195] (helo=birgitte.twibble.org)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <lenehan@twibble.org>) id 1I1bGj-0003yd-LS
	for openembedded-devel@lists.openembedded.org;
	Fri, 22 Jun 2007 07:01:15 +0200
Received: from localhost (localhost.localdomain [127.0.0.1])
	by birgitte.twibble.org (Postfix) with ESMTP id EE76011089F;
	Fri, 22 Jun 2007 14:57:18 +1000 (EST)
Received: from birgitte.twibble.org ([127.0.0.1])
	by localhost (birgitte [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 12616-09; Fri, 22 Jun 2007 14:57:18 +1000 (EST)
Received: from nynaeve.twibble.org (nynaeve.twibble.org [202.173.155.194])
	by birgitte.twibble.org (Postfix) with ESMTP id 7506A110810;
	Fri, 22 Jun 2007 14:57:18 +1000 (EST)
Received: by nynaeve.twibble.org (Postfix, from userid 500)
	id 679B6B70149; Fri, 22 Jun 2007 14:57:18 +1000 (EST)
Date: Fri, 22 Jun 2007 14:57:18 +1000
From: Jamie Lenehan <lenehan@twibble.org>
To: =?iso-8859-1?Q?Lu=EDs?= Cargnini <lvcargnini@gmail.com>
Message-ID: <20070622045718.GA8358@twibble.org>
References: <ae36f8040706060937la8400adr2f98d7db547a2664@mail.gmail.com>
	<ae36f8040706061036i3662ee38x104bb1896550b64@mail.gmail.com>
	<ae36f8040706061143o47650436we993cf24bd807174@mail.gmail.com>
	<ae36f8040706071545i772205b2m85d251b45c7f26d7@mail.gmail.com>
	<20070613123908.GA19284@twibble.org>
	<ae36f8040706130931r4e81a08bi8ca10417336df3b5@mail.gmail.com>
	<20070614013553.GA4558@twibble.org>
	<ae36f8040706131940x128ce3b5ic2422b3fc5f6c99d@mail.gmail.com>
	<20070614025356.GA6177@twibble.org>
	<ae36f8040706200948o54d0ec92qb94eb5c379bad1fd@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <ae36f8040706200948o54d0ec92qb94eb5c379bad1fd@mail.gmail.com>
User-Agent: Mutt/1.5.12-2006-07-14
X-Virus-Scanned: by amavisd at twibble.org
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: problems doing bitbake task-base
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 22 Jun 2007 05:01:27 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 20, 2007 at 01:48:00PM -0300, Lu=EDs Cargnini wrote:
> Please can add the Gentoo patch as suggested ?

Not yet.

The patch will break builds using older glibc's... the question is
how old? I think it'll be that old that it doesn't matter, but until
I've verified that I don't want to push this change.

Did you try upgrading to the latest linux-headers? I thought this had
been re-added in the lastest version of the linux-headers (of
whatever gentoo calls it) and that gentoo had update the later
version?

> I emailed the list some days ago, this will make perl compile in any sy=
stem
> without errors I suppose

Any recent system.

--=20
 Jamie Lenehan <lenehan@twibble.org>


