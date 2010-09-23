Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1Oyhyx-00028q-Dh for openembedded-devel@lists.openembedded.org;
	Thu, 23 Sep 2010 11:20:48 +0200
Received: from f053045061.adsl.alicedsl.de ([78.53.45.61]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1Oyhyt-0001Ko-Mr for openembedded-devel@lists.openembedded.org;
	Thu, 23 Sep 2010 09:20:43 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1285167492-4786-1-git-send-email-schnitzeltony@gmx.de>
References: <1285167492-4786-1-git-send-email-schnitzeltony@gmx.de>
Date: Thu, 23 Sep 2010 11:20:42 +0200
Message-ID: <1285233642.3691.4.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
X-SA-Exim-Connect-IP: 188.40.100.199
X-SA-Exim-Mail-From: paulepanter@users.sourceforge.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH v2] clutter-gtk: Bump to 0.10.8
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
X-List-Received-Date: Thu, 23 Sep 2010 09:20:48 -0000
X-Groupsio-MsgNum: 23872
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-JUKhObUCSclUwaIcAzgX"

--=-JUKhObUCSclUwaIcAzgX
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Mittwoch, den 22.09.2010, 16:58 +0200 schrieb Andreas Mueller:

Signed-off-by line is missing. Please add this when you commit.

[=E2=80=A6]

I build tested this recipe with `MACHINE =3D "beagleboard"` and the
following distributions and tool chains.

1. minimal (LIBC =3D "glibc")
2. minimal (LIBC =3D "glibc"; PREFERRED_GCC_VERSION =3D "4.5"; PREFERRED_BI=
NUTILS =3D "2.20.1")
3. minimal (LIBC =3D "eglibc")
4. minimal (LIBC =3D "eglibc"; PREFERRED_GCC_VERSION =3D "4.5"; PREFERRED_B=
INUTILS =3D "2.20.1")
5. =C8=A6ngstr=C3=B6m 2008.1

I could not test the following combinations because of build errors in
the dependencies.

1. minimal-uclibc
/powervr-drivers/libgles-omap3_3.01.00.07.bb
2. =C8=A6ngstr=C3=B6m 2008.1 with GCC* 4.5 and Binutils 2.20.1
gettext 0.18.0

Acked-by: Paul Menzel <paulepanter@users.sourceforge.net>=20

--=-JUKhObUCSclUwaIcAzgX
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAkybG94ACgkQPX1aK2wOHVglJQCeLqxcYmm35EC22lSFgW3MX2h7
9Q8AnR0RZ362xEFXRprXF7ACnwXson2v
=mocj
-----END PGP SIGNATURE-----

--=-JUKhObUCSclUwaIcAzgX--
