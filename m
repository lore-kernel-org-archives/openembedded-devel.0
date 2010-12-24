Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1PWCt7-00067h-7t for openembedded-devel@lists.openembedded.org;
	Fri, 24 Dec 2010 20:01:13 +0100
Received: from f053044232.adsl.alicedsl.de ([78.53.44.232]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1PWCsz-0006PB-2Q for openembedded-devel@lists.openembedded.org;
	Fri, 24 Dec 2010 19:01:05 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1293197342.4027.2.camel@mattotaupa>
References: <1293197342.4027.2.camel@mattotaupa>
Date: Fri, 24 Dec 2010 20:01:03 +0100
Message-ID: <1293217263.4027.38.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: =?UTF-8?B?UmU6IFtQQVRDSCAyLzIgdjJdIHhibWNfc3ZuOiBhcHBseSB1cHN0cmVhbSBwYXRjaCDCu2NvbXBsZXRlIHJlcGxhY2VtZW50IG9mIGxpYmx6byB3aXRoIGxpYmx6bzIsIGxpbnV4IHdhcyBhbHJlYWR5IGxpYmx6bzLCqw==?=
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
X-List-Received-Date: Fri, 24 Dec 2010 19:01:13 -0000
X-Groupsio-MsgNum: 27491
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-eldTugQf48g8Ubg3+iVu"

--=-eldTugQf48g8Ubg3+iVu
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Date: Tue, 30 Nov 2010 16:45:26 +0100

Task `compile` fails with `/bin/grep: /usr/lib/libz.la: No such file or dir=
ectory`.

	| SDL_anigif.c:1: warning: switch -mcpu=3Dcortex-a8 conflicts with -march=
=3D switch
	| arm-angstrom-linux-gnueabi-g++ -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=
=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb -MD -c -isystem/o=
e/build/angstrom-dev/sysroots
	/armv7a-angstrom-linux-gnueabi/usr/include -fexpensive-optimizations -fren=
ame-registers -fomit-frame-pointer -O2 -ggdb2 -fpermissive -fvisibility-inl=
ines-hidden -fPIC -DPIC -D_REEN
	TRANT -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=3D64 -g -D_DEBUG -Wall -O2=
 -mfloat-abi=3Dsoftfp -mno-apcs-stack-check -Wa,-march=3Darmv7a -mcpu=3Dcor=
tex-a8 -mfpu=3Dneon -mvectorize-with-neon
	-quad -isystem/oe/build/angstrom-dev/sysroots/armv7a-angstrom-linux-gnueab=
i/usr/include -fexpensive-optimizations -frename-registers -fomit-frame-poi=
nter -O2 -ggdb2 -fper
	missive -fvisibility-inlines-hidden -fPIC -DPIC -D_REENTRANT -D_LARGEFILE6=
4_SOURCE -D_FILE_OFFSET_BITS=3D64 -g -D_DEBUG -Wall -O2 -mfloat-abi=3Dsoftf=
p -mno-apcs-stack-check -Wa,-march=3D
	armv7a -mcpu=3Dcortex-a8 -mfpu=3Dneon -mvectorize-with-neon-quad -isystem/=
oe/build/angstrom-dev/sysroots/armv7a-angstrom-linux-gnueabi/usr/include -f=
expensive-optimizations -
	frename-registers -fomit-frame-pointer -O2 -ggdb2 -fpermissive -fvisibilit=
y-inlines-hidden -fPIC -DPIC -D_REENTRANT -D_LARGEFILE64_SOURCE -D_FILE_OFF=
SET_BITS=3D64 -g -D_DEBUG -Wall -
	O2 -mfloat-abi=3Dsoftfp -mno-apcs-stack-check -Wa,-march=3Darmv7a -mcpu=3D=
cortex-a8 -mfpu=3Dneon -mvectorize-with-neon-quad  -D_LINUX -D_FILE_DEFINED=
 -D__STDC_CONSTANT_MACROS -DBIN_INSTALL
	_PATH=3D"\"/usr/lib/xbmc\"" -DINSTALL_PATH=3D"\"/usr/share/xbmc\"" -DHAS_S=
DL_JOYSTICK -D'SVN_REV=3D"Unknown"' -D_ARMEL -DHAVE_CONFIG_H  -I../../xbmc/=
utils -I../../guilib -I../../xbmc/lin
	ux -I../../xbmc/lib/libsquish -D_GNU_SOURCE=3D1 -D_REENTRANT -I/oe/build/a=
ngstrom-dev/sysroots/armv7a-angstrom-linux-gnueabi/usr/include/ -I/oe/build=
/angstrom-dev
	/sysroots/armv7a-angstrom-linux-gnueabi/usr/include/SDL -I/oe/build/angstr=
om-dev/sysroots/armv7a-angstrom-linux-gnueabi/usr/include/alsa -I/oe/build/=
angstrom-de
	v/sysroots/armv7a-angstrom-linux-gnueabi/usr/include/dbus-1.0 -I/oe/build/=
angstrom-dev/sysroots/armv7a-angstrom-linux-gnueabi/usr/include/freetype2 -=
I/oe/build/
	angstrom-dev/sysroots/armv7a-angstrom-linux-gnueabi/usr/include/fribidi -I=
/oe/build/angstrom-dev/sysroots/armv7a-angstrom-linux-gnueabi/usr/include/g=
lib-2.0 -I/
	oe/build/angstrom-dev/sysroots/armv7a-angstrom-linux-gnueabi/usr/include/l=
ibpng12 -I/oe/build/angstrom-dev/sysroots/armv7a-angstrom-linux-gnueabi/usr=
/lib/dbus-1.0/include
	 -I/oe/build/angstrom-dev/sysroots/armv7a-angstrom-linux-gnueabi/usr/lib/g=
lib-2.0/include -I/oe/build/angstrom-dev/sysroots/i686-linux/usr/armv7a/inc=
lude -I/hom
	e/paul/oe/build/angstrom-dev/work/armv7a-angstrom-linux-gnueabi/xbmc-10.05=
-r9+gitr0+e2ab481ebe964321c358ab9d6402088c714adcbe/git XBTFWriter.cpp -o XB=
TFWriter.o
	| XBTFWriter.cpp:1: warning: switch -mcpu=3Dcortex-a8 conflicts with -marc=
h=3D switch
	| arm-angstrom-linux-gnueabi-g++ -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=
=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb -MD -c -isystem/o=
e/build/angstrom-dev/sysroots
	/armv7a-angstrom-linux-gnueabi/usr/include -fexpensive-optimizations -fren=
ame-registers -fomit-frame-pointer -O2 -ggdb2 -fpermissive -fvisibility-inl=
ines-hidden -fPIC -DPIC -D_REEN
	TRANT -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=3D64 -g -D_DEBUG -Wall -O2=
 -mfloat-abi=3Dsoftfp -mno-apcs-stack-check -Wa,-march=3Darmv7a -mcpu=3Dcor=
tex-a8 -mfpu=3Dneon -mvectorize-with-neon
	-quad -isystem/oe/build/angstrom-dev/sysroots/armv7a-angstrom-linux-gnueab=
i/usr/include -fexpensive-optimizations -frename-registers -fomit-frame-poi=
nter -O2 -ggdb2 -fper
	missive -fvisibility-inlines-hidden -fPIC -DPIC -D_REENTRANT -D_LARGEFILE6=
4_SOURCE -D_FILE_OFFSET_BITS=3D64 -g -D_DEBUG -Wall -O2 -mfloat-abi=3Dsoftf=
p -mno-apcs-stack-check -Wa,-march=3D
	armv7a -mcpu=3Dcortex-a8 -mfpu=3Dneon -mvectorize-with-neon-quad -isystem/=
oe/build/angstrom-dev/sysroots/armv7a-angstrom-linux-gnueabi/usr/include -f=
expensive-optimizations -
	frename-registers -fomit-frame-pointer -O2 -ggdb2 -fpermissive -fvisibilit=
y-inlines-hidden -fPIC -DPIC -D_REENTRANT -D_LARGEFILE64_SOURCE -D_FILE_OFF=
SET_BITS=3D64 -g -D_DEBUG -Wall -
	O2 -mfloat-abi=3Dsoftfp -mno-apcs-stack-check -Wa,-march=3Darmv7a -mcpu=3D=
cortex-a8 -mfpu=3Dneon -mvectorize-with-neon-quad  -D_LINUX -D_FILE_DEFINED=
 -D__STDC_CONSTANT_MACROS -DBIN_INSTALL
	_PATH=3D"\"/usr/lib/xbmc\"" -DINSTALL_PATH=3D"\"/usr/share/xbmc\"" -DHAS_S=
DL_JOYSTICK -D'SVN_REV=3D"Unknown"' -D_ARMEL -DHAVE_CONFIG_H  -I../../xbmc/=
utils -I../../guilib -I../../xbmc/lin
	ux -I../../xbmc/lib/libsquish -D_GNU_SOURCE=3D1 -D_REENTRANT -I/oe/build/a=
ngstrom-dev/sysroots/armv7a-angstrom-linux-gnueabi/usr/include/ -I/oe/build=
/angstrom-dev
	/sysroots/armv7a-angstrom-linux-gnueabi/usr/include/SDL -I/oe/build/angstr=
om-dev/sysroots/armv7a-angstrom-linux-gnueabi/usr/include/alsa -I/oe/build/=
angstrom-de
	v/sysroots/armv7a-angstrom-linux-gnueabi/usr/include/dbus-1.0 -I/oe/build/=
angstrom-dev/sysroots/armv7a-angstrom-linux-gnueabi/usr/include/freetype2 -=
I/oe/build/
	angstrom-dev/sysroots/armv7a-angstrom-linux-gnueabi/usr/include/fribidi -I=
/oe/build/angstrom-dev/sysroots/armv7a-angstrom-linux-gnueabi/usr/include/g=
lib-2.0 -I/
	oe/build/angstrom-dev/sysroots/armv7a-angstrom-linux-gnueabi/usr/include/l=
ibpng12 -I/oe/build/angstrom-dev/sysroots/armv7a-angstrom-linux-gnueabi/usr=
/lib/dbus-1.0/include
	 -I/oe/build/angstrom-dev/sysroots/armv7a-angstrom-linux-gnueabi/usr/lib/g=
lib-2.0/include -I/oe/build/angstrom-dev/sysroots/i686-linux/usr/armv7a/inc=
lude -I/hom
	e/paul/oe/build/angstrom-dev/work/armv7a-angstrom-linux-gnueabi/xbmc-10.05=
-r9+gitr0+e2ab481ebe964321c358ab9d6402088c714adcbe/git XBMCTex.cpp -o XBMCT=
ex.o
	| XBMCTex.cpp:1: warning: switch -mcpu=3Dcortex-a8 conflicts with -march=
=3D switch
	| XBMCTex.cpp: In function 'CXBTFFrame createXBTFFrame(SDL_Surface*, CXBTF=
Writer&, double, unsigned int)':
	| XBMCTex.cpp:235: warning: unused variable 'format'
	| XBMCTex.cpp:236: warning: unused variable 'colorMSE'
	| XBMCTex.cpp:236: warning: unused variable 'alphaMSE'
	| arm-angstrom-linux-gnueabi-g++ -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=
=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb -isystem/oe/build=
/angstrom-dev/sysroots/armv7a
	-angstrom-linux-gnueabi/usr/include -fexpensive-optimizations -frename-reg=
isters -fomit-frame-pointer -O2 -ggdb2 -fpermissive -fvisibility-inlines-hi=
dden -fPIC -DPIC -D_REENTRANT -
	D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=3D64 -g -D_DEBUG -Wall -O2 -mfloa=
t-abi=3Dsoftfp -mno-apcs-stack-check -Wa,-march=3Darmv7a -mcpu=3Dcortex-a8 =
-mfpu=3Dneon -mvectorize-with-neon-quad -
	isystem/oe/build/angstrom-dev/sysroots/armv7a-angstrom-linux-gnueabi/usr/i=
nclude -fexpensive-optimizations -frename-registers -fomit-frame-pointer -O=
2 -ggdb2 -fpermissive
	 -fvisibility-inlines-hidden -fPIC -DPIC -D_REENTRANT -D_LARGEFILE64_SOURC=
E -D_FILE_OFFSET_BITS=3D64 -g -D_DEBUG -Wall -O2 -mfloat-abi=3Dsoftfp -mno-=
apcs-stack-check -Wa,-march=3Darmv7a=20
	-mcpu=3Dcortex-a8 -mfpu=3Dneon -mvectorize-with-neon-quad -isystem/oe/buil=
d/angstrom-dev/sysroots/armv7a-angstrom-linux-gnueabi/usr/include -fexpensi=
ve-optimizations -frename
	-registers -fomit-frame-pointer -O2 -ggdb2 -fpermissive -fvisibility-inlin=
es-hidden -fPIC -DPIC -D_REENTRANT -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BIT=
S=3D64 -g -D_DEBUG -Wall -O2 -mfl
	oat-abi=3Dsoftfp -mno-apcs-stack-check -Wa,-march=3Darmv7a -mcpu=3Dcortex-=
a8 -mfpu=3Dneon -mvectorize-with-neon-quad SDL_anigif.o XBTFWriter.o XBMCTe=
x.o ../../guilib/XBTF.o      -L/home/pa
	ul/oe/build/angstrom-dev/sysroots/armv7a-angstrom-linux-gnueabi/usr/lib -W=
l,-rpath-link,/oe/build/angstrom-dev/sysroots/armv7a-angstrom-linux-gnueabi=
/usr/lib -Wl,-O1 -Wl,
	--hash-style=3Dgnu ../../xbmc/lib/libsquish/libsquish-arm.a -lSDL_image -l=
SDL -llzo2 -o TexturePacker
	| XBMCTex.o: In function `main':
	| /oe/build/angstrom-dev/work/armv7a-angstrom-linux-gnueabi/xbmc-10.05-r9+=
gitr0+e2ab481ebe964321c358ab9d6402088c714adcbe/git/tools/TexturePacker/XBMC=
Tex.cpp:394: undefined reference to `__lzo_init2'
	| collect2: ld returned 1 exit status
	| make[1]: *** [TexturePacker] Error 1
	| make[1]: Leaving directory `/oe/build/angstrom-dev/work/armv7a-angstrom-=
linux-gnueabi/xbmc-10.05-r9+gitr0+e2ab481ebe964321c358ab9d6402088c714adcbe/=
git/tools/TexturePacker'
	| make: *** [tools/TexturePacker/TexturePacker] Error 2
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
v2: fix error message in commit message
---
 recipes/xbmc/xbmc/0012-fix-lzo-things.patch |   45 +++++++++++++++++++++++=
++++
 recipes/xbmc/xbmc_svn.bb                    |    3 +-
 2 files changed, 47 insertions(+), 1 deletions(-)
 create mode 100644 recipes/xbmc/xbmc/0012-fix-lzo-things.patch

diff --git a/recipes/xbmc/xbmc/0012-fix-lzo-things.patch b/recipes/xbmc/xbm=
c/0012-fix-lzo-things.patch
new file mode 100644
index 0000000..4b3e771
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
index 3ca90e0..766d74a 100644
--- a/recipes/xbmc/xbmc_svn.bb
+++ b/recipes/xbmc/xbmc_svn.bb
@@ -7,7 +7,7 @@ require recipes/egl/egl.inc
 SRCREV =3D "e2ab481ebe964321c358ab9d6402088c714adcbe"
=20
 PV =3D "10.05"
-PR =3D "r10"
+PR =3D "r11"
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

--=-eldTugQf48g8Ubg3+iVu
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAk0U7e8ACgkQPX1aK2wOHVgRuACfYPJtBOx2NsSNXEGCaD0YCQ8F
Lz4An1KeStfWCq0ACakFCG4VgQhRLR0g
=AeKd
-----END PGP SIGNATURE-----

--=-eldTugQf48g8Ubg3+iVu--
