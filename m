Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1HvClM-00078v-B1
	for openembedded-devel@openembedded.org; Mon, 04 Jun 2007 15:38:24 +0200
Received: from Powerbook-2.local (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l54DaCLr018150 for <openembedded-devel@openembedded.org>;
	Mon, 4 Jun 2007 15:36:13 +0200
Message-ID: <4664154E.5000302@dominion.kabel.utwente.nl>
Date: Mon, 04 Jun 2007 15:36:14 +0200
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 2.0.0.0 (Macintosh/20070326)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <ae36f8040706040616y6de8ab01hb8699de1fbd239b2@mail.gmail.com>
In-Reply-To: <ae36f8040706040616y6de8ab01hb8699de1fbd239b2@mail.gmail.com>
X-Enigmail-Version: 0.95.0
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: koen@dominion.kabel.utwente.nl
X-Spam-Status: No
X-MIME-Autoconverted: from 8bit to quoted-printable by smtp.utwente.nl id
	l54DaCLr018150
Subject: Re: target os of angstrom
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
X-List-Received-Date: Mon, 04 Jun 2007 13:38:24 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Lu=C3=ADs Cargnini schreef:
> please how to set the angstrom distro not to
> TARGET_OS      =3D "linux-gnueabi"
>=20
> but to
> TARGET_OS      =3D "linux-gnu"
>=20
> according to distro this is set to eabi (big-endian) and i need
> little-endian

Wrong. arm-angstrom-linux-gnueabi is little-endian, armeb-angstrom-linux-=
gnueabi
bigendian. Note how 'eabi' has nothing to do with endiannes
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFGZBVOMkyGM64RGpERArU/AJ9e09YEV3/MGra5HtCLzJWqRYhfhACfaUfU
G0kj4pg1KPgjT+BCzFulAZc=3D
=3DOGGK
-----END PGP SIGNATURE-----


