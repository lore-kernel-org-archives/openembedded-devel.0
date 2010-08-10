Received: from host4.kei.pl ([195.149.226.213] helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1Oitx9-0002Qr-7y
	for openembedded-devel@lists.openembedded.org;
	Tue, 10 Aug 2010 20:53:36 +0200
Received: (qmail 28170 invoked by uid 813007); 10 Aug 2010 18:46:03 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO home.localnet)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 10 Aug 2010 18:46:03 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 10 Aug 2010 20:46:20 +0200
User-Agent: KMail/1.13.5 (Linux/2.6.35-10-generic; KDE/4.5.0; x86_64; ; )
References: <1281462087-4693-1-git-send-email-fransmeulenbroeks@gmail.com>
In-Reply-To: <1281462087-4693-1-git-send-email-fransmeulenbroeks@gmail.com>
MIME-Version: 1.0
Message-Id: <201008102046.21370.marcin@juszkiewicz.com.pl>
X-SA-Exim-Connect-IP: 195.149.226.213
X-SA-Exim-Mail-From: marcin@juszkiewicz.com.pl
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=unavailable version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFC] add maintainers to distro conf files, move or remove orphaned distro's, remove obsolete distro's
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
X-List-Received-Date: Tue, 10 Aug 2010 18:53:38 -0000
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Dnia wtorek, 10 sierpnia 2010 o 19:41:27 Frans Meulenbroeks napisa=C5=82(a):
=20
> celinux-test.conf
>   Not listed in MAINTAINERS
>   created by Marcin Juszkiewicz in 2006

Created for CELF and their testlab. No idea is it in use or not. Probably T=
im=20
Bird would be a good contact. IIRC it was Angstrom fork.
=20
> gmustix.conf
>   Not listed in MAINTAINERS
>   created by Marcin Juszkiewicz in 2006

I did not created it. Maybe I pushed someone's patch.
=20
> iphone-compat.conf
>   Not listed in MAINTAINERS
>   created by eremy Laine in 2009

Imported from Poky or based on it probably.
=20
> maemo5-compat.conf
>   Not listed in MAINTAINERS
>   created by Marcin Juszkiewicz in 2010

Created by Robert Schuster and edited/merged by me.
=20
> nylon.conf
>   Not listed in MAINTAINERS
>   created by Martin Dietze in 2009

IIRC it is older then 2009 even.
=20
> openmn.conf
>   Not listed in MAINTAINERS
>   created by nslu2-linux.adm@bkbits.net (!) in 2005

Maintained outside of OE tree and not merged back.
=20
> openwrt-sdk.conf
>   Not listed in MAINTAINERS

Created in 2008/2009 to use OpenEmbedded to build packages compatible with=
=20
OpenWRT. Worth staying.
=20
> sharprom-compatible.conf
>   Not listed in MAINTAINERS
>   probbly also created by nslu2-linux.adm@bkbits.net, but file has been
> touched by several people

Rolf 'Laibsch' Leggewie is closest to being maintainer of it.
=20
> ucslugc.conf
>   Not listed in MAINTAINERS
>   created by John Bowler in 2005, content is mostly from Rod Whitby
> (2006/2007)

Yet another nslu2 distro - no idea is it in use.
=20
> wrt54oe.conf
>   Not listed in MAINTAINERS
>   created by Chris Larson in 2005, content is mostly from Marcin
> Juszkiewicz (2005)

Gives packages which can be installed under OpenWRT 8.x (WhiteRussian).
=20
> Distro's mentioned in MAINTAINERS but with no entry in conf/distro:
>   arago (Denys Dmytriyenko)

External tree.

>   familiar (Erik Hovland)

Dead, already removed from OE.

>   Sonkei (Rolf 'Laibsch' Leggewie, Matthias 'CoreDump' Hentges)

OpenZaurus clone - was maintained externally.

>   openzaurus (Richard Purdie)

Dead, already removed from OE.

Regards,=20
=2D-=20
JID:      hrw@jabber.org
Website:  http://marcin.juszkiewicz.com.pl/
LinkedIn: http://www.linkedin.com/in/marcinjuszkiewicz




