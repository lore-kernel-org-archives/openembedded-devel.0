Received: from [93.188.72.201] (helo=mail.o2s.ch)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <david.lanzendoerfer@o2s.ch>) id 1NisUN-00066u-RK
	for openembedded-devel@lists.openembedded.org;
	Sat, 20 Feb 2010 17:47:34 +0100
Received: from dizzy-6.localnet ([::ffff:82.192.226.27])
	(AUTH: PLAIN david.lanzendoerfer@o2s.ch, TLS: TLSv1/SSLv3, 256bits,
	AES256-SHA) by koffein with esmtp; Sat, 20 Feb 2010 18:42:03 +0000
	id 0000000000028BA7.000000004B802CFB.000046B5
From: David =?iso-8859-1?q?Lanzend=F6rfer?= <david.lanzendoerfer@o2s.ch>
Organization: OpenSourceSupport GmbH
To: openembedded-devel@lists.openembedded.org
Date: Sat, 20 Feb 2010 17:39:06 +0100
User-Agent: KMail/1.12.4 (Linux/2.6.32-gentoo; KDE/4.3.5; x86_64; ; )
X-Face: a023Y#Om+E(<|Tkz7Ae>YeJ\rvY,eXDn^g66`NiaNQ"#xRJ=gr'!V}V#{MN6!YO{s{{)
	=?utf-8?q?=3Bh=0A=09=3Ds?=@Vv%T)fi>gJrAHvijw^ZG9{b1rtf~mn$V^b`:3m>yH=o$Eo')
	=?utf-8?q?Ul8f=7DF=251vdg9=7C52W=3DXs=0A=09rR=5E/E/SPo=5E=7B-R22=5Ba?=
	=?utf-8?q?=7Dc=3F?=@tgfp<I#oOW7r}0We&3g5"2>N5r/Vu|>kWs"|J'XppA;*0A,6>
	=?utf-8?q?=0A=09*GY?=(0=H@>@^vEy]!m\)I42Lu@k~_=:U@/kf8{AO4'F7:Hy_*"5Xf9Vvkqr4E(
	=?utf-8?q?32pVlT=3A=3D=26=0A=09i4l=5B3=25=3FZ?=<zzP~wGSke?1VJj\cd~Z(,Upc;
	nOR|pqK@<j(`EYFSn,jN)A(~`YwM2nIv,
MIME-Version: 1.0
Message-Id: <201002201739.12711.david.lanzendoerfer@o2s.ch>
X-SA-Exim-Connect-IP: 93.188.72.201
X-SA-Exim-Mail-From: david.lanzendoerfer@o2s.ch
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Build error: attr_2.4.44.bb
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
X-List-Received-Date: Sat, 20 Feb 2010 16:47:35 -0000
X-Groupsio-MsgNum: 16928
Content-Type: multipart/signed; boundary="nextPart2569058.55Gb2RjqbH";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit

--nextPart2569058.55Gb2RjqbH
Content-Type: multipart/mixed;
  boundary="Boundary-01=_qABgLFOE7MnCuk8"
Content-Transfer-Encoding: 7bit

--Boundary-01=_qABgLFOE7MnCuk8
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi guys
Since some days I'm encountering a serious builderror with  attr.
Has someone a clou, what it could be?

greats
	leviathan

--Boundary-01=_qABgLFOE7MnCuk8
Content-Type: text/plain;
  charset="ISO-8859-1";
  name="log.do_configure.19218"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="log.do_configure.19218"

automake (GNU automake) 1.10.2
Copyright (C) 2008 Free Software Foundation, Inc.
License GPLv2+: GNU GPL version 2 or later <http://gnu.org/licenses/gpl.htm=
l>
This is free software: you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.

Written by Tom Tromey <tromey@redhat.com>
       and Alexandre Duret-Lutz <adl@gnu.org>.
AUTOV is 1.10
NOTE: Executing autoreconf --verbose --install --force --exclude=3Dautopoin=
t -I /mnt/sda/fso/build/tmp/work/armv6-novfp-oe-linux-gnueabi/attr-2.4.44-r=
1/attr-2.4.44/m4/ -I/mnt/sda/fso/build/tmp/staging/armv6-novfp-oe-linux-gnu=
eabi/usr/share/aclocal-1.10 -I /mnt/sda/fso/build/tmp/staging/armv6-novfp-o=
e-linux-gnueabi/usr/share/aclocal
autoreconf: Entering directory `.'
autoreconf: configure.in: not using Gettext
autoreconf: running: aclocal -I /mnt/sda/fso/build/tmp/work/armv6-novfp-oe-=
linux-gnueabi/attr-2.4.44-r1/attr-2.4.44/m4/ -I /mnt/sda/fso/build/tmp/stag=
ing/armv6-novfp-oe-linux-gnueabi/usr/share/aclocal-1.10 -I /mnt/sda/fso/bui=
ld/tmp/staging/armv6-novfp-oe-linux-gnueabi/usr/share/aclocal --force=20
autoreconf: configure.in: tracing
autoreconf: running: libtoolize --copy --force
libtoolize: putting auxiliary files in AC_CONFIG_AUX_DIR, `.'.
libtoolize: copying file `./ltmain.sh'
libtoolize: putting macros in AC_CONFIG_MACRO_DIR, `m4'.
libtoolize: copying file `m4/libtool.m4'
libtoolize: copying file `m4/ltoptions.m4'
libtoolize: copying file `m4/ltsugar.m4'
libtoolize: copying file `m4/ltversion.m4'
libtoolize: copying file `m4/lt~obsolete.m4'
libtoolize: Consider adding `-I m4' to ACLOCAL_AMFLAGS in Makefile.am.
autoreconf: running: /mnt/sda/fso/build/tmp/staging/x86_64-linux/usr/bin/au=
toconf --include=3D/mnt/sda/fso/build/tmp/work/armv6-novfp-oe-linux-gnueabi=
/attr-2.4.44-r1/attr-2.4.44/m4/ --include=3D/mnt/sda/fso/build/tmp/staging/=
armv6-novfp-oe-linux-gnueabi/usr/share/aclocal-1.10 --include=3D/mnt/sda/fs=
o/build/tmp/staging/armv6-novfp-oe-linux-gnueabi/usr/share/aclocal --force =
--warnings=3Dcross
autoreconf: running: /mnt/sda/fso/build/tmp/staging/x86_64-linux/usr/bin/au=
toheader --include=3D/mnt/sda/fso/build/tmp/work/armv6-novfp-oe-linux-gnuea=
bi/attr-2.4.44-r1/attr-2.4.44/m4/ --include=3D/mnt/sda/fso/build/tmp/stagin=
g/armv6-novfp-oe-linux-gnueabi/usr/share/aclocal-1.10 --include=3D/mnt/sda/=
fso/build/tmp/staging/armv6-novfp-oe-linux-gnueabi/usr/share/aclocal --forc=
e --warnings=3Dcross
autoreconf: configure.in: not using Automake
autoreconf: running: gnu-configize
autoreconf: Leaving directory `.'
NOTE: Running /mnt/sda/fso/build/tmp/work/armv6-novfp-oe-linux-gnueabi/attr=
-2.4.44-r1/attr-2.4.44/configure 		    --build=3Dx86_64-linux 		    --host=
=3Darm-oe-linux-gnueabi 		    --target=3Darm-oe-linux-gnueabi 		    --prefi=
x=3D/usr 		    --exec_prefix=3D/usr 		    --bindir=3D/usr/bin 		    --sbind=
ir=3D/usr/sbin 		    --libexecdir=3D/usr/libexec 		    --datadir=3D/usr/sha=
re 		    --sysconfdir=3D/etc 		    --sharedstatedir=3D/com 		    --localsta=
tedir=3D/var 		    --libdir=3D/usr/lib 		    --includedir=3D/usr/include 		=
    --oldincludedir=3D/usr/include 		    --infodir=3D/usr/share/info 		    =
--mandir=3D/usr/share/man 			 --enable-gettext=3Dyes ac_cv_path_XGETTEXT=3D=
/mnt/sda/fso/build/tmp/staging/x86_64-linux/usr/bin/xgettext 		    ...
configure: loading site script /mnt/sda/fso/openembedded/site/endian-little
configure: loading site script /mnt/sda/fso/openembedded/site/common-linux
configure: loading site script /mnt/sda/fso/openembedded/site/common-glibc
configure: loading site script /mnt/sda/fso/openembedded/site/arm-common
configure: loading site script /mnt/sda/fso/openembedded/site/arm-linux
configure: loading site script /mnt/sda/fso/openembedded/site/common
configure: loading site script /mnt/sda/fso/openembedded/site/common
checking build system type... x86_64-pc-linux-gnu
checking host system type... arm-oe-linux-gnueabi
checking for arm-oe-linux-gnueabi-gcc... arm-oe-linux-gnueabi-gcc -march=3D=
armv6j -mtune=3Darm1136jf-s -mthumb-interwork -mno-thumb
checking for C compiler default output file name... a.out
checking whether the C compiler works... yes
checking whether we are cross compiling... yes
checking for suffix of executables...=20
checking for suffix of object files... o
checking whether we are using the GNU C compiler... yes
checking whether arm-oe-linux-gnueabi-gcc -march=3Darmv6j -mtune=3Darm1136j=
f-s -mthumb-interwork -mno-thumb accepts -g... yes
checking for arm-oe-linux-gnueabi-gcc -march=3Darmv6j -mtune=3Darm1136jf-s =
-mthumb-interwork -mno-thumb option to accept ISO C89... none needed
checking for a sed that does not truncate output... /bin/sed
checking for grep that handles long lines and -e... /bin/grep
checking for egrep... /bin/grep -E
checking for fgrep... /bin/grep -F
checking for ld used by arm-oe-linux-gnueabi-gcc -march=3Darmv6j -mtune=3Da=
rm1136jf-s -mthumb-interwork -mno-thumb... arm-oe-linux-gnueabi-ld
checking if the linker (arm-oe-linux-gnueabi-ld) is GNU ld... yes
checking for BSD- or MS-compatible name lister (nm)... arm-oe-linux-gnueabi=
-nm
checking the name lister (arm-oe-linux-gnueabi-nm) interface... BSD nm
checking whether ln -s works... yes
checking the maximum length of command line arguments... 1572864
checking whether the shell understands some XSI constructs... yes
checking whether the shell understands "+=3D"... yes
checking for arm-oe-linux-gnueabi-ld option to reload object files... -r
checking for arm-oe-linux-gnueabi-objdump... arm-oe-linux-gnueabi-objdump
checking how to recognize dependent libraries... pass_all
checking for arm-oe-linux-gnueabi-ar... arm-oe-linux-gnueabi-ar
checking for arm-oe-linux-gnueabi-strip... arm-oe-linux-gnueabi-strip
checking for arm-oe-linux-gnueabi-ranlib... arm-oe-linux-gnueabi-ranlib
checking command to parse arm-oe-linux-gnueabi-nm output from arm-oe-linux-=
gnueabi-gcc -march=3Darmv6j -mtune=3Darm1136jf-s -mthumb-interwork -mno-thu=
mb object... ok
checking how to run the C preprocessor... arm-oe-linux-gnueabi-gcc -E
checking for ANSI C header files... yes
checking for sys/types.h... yes
checking for sys/stat.h... yes
checking for stdlib.h... yes
checking for string.h... yes
checking for memory.h... yes
checking for strings.h... yes
checking for inttypes.h... yes
checking for stdint.h... yes
checking for unistd.h... yes
checking for dlfcn.h... yes
checking for objdir... .libs
checking if arm-oe-linux-gnueabi-gcc -march=3Darmv6j -mtune=3Darm1136jf-s -=
mthumb-interwork -mno-thumb supports -fno-rtti -fno-exceptions... no
checking for arm-oe-linux-gnueabi-gcc -march=3Darmv6j -mtune=3Darm1136jf-s =
-mthumb-interwork -mno-thumb option to produce PIC... -fPIC -DPIC
checking if arm-oe-linux-gnueabi-gcc -march=3Darmv6j -mtune=3Darm1136jf-s -=
mthumb-interwork -mno-thumb PIC flag -fPIC -DPIC works... yes
checking if arm-oe-linux-gnueabi-gcc -march=3Darmv6j -mtune=3Darm1136jf-s -=
mthumb-interwork -mno-thumb static flag -static works... yes
checking if arm-oe-linux-gnueabi-gcc -march=3Darmv6j -mtune=3Darm1136jf-s -=
mthumb-interwork -mno-thumb supports -c -o file.o... yes
checking if arm-oe-linux-gnueabi-gcc -march=3Darmv6j -mtune=3Darm1136jf-s -=
mthumb-interwork -mno-thumb supports -c -o file.o... (cached) yes
checking whether the arm-oe-linux-gnueabi-gcc -march=3Darmv6j -mtune=3Darm1=
136jf-s -mthumb-interwork -mno-thumb linker (arm-oe-linux-gnueabi-ld) suppo=
rts shared libraries... yes
checking whether -lc should be explicitly linked in... no
checking dynamic linker characteristics... GNU/Linux ld.so
checking how to hardcode library paths into programs... immediate
checking whether stripping libraries is possible... yes
checking if libtool supports shared libraries... yes
checking whether to build shared libraries... yes
checking whether to build static libraries... yes
checking for arm-oe-linux-gnueabi-gcc... (cached) arm-oe-linux-gnueabi-gcc =
-march=3Darmv6j -mtune=3Darm1136jf-s -mthumb-interwork -mno-thumb
checking whether we are using the GNU C compiler... (cached) yes
checking whether arm-oe-linux-gnueabi-gcc -march=3Darmv6j -mtune=3Darm1136j=
f-s -mthumb-interwork -mno-thumb accepts -g... (cached) yes
checking for arm-oe-linux-gnueabi-gcc -march=3Darmv6j -mtune=3Darm1136jf-s =
-mthumb-interwork -mno-thumb option to accept ISO C89... (cached) none need=
ed
id: cannot find name for group ID 1000
checking for arm-oe-linux-gnueabi-gcc... (cached) arm-oe-linux-gnueabi-gcc =
-march=3Darmv6j -mtune=3Darm1136jf-s -mthumb-interwork -mno-thumb
checking whether we are using the GNU C compiler... (cached) yes
checking whether arm-oe-linux-gnueabi-gcc -march=3Darmv6j -mtune=3Darm1136j=
f-s -mthumb-interwork -mno-thumb accepts -g... (cached) yes
checking for arm-oe-linux-gnueabi-gcc -march=3Darmv6j -mtune=3Darm1136jf-s =
-mthumb-interwork -mno-thumb option to accept ISO C89... (cached) none need=
ed
/mnt/sda/fso/build/tmp/work/armv6-novfp-oe-linux-gnueabi/attr-2.4.44-r1/att=
r-2.4.44/configure: line 11807: test: too many arguments
checking for tar... /bin/tar
checking for gzip... /bin/gzip
checking for makedepend... /usr/bin/makedepend
checking for awk... /bin/awk
checking for sort... /bin/sort
checking whether ln -s works... yes
checking for msgfmt... no

FATAL ERROR: msgfmt does not seem to be installed.
attr cannot be built without a working gettext installation.
FATAL: oe_runconf failed

--Boundary-01=_qABgLFOE7MnCuk8--

--nextPart2569058.55Gb2RjqbH
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.11 (GNU/Linux)

iEYEABECAAYFAkuAEDAACgkQAeZw77btGjrfmgCeImrOy4O1s5BRCAKmKbbmU76W
4GcAoIKwGsljZ0FPe2p0rCM0MHAkv1ep
=DRws
-----END PGP SIGNATURE-----

--nextPart2569058.55Gb2RjqbH--
