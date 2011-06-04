Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1QSvCo-0007vh-08 for openembedded-devel@lists.openembedded.org;
	Sat, 04 Jun 2011 20:04:14 +0200
Received: from f053045003.adsl.alicedsl.de ([78.53.45.3] helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1QSvAO-0000c9-0S; Sat, 04 Jun 2011 18:01:44 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1307209126.4456.21.camel@mattotaupa>
References: <1307209126.4456.21.camel@mattotaupa>
Date: Sat, 04 Jun 2011 20:01:00 +0200
Message-ID: <1307210460.4456.24.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.3 
Cc: Eric BENARD <eric@eukrea.com>
Subject: Re: [PATCH] Revert "busybox_1.18.4.bb: Fix checksums of busybox-1.18.4-hush.patch"
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
X-List-Received-Date: Sat, 04 Jun 2011 18:04:14 -0000
X-Groupsio-MsgNum: 32505
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-ghI2jacjrL5iy06W8+1n"

--=-ghI2jacjrL5iy06W8+1n
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear OpenEmbedded folks,


Am Samstag, den 04.06.2011, 19:38 +0200 schrieb Paul Menzel:
> Date: Sat, 4 Jun 2011 19:35:03 +0200
>=20
> This reverts commit 688b8dc036f504ae1bdf1736bf211a0c62de03f8.
>=20
>         commit 688b8dc036f504ae1bdf1736bf211a0c62de03f8
>         Author: Khem Raj <raj.khem@gmail.com>
>         Date:   Fri Jun 3 11:38:12 2011 -0700
>        =20
>             busybox_1.18.4.bb: Fix checksums of busybox-1.18.4-hush.patch
>            =20
>             Signed-off-by: Khem Raj <raj.khem@gmail.com>
>=20
> The old checksums are the ones I get when downloading the patch.
>=20
>         $ zless minimal-dev/work/armv7a-oe-linux-gnueabi/busybox-1.18.4-r=
43.2/temp/log.do_fetch
>         NOTE: The checksums for 'busybox-1.18.4-hush.patch' did not match=
.
>         Expected MD5: '91005640b4b434ab5029fa5a0349a33c' and Got: 'a81f2d=
7d3bdf1a35ab77c4414a530d38'
>         Expected SHA256: 'e76da947c40784c9a0527c38b1e9edb615c80cfe911d28b=
9d8a5d67a492bf67c' and Got: 'c87e73ad942d53c8a2a5ffe6037c1cdf52d4b20d3f29ca=
ae5fffc7a99009b7cb'
>         NOTE: Your checksums:
>         SRC_URI[patch01.md5sum] =3D "a81f2d7d3bdf1a35ab77c4414a530d38"
>         SRC_URI[patch01.sha256sum] =3D "c87e73ad942d53c8a2a5ffe6037c1cdf5=
2d4b20d3f29caae5fffc7a99009b7cb"

[=E2=80=A6]

Please ignore this patch as I had the old patch file in cached my
download directory.

Is there a way in BitBake to check and redownload a file if the
checksums do not match?

Another solution would be to handle all patches in OpenEmbedded
directly.


Thanks,

Paul

--=-ghI2jacjrL5iy06W8+1n
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk3qctwACgkQPX1aK2wOHVjc/QCeIrbDn6/5By5qaBULg7jRnFLX
enAAmwdGbpMLLc4ldy0TSjN6yABFi94T
=sJqa
-----END PGP SIGNATURE-----

--=-ghI2jacjrL5iy06W8+1n--
