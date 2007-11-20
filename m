Received: from [67.19.73.58] (helo=pug.o-hand.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <openembedded@haerwu.biz>) id 1IuRA1-0001Hb-Id
	for openembedded-devel@lists.openembedded.org;
	Tue, 20 Nov 2007 12:20:57 +0100
Received: from home.lan (c62-222.icpnet.pl [62.21.62.222])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by pug.o-hand.com (Postfix) with ESMTP id A7F37E2A54C
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Nov 2007 06:10:16 -0500 (EST)
From: Marcin Juszkiewicz <openembedded@haerwu.biz>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 20 Nov 2007 11:46:28 +0100
User-Agent: KMail/1.9.7
References: <20071119120819.GA17788@lenovo> <4741FB41.7080602@trolltech.com>
	<1195551213.6337.9.camel@localhost.localdomain>
In-Reply-To: <1195551213.6337.9.camel@localhost.localdomain>
MIME-Version: 1.0
Message-Id: <200711201146.29678.openembedded@haerwu.biz>
Subject: Re: Getting Started -Makefile
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
X-List-Received-Date: Tue, 20 Nov 2007 11:20:57 -0000
Content-Type: text/plain;
  charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Dnia wtorek, 20 listopada 2007, Richard Purdie napisa=B3:

> Users end up realising that everything is either an SCM command ("svn
> up" for Poky) or a bitbake one. Neither are complicated programs to
> learn. Yes monotone is more complex than svn but all you really need to
> know is "mtn pull;mtn up" and even then, understanding why there are
> two commands actually teaches you something important about the SCM.
> Hiding them from the user just creates a =A0phobia of using the real
> tools.

And updating can also be handled by 'first step'. My setup-oe.sh script=20
updates BitBake and OE, set env vars and put me into build dir.

=2D-=20
JID: hrw-jabber.org
OpenEmbedded developer/consultant

    The fact that no one understands you doesn't mean you're an artist.


