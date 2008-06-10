Received: from [194.106.48.114] (helo=tim.rpsys.net ident=0)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1K6C5p-0007zf-Tx
	for openembedded-devel@openembedded.org; Wed, 11 Jun 2008 00:13:30 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m5AM820F031670
	for <openembedded-devel@openembedded.org>;
	Tue, 10 Jun 2008 23:08:02 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 31536-05 for <openembedded-devel@openembedded.org>;
	Tue, 10 Jun 2008 23:07:57 +0100 (BST)
Received: from [192.168.1.3] (dax.rpnet.com [192.168.1.3])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m5AM7s9v031647
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@openembedded.org>;
	Tue, 10 Jun 2008 23:07:54 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <484ED558.7070907@bolloretelecom.eu>
References: <g2h415$pk1$1@ger.gmane.org> <484ED558.7070907@bolloretelecom.eu>
Date: Tue, 10 Jun 2008 23:07:53 +0100
Message-Id: <1213135673.5013.60.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.12.1 
X-Virus-Scanned: amavisd-new at rpsys.net
X-MIME-Autoconverted: from 8bit to quoted-printable by tim.rpsys.net id
	m5AM820F031670
Subject: Re: pkg_postinst_* not working anymore -> broken packages
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 10 Jun 2008 22:13:30 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Tue, 2008-06-10 at 21:26 +0200, Jeremy Lain=C3=A9 wrote:
> Any chance of getting bitbake commit r1072 backed out soon (the one tha=
t
> broke the postins* scripts), because for now pinning to r1071 is pretty
> much the only sane way to get a sane build environment?

As already mentioned, its already gone.

My current bitbake plans are something like:

a) Merge some kind of environment sanity patches
b) Some testing to make sure the above doesn't break anything (a week?)
c) Release bitbake 1.8.12

Are there any other open bitbake issues we need to account for before we
make a new release?

Cheers,

Richard




