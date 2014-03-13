Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f182.google.com (mail-ea0-f182.google.com
	[209.85.215.182])
	by mail.openembedded.org (Postfix) with ESMTP id D51DE6E720
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Mar 2014 10:21:02 +0000 (UTC)
Received: by mail-ea0-f182.google.com with SMTP id b10so380244eae.41
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Mar 2014 03:21:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=gedRuwiTYayMwncfrRn/YjFFYPRsLoP1whn6PQiqOQs=;
	b=VkTpLCHLc5sz9+w3gVsGZ0cOXXygVs7+OtTgbwMi/R7HEEb5gA1IM9ouk7a9iWdh/j
	CQ+nwk+sNv9Vtsc5ZTF51qqVctttjdaAkWZyEVFb0u5TOSQ9sFJEgxqz3WsnRp9Orc+p
	a3RYR7yHk+5aswNyVHtXDuDR4ypJCFHJacurMC8lSXZJitKS10BY9LyFsJDOVSomNSXl
	yH2yF3p0us3qpyrW0eaNXk19rKbFbd5UvtunAAa6UjzfMTSIfTyysEaWDxyX7mb1T5Ro
	v51jiF4k3MVZOFjJZsgmK1K7crIcktQ8FVwKo9wxxdcy11XFbiUeOLWSRzrid4bPP7Yk
	Tcug==
X-Received: by 10.15.42.138 with SMTP id u10mr1246053eev.7.1394706063243;
	Thu, 13 Mar 2014 03:21:03 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	i1sm6606312eeo.16.2014.03.13.03.21.01 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 13 Mar 2014 03:21:02 -0700 (PDT)
Date: Thu, 13 Mar 2014 11:21:16 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140313102116.GE3759@jama>
References: <CANR6C54WmokZxiFHThuXkZ-kiocewgnGVg7AtbH=FHjr1AFHsg@mail.gmail.com>
	<CANR6C56W7g63xx1D5WOA40YL8B_5j-q=uwt6VgFPW72eNZ=k7Q@mail.gmail.com>
	<CANyK_8eseDidQWN6tfCFXF3dXy6pQMH0uSCSyGAHDJfE_zfwzw@mail.gmail.com>
	<CANR6C55tvGxPN1DsJaupK53Z4HdWM=Zi5X8L7ZXM9k5FRH2LWQ@mail.gmail.com>
	<CANyK_8cKnc87R3AGRy1MpNJB9hbPhq1qr4LL5TdNWuBCZ55=+Q@mail.gmail.com>
	<CANR6C5466yB62G30Bg6LhdNYqz6KHb7hJVHEhLWSp1tC=BzGRQ@mail.gmail.com>
	<CANyK_8fbDxMDXkvoi0o1v6UwVaQx5+rp5C3qWjc=qv-BP5hC3w@mail.gmail.com>
	<CANR6C56dt_DH1yNKCBo8-sX63_wATEoFLpnONA42AQYccMi1=g@mail.gmail.com>
	<CANR6C56QsMoMJ7YLB4UF9jPYDO=aF8QEKPkV8XKrxsE1po29Dg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CANR6C56QsMoMJ7YLB4UF9jPYDO=aF8QEKPkV8XKrxsE1po29Dg@mail.gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: tk 8.6.0: strange error: "oe_runmake: command not found"
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 13 Mar 2014 10:21:08 -0000
X-Groupsio-MsgNum: 48642
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="KlAEzMkarCnErv5Q"
Content-Disposition: inline

--KlAEzMkarCnErv5Q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 13, 2014 at 07:23:36PM +1100, Nick D'Ademo wrote:
> This bug is still present and has been for nearly 3 months now.

tk is regularly failing in world builds for more than 3 months:
www.openembedded.org/wiki/Bitbake_World_Status
but with different error.

> Has anyone else encountered it or has any ideas as to why oe_runmake isn't
> being found?
>=20
>=20
>=20
>=20
> On Tue, Feb 18, 2014 at 3:11 AM, Nick D'Ademo <nickdademo@gmail.com> wrot=
e:
>=20
> > No worries Paul.
> >
> > The issue is currently listed in the state of Bitbake world failed tasks
> > as well, so hopefully someone else may see it and have a better idea.
> >
> >
> >
> >
> > On Mon, Feb 17, 2014 at 8:35 PM, Paul Barker <paul@paulbarker.me.uk>wro=
te:
> >
> >> On 11 February 2014 13:01, Nick D'Ademo <nickdademo@gmail.com> wrote:
> >> > The only reference to "oe_runmake" in the run file is within the
> >> > autotools_do_install() function (as pasted in my previous message).
> >> >
> >> > Complete run file below:
> >> >
> >> >> #!/bin/sh
> >> >>
> >> >> # Emit a useful diagnostic if something fails:
> >> >> bb_exit_handler() {
> >> >>     ret=3D$?
> >> >>     case $ret in
> >> >>     0)  ;;
> >> >>     *)  case $BASH_VERSION in
> >> >>         "")   echo "WARNING: exit code $ret from a shell command.";;
> >> >>         *)    echo "WARNING: ${BASH_SOURCE[0]}:${BASH_LINENO[0]} ex=
it
> >> $ret
> >> >> from
> >> >>   "$BASH_COMMAND"";;
> >> >>         esac
> >> >>         exit $ret
> >> >>     esac
> >> >> }
> >> >> trap 'bb_exit_handler' 0
> >> >> set -e
> >> >> export localstatedir=3D"/var"
> >> >> export prefix=3D"/usr"
> >> >> export LD=3D"x86_64-poky-linux-ld
> >> >> --sysroot=3D/home/nick/poky/build/tmp/sysroots/nuc  "
> >> >> export RANLIB=3D"x86_64-poky-linux-ranlib"
> >> >> export CXX=3D"x86_64-poky-linux-g++  -m64 -march=3Dcorei7 -mtune=3D=
corei7
> >> >> -mfpmath=3Dsse -msse4.2 --sysroot=3D/home/nick/poky/build/tmp/sysro=
ots/nuc"
> >> >> export lt_cv_sys_lib_dlsearch_path_spec=3D"/usr/lib64 /lib64"
> >> >> export servicedir=3D"/srv"
> >> >> export sysconfdir=3D"/etc"
> >> >> export TARGET_LDFLAGS=3D"-Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-ne=
eded"
> >> >> export PKG_CONFIG_DISABLE_UNINSTALLED=3D"yes"
> >> >> export STRINGS=3D"x86_64-poky-linux-strings"
> >> >> export
> >> >>
> >> BUILD_CFLAGS=3D"-isystem/home/nick/poky/build/tmp/sysroots/i686-linux/=
usr/include
> >> >> -O2 -pipe"
> >> >> export base_prefix=3D""
> >> >> export CPP=3D"x86_64-poky-linux-gcc -E
> >> >> --sysroot=3D/home/nick/poky/build/tmp/sysroots/nuc  -m64 -march=3Dc=
orei7
> >> >> -mtune=3Dcorei7 -mfpmath=3Dsse -msse4.2"
> >> >> export
> >> >>
> >> PSEUDO_LOCALSTATEDIR=3D"/home/nick/poky/build/tmp/work/corei7-64-poky-=
linux/tk/8.6.0-r0/pseudo/"
> >> >> export LOGNAME=3D"nick"
> >> >> export STRIP=3D"x86_64-poky-linux-strip"
> >> >> export datadir=3D"/usr/share"
> >> >> export PKG_CONFIG_SYSROOT_DIR=3D"/home/nick/poky/build/tmp/sysroots=
/nuc"
> >> >> export bindir=3D"/usr/bin"
> >> >> export mandir=3D"/usr/share/man"
> >> >> export
> >> >>
> >> CPPFLAGS_FOR_BUILD=3D"-isystem/home/nick/poky/build/tmp/sysroots/i686-=
linux/usr/include"
> >> >> export PATCH_GET=3D"0"
> >> >> export LDFLAGS=3D"-Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed
> >> >> -Wl,-rpath,/usr/lib64/tcltk/8.6.0/lib"
> >> >> export MAKE=3D"make"
> >> >> export
> >> >>
> >> PKG_CONFIG_PATH=3D"/home/nick/poky/build/tmp/sysroots/nuc/usr/lib64/pk=
gconfig:/home/nick/poky/build/tmp/sysroots/nuc/usr/share/pkgconfig"
> >> >> export LD_FOR_BUILD=3D"ld "
> >> >> export AS=3D"x86_64-poky-linux-as  "
> >> >> export AR=3D"x86_64-poky-linux-ar"
> >> >> export exec_prefix=3D"/usr"
> >> >> export LC_ALL=3D"C"
> >> >> export base_libdir=3D"/lib64"
> >> >> export
> >> >>
> >> PATH=3D"/home/nick/poky/scripts:/home/nick/poky/build/tmp/sysroots/i68=
6-linux/usr/bin/corei7-64-poky-linux:/home/nick/poky/build/tmp/sysroots/nuc=
/usr/bin/crossscripts:/home/nick/poky/build/tmp/sysroots/i686-linux/usr/sbi=
n:/home/nick/poky/build/tmp/sysroots/i686-linux/usr/bin:/home/nick/poky/bui=
ld/tmp/sysroots/i686-linux/sbin:/home/nick/poky/build/tmp/sysroots/i686-lin=
ux/bin:/home/nick/poky/scripts:/home/nick/poky/bitbake/bin:/usr/lib/lightdm=
/lightdm:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/=
games:/home/nick/workspace/tye-firmware/util/arm-2011.03/bin"
> >> >> export infodir=3D"/usr/share/info"
> >> >> export BUILD_CC=3D"gcc "
> >> >> export
> >> >> BUILD_LDFLAGS=3D"-L/home/nick/poky/build/tmp/sysroots/i686-linux/us=
r/lib
> >> >> -L/home/nick/poky/build/tmp/sysroots/i686-linux/lib
> >> >> -Wl,-rpath-link,/home/nick/poky/build/tmp/sysroots/i686-linux/usr/l=
ib
> >> >> -Wl,-rpath-link,/home/nick/poky/build/tmp/sysroots/i686-linux/lib
> >> >> -Wl,-rpath,/home/nick/poky/build/tmp/sysroots/i686-linux/usr/lib
> >> >> -Wl,-rpath,/home/nick/poky/build/tmp/sysroots/i686-linux/lib -Wl,-O=
1"
> >> >> export BUILD_CCLD=3D"gcc "
> >> >> export
> >> >>
> >> CFLAGS_FOR_BUILD=3D"-isystem/home/nick/poky/build/tmp/sysroots/i686-li=
nux/usr/include
> >> >> -O2 -pipe"
> >> >> export CC=3D"x86_64-poky-linux-gcc  -m64 -march=3Dcorei7 -mtune=3Dc=
orei7
> >> >> -mfpmath=3Dsse -msse4.2 --sysroot=3D/home/nick/poky/build/tmp/sysro=
ots/nuc"
> >> >> export CPPFLAGS=3D""
> >> >> export OBJCOPY=3D"x86_64-poky-linux-objcopy"
> >> >> export systemd_unitdir=3D"/lib/systemd"
> >> >> export
> >> >>
> >> PKG_CONFIG_DIR=3D"/home/nick/poky/build/tmp/sysroots/nuc/usr/lib64/pkg=
config"
> >> >> export CCLD=3D"x86_64-poky-linux-gcc  -m64 -march=3Dcorei7 -mtune=
=3Dcorei7
> >> >> -mfpmath=3Dsse -msse4.2 --sysroot=3D/home/nick/poky/build/tmp/sysro=
ots/nuc"
> >> >> export base_bindir=3D"/bin"
> >> >> export
> >> >>
> >> PKG_CONFIG_LIBDIR=3D"/home/nick/poky/build/tmp/sysroots/nuc/usr/lib64/=
pkgconfig"
> >> >> export sbindir=3D"/usr/sbin"
> >> >> export CFLAGS=3D" -O2 -pipe -g -feliminate-unused-debug-types"
> >> >> export
> >> >>
> >> LDFLAGS_FOR_BUILD=3D"-L/home/nick/poky/build/tmp/sysroots/i686-linux/u=
sr/lib
> >> >> -L/home/nick/poky/build/tmp/sysroots/i686-linux/lib
> >> >> -Wl,-rpath-link,/home/nick/poky/build/tmp/sysroots/i686-linux/usr/l=
ib
> >> >> -Wl,-rpath-link,/home/nick/poky/build/tmp/sysroots/i686-linux/lib
> >> >> -Wl,-rpath,/home/nick/poky/build/tmp/sysroots/i686-linux/usr/lib
> >> >> -Wl,-rpath,/home/nick/poky/build/tmp/sysroots/i686-linux/lib -Wl,-O=
1"
> >> >> export docdir=3D"/usr/share/doc"
> >> >> export TERM=3D"xterm"
> >> >> export CCACHE_DISABLE=3D"1"
> >> >> export
> >> >>
> >> BUILD_CXXFLAGS=3D"-isystem/home/nick/poky/build/tmp/sysroots/i686-linu=
x/usr/include
> >> >> -O2 -pipe -fpermissive"
> >> >> export FC=3D"x86_64-poky-linux-gfortran  -m64 -march=3Dcorei7 -mtun=
e=3Dcorei7
> >> >> -mfpmath=3Dsse -msse4.2 --sysroot=3D/home/nick/poky/build/tmp/sysro=
ots/nuc"
> >> >> export HOME=3D"/home/nick"
> >> >> export CXXFLAGS=3D" -O2 -pipe -g -feliminate-unused-debug-types
> >> -fpermissive
> >> >> -fvisibility-inlines-hidden"
> >> >> unset MACHINE
> >> >> export BUILD_STRIP=3D"strip"
> >> >> export PSEUDO_PASSWD=3D"/home/nick/poky/build/tmp/sysroots/nuc"
> >> >> export libexecdir=3D"/usr/lib64/tk"
> >> >> export TARGET_CXXFLAGS=3D" -O2 -pipe -g -feliminate-unused-debug-ty=
pes
> >> >> -fpermissive"
> >> >> export includedir=3D"/usr/include"
> >> >> export BUILD_LD=3D"ld "
> >> >> export oldincludedir=3D"/usr/include"
> >> >> export BUILD_RANLIB=3D"ranlib"
> >> >> export BUILD_NM=3D"nm"
> >> >> export BUILD_AR=3D"ar"
> >> >> export BUILD_AS=3D"as "
> >> >> export sharedstatedir=3D"/com"
> >> >> export CONFIG_SITE=3D"/home/nick/poky/meta/site/endian-little
> >> >> /home/nick/poky/meta/site/common-linux
> >> >> /home/nick/poky/meta/site/common-glibc
> >> >> /home/nick/poky/meta/site/x86_64-linux /home/nick/poky/meta/site/co=
mmon
> >> >> /home/nick/poky/meta-openembedded/meta-oe/site/endian-little "
> >> >> export PSEUDO_DISABLED=3D"0"
> >> >> export CXX_FOR_BUILD=3D"g++ "
> >> >> export libdir=3D"/usr/lib64"
> >> >> export nonarch_base_libdir=3D"/lib"
> >> >> export BUILD_CXX=3D"g++ "
> >> >> unset TARGET_ARCH
> >> >> export CCACHE_DIR=3D"/home/nick"
> >> >> export
> >> PSEUDO_PREFIX=3D"/home/nick/poky/build/tmp/sysroots/i686-linux/usr"
> >> >> export BUILD_CPP=3D"cpp "
> >> >> export base_sbindir=3D"/sbin"
> >> >> export USER=3D"nick"
> >> >> export NM=3D"x86_64-poky-linux-nm"
> >> >> export
> >> >>
> >> BUILD_CPPFLAGS=3D"-isystem/home/nick/poky/build/tmp/sysroots/i686-linu=
x/usr/include"
> >> >> export BUILD_FC=3D"gfortran "
> >> >> export CPP_FOR_BUILD=3D"cpp "
> >> >> export TARGET_CPPFLAGS=3D""
> >> >> export
> >> >>
> >> CXXFLAGS_FOR_BUILD=3D"-isystem/home/nick/poky/build/tmp/sysroots/i686-=
linux/usr/include
> >> >> -O2 -pipe -fpermissive"
> >> >> export TARGET_CFLAGS=3D" -O2 -pipe -g -feliminate-unused-debug-type=
s"
> >> >> export OBJDUMP=3D"x86_64-poky-linux-objdump"
> >> >> unset DISTRO
> >> >> export CC_FOR_BUILD=3D"gcc "
> >> >> export SHELL=3D"/bin/bash"
> >> >> export PSEUDO_NOSYMLINKEXP=3D"1"
> >> >> do_install() {
> >> >>     autotools_do_install
> >> >>     ln -sf libtk8.6.so
> >> >>
> >> /home/nick/poky/build/tmp/work/corei7-64-poky-linux/tk/8.6.0-r0/image/=
usr/lib64/libtk8.6.so.0
> >> >>     oe_libinstall -so libtk8.6
> >> >>
> >> /home/nick/poky/build/tmp/work/corei7-64-poky-linux/tk/8.6.0-r0/image/=
usr/lib64
> >> >>     ln -sf wish8.6
> >> >>
> >> /home/nick/poky/build/tmp/work/corei7-64-poky-linux/tk/8.6.0-r0/image/=
usr/bin/wish
> >> >>
> >> >>     # Even after passing libdir=3D/usr/lib64 at config, some incorr=
ect
> >> dirs
> >> >> are still generated for the multilib build
> >> >>     if [ "$libdir" !=3D "/usr/lib" ]; then
> >> >>         # Move files to correct library directory
> >> >>         mv
> >> >>
> >> /home/nick/poky/build/tmp/work/corei7-64-poky-linux/tk/8.6.0-r0/image/=
usr/lib/tk8.6/*
> >> >>
> >> /home/nick/poky/build/tmp/work/corei7-64-poky-linux/tk/8.6.0-r0/image/=
/usr/lib64/tk8.6/
> >> >>         # Remove unneeded/incorrect dir ('usr/lib/')
> >> >>         rm -rf
> >> >>
> >> /home/nick/poky/build/tmp/work/corei7-64-poky-linux/tk/8.6.0-r0/image/=
usr/lib
> >> >>     fi
> >> >>
> >> >> }
> >> >>
> >> >> oe_libinstall() {
> >> >>     # Purpose: Install a library, in all its forms
> >> >>     # Example
> >> >>     #
> >> >>     # oe_libinstall libltdl
> >> >> /home/nick/poky/build/tmp/sysroots/nuc/usr/lib64/
> >> >>     # oe_libinstall -C src/libblah libblah
> >> >>
> >> /home/nick/poky/build/tmp/work/corei7-64-poky-linux/tk/8.6.0-r0/image/=
/usr/lib64/
> >> >>     dir=3D""
> >> >>     libtool=3D""
> >> >>     silent=3D""
> >> >>     require_static=3D""
> >> >>     require_shared=3D""
> >> >>     staging_install=3D""
> >> >>     while [ "$#" -gt 0 ]; do
> >> >>         case "$1" in
> >> >>         -C)
> >> >>             shift
> >> >>             dir=3D"$1"
> >> >>             ;;
> >> >>         -s)
> >> >>             silent=3D1
> >> >>             ;;
> >> >>         -a)
> >> >>             require_static=3D1
> >> >>             ;;
> >> >>         -so)
> >> >>             require_shared=3D1
> >> >>             ;;
> >> >>         -*)
> >> >>             bbfatal "oe_libinstall: unknown option: $1"
> >> >>             ;;
> >> >>         *)
> >> >>             break;
> >> >>             ;;
> >> >>         esac
> >> >>         shift
> >> >>     done
> >> >>
> >> >>     libname=3D"$1"
> >> >>     shift
> >> >>     destpath=3D"$1"
> >> >>     if [ -z "$destpath" ]; then
> >> >>         bbfatal "oe_libinstall: no destination path specified"
> >> >>     fi
> >> >>     if echo "$destpath/" | egrep
> >> >> '^/home/nick/poky/build/tmp/sysroots/nuc/usr/lib64/' >/dev/null
> >> >>     then
> >> >>         staging_install=3D1
> >> >>     fi
> >> >>
> >> >>     __runcmd () {
> >> >>         if [ -z "$silent" ]; then
> >> >>             echo >&2 "oe_libinstall: $*"
> >> >>         fi
> >> >>         $*
> >> >>     }
> >> >>
> >> >>     if [ -z "$dir" ]; then
> >> >>         dir=3D`pwd`
> >> >>     fi
> >> >>
> >> >>     dotlai=3D$libname.lai
> >> >>
> >> >>     # Sanity check that the libname.lai is unique
> >> >>     number_of_files=3D`(cd $dir; find . -name "$dotlai") | wc -l`
> >> >>     if [ $number_of_files -gt 1 ]; then
> >> >>         bbfatal "oe_libinstall: $dotlai is not unique in $dir"
> >> >>     fi
> >> >>
> >> >>
> >> >>     dir=3D$dir`(cd $dir;find . -name "$dotlai") | sed
> >> >> "s/^\.//;s/\/$dotlai\$//;q"`
> >> >>     olddir=3D`pwd`
> >> >>     __runcmd cd $dir
> >> >>
> >> >>     lafile=3D$libname.la
> >> >>
> >> >>     # If such file doesn't exist, try to cut version suffix
> >> >>     if [ ! -f "$lafile" ]; then
> >> >>         libname1=3D`echo "$libname" | sed 's/-[0-9.]*$//'`
> >> >>         lafile1=3D$libname.la
> >> >>         if [ -f "$lafile1" ]; then
> >> >>             libname=3D$libname1
> >> >>             lafile=3D$lafile1
> >> >>         fi
> >> >>     fi
> >> >>
> >> >>     if [ -f "$lafile" ]; then
> >> >>         # libtool archive
> >> >>         eval `cat $lafile|grep "^library_names=3D"`
> >> >>         libtool=3D1
> >> >>     else
> >> >>         library_names=3D"$libname.so* $libname.dll.a $libname.*.dyl=
ib"
> >> >>     fi
> >> >>
> >> >>     __runcmd install -d $destpath/
> >> >>     dota=3D$libname.a
> >> >>     if [ -f "$dota" -o -n "$require_static" ]; then
> >> >>         rm -f $destpath/$dota
> >> >>         __runcmd install -m 0644 $dota $destpath/
> >> >>     fi
> >> >>     if [ -f "$dotlai" -a -n "$libtool" ]; then
> >> >>         rm -f $destpath/$libname.la
> >> >>         __runcmd install -m 0644 $dotlai $destpath/$libname.la
> >> >>     fi
> >> >>
> >> >>     for name in $library_names; do
> >> >>         files=3D`eval echo $name`
> >> >>         for f in $files; do
> >> >>             if [ ! -e "$f" ]; then
> >> >>                 if [ -n "$libtool" ]; then
> >> >>                     bbfatal "oe_libinstall: $dir/$f not found."
> >> >>                 fi
> >> >>             elif [ -L "$f" ]; then
> >> >>                 __runcmd cp -P "$f" $destpath/
> >> >>             elif [ ! -L "$f" ]; then
> >> >>                 libfile=3D"$f"
> >> >>                 rm -f $destpath/$libfile
> >> >>                 __runcmd install -m 0755 $libfile $destpath/
> >> >>             fi
> >> >>         done
> >> >>     done
> >> >>
> >> >>     if [ -z "$libfile" ]; then
> >> >>         if  [ -n "$require_shared" ]; then
> >> >>             bbfatal "oe_libinstall: unable to locate shared library"
> >> >>         fi
> >> >>     elif [ -z "$libtool" ]; then
> >> >>         # special case hack for non-libtool .so.#.#.# links
> >> >>         baselibfile=3D`basename "$libfile"`
> >> >>         if (echo $baselibfile | grep -qE '^lib.*\.so\.[0-9.]*$'); t=
hen
> >> >>             sonamelink=3D`x86_64-poky-linux-readelf -d $libfile |gr=
ep
> >> >> 'Library soname:' |sed -e 's/.*\[\(.*\)\].*/\1/'`
> >> >>             solink=3D`echo $baselibfile | sed -e 's/\.so\..*/.so/'`
> >> >>             if [ -n "$sonamelink" -a x"$baselibfile" !=3D x"$soname=
link"
> >> ];
> >> >> then
> >> >>                 __runcmd ln -sf $baselibfile $destpath/$sonamelink
> >> >>             fi
> >> >>             __runcmd ln -sf $baselibfile $destpath/$solink
> >> >>         fi
> >> >>     fi
> >> >>
> >> >>     __runcmd cd "$olddir"
> >> >>
> >> >>
> >> >> }
> >> >>
> >> >> autotools_do_install() {
> >> >>     oe_runmake
> >> >>
> >> 'DESTDIR=3D/home/nick/poky/build/tmp/work/corei7-64-poky-linux/tk/8.6.=
0-r0/image'
> >> >> install
> >> >>     # Info dir listing isn't interesting at this point so remove it=
 if
> >> it
> >> >> exists.
> >> >>     if [ -e
> >> >>
> >> "/home/nick/poky/build/tmp/work/corei7-64-poky-linux/tk/8.6.0-r0/image=
/usr/share/info/dir"
> >> >> ]; then
> >> >>         rm -f
> >> >>
> >> /home/nick/poky/build/tmp/work/corei7-64-poky-linux/tk/8.6.0-r0/image/=
usr/share/info/dir
> >> >>     fi
> >> >>
> >> >> }
> >> >>
> >> >> bbfatal() {
> >> >>     echo "ERROR: $*"
> >> >>     exit 1
> >> >>
> >> >> }
> >> >>
> >> >> cd
> >> >>
> >> '/home/nick/poky/build/tmp/work/corei7-64-poky-linux/tk/8.6.0-r0/tk8.6=
=2E0/unix'
> >> >> do_install
> >> >>
> >> >> # cleanup
> >> >> ret=3D$?
> >> >> trap '' 0
> >> >> exit $?
> >> >
> >>
> >> Sorry, I'm lost on where to look next on this. The run files in my
> >> builds include the definition of oe_runmake() and the other functions
> >> which are used so I assume that's what's supposed to happen. I was
> >> hoping someone else would notice this thread and have a better idea
> >> what the underlying problem might be. I've never really looked at the
> >> internals of bitbake or how these scripts are generated.
> >>
> >> I'd suggest asking on the #oe or #yocto channels on irc.freenode.net,
> >> plus maybe reposting to yocto@yoctoproject.org if no-one else replies
> >> to this and you still need help.
> >>
> >> Sorry I can't be any more help.
> >>
> >> --
> >> Paul Barker
> >>
> >> Email: paul@paulbarker.me.uk
> >> http://www.paulbarker.me.uk
> >>
> >
> >
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--KlAEzMkarCnErv5Q
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlMhhpwACgkQN1Ujt2V2gBwvzwCdFvmiAc47faDYbSVPUzW3QLg3
b3wAoKj5CfptOmcz7R3FApqobu6shupN
=aHZn
-----END PGP SIGNATURE-----

--KlAEzMkarCnErv5Q--
