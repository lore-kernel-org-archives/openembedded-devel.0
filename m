Received: from pasmtpb.tele.dk ([80.160.77.98])
	by linuxtogo.org with esmtp (Exim 4.69) (envelope-from <sgh@sgh.dk>)
	id 1NWpFc-0005P4-7o for openembedded-devel@lists.openembedded.org;
	Mon, 18 Jan 2010 11:54:31 +0100
Received: from mail.mikrofyn.com (cpe.ge-0-2-0-951.faaqnqu1.customer.tele.dk
	[93.167.193.22])
	by pasmtpB.tele.dk (Postfix) with ESMTP id D60B4E30492
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Jan 2010 11:21:30 +0100 (CET)
Received: from koontz.localnet ([10.0.1.94]) by mail.mikrofyn.com with
	Microsoft SMTPSVC(6.0.3790.3959); Mon, 18 Jan 2010 11:22:04 +0100
From: =?iso-8859-1?q?S=F8ren_Holm?= <sgh@sgh.dk>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 18 Jan 2010 11:21:29 +0100
User-Agent: KMail/1.12.4 (Linux/2.6.33-020633rc4-generic; KDE/4.3.4; i686; ; )
References: <201001172228.26477.sgh@sgh.dk> <201001180046.29318.sgh@sgh.dk>
	<Pine.LNX.4.64.1001171912530.12229@juice.ott.cti.com>
In-Reply-To: <Pine.LNX.4.64.1001171912530.12229@juice.ott.cti.com>
MIME-Version: 1.0
Message-Id: <201001181121.29393.sgh@sgh.dk>
X-OriginalArrivalTime: 18 Jan 2010 10:22:04.0140 (UTC)
	FILETIME=[145F8AC0:01CA9828]
X-SA-Exim-Connect-IP: 80.160.77.98
X-SA-Exim-Mail-From: sgh@sgh.dk
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Mesa packages and TLS
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
X-List-Received-Date: Mon, 18 Jan 2010 10:54:31 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Mandag 18 januar 2010 01:16:26 skrev Michael Smith:
>=20
> Which version of xserver-xorg? It also inherits glx-use-tls, so
> _glapi_tls_Context should be there if you've rebuilt since August 24.
>=20

The ensure that stuff is not changing we have based us on
OE commit eb0805d926c8cf4c1f48d21ee9402786c3209df9

bitbake -i tells me=20
xserver-xorg_1.7.3.bb

=2D-=20
Mvh./ Best regards

S=F8ren Holm

Software developer=20

MIKROFYN A/S
Bondovej 16
DK - 5250 Odense SV

E-mail: soeren.holm@mikrofyn.com =20
Web:    www.mikrofyn.com=20
Phone:  +45 6617 0716
Mobile: +45 4212 9477
=46ax:    +45 6617 0785


