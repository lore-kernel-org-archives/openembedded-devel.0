Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1Pmb7z-0006WP-KF for openembedded-devel@lists.openembedded.org;
	Tue, 08 Feb 2011 01:08:19 +0100
Received: from f053035241.adsl.alicedsl.de ([78.53.35.241]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1Pmb71-0002fE-VH for openembedded-devel@lists.openembedded.org;
	Tue, 08 Feb 2011 00:07:20 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 08 Feb 2011 01:07:18 +0100
Message-ID: <1297123638.3802.7.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: angstrom-2010.x: eglibc-2.12-r21.8+svnr12323: `/tmp/ccqyEDnv.s:33181: Error: can't resolve `.LBB491' {*UND* section} - `.Ltext0' {.text section}`
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
X-List-Received-Date: Tue, 08 Feb 2011 00:08:19 -0000
X-Groupsio-MsgNum: 28888
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-Am7YKpv77fJxcRJ3Zit/"

--=-Am7YKpv77fJxcRJ3Zit/
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear OE folks,


task `compile` with 82c07ebb and `angstrom-2010.x` for `MACHINE =3D
"beagleboard"` fails with the following error.

        In file included from dl-init.c:21:0:
        ../ports/sysdeps/unix/sysv/linux/arm/ldsodefs.h:41:0: warning: "MOR=
E_ELF_HEADER_DATA" redefined
        ../sysdeps/unix/sysv/linux/ldsodefs.h:64:0: note: this is the locat=
ion of the previous definition
        arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 =
-mfpu=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb dl-fini.c -c=
 -std=3Dgnu99 -fgnu89-inline -O2 -Wall -Winline -Wwrite-strings -fexpensive=
-optimizations -fmerge-all-constants -frename-registers -ggdb3 -Wstrict-pro=
totypes  -fomit-frame-pointer    -I../include -I/oe/build-angstrom-next/ang=
strom-dev/work/armv7a-angstrom-linux-gnueabi/eglibc-2.12-r21.8+svnr12323/bu=
ild-arm-angstrom-linux-gnueabi/elf @/oe/build-angstrom-next/angstrom-dev/wo=
rk/armv7a-angstrom-linux-gnueabi/eglibc-2.12-r21.8+svnr12323/build-arm-angs=
trom-linux-gnueabi/includes -I.. -I../libio -I. -D_LIBC_REENTRANT -include =
../include/libc-symbols.h       -o /oe/build-angstrom-next/angstrom-dev/wor=
k/armv7a-angstrom-linux-gnueabi/eglibc-2.12-r21.8+svnr12323/build-arm-angst=
rom-linux-gnueabi/elf/dl-fini.o -MD -MP -MF /oe/build-angstrom-next/angstro=
m-dev/work/armv7a-angstrom-linux-gnueabi/eglibc-2.12-r21.8+svnr12323/build-=
arm-angstrom-linux-gnueabi/elf/dl-fini.o.dt -MT /oe/build-angstrom-next/ang=
strom-dev/work/armv7a-angstrom-linux-gnueabi/eglibc-2.12-r21.8+svnr12323/bu=
ild-arm-angstrom-linux-gnueabi/elf/dl-fini.o
        arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 =
-mfpu=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb dl-debug.c -=
c -std=3Dgnu99 -fgnu89-inline -O2 -Wall -Winline -Wwrite-strings -fexpensiv=
e-optimizations -fmerge-all-constants -frename-registers -ggdb3 -Wstrict-pr=
ototypes  -fomit-frame-pointer    -I../include -I/oe/build-angstrom-next/an=
gstrom-dev/work/armv7a-angstrom-linux-gnueabi/eglibc-2.12-r21.8+svnr12323/b=
uild-arm-angstrom-linux-gnueabi/elf @/oe/build-angstrom-next/angstrom-dev/w=
ork/armv7a-angstrom-linux-gnueabi/eglibc-2.12-r21.8+svnr12323/build-arm-ang=
strom-linux-gnueabi/includes -I.. -I../libio -I. -D_LIBC_REENTRANT -include=
 ../include/libc-symbols.h       -o /oe/build-angstrom-next/angstrom-dev/wo=
rk/armv7a-angstrom-linux-gnueabi/eglibc-2.12-r21.8+svnr12323/build-arm-angs=
trom-linux-gnueabi/elf/dl-debug.o -MD -MP -MF /oe/build-angstrom-next/angst=
rom-dev/work/armv7a-angstrom-linux-gnueabi/eglibc-2.12-r21.8+svnr12323/buil=
d-arm-angstrom-linux-gnueabi/elf/dl-debug.o.dt -MT /oe/build-angstrom-next/=
angstrom-dev/work/armv7a-angstrom-linux-gnueabi/eglibc-2.12-r21.8+svnr12323=
/build-arm-angstrom-linux-gnueabi/elf/dl-debug.o
        In file included from dl-fini.c:23:0:
        ../ports/sysdeps/unix/sysv/linux/arm/ldsodefs.h:41:0: warning: "MOR=
E_ELF_HEADER_DATA" redefined
        ../sysdeps/unix/sysv/linux/ldsodefs.h:64:0: note: this is the locat=
ion of the previous definition
        arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 =
-mfpu=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb dl-misc.c -c=
 -std=3Dgnu99 -fgnu89-inline -O2 -Wall -Winline -Wwrite-strings -fexpensive=
-optimizations -fmerge-all-constants -frename-registers -ggdb3 -Wstrict-pro=
totypes  -fomit-frame-pointer    -I../include -I/oe/build-angstrom-next/ang=
strom-dev/work/armv7a-angstrom-linux-gnueabi/eglibc-2.12-r21.8+svnr12323/bu=
ild-arm-angstrom-linux-gnueabi/elf @/oe/build-angstrom-next/angstrom-dev/wo=
rk/armv7a-angstrom-linux-gnueabi/eglibc-2.12-r21.8+svnr12323/build-arm-angs=
trom-linux-gnueabi/includes -I.. -I../libio -I. -D_LIBC_REENTRANT -include =
../include/libc-symbols.h       -o /oe/build-angstrom-next/angstrom-dev/wor=
k/armv7a-angstrom-linux-gnueabi/eglibc-2.12-r21.8+svnr12323/build-arm-angst=
rom-linux-gnueabi/elf/dl-misc.o -MD -MP -MF /oe/build-angstrom-next/angstro=
m-dev/work/armv7a-angstrom-linux-gnueabi/eglibc-2.12-r21.8+svnr12323/build-=
arm-angstrom-linux-gnueabi/elf/dl-misc.o.dt -MT /oe/build-angstrom-next/ang=
strom-dev/work/armv7a-angstrom-linux-gnueabi/eglibc-2.12-r21.8+svnr12323/bu=
ild-arm-angstrom-linux-gnueabi/elf/dl-misc.o
        In file included from dl-misc.c:22:0:
        ../ports/sysdeps/unix/sysv/linux/arm/ldsodefs.h:41:0: warning: "MOR=
E_ELF_HEADER_DATA" redefined
        ../sysdeps/unix/sysv/linux/ldsodefs.h:64:0: note: this is the locat=
ion of the previous definition
        In file included from dl-debug.c:21:0:
        ../ports/sysdeps/unix/sysv/linux/arm/ldsodefs.h:41:0: warning: "MOR=
E_ELF_HEADER_DATA" redefined
        ../sysdeps/unix/sysv/linux/ldsodefs.h:64:0: note: this is the locat=
ion of the previous definition
        arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 =
-mfpu=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb dl-version.c=
 -c -std=3Dgnu99 -fgnu89-inline -O2 -Wall -Winline -Wwrite-strings -fexpens=
ive-optimizations -fmerge-all-constants -frename-registers -ggdb3 -Wstrict-=
prototypes  -fomit-frame-pointer    -I../include -I/oe/build-angstrom-next/=
angstrom-dev/work/armv7a-angstrom-linux-gnueabi/eglibc-2.12-r21.8+svnr12323=
/build-arm-angstrom-linux-gnueabi/elf @/oe/build-angstrom-next/angstrom-dev=
/work/armv7a-angstrom-linux-gnueabi/eglibc-2.12-r21.8+svnr12323/build-arm-a=
ngstrom-linux-gnueabi/includes -I.. -I../libio -I. -D_LIBC_REENTRANT -inclu=
de ../include/libc-symbols.h       -o /oe/build-angstrom-next/angstrom-dev/=
work/armv7a-angstrom-linux-gnueabi/eglibc-2.12-r21.8+svnr12323/build-arm-an=
gstrom-linux-gnueabi/elf/dl-version.o -MD -MP -MF /oe/build-angstrom-next/a=
ngstrom-dev/work/armv7a-angstrom-linux-gnueabi/eglibc-2.12-r21.8+svnr12323/=
build-arm-angstrom-linux-gnueabi/elf/dl-version.o.dt -MT /oe/build-angstrom=
-next/angstrom-dev/work/armv7a-angstrom-linux-gnueabi/eglibc-2.12-r21.8+svn=
r12323/build-arm-angstrom-linux-gnueabi/elf/dl-version.o
        In file included from dl-version.c:26:0:
        ../ports/sysdeps/unix/sysv/linux/arm/ldsodefs.h:41:0: warning: "MOR=
E_ELF_HEADER_DATA" redefined
        ../sysdeps/unix/sysv/linux/ldsodefs.h:64:0: note: this is the locat=
ion of the previous definition
        /tmp/ccqyEDnv.s: Assembler messages:
        /tmp/ccqyEDnv.s:33181: Error: can't resolve `.LBB491' {*UND* sectio=
n} - `.Ltext0' {.text section}
        make[2]: *** [/oe/build-angstrom-next/angstrom-dev/work/armv7a-angs=
trom-linux-gnueabi/eglibc-2.12-r21.8+svnr12323/build-arm-angstrom-linux-gnu=
eabi/elf/dl-reloc.o] Error 1
        make[2]: *** Waiting for unfinished jobs....
        make[2]: Leaving directory `/oe/build-angstrom-next/angstrom-dev/wo=
rk/armv7a-angstrom-linux-gnueabi/eglibc-2.12-r21.8+svnr12323/eglibc-2_12/li=
bc/elf'
        make[1]: *** [elf/subdir_lib] Error 2
        make[1]: Leaving directory `/oe/build-angstrom-next/angstrom-dev/wo=
rk/armv7a-angstrom-linux-gnueabi/eglibc-2.12-r21.8+svnr12323/eglibc-2_12/li=
bc'
        make: *** [all] Error 2
        FATAL: oe_runmake failed
        ERROR: Function do_compile failed

I will try to reproduce the error.


Thanks,

Paul

--=-Am7YKpv77fJxcRJ3Zit/
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAk1QiTEACgkQPX1aK2wOHVih4wCdEkKWlg0Ll4NeS440KhcHbRAR
CtoAn2xNhnURP9kU1DeVyu1kx3Fmzki4
=xd8w
-----END PGP SIGNATURE-----

--=-Am7YKpv77fJxcRJ3Zit/--
