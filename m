Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1M4IVW-0007By-LJ
	for openembedded-devel@openembedded.org; Wed, 13 May 2009 19:44:42 +0200
Received: (qmail 8060 invoked by uid 813007); 13 May 2009 17:37:57 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO home.localnet)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 13 May 2009 17:37:57 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 13 May 2009 19:37:00 +0200
User-Agent: KMail/1.11.2 (Linux/2.6.30-rc3-00005-g51bc6b7-dirty; KDE/4.2.2;
	x86_64; ; )
References: <1242226019-10881-1-git-send-email-marcin@juszkiewicz.com.pl>
	<1242226019-10881-7-git-send-email-marcin@juszkiewicz.com.pl>
	<guen3q$p5u$1@ger.gmane.org>
In-Reply-To: <guen3q$p5u$1@ger.gmane.org>
MIME-Version: 1.0
Message-Id: <200905131937.17911.marcin@juszkiewicz.com.pl>
Subject: Re: [PATCH 6/6] angstrom: use GCC 4.3.3 for Geode devices
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
X-List-Received-Date: Wed, 13 May 2009 17:44:42 -0000
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Dnia =C5=9Broda, 13 maja 2009 o 16:56:58 Koen Kooi napisa=C5=82(a):

> > +++ b/conf/distro/angstrom-2008.1.conf

> > +ANGSTROM_GCC_VERSION_geode      =3D "4.3.3"

> NAK, this would interfere with an outstanding patch that Graeme and I
> are testing:
>
> http://dominion.thruhere.net/koen/OE/angstrom-dev-toolchain.diff

OK, I dropped 6/6 patch from local branch and added your change. Will do=20
build from scratch and test on device.

Regards,=20
=2D-=20
JID:      hrw@jabber.org
Website:  http://marcin.juszkiewicz.com.pl/
LinkedIn: http://www.linkedin.com/in/marcinjuszkiewicz




