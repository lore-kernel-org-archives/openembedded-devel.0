Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f178.google.com (mail-wi0-f178.google.com
	[209.85.212.178])
	by mail.openembedded.org (Postfix) with ESMTP id CE60765FE2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Jun 2014 16:51:56 +0000 (UTC)
Received: by mail-wi0-f178.google.com with SMTP id n15so4694152wiw.17
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Jun 2014 09:51:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=Ykg6BHpm1cKF0Q3ak4qHDzh4HZMf36lhD6a7k8UAlxg=;
	b=ByoMAPSBhPvLPzi0cwdwFFlOFJg3z5dXWrSpUTTEKADKAAGksAr68Zc20GfawCM5R7
	LQZcs0tdWx0CXkzEsLtFIW9QUfOw1TBTimQJsqHmk4nO/wC5pt3IOOHEnZSaxfPKfNO7
	aO0ffnLkU3rWIN3cKdkPJQ5exl7pbDN6B9BEeu4syoigjUBl3HTLwCG/s4eNjGDztE8h
	4dCBWk1tb4g9kmXSCM8dr+YDBPE5NmWB+juiApmGtk6824NkIoDECOQl6jwIQq8EkR0L
	bauOlGtU6mE4GG9wYkcyqms9dykHaqUkeJ1EZ6HPkgzycgmpF+sWlD2KkpAYiBEXYfHk
	VoxA==
X-Received: by 10.194.200.37 with SMTP id jp5mr5125254wjc.120.1403542315773;
	Mon, 23 Jun 2014 09:51:55 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	bq7sm34962126wib.7.2014.06.23.09.51.54
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 23 Jun 2014 09:51:54 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 23 Jun 2014 18:51:54 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140623165154.GI2437@jama>
References: <20140620081307.GW2117@jama>
	<CACgAsMeUBoXLNq48-2fz_ifnxf=nHGwE_RvAc-q+E_HRGmoYsA@mail.gmail.com>
	<20140620234853.GA2117@jama>
	<CACgAsMczZMkbPJ4VsfA8iHBKysS1uLKzDqxLxgkQr7cU_n1TmQ@mail.gmail.com>
	<20140621010508.GC2117@jama>
	<CACgAsMdguugQZiTiOo8aWaBZFCYnsWUtp7-0KWu7VdGvdBDCSA@mail.gmail.com>
	<20140621074733.GD2117@jama>
	<CACgAsMdQgREcvnQqnH5942TMzAR1LJr5bkHwm0nD+G2wNarEMg@mail.gmail.com>
	<20140623140131.GH2437@jama>
	<CACgAsMcSoWZSNh9cBnO6Vm9YuCf1NEzzr5VQ=KpSUfoKwC_x5Q@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CACgAsMcSoWZSNh9cBnO6Vm9YuCf1NEzzr5VQ=KpSUfoKwC_x5Q@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [yocto][meta-qt5][daisy] Error during bitbake of my image
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
X-List-Received-Date: Mon, 23 Jun 2014 16:51:58 -0000
X-Groupsio-MsgNum: 50531
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="boAH8PqvUi1v1f55"
Content-Disposition: inline

--boAH8PqvUi1v1f55
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 23, 2014 at 12:21:24PM -0400, Kevyn-Alexandre Par=E9 wrote:
> On Mon, Jun 23, 2014 at 10:01 AM, Martin Jansa <martin.jansa@gmail.com> w=
rote:
> > On Mon, Jun 23, 2014 at 09:40:28AM -0400, Kevyn-Alexandre Par=E9 wrote:
> <snip>
> >> Here the way I check that icu is added as part of my image:
> >> bitbake -e nirs-console-image | grep -n5 PACKAGECONFIG
> >> 2560-# $B_pn-strace
> >> 2561-#   set /home/knight/SVN/rogue/3rdParty/Yocto/trunk/starting_poin=
t/yocto_build/src/poky/meta/conf/distro/include/seperatebuilddir.inc:645
> >> 2562-#     "${SEPB}"
> >> 2563-B_pn-strace=3D"/home/knight/SVN/rogue/3rdParty/Yocto/trunk/starti=
ng_point/yocto_build/src/build/tmp/work/overo-poky-linux-gnueabi/nirs-conso=
le-image/1.0-r0/build"
> >> 2564-#
> >> 2565:# $PACKAGECONFIG [2 operations]
> >> 2566-#   set /home/knight/SVN/rogue/3rdParty/Yocto/trunk/starting_poin=
t/yocto_build/src/poky/meta/conf/documentation.conf:308
> >> 2567-#     [doc] "This variable provides a means of enabling or
> >> disabling features of a recipe on a per-recipe basis."
> >> 2568-#   _append[pn-qtbase]
> >> /home/knight/SVN/rogue/3rdParty/Yocto/trunk/starting_point/yocto_build=
/src/poky/meta-nirs/recipes-images/gumstix/nirs-console-image.bb:17
> >> 2569-#     "   developer   tests   examples   icu   alsa-lib   gles2
> >> accessibility   glib-2.0   tslib   linuxfb   sqlite3 "
> >
> > Are you trying to set PACKAGECONFIG_append_pn-qtbase from
> > nirs-console-image.bb? That wont work you need to set it in distro or
> > local.conf
>=20
> Yes I was :( I was rereading ref manual
>=20
> Configuration file: This method is identical to changing the block
> through an append file except you edit your local.conf or
> <mydistro>.conf file. As with append files previously described, you
> can either completely override the variable:
>=20
>      PACKAGECONFIG_pn-<recipename>=3D"f4 f5"
>=20
>=20
> Or, you can just amend the variable:
>=20
>      PACKAGECONFIG_append_pn-<recipename> =3D " f4"
>=20
>=20
> I Move my PACKAGECONFIG_append to my local.conf
>=20
> Here my setup for now just trying to make it compile remove the gles
> for now it was giving me errors...
>=20
> bitbake -e qtbase | grep ^PACKAGECONFIG=3D
> PACKAGECONFIG=3D"     release     dbus udev evdev widgets tools libs
> openssl     gl          xcb xvideo xsync xshape xrender xrandr xfixes
> xinput2 xinput xinerama xcursor gtkstyle xkb     fontconfig freetype
>   jpeg libpng zlib     pulseaudio       developer tests examples icu
> alsa-lib accessibility glib-2.0 tslib sqlite3
>=20
> cat tmp/work/armv7a-vfp-neon-poky-linux-gnueabi/qtbase/5.2.1-r0/build/con=
fig.summary
> | grep ICU
>   ICU .................... yes
>=20
> it's compiling further then before and stop
>=20
> meta-qt5/recipes-qt/qt5/qtdeclarative_5.2.1.bb, do_compile) failed
> with exit code '1'
>=20
> http://pastebin.com/qJAME8ew

Try to disable tests for qtdeclarative, they are not tested as often as
default setup so it's possible that there is some issue:
compiling
/home/knight/SVN/rogue/3rdParty/Yocto/trunk/starting_point/yocto_build/src/=
build/tmp/work/armv7a-vfp-neon-poky-linux-gnueabi/qtdeclarative/5.2.1-r0/qt=
declarative-opensource-src-5.2.1/tests/auto/qml/qv4debugger/tst_qv4debugger=
=2Ecpp
mv: `libplugin1.so' and `./libplugin1.so' are the same file
make[5]: [libplugin1.so] Error 1 (ignored)

> _reading_ qtbase.inc qtwebkit depends on qtdeclarative and it depends
> # gl or gles needs to be enabled in order to build qtdeclarative
>=20
> The error is maybe not related to this but will work on adding gles to my=
 image.
>=20
> >
> >> > Check config.summary in qtbase WORKDIR (where you built qtbase to be
> >> > sure it was enabled) and check with bitbake -e that it's really in y=
our
> >> > PACKAGECONFIG for qtbase.
> >>
> >> My bad I didn't check in the WORKDIR only in meta-qt5...
> >>
> >> Check config.summary:
> >> find tmp/work/armv7a-vfp-neon-poky-linux-gnueabi/qtbase/ -name config.=
summary
> >> tmp/work/armv7a-vfp-neon-poky-linux-gnueabi/qtbase/5.2.1-r0/build/conf=
ig.summary
> >>
> >> http://pastebin.com/gZ2Nqa5g
> >>
> >> Found that ICU is disable:
> >>  27 Support enabled for:
> >>  28   Accessibility .......... no
> >>  29   ALSA ................... no
> >>  30   CUPS ................... no
> >>  31   FontConfig ............. no
> >>  32   FreeType ............... qt
> >>  33   Iconv .................. no
> >>  34   ICU .................... no
> >>
> >> Clearly I'm doing something wrong!
> >
> > Yes, setting PACKAGECONFIG in wrong place.
>=20
> thx
>=20
> >
> > bitbake -e qtbase | grep ^PACKAGECONFIG=3D
> >
> > is what you need to check.
> >
> >> [1] Will _read_ and try to make the config.summary change to yes...
> >>
> >> [2] When i'm setting my PACKAGECONFIG and i'm having one like:
> >> PACKAGECONFIG[gles2] =3D "-opengl es2 -eglfs,,virtual/libgles2 virtual=
/egl"
> >>
> >> I'm suppose to set:
> >> PACKAGECONFIG_append_pn-qtbase =3D " virtual/libgles2"
> >> and not
> >> PACKAGECONFIG_append_pn-qtbase =3D " gles2"
> >> ?
> >
> > The later is less wrong, but setting
> > PACKAGECONFIG_GL_pn-qtbase =3D "gles2"
> > is even better.
>=20
> For gles2 it's easy to know to use PACKAGECONFIG_GL but how do you
> know for example when to put it where? I know it result all in
> PACKAGECONFIG but I'm just curious?
> ex: glib? PACKAGECONFIG_DISTRO or  PACKAGECONFIG_SYSTEM?
>=20
> Leaving for a week of vacancy & understanding a lot more thx to you!
>=20
> BR,
>=20
> -KA
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--boAH8PqvUi1v1f55
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlOoWyoACgkQN1Ujt2V2gByHbQCfZ2yAFzUBaj8O8vxehCQlScR6
qasAnidy9PL2jiQ2WNJ2Jq77JOfOKubA
=UZ+B
-----END PGP SIGNATURE-----

--boAH8PqvUi1v1f55--
