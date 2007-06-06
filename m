Received: from [209.85.132.247] (helo=an-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <lvcargnini@gmail.com>) id 1HvlGI-0004hG-MZ
	for openembedded-devel@lists.openembedded.org;
	Wed, 06 Jun 2007 04:28:40 +0200
Received: by an-out-0708.google.com with SMTP id b33so420066ana
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 05 Jun 2007 19:26:20 -0700 (PDT)
Received: by 10.100.46.19 with SMTP id t19mr5550ant.1181096779625;
	Tue, 05 Jun 2007 19:26:19 -0700 (PDT)
Received: by 10.100.38.6 with HTTP; Tue, 5 Jun 2007 19:26:19 -0700 (PDT)
Message-ID: <ae36f8040706051926x1e9ff75agde47137c55497e19@mail.gmail.com>
Date: Tue, 5 Jun 2007 23:26:19 -0300
From: "=?ISO-8859-1?Q?Lu=EDs_Cargnini?=" <lvcargnini@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <ae36f8040706051852s10483277h1ce4f162726d9d0a@mail.gmail.com>
MIME-Version: 1.0
References: <ae36f8040706021959p2c020f17k454aa346d7123f95@mail.gmail.com>
	<ae36f8040706040555s79d65114r57f7f514c6c746d5@mail.gmail.com>
	<46641153.2050207@dominion.kabel.utwente.nl>
	<ae36f8040706051004j24debcd0g397143693f2f1285@mail.gmail.com>
	<ae36f8040706051136h36f72d93wd6c4df2845018c8a@mail.gmail.com>
	<7C28F02B-B392-4557-9E7A-2991BE0E1BF3@gmx.net>
	<ae36f8040706051251g22ae2a09ha560b3c8b6d0de57@mail.gmail.com>
	<4665CF19.2030501@dominion.kabel.utwente.nl>
	<ae36f8040706051806q120be1bdyae9da9c8f754ab59@mail.gmail.com>
	<ae36f8040706051852s10483277h1ce4f162726d9d0a@mail.gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.9
Subject: Re: problems doing bitbake task-base
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
X-List-Received-Date: Wed, 06 Jun 2007 02:28:49 -0000
Content-Type: text/plain; charset=WINDOWS-1252; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Well well, and the problems do not stop:
(enterprise:~/puc/instramed/openembedded) lvcargnini% bitbake task-base
NOTE: Handling BitBake files: \ (0035/4598) [ 0 %]ERROR: Could not inherit
file classes/rootfs_tar.bbclass while parsing
/home/lvcargnini/puc/instramed/openembedded/org.openembedded.dev/packages/a=
ngstrom/angstrom-
bootmanager-image.bb
NOTE: Handling BitBake files: \ (0037/4598) [ 0 %]ERROR: Could not inherit
file classes/rootfs_tar.bbclass while parsing
/home/lvcargnini/puc/instramed/openembedded/org.openembedded.dev/packages/a=
ngstrom/angstrom-
console-image.bb
ERROR: Could not inherit file classes/rootfs_tar.bbclass while parsing
/home/lvcargnini/puc/instramed/openembedded/org.openembedded.dev/packages/a=
ngstrom/angstrom-
e-image.bb
ERROR: Could not inherit file classes/rootfs_tar.bbclass while parsing
/home/lvcargnini/puc/instramed/openembedded/org.openembedded.dev/packages/a=
ngstrom/angstrom-
mokogateway-image.bb
NOTE: Handling BitBake files: | (0041/4598) [ 0 %]ERROR: Could not inherit
file classes/rootfs_tar.bbclass while parsing
/home/lvcargnini/puc/instramed/openembedded/org.openembedded.dev/packages/a=
ngstrom/angstrom-
x11-image.bb
NOTE: Handling BitBake files: | (1355/4598) [29 %]ERROR: Could not inherit
file classes/rootfs_tar.bbclass while parsing
/home/lvcargnini/puc/instramed/openembedded/org.openembedded.dev/packages/i=
mages/angstrom-
minimal-image.bb
ERROR: Could not inherit file classes/rootfs_tar.bbclass while parsing
/home/lvcargnini/puc/instramed/openembedded/org.openembedded.dev/packages/i=
mages/bootstrap-
image-bootchart.bb
ERROR: Could not inherit file classes/rootfs_tar.bbclass while parsing
/home/lvcargnini/puc/instramed/openembedded/org.openembedded.dev/packages/i=
mages/bootstrap-
image.bb
ERROR: Could not inherit file classes/rootfs_tar.bbclass while parsing
/home/lvcargnini/puc/instramed/openembedded/org.openembedded.dev/packages/i=
mages/dvb-
image.bb
ERROR: Could not inherit file classes/rootfs_tar.bbclass while parsing
/home/lvcargnini/puc/instramed/openembedded/org.openembedded.dev/packages/i=
mages/e-
image-core.bb
ERROR: Could not inherit file classes/rootfs_tar.bbclass while parsing
/home/lvcargnini/puc/instramed/openembedded/org.openembedded.dev/packages/i=
mages/e-
image.bb
ERROR: Could not inherit file classes/rootfs_tar.bbclass while parsing
/home/lvcargnini/puc/instramed/openembedded/org.openembedded.dev/packages/i=
mages/essential-
image.bb
ERROR: Could not inherit file classes/rootfs_tar.bbclass while parsing
/home/lvcargnini/puc/instramed/openembedded/org.openembedded.dev/packages/i=
mages/essential-
machine-image.bb
ERROR: Could not inherit file classes/rootfs_tar.bbclass while parsing
/home/lvcargnini/puc/instramed/openembedded/org.openembedded.dev/packages/i=
mages/gpe-
image-blank-user.bb
ERROR: Could not inherit file classes/rootfs_tar.bbclass while parsing
/home/lvcargnini/puc/instramed/openembedded/org.openembedded.dev/packages/i=
mages/gpe-
image.bb
ERROR: Could not inherit file classes/rootfs_tar.bbclass while parsing
/home/lvcargnini/puc/instramed/openembedded/org.openembedded.dev/packages/i=
mages/gpephone-
image-vm.bb
ERROR: Could not inherit file classes/rootfs_tar.bbclass while parsing
/home/lvcargnini/puc/instramed/openembedded/org.openembedded.dev/packages/i=
mages/gpephone-
image.bb
ERROR: Could not inherit file classes/rootfs_tar.bbclass while parsing
/home/lvcargnini/puc/instramed/openembedded/org.openembedded.dev/packages/i=
mages/jlime-
opie.bb
ERROR: Could not inherit file classes/rootfs_tar.bbclass while parsing
/home/lvcargnini/puc/instramed/openembedded/org.openembedded.dev/packages/i=
mages/maemo-
image.bb
ERROR: Could not inherit file classes/rootfs_tar.bbclass while parsing
/home/lvcargnini/puc/instramed/openembedded/org.openembedded.dev/packages/i=
mages/mythfront-
image.bb
ERROR: Could not inherit file classes/rootfs_tar.bbclass while parsing
/home/lvcargnini/puc/instramed/openembedded/org.openembedded.dev/packages/i=
mages/nslu2-
linksys-image.bb
ERROR: Could not inherit file classes/rootfs_tar.bbclass while parsing
/home/lvcargnini/puc/instramed/openembedded/org.openembedded.dev/packages/i=
mages/nylon-
image-base.bb
ERROR: Could not inherit file classes/rootfs_tar.bbclass while parsing
/home/lvcargnini/puc/instramed/openembedded/org.openembedded.dev/packages/i=
mages/nylon-
image-extended.bb
ERROR: Could not inherit file classes/rootfs_tar.bbclass while parsing
/home/lvcargnini/puc/instramed/openembedded/org.openembedded.dev/packages/i=
mages/nylon-
image-extra.bb
ERROR: Could not inherit file classes/rootfs_tar.bbclass while parsing
/home/lvcargnini/puc/instramed/openembedded/org.openembedded.dev/packages/i=
mages/nylon-
image-mini.bb
ERROR: Could not inherit file classes/rootfs_tar.bbclass while parsing
/home/lvcargnini/puc/instramed/openembedded/org.openembedded.dev/packages/i=
mages/nylon-
image-standard.bb
ERROR: Could not inherit file classes/rootfs_tar.bbclass while parsing
/home/lvcargnini/puc/instramed/openembedded/org.openembedded.dev/packages/i=
mages/openmoko-
devel-image.bb
ERROR: Could not inherit file classes/rootfs_tar.bbclass while parsing
/home/lvcargnini/puc/instramed/openembedded/org.openembedded.dev/packages/i=
mages/openmoko-
image.bb
ERROR: Could not inherit file classes/rootfs_tar.bbclass while parsing
/home/lvcargnini/puc/instramed/openembedded/org.openembedded.dev/packages/i=
mages/openmoko-
sdk-image.bb
ERROR: Could not inherit file classes/rootfs_tar.bbclass while parsing
/home/lvcargnini/puc/instramed/openembedded/org.openembedded.dev/packages/i=
mages/openprotium-
image.bb
ERROR: Could not inherit file classes/rootfs_tar.bbclass while parsing
/home/lvcargnini/puc/instramed/openembedded/org.openembedded.dev/packages/i=
mages/opie-
image.bb
ERROR: Could not inherit file classes/rootfs_tar.bbclass while parsing
/home/lvcargnini/puc/instramed/openembedded/org.openembedded.dev/packages/i=
mages/opie-
kdepim-image.bb
ERROR: Could not inherit file classes/rootfs_tar.bbclass while parsing
/home/lvcargnini/puc/instramed/openembedded/org.openembedded.dev/packages/i=
mages/ossie-
image.bb
ERROR: Could not inherit file classes/rootfs_tar.bbclass while parsing
/home/lvcargnini/puc/instramed/openembedded/org.openembedded.dev/packages/i=
mages/pivotboot-
image.bb
ERROR: Could not inherit file classes/rootfs_tar.bbclass while parsing
/home/lvcargnini/puc/instramed/openembedded/org.openembedded.dev/packages/i=
mages/sdl-
image.bb
ERROR: Could not inherit file classes/rootfs_tar.bbclass while parsing
/home/lvcargnini/puc/instramed/openembedded/org.openembedded.dev/packages/i=
mages/sectest-
gpe-image.bb
ERROR: Could not inherit file classes/rootfs_tar.bbclass while parsing
/home/lvcargnini/puc/instramed/openembedded/org.openembedded.dev/packages/i=
mages/slugos-
image.bb
ERROR: Could not inherit file classes/rootfs_tar.bbclass while parsing
/home/lvcargnini/puc/instramed/openembedded/org.openembedded.dev/packages/i=
mages/twin-
image.bb
ERROR: Could not inherit file classes/rootfs_tar.bbclass while parsing
/home/lvcargnini/puc/instramed/openembedded/org.openembedded.dev/packages/i=
mages/uml-
image.bb
ERROR: Could not inherit file classes/rootfs_tar.bbclass while parsing
/home/lvcargnini/puc/instramed/openembedded/org.openembedded.dev/packages/i=
mages/unslung-
image.bb
ERROR: Could not inherit file classes/rootfs_tar.bbclass while parsing
/home/lvcargnini/puc/instramed/openembedded/org.openembedded.dev/packages/i=
mages/xfce-
image.bb
ERROR: Could not inherit file classes/rootfs_tar.bbclass while parsing
/home/lvcargnini/puc/instramed/openembedded/org.openembedded.dev/packages/i=
mages/xterminal-
image.bb
ERROR: Could not inherit file classes/rootfs_tar.bbclass while parsing
/home/lvcargnini/puc/instramed/openembedded/org.openembedded.dev/packages/i=
mages/helloworld-
image.bb
ERROR: Could not inherit file classes/rootfs_tar.bbclass while parsing
/home/lvcargnini/puc/instramed/openembedded/org.openembedded.dev/packages/i=
mages/hentges-
console-image.bb
ERROR: Could not inherit file classes/rootfs_tar.bbclass while parsing
/home/lvcargnini/puc/instramed/openembedded/org.openembedded.dev/packages/i=
mages/hentges-
x11-image.bb
NOTE: Handling BitBake files: - (4598/4598) [100 %]
NOTE: Parsing finished. 4343 cached, 0 parsed, 210 skipped, 0 masked.
NOTE: build 200706052320: started

OE Build Configuration:
BB_VERSION     =3D "1.8.2"
OE_REVISION    =3D "c6559ceba5987d7142c9759ae7f895632ac3b712"
TARGET_ARCH    =3D "arm"
TARGET_OS      =3D "linux-gnueabi"
MACHINE        =3D "omap5912osk"
DISTRO         =3D "angstrom"
DISTRO_VERSION =3D "test-20070606"
TARGET_FPU     =3D "soft"

NOTE: Resolving missing task queue dependencies
NOTE: preferred version 2.5 of glibc not available (for item
virtual/arm-angstrom-linux-gnueabi-libc-for-gcc)
NOTE: Preparing Runqueue
NOTE: Executing runqueue
NOTE: Running task 168 of 1124 (ID: 559,
/home/lvcargnini/puc/instramed/openembedded/org.openembedded.dev/packages/q=
emu/qemu-native_cvs.bb,
do_configure)
NOTE: package qemu-native-0.8.2+cvs20060723: started
NOTE: package qemu-native-0.8.2+cvs20060723-r1: task do_configure: started
ERROR: function do_configure failed
ERROR: log data follows
(/home/lvcargnini/puc/instramed/openembedded/tmp/work/i686-linux/qemu-
native-0.8.2+cvs20060723-r1/temp/log.do_configure.30356)
| NOTE: Running
/home/lvcargnini/puc/instramed/openembedded/tmp/work/i686-linux/qemu-
native-0.8.2+cvs20060723-r1/qemu/configure
--build=3Di686-linux                   --host=3Di686-linux
--target=3Di686-linux
--prefix=3D/home/lvcargnini/puc/instramed/openembedded/tmp/staging
--exec_prefix=3D/home/lvcargnini/puc/instramed/openembedded/tmp/staging/i68=
6-linux
--bindir=3D/home/lvcargnini/puc/instramed/openembedded/tmp/staging/i686-lin=
ux/bin
--sbindir=3D/home/lvcargnini/puc/instramed/openembedded/tmp/staging/i686-li=
nux/bin
--libexecdir=3D/home/lvcargnini/puc/instramed/openembedded/tmp/staging/i686=
-linux/libexec
--datadir=3D/home/lvcargnini/puc/instramed/openembedded/tmp/staging/i686-li=
nux/share
--sysconfdir=3D/home/lvcargnini/puc/instramed/openembedded/tmp/staging/etc
--sharedstatedir=3D/home/lvcargnini/puc/instramed/openembedded/tmp/staging/=
com
--localstatedir=3D/home/lvcargnini/puc/instramed/openembedded/tmp/staging/v=
ar
--libdir=3D/home/lvcargnini/puc/instramed/openembedded/tmp/staging/i686-lin=
ux/lib
--includedir=3D/home/lvcargnini/puc/instramed/openembedded/tmp/staging/i686=
-linux/include
--oldincludedir=3D/home/lvcargnini/puc/instramed/openembedded/tmp/staging/i=
686-linux/include
--infodir=3D/home/lvcargnini/puc/instramed/openembedded/tmp/staging/i686-li=
nux/share/info
--mandir=3D/home/lvcargnini/puc/instramed/openembedded/tmp/staging/i686-lin=
ux/share/man
...
| ERROR: "gcc" looks like gcc 4.x
| QEMU is known to have problems when compiled with gcc 4.x
| It is recommended that you use gcc 3.x to build QEMU
| To use this compiler anyway, configure with --disable-gcc-check
| FATAL: oe_runconf failed
NOTE: Task failed:
/home/lvcargnini/puc/instramed/openembedded/tmp/work/i686-linux/qemu-
native-0.8.2+cvs20060723-r1/temp/log.do_configure.30356
NOTE: package qemu-native-0.8.2+cvs20060723-r1: task do_configure: failed
ERROR: TaskFailed event exception, aborting
NOTE: package qemu-native-0.8.2+cvs20060723: failed
ERROR: Build of
/home/lvcargnini/puc/instramed/openembedded/org.openembedded.dev/packages/q=
emu/qemu-native_cvs.bb
do_configure failed
ERROR: Task 559
(/home/lvcargnini/puc/instramed/openembedded/org.openembedded.dev/packages/=
qemu/qemu-native_cvs.bb,
do_configure) failed
ERROR:
'/home/lvcargnini/puc/instramed/openembedded/org.openembedded.dev/packages/=
qemu/qemu-native_cvs.bb'
failed
(enterprise:~/puc/instramed/openembedded) lvcargnini%


On 6/5/07, Lu=EDs Cargnini <lvcargnini@gmail.com> wrote:
>
> I already upgraded the bitbake and uploaded to bugs.gentoo.org a new
> ebuild file
> Attachment #121306<https://bugs.gentoo.org/attachment.cgi?id=3D121306&act=
ion=3Dedit>to Bug
> #181034 <https://bugs.gentoo.org/show_bug.cgi?id=3D181034>
> so my latest output from bitbake after try bitbake task-base was:
>
> NOTE: Invalid cache found, rebuilding...
> NOTE: Handling BitBake files: \ (0035/4598) [ 0 %]ERROR: Could not inheri=
t
> file classes/rootfs_tar.bbclass while parsing
> /home/lvcargnini/puc/instramed/openembedded/org.openembedded.dev/packages=
/angstrom/angstrom-
> bootmanager-image.bb
> NOTE: Handling BitBake files: \ (0037/4598) [ 0 %]ERROR: Could not inheri=
t
> file classes/rootfs_tar.bbclass while parsing
> /home/lvcargnini/puc/instramed/openembedded/org.openembedded.dev/packages=
/angstrom/angstrom-
> console-image.bb
> ERROR: Could not inherit file classes/rootfs_tar.bbclass while parsing
> /home/lvcargnini/puc/instramed/openembedded/org.openembedded.dev/packages=
/angstrom/angstrom-
> e-image.bb
> ERROR: Could not inherit file classes/rootfs_tar.bbclass while parsing
> /home/lvcargnini/puc/instramed/openembedded/org.openembedded.dev/packages=
/angstrom/angstrom-mokogateway-image.bb
> NOTE: Handling BitBake files: | (0041/4598) [ 0 %]ERROR: Could not inheri=
t
> file classes/rootfs_tar.bbclass while parsing
> /home/lvcargnini/puc/instramed/openembedded/org.openembedded.dev/packages=
/angstrom/angstrom-
> x11-image.bb
> NOTE: Handling BitBake files: \ (0448/4598) [ 9 %]Traceback (most recent
> call last):
>
>
> On 6/5/07, Lu=EDs Cargnini <lvcargnini@gmail.com> wrote:
> >
> > so just to make it fast before I could upload everything to some server
> > here follow my local.conf:
> >
> > DL_DIR =3D "/home/lvcargnini/puc/instramed/openembedded/build/sources"
> > BBFILES :=3D
> > "/home/lvcargnini/puc/instramed/openembedded/org.openembedded.dev/packa=
ges/*/*.bb"
> >
> > BBMASK =3D ""
> > TMPDIR=3D/home/lvcargnini/puc/instamed/openembedded/tmp
> > MACHINE =3D "omap5912osk"
> > TARGET_ARCH =3D "arm"
> > TARGET_OS =3D "linux"
> > DISTRO =3D " angstrom-2007.1"
> > GLIBC_GENERATE_LOCALES =3D "en en_GB.UTF-8 fr pt_BR.UTF-8"
> > INHERIT =3D "package_tar"
> > IMAGE_FSTYPES =3D "jffs2 tar cramfs"
> > BBDEBUG =3D "yes
> > BBINCLUDELOGS =3D "yes"
> >
> >
> >
> > On 6/5/07, Koen Kooi <koen@dominion.kabel.utwente.nl > wrote:
> > >
> > > -----BEGIN PGP SIGNED MESSAGE-----
> > > Hash: SHA1
> > >
> > > Lu=EDs Cargnini schreef:
> > > > dev-embedded/bitbake
> > > >       Latest version available: 1.6.6
> > > >       Latest version installed: 1.6.6
> > > >       Size of files: 89 kB
> > > >       Homepage:      http://developer.berlios.de/projects/bitbake/
> > > >       Description:   package management tool for OpenEmbedded
> > > >       License:       GPL-2
> > > >
> > > >
> > > > Searching...
> > > > [ Results for search key : monotone ]
> > > > [ Applications found : 1 ]
> > > >
> > > > *  dev-util/monotone
> > > >       Latest version available: 0.33
> > > >       Latest version installed: 0.33
> > > >       Size of files: 4,651 kB
> > > >       Homepage:      http://monotone.ca
> > > >       Description:   Monotone Distributed Version Control System
> > > >       License:       GPL-2
> > > >
> > > > my revision of OE I think is the latest I downloaded it from
> > > > openembedded.org, I did an pull update 2 days ago and mtn update
> > > today.
> > > > I installed the bitbake and monotone using emerge of my gentoo it
> > > get the
> > > > latest stable version I suppose ?
> > > > I will get all the information and put somewhere than they could
> > > download
> > > > it.
> > >
> > > Follow http://www.angstrom-distribution.org/building-angstrom to get
> > > something that was a
> > > 99% chance of building without any troubles.
> > >
> > > regards,
> > >
> > > Koen
> > > -----BEGIN PGP SIGNATURE-----
> > > Version: GnuPG v1.4.5 (Darwin)
> > >
> > > iD8DBQFGZc8ZMkyGM64RGpERApLmAKC6kPVEgMfA0bQfDoMP6dMOlcdHHQCfT+TA
> > > dccaqsifJr47CCHOsjiKYy0=3D
> > > =3D5QOT
> > > -----END PGP SIGNATURE-----
> > >
> > > _______________________________________________
> > > Openembedded-devel mailing list
> > > Openembedded-devel@lists.openembedded.org
> > > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-deve=
l
> > >
> > >
> >
> >
> >
> > --
> >
> > -----------------------------------------------------------------------=
-------
> > Thanks && Regards
> > Msc. Bsc. Lu=EDs Vit=F3rio Cargnini
> > IEEE Member
> > Electrical Engineer Faculty @ PUCRS
> > Ipiranga Avenue, 6681 =96 Building 30
> > P.O. Box: 90619-900 =96 Porto Alegre/RS
> > Phone: +55 51 3320 3500  extension: 7696
> > -----------------------------------------------------------------------=
----------
> >
> >
>
>
>
> --
>
> -------------------------------------------------------------------------=
-----
> Thanks && Regards
> Msc. Bsc. Lu=EDs Vit=F3rio Cargnini
> IEEE Member
> Electrical Engineer Faculty @ PUCRS
> Ipiranga Avenue, 6681 =96 Building 30
> P.O. Box: 90619-900 =96 Porto Alegre/RS
> Phone: +55 51 3320 3500  extension: 7696
> -------------------------------------------------------------------------=
--------
>
>



--=20
---------------------------------------------------------------------------=
---
Thanks && Regards
Msc. Bsc. Lu=EDs Vit=F3rio Cargnini
IEEE Member
Electrical Engineer Faculty @ PUCRS
Ipiranga Avenue, 6681 =96 Building 30
P.O. Box: 90619-900 =96 Porto Alegre/RS
Phone: +55 51 3320 3500  extension: 7696
---------------------------------------------------------------------------=
------

