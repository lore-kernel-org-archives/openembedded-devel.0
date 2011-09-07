Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1R1FsE-00052t-Sa for openembedded-devel@lists.openembedded.org;
	Wed, 07 Sep 2011 13:00:54 +0200
Received: from f053046110.adsl.alicedsl.de ([78.53.46.110]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1R1FnT-00045P-Se for openembedded-devel@lists.openembedded.org;
	Wed, 07 Sep 2011 10:56:00 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 07 Sep 2011 12:55:53 +0200
In-Reply-To: <1315385957-13742-1-git-send-email-sylvain.pare@gmail.com>
References: <1315385957-13742-1-git-send-email-sylvain.pare@gmail.com>
X-Mailer: Evolution 3.0.3- 
Message-ID: <1315392954.17658.16.camel@mattotaupa>
Mime-Version: 1.0
Subject: Re: [PATCH v2] binutils: update to 2.21.1a
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
X-List-Received-Date: Wed, 07 Sep 2011 11:00:54 -0000
X-Groupsio-MsgNum: 34117
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature"; 
	boundary="=-/axx3+dM/ORFjzG7W/vv"

--=-/axx3+dM/ORFjzG7W/vv
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Sylvain,


Am Mittwoch, den 07.09.2011, 10:59 +0200 schrieb Sylvain 'GarthPS' Par=C3=
=A9:
> I did finally a complet rework of my patch. It will be the last one as I =
should better work
> on new oe than on old one.

this text is not suitable for a commit message.

> This patch use an ugly copy/past of libtool-2.4-update.patch from oe-core=
 to overwrite it but it worked here.
> For thos interested.

Why is that necessary? Did the old one not work?

> Signed-off-by: Sylvain 'GarthPS' Par=C3=A9 <sylvain.pare@gmail.com>
> ---
>  conf/distro/include/sane-toolchain.inc             |    2 +-
>  .../110-arm-eabi-conf.patch                        |    0
>  .../binutils-2.16.1-e300c2c3.patch                 |    0
>  ...tils-2.16.91.0.6-objcopy-rename-errorcode.patch |    0
>  .../binutils-2.19.1-ld-sysroot.patch               |    0
>  .../binutils-arm-pr7093.patch                      |    0
>  .../binutils-uclibc-100-uclibc-conf.patch          |    0
>  ...binutils-uclibc-300-001_ld_makefile_patch.patch |    0
>  ...binutils-uclibc-300-006_better_file_error.patch |    0
>  ...ils-uclibc-300-012_check_ldrunpath_length.patch |    0
>  .../binutils-uclibc-gas-needs-libm.patch           |    0
>  .../fix-clone-conflicts.patch                      |    0
>  .../binutils-2.21.1a/libtool-2.4-update.patch      |18730 ++++++++++++++=
+++++
>  .../binutils-2.21/libtool-2.4-update.patch         |18731 --------------=
------
>  ...s-sdk_2.21.bb =3D> binutils-cross-sdk_2.21.1a.bb} |    0
>  ...ils-cross_2.21.bb =3D> binutils-cross_2.21.1a.bb} |    0
>  recipes/binutils/binutils_2.21.1a.bb               |   21 +
>  recipes/binutils/binutils_2.21.bb                  |   21 -
>  18 files changed, 18752 insertions(+), 18753 deletions(-)
>  rename recipes/binutils/{binutils-2.21 =3D> binutils-2.21.1a}/110-arm-ea=
bi-conf.patch (100%)
>  rename recipes/binutils/{binutils-2.21 =3D> binutils-2.21.1a}/binutils-2=
.16.1-e300c2c3.patch (100%)
>  rename recipes/binutils/{binutils-2.21 =3D> binutils-2.21.1a}/binutils-2=
.16.91.0.6-objcopy-rename-errorcode.patch (100%)
>  rename recipes/binutils/{binutils-2.21 =3D> binutils-2.21.1a}/binutils-2=
.19.1-ld-sysroot.patch (100%)
>  rename recipes/binutils/{binutils-2.21 =3D> binutils-2.21.1a}/binutils-a=
rm-pr7093.patch (100%)
>  rename recipes/binutils/{binutils-2.21 =3D> binutils-2.21.1a}/binutils-u=
clibc-100-uclibc-conf.patch (100%)
>  rename recipes/binutils/{binutils-2.21 =3D> binutils-2.21.1a}/binutils-u=
clibc-300-001_ld_makefile_patch.patch (100%)
>  rename recipes/binutils/{binutils-2.21 =3D> binutils-2.21.1a}/binutils-u=
clibc-300-006_better_file_error.patch (100%)
>  rename recipes/binutils/{binutils-2.21 =3D> binutils-2.21.1a}/binutils-u=
clibc-300-012_check_ldrunpath_length.patch (100%)
>  rename recipes/binutils/{binutils-2.21 =3D> binutils-2.21.1a}/binutils-u=
clibc-gas-needs-libm.patch (100%)
>  rename recipes/binutils/{binutils-2.21 =3D> binutils-2.21.1a}/fix-clone-=
conflicts.patch (100%)
>  create mode 100644 recipes/binutils/binutils-2.21.1a/libtool-2.4-update.=
patch
>  delete mode 100644 recipes/binutils/binutils-2.21/libtool-2.4-update.pat=
ch
>  rename recipes/binutils/{binutils-cross-sdk_2.21.bb =3D> binutils-cross-=
sdk_2.21.1a.bb} (100%)
>  rename recipes/binutils/{binutils-cross_2.21.bb =3D> binutils-cross_2.21=
.1a.bb} (100%)
>  create mode 100644 recipes/binutils/binutils_2.21.1a.bb
>  delete mode 100644 recipes/binutils/binutils_2.21.bb

[=E2=80=A6]

Anyway, the build fails with your patch.

        NOTE: package binutils-cross-2.21.1a-r14.3: task do_patch: Started
        ERROR: Execution of 'quilt --quiltrc=3D/oe/build-minimal-eglibc/min=
imal-dev/sysroots/i686-linux/usr/bin/quiltrc push' failed with exit code 1:
        Applying patch binutils-uclibc-100-uclibc-conf.patch
        patching file configure
        Hunk #1 FAILED at 2206.
        Hunk #2 FAILED at 2504.
        2 out of 2 hunks FAILED -- rejects in file configure
        patching file gprof/configure
        Hunk #1 FAILED at 4124.
        1 out of 1 hunk FAILED -- rejects in file gprof/configure
        Patch binutils-uclibc-100-uclibc-conf.patch does not apply (enforce=
 with -f)

NOTE: package binutils-cross-2.21.1a-r14.3: task patch_do_patch: Failed
ERROR: Function 'patch_do_patch' failed


Thanks,

Paul

--=-/axx3+dM/ORFjzG7W/vv
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk5nTbkACgkQPX1aK2wOHVgWggCeKOPr3znuIttw7Mju0Vym18dR
JFIAnjGeC/TTMc/3GIMfFk9TjXs+g2/1
=xijX
-----END PGP SIGNATURE-----

--=-/axx3+dM/ORFjzG7W/vv--
