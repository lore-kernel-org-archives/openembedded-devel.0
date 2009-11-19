Received: from host4.kei.pl ([195.149.226.213] helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1NB6zW-0004ew-Fh
	for openembedded-devel@lists.openembedded.org;
	Thu, 19 Nov 2009 14:24:09 +0100
Received: (qmail 2973 invoked by uid 813007); 19 Nov 2009 13:22:43 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO home.localnet)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 19 Nov 2009 13:22:43 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 19 Nov 2009 14:22:42 +0100
User-Agent: KMail/1.12.2 (Linux/2.6.32-rc7-00029-ga9366e6-dirty; KDE/4.3.2;
	x86_64; ; )
References: <B44D4D5BF344094DABB900C4E0F6E3533945A36F15@srv02.nortechonline.net>
In-Reply-To: <B44D4D5BF344094DABB900C4E0F6E3533945A36F15@srv02.nortechonline.net>
MIME-Version: 1.0
Message-Id: <200911191422.43470.marcin@juszkiewicz.com.pl>
X-SA-Exim-Connect-IP: 195.149.226.213
X-SA-Exim-Mail-From: marcin@juszkiewicz.com.pl
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Which distro for OE development?
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
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
X-List-Received-Date: Thu, 19 Nov 2009 13:24:09 -0000
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Dnia czwartek, 19 listopada 2009 o 14:06:43 Hodgson, Simon napisa=C5=82(a):

> I'm setting up a new machine with Linux specifically to use for
>  OpenEmbedded development. Which Linux distro should I go with?
>=20
> I'm looking to make it as easy as possible to get started, so ideally all
>  the packages I need will be available from that distro's standard
>  repositry.
>=20
> I've tried SuSE in the past and given up trying to get all of the required
> tools installed, and more recently been using Debian, but the Python
> version in Debian is a few versions behind and there was talk of OE soon
> requiring a more up to date version.

OpenEmbedded require Python 2.4 or newer. Debian lenny (stable) and squeeze=
=20
(testing) should work fine. I use 'sid' for development.

> Ubuntu is a good candidate at the moment as I belive there won't be any
> hardware issues with the laptop I want to use, but this wiki page suggests
> there's some faffing to do
> http://wiki.openembedded.net/index.php/Gcc_issues_in_Intrepid_and_later
> which I'd like to avoid if possible - does anyone know if these issues are
> present in the latest version 9.10?

I use OpenEmbedded on Ubuntu 8.04 machine and Poky on 8.04/9.04/9.10 withou=
t=20
problems.=20

So I suggest Debian 'testing' or Ubuntu 9.10/9.04 as a base.

Regards,=20
=2D-=20
JID:      hrw@jabber.org
Website:  http://marcin.juszkiewicz.com.pl/
LinkedIn: http://www.linkedin.com/in/marcinjuszkiewicz




