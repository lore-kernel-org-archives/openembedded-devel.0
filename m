Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1PxiQF-0003R7-8S for openembedded-devel@lists.openembedded.org;
	Thu, 10 Mar 2011 17:09:07 +0100
Received: from f053036145.adsl.alicedsl.de ([78.53.36.145]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1PxiOj-00011S-07 for openembedded-devel@lists.openembedded.org;
	Thu, 10 Mar 2011 16:07:33 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <4D78F0F4.9000908@gmail.com>
References: <1299768051.3853.21.camel@mattotaupa>
	<4D78E882.5040307@mentor.com>  <4D78F0F4.9000908@gmail.com>
Date: Thu, 10 Mar 2011 17:07:32 +0100
Message-ID: <1299773252.3853.22.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
Subject: Re: help2man-native: task configure fails with `configure: error: perl module Locale::gettext required`
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
X-List-Received-Date: Thu, 10 Mar 2011 16:09:07 -0000
X-Groupsio-MsgNum: 30039
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-rKYfkFeNZyGThQ3333KN"

--=-rKYfkFeNZyGThQ3333KN
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Donnerstag, den 10.03.2011, 16:40 +0100 schrieb Marco Cavallini:
> Tom Rini ha scritto, Il 10/03/2011 16:04:

> > Is this a uclibc target perhaps?

> Not mine, is this
>=20
> Build Configuration:
> BB_VERSION        =3D "1.10.2"
> METADATA_BRANCH   =3D "master"
> METADATA_REVISION =3D "40a8506"
> TARGET_ARCH       =3D "arm"
> TARGET_OS         =3D "linux-gnueabi"
> MACHINE           =3D "ronetix-pm9263"
> DISTRO            =3D "angstrom"
> DISTRO_VERSION    =3D "2010.7-test-20110310"
> TARGET_FPU        =3D "soft"

No, I get this error using `angstrom-2008.1`, `minimal` and
`minimal-uclibc`.


Thanks,

Paul

--=-rKYfkFeNZyGThQ3333KN
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk1490QACgkQPX1aK2wOHVilEwCcCwv8oO2knuCGTED+tDxf0BIq
RkAAn29SIQO0Ifu0NVX+LMG+DbNrWuce
=htyb
-----END PGP SIGNATURE-----

--=-rKYfkFeNZyGThQ3333KN--
