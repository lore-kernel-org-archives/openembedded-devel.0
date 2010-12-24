Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1PW7hn-0003vi-Jp for openembedded-devel@lists.openembedded.org;
	Fri, 24 Dec 2010 14:29:11 +0100
Received: from f053044232.adsl.alicedsl.de ([78.53.44.232]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1PW7hf-0007ix-KA for openembedded-devel@lists.openembedded.org;
	Fri, 24 Dec 2010 13:29:03 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 24 Dec 2010 14:29:02 +0100
Message-ID: <1293197342.4027.2.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: =?UTF-8?B?W1BBVENIXSB4Ym1jX3N2bjogYXBwbHkgdXBzdHJlYW0gcGF0Y2ggwrtjb21wbGV0ZSByZXBsYWNlbWVudCBvZiBsaWJsem8gd2l0aCBsaWJsem8yLCBsaW51eCB3YXMgYWxyZWFkeSBsaWJsem8ywqs=?=
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
X-List-Received-Date: Fri, 24 Dec 2010 13:29:11 -0000
X-Groupsio-MsgNum: 27479
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-Fqzv4C9WgozYC+pGlFtd"

--=-Fqzv4C9WgozYC+pGlFtd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Date: Tue, 30 Nov 2010 16:45:26 +0100

Task `compile` fails with `/bin/grep: /usr/lib/libz.la: No such file or dir=
ectory`.

	| make -C ..
	| make[2]: Entering directory `/oe/build-angstrom-next/angstrom-dev/work/a=
rmv7a-angstrom-linux-gnueabi/xbmc-10.05-r9+gitr0+e2ab481ebe964321c358ab9d64=
02088c714adcbe/git/lib/libass'
	|  cd . && /bin/sh ./config.status Makefile
	| config.status: creating Makefile
	| make[2]: Leaving directory `/oe/build-angstrom-next/angstrom-dev/work/ar=
mv7a-angstrom-linux-gnueabi/xbmc-10.05-r9+gitr0+e2ab481ebe964321c358ab9d640=
2088c714adcbe/git/lib/libass'
	| make[2]: Entering directory `/oe/build-angstrom-next/angstrom-dev/work/a=
rmv7a-angstrom-linux-gnueabi/xbmc-10.05-r9+gitr0+e2ab481ebe964321c358ab9d64=
02088c714adcbe/git/lib/libass'
	| make[3]: Entering directory `/oe/build-angstrom-next/angstrom-dev/work/a=
rmv7a-angstrom-linux-gnueabi/xbmc-10.05-r9+gitr0+e2ab481ebe964321c358ab9d64=
02088c714adcbe/git/lib/libass'
	| Making all in libass
	| make[4]: Entering directory `/oe/build-angstrom-next/angstrom-dev/work/a=
rmv7a-angstrom-linux-gnueabi/xbmc-10.05-r9+gitr0+e2ab481ebe964321c358ab9d64=
02088c714adcbe/git/lib/libass/libass'
	|  cd .. && /bin/sh ./config.status libass/Makefile depfiles
	| config.status: creating libass/Makefile
	| config.status: executing depfiles commands
	| make[4]: Leaving directory `/oe/build-angstrom-next/angstrom-dev/work/ar=
mv7a-angstrom-linux-gnueabi/xbmc-10.05-r9+gitr0+e2ab481ebe964321c358ab9d640=
2088c714adcbe/git/lib/libass/libass'
	| make[4]: Entering directory `/oe/build-angstrom-next/angstrom-dev/work/a=
rmv7a-angstrom-linux-gnueabi/xbmc-10.05-r9+gitr0+e2ab481ebe964321c358ab9d64=
02088c714adcbe/git/lib/libass/libass'
	|   CC    ass.o
	|   CC    ass_cache.o
	|   CC    ass_font.o
	|   CC    ass_fontconfig.o
	|   CC    ass_render.o
	|   CC    ass_utils.o
	|   CC    ass_bitmap.o
	|   CC    ass_library.o
	|   CC    ass_drawing.o
	|   CC    ass_parse.o
	|   CC    ass_strtod.o
	|   LINK  libass.la
	| arm-angstrom-linux-gnueabi-libtool: link: warning: library `/oe/build-an=
gstrom-next/angstrom-dev/sysroots/armv7a-angstrom-linux-gnueabi/usr/lib/lib=
freetype.la' was moved.
	| /bin/grep: /usr/lib/libz.la: No such file or directory
	| /bin/sed: can't read /usr/lib/libz.la: No such file or directory
	| arm-angstrom-linux-gnueabi-libtool: link: `/usr/lib/libz.la' is not a va=
lid libtool archive
	| make[4]: *** [libass.la] Error 1
	| make[4]: Leaving directory `/oe/build-angstrom-next/angstrom-dev/work/ar=
mv7a-angstrom-linux-gnueabi/xbmc-10.05-r9+gitr0+e2ab481ebe964321c358ab9d640=
2088c714adcbe/git/lib/libass/libass'
	| make[3]: *** [all-recursive] Error 1
	| make[3]: Leaving directory `/oe/build-angstrom-next/angstrom-dev/work/ar=
mv7a-angstrom-linux-gnueabi/xbmc-10.05-r9+gitr0+e2ab481ebe964321c358ab9d640=
2088c714adcbe/git/lib/libass'
	| make[2]: *** [all] Error 2
	| make[2]: Leaving directory `/oe/build-angstrom-next/angstrom-dev/work/ar=
mv7a-angstrom-linux-gnueabi/xbmc-10.05-r9+gitr0+e2ab481ebe964321c358ab9d640=
2088c714adcbe/git/lib/libass'
	| make[1]: *** [../libass/.libs/libass.so] Error 2
	| make[1]: Leaving directory `/oe/build-angstrom-next/angstrom-dev/work/ar=
mv7a-angstrom-linux-gnueabi/xbmc-10.05-r9+gitr0+e2ab481ebe964321c358ab9d640=
2088c714adcbe/git/lib/libass/xbmc'
	| make: *** [dvdpcodecs] Error 2
	| FATAL: oe_runmake failed
	| ERROR: Function do_compile failed
	NOTE: package xbmc-10.05-r9+gitr0+e2ab481ebe964321c358ab9d6402088c714adcbe=
: task do_compile: Failed
	ERROR: TaskFailed event exception, aborting
	ERROR: Build of /oe/openembedded/recipes/xbmc/xbmc_svn.bb do_compile faile=
d
	ERROR: Task 13 (/oe/openembedded/recipes/xbmc/xbmc_svn.bb, do_compile) fai=
led with 256
	ERROR: '/oe/openembedded/recipes/xbmc/xbmc_svn.bb' failed
	ERROR: '/oe/openembedded/recipes/xbmc/xbmc_svn.bb' failed
	ERROR: '/oe/openembedded/recipes/xbmc/xbmc_svn.bb' failed

A fix was provided upstream in changeset 35484 [1][2] and on the list by Er=
ic Colleu [3].

This patch is build tested with `angstrom-2008.1` and `minimal`.

[1] http://trac.xbmc.org/changeset/35484
[2] https://github.com/xbmc/xbmc/commit/9e765ccae4ef9753c94b793f44931d84f65=
ca99c
[3] http://lists.linuxtogo.org/pipermail/openembedded-devel/2010-November/0=
27418.html

Signed-off-by: Paul Menzel <paulepanter@users.sourceforge.net>
---
 recipes/xbmc/xbmc/0012-fix-lzo-things.patch |   45 +++++++++++++++++++++++=
++++
 recipes/xbmc/xbmc_svn.bb                    |    3 +-
 2 files changed, 47 insertions(+), 1 deletions(-)
 create mode 100644 recipes/xbmc/xbmc/0012-fix-lzo-things.patch

diff --git a/recipes/xbmc/xbmc/0012-fix-lzo-things.patch b/recipes/xbmc/xbm=
c/0012-fix-lzo-things.patch
new file mode 100644
index 0000000..f4fb7ef
--- /dev/null
+++ b/recipes/xbmc/xbmc/0012-fix-lzo-things.patch
@@ -0,0 +1,45 @@
+status: applied
+origin: https://github.com/xbmc/xbmc/commit/9e765ccae4ef9753c94b793f44931d=
84f65ca99c
+
+Index: /tools/TexturePacker/Makefile.in
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+--- /tools/TexturePacker/Makefile.in	(revision 33752)
++++ /tools/TexturePacker/Makefile.in	(revision 35484)
+@@ -3,5 +3,5 @@
+ DEFINES =3D=20
+ ifeq ($(findstring osx,$(ARCH)),osx)
+-LIBS =3D ../../xbmc/lib/libsquish/libsquish-@ARCH@.a -L/opt/local/lib -lS=
DL_image -lSDL -llzo
++LIBS =3D ../../xbmc/lib/libsquish/libsquish-@ARCH@.a -L/opt/local/lib -lS=
DL_image -lSDL -llzo2
+ else
+ LIBS =3D ../../xbmc/lib/libsquish/libsquish-@ARCH@.a -lSDL_image -lSDL -l=
lzo2
+Index: /tools/TexturePacker/XBMCTex.cpp
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+--- /tools/TexturePacker/XBMCTex.cpp	(revision 35328)
++++ /tools/TexturePacker/XBMCTex.cpp	(revision 35484)
+@@ -41,5 +41,5 @@
+=20
+ #ifdef _LINUX
+-#include <lzo1x.h>
++#include <lzo/lzo1x.h>
+ #else
+ #include "../../xbmc/lib/liblzo/LZO1X.H"
+Index: /configure.in
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+--- /configure.in	(revision 35468)
++++ /configure.in	(revision 35484)
+@@ -1074,5 +1074,4 @@
+ AC_HEADER_STDC
+ AC_HEADER_SYS_WAIT
+-AC_CHECK_HEADERS([lzo/lzo1.h])
+ AC_CHECK_HEADERS([arpa/inet.h fcntl.h float.h inttypes.h limits.h locale.=
h \
+   malloc.h memory.h netdb.h netinet/in.h stddef.h stdint.h stdlib.h strin=
g.h \
+@@ -1186,10 +1185,4 @@
+ else
+   final_message=3D"$final_message\n  MID Support:\tNo"
+-fi
+-
+-if test -d "/usr/include/lzo"; then
+-  INCLUDES=3D"$INCLUDES -I/usr/include/lzo"
+-else
+-  INCLUDES=3D"$INCLUDES"
+ fi
diff --git a/recipes/xbmc/xbmc_svn.bb b/recipes/xbmc/xbmc_svn.bb
index ad95a8a..9ae7cbe 100644
--- a/recipes/xbmc/xbmc_svn.bb
+++ b/recipes/xbmc/xbmc_svn.bb
@@ -7,7 +7,7 @@ require recipes/egl/egl.inc
 SRCREV =3D "e2ab481ebe964321c358ab9d6402088c714adcbe"
=20
 PV =3D "10.05"
-PR =3D "r9"
+PR =3D "r10"
 PR_append =3D "+gitr${SRCPV}"
=20
 SRC_URI =3D "git://xbmc.git.sourceforge.net/gitroot/xbmc/xbmc;protocol=3Dg=
it;branch=3Dmaster \
@@ -22,6 +22,7 @@ file://0008-configure.in-also-pass-down-target-when-using=
-host-a.patch \
 file://0009-Added-a-configure-option-disable-optical-drive.patch \
 file://0010-Fixed-so-compile-worked-when-disabling-optical.patch \
 file://0011-reverted-so-normal-bootstrap-doesn-t-exclude-gnu-con.patch \
+file://0012-fix-lzo-things.patch \
 "
=20
 inherit autotools gettext
--=20
1.7.2.3

--=-Fqzv4C9WgozYC+pGlFtd
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAk0UoBgACgkQPX1aK2wOHVheOQCfdE7ooHnxVxd8MWZwyvjHEUdN
peIAn38Z/OPzc2zTklOUpJ7Sc0athLfM
=TLNr
-----END PGP SIGNATURE-----

--=-Fqzv4C9WgozYC+pGlFtd--
