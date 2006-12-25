Received: from [82.195.149.148] (helo=xen.inhex.net)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <dion@inhex.net>) id 1GydVh-0007Ow-AJ
	for openembedded-devel@openembedded.org; Mon, 25 Dec 2006 01:16:09 +0100
Received: from localhost ([127.0.0.1]:1393 helo=debian.deb)
	by xen.inhex.net with esmtp (Exim 4.63)
	(envelope-from <dion@inhex.net>) id 1GydVw-0004vw-Kz
	for openembedded-devel@openembedded.org; Mon, 25 Dec 2006 00:16:28 +0000
Received: from dion by debian.deb with local (Exim 4.63)
	(envelope-from <dion@inhex.net>) id 1GydWL-0005se-1t
	for openembedded-devel@openembedded.org; Mon, 25 Dec 2006 02:16:49 +0200
Date: Mon, 25 Dec 2006 02:16:48 +0200
From: Dmitry Nezhevenko <dion@inhex.net>
To: openembedded-devel@openembedded.org
Message-ID: <20061225001648.GA21942@debian.deb>
MIME-Version: 1.0
User-Agent: Mutt/1.5.13 (2006-08-11)
Subject: Trying to build opie-image
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
X-List-Received-Date: Mon, 25 Dec 2006 00:16:09 -0000
X-Groupsio-MsgNum: 1010
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="dDRMvlgZJXvWKvBx"
Content-Disposition: inline

--dDRMvlgZJXvWKvBx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi. I'm just trying to build target opie-image. After some time of
building i get:

OE Build Configuration:
BB_VERSION     =3D "1.6.3"
OE_REVISION    =3D "8eaefa4f638dc67e29fb59fca3c6a98e4049eb09"
TARGET_ARCH    =3D "arm"
TARGET_OS      =3D "linux"
MACHINE        =3D "a780"
DISTRO         =3D "ezx"
DISTRO_VERSION =3D ".dev-snapshot-20061225"
TARGET_FPU     =3D "soft"

NOTE: multiple providers are available (glibc, glibc-intermediate);
NOTE: consider defining PREFERRED_PROVIDER_virtual/arm-linux-libc-for-gcc
ERROR: Nothing provides dependency task-bootstrap
ERROR: dependency task-bootstrap (for opie-image) not satisfied
NOTE: no buildable providers for opie-image

Any ideas?

--=20
WBR, Dmitry

--dDRMvlgZJXvWKvBx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQFFjxhw0T/aIlRaJQYRAn7rAJ9TPoTz8o5IQEy+iqlzBPzroEa8QQCaA0mK
WdUGW4/3CHVqcY4CXD0ugvk=
=Msd6
-----END PGP SIGNATURE-----

--dDRMvlgZJXvWKvBx--
