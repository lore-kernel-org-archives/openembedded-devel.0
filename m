Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f181.google.com (mail-we0-f181.google.com
	[74.125.82.181])
	by mail.openembedded.org (Postfix) with ESMTP id 2FCE666055
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Jun 2014 14:01:36 +0000 (UTC)
Received: by mail-we0-f181.google.com with SMTP id q59so6870349wes.26
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Jun 2014 07:01:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=aljXthyQDyo0Ouc5CexJRXCi6SfOSXae/rRuZ3Sq5lA=;
	b=mQkVPjozd7NWeF72N7csq0vbivETlDR/4QB8+GxzdRmveeUTI5PhwT/RcJBn1knTE2
	7/TEpGLfFpDATx3wkkJ0GeGTsgu6jcKYlr5iqSofcXDL8Wt93VaDYev6pHVtuVHFZZSF
	Rr4+F7sK72n0uSMj5KPY3L9Z4uhdTNzJ0TsWTMFSW42XGT/9REXMMnsGZMy2YGdAsOh0
	AV8mQvG4zcUNjMMdecrv8GLxrz7e/u3HwaATKtHCh+uJ8XFNYxiLhZvpzOtLA77RmQDC
	1EEA6KKWrwDvRTiZmanBKuLxMrwQb9bALgYmkmbPdys6Okp4PSPRh6uOZcJVzdC6dH+h
	Qt6w==
X-Received: by 10.194.80.7 with SMTP id n7mr27760288wjx.8.1403532093292;
	Mon, 23 Jun 2014 07:01:33 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	i3sm33684516wiz.13.2014.06.23.07.01.32
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 23 Jun 2014 07:01:32 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 23 Jun 2014 16:01:31 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140623140131.GH2437@jama>
References: <20140619232132.GV2117@jama>
	<CACgAsMdCCZNcNwmLF-BEEcY=JuTtMCPL9K+9TEhCKU7Q+DAs4g@mail.gmail.com>
	<20140620081307.GW2117@jama>
	<CACgAsMeUBoXLNq48-2fz_ifnxf=nHGwE_RvAc-q+E_HRGmoYsA@mail.gmail.com>
	<20140620234853.GA2117@jama>
	<CACgAsMczZMkbPJ4VsfA8iHBKysS1uLKzDqxLxgkQr7cU_n1TmQ@mail.gmail.com>
	<20140621010508.GC2117@jama>
	<CACgAsMdguugQZiTiOo8aWaBZFCYnsWUtp7-0KWu7VdGvdBDCSA@mail.gmail.com>
	<20140621074733.GD2117@jama>
	<CACgAsMdQgREcvnQqnH5942TMzAR1LJr5bkHwm0nD+G2wNarEMg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CACgAsMdQgREcvnQqnH5942TMzAR1LJr5bkHwm0nD+G2wNarEMg@mail.gmail.com>
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
X-List-Received-Date: Mon, 23 Jun 2014 14:01:40 -0000
X-Groupsio-MsgNum: 50526
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="RwGu8mu1E+uYXPWP"
Content-Disposition: inline

--RwGu8mu1E+uYXPWP
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 23, 2014 at 09:40:28AM -0400, Kevyn-Alexandre Par=E9 wrote:
> On Sat, Jun 21, 2014 at 3:47 AM, Martin Jansa <martin.jansa@gmail.com> wr=
ote:
> > On Fri, Jun 20, 2014 at 11:35:34PM -0400, Kevyn-Alexandre Par=E9 wrote:
> >> On Fri, Jun 20, 2014 at 9:05 PM, Martin Jansa <martin.jansa@gmail.com>=
 wrote:
> >> > On Fri, Jun 20, 2014 at 08:22:39PM -0400, Kevyn-Alexandre Par=E9 wro=
te:
> >> >> On Fri, Jun 20, 2014 at 7:48 PM, Martin Jansa <martin.jansa@gmail.c=
om> wrote:
> >> >> > On Fri, Jun 20, 2014 at 06:30:09PM -0400, Kevyn-Alexandre Par=E9 =
wrote:
> >> >> >> [1] I still don't understand why adding qtwebkit IMAGE_INSTALL m=
ake my
> >> >> >> build fail with:
> >> >> >> ERROR: qtwebkit not found in the base feeds
> >> >> >> LOG: http://pastebin.com/fx2Zi9vW
> >> >> >> Any clue what I'm doing wrong?
> >> >> >
> >> >> > Check which packages (if any) were created by qtwebkit recipe, if=
 any
> >> >> > then read log.do_configure for possible clues.
> >> >> >
> >> >>
> >> >> qtwebkit-dbg and qtwebkit-dev is part of deploy rpm not qtwebkit? In
> >> >> pkgdata these only to have ".packaged"
> >> >> http://pastebin.com/0ugj2NVF
> >> >>
> >> >> log.do_configure:
> >> >> http://pastebin.com/cXWdDXmy
> >> >
> >> > The WebKit build was disabled for the following reasons:
> >> >     * ICU is required. To build QtWebKit with Qt 5 you need to build=
 Qt
> >> >      5 with libICU support. Check for ICU support being mentioned in
> >> >      qtbase/config.summary.
> >> >
> >>
> >> Yes you told me that in previous email I when to
> >> layers.openembedded.org to check
> >>
> >> icu  53.1 International Component for Unicode libraries   openembedded=
-core
> >>
> >> I add it in PACKAGECONFIG_append_pn-qtbase and IMAGE_INSTALL I thought
> >> it will be enough?
> >>
> >> Obviously, I'm still missing somethink
> >>
> >> qtbase/config.summary? you mean qtbase.inc?
> >
> > I've just pasted it for you from the log.do_configure you sent me,
> > please _read_ it.
> >
>=20
> Thanks for trying to make me _see_ what I'm clearly not seeing yet...
>=20
> I cleanall qtbase & my image since I was having multiple
> log.do_configure and could have looked at the wrong one...
>=20
> My image with IMAGE_INSTALL & PACKAGECONFIG:
> http://pastebin.com/4JCWb5cY
>=20
> Here the way I check that icu is added as part of my image:
> bitbake -e nirs-console-image | grep -n5 PACKAGECONFIG
> 2560-# $B_pn-strace
> 2561-#   set /home/knight/SVN/rogue/3rdParty/Yocto/trunk/starting_point/y=
octo_build/src/poky/meta/conf/distro/include/seperatebuilddir.inc:645
> 2562-#     "${SEPB}"
> 2563-B_pn-strace=3D"/home/knight/SVN/rogue/3rdParty/Yocto/trunk/starting_=
point/yocto_build/src/build/tmp/work/overo-poky-linux-gnueabi/nirs-console-=
image/1.0-r0/build"
> 2564-#
> 2565:# $PACKAGECONFIG [2 operations]
> 2566-#   set /home/knight/SVN/rogue/3rdParty/Yocto/trunk/starting_point/y=
octo_build/src/poky/meta/conf/documentation.conf:308
> 2567-#     [doc] "This variable provides a means of enabling or
> disabling features of a recipe on a per-recipe basis."
> 2568-#   _append[pn-qtbase]
> /home/knight/SVN/rogue/3rdParty/Yocto/trunk/starting_point/yocto_build/sr=
c/poky/meta-nirs/recipes-images/gumstix/nirs-console-image.bb:17
> 2569-#     "   developer   tests   examples   icu   alsa-lib   gles2
> accessibility   glib-2.0   tslib   linuxfb   sqlite3 "

Are you trying to set PACKAGECONFIG_append_pn-qtbase from
nirs-console-image.bb? That wont work you need to set it in distro or
local.conf

> > Check config.summary in qtbase WORKDIR (where you built qtbase to be
> > sure it was enabled) and check with bitbake -e that it's really in your
> > PACKAGECONFIG for qtbase.
>=20
> My bad I didn't check in the WORKDIR only in meta-qt5...
>=20
> Check config.summary:
> find tmp/work/armv7a-vfp-neon-poky-linux-gnueabi/qtbase/ -name config.sum=
mary
> tmp/work/armv7a-vfp-neon-poky-linux-gnueabi/qtbase/5.2.1-r0/build/config.=
summary
>=20
> http://pastebin.com/gZ2Nqa5g
>=20
> Found that ICU is disable:
>  27 Support enabled for:
>  28   Accessibility .......... no
>  29   ALSA ................... no
>  30   CUPS ................... no
>  31   FontConfig ............. no
>  32   FreeType ............... qt
>  33   Iconv .................. no
>  34   ICU .................... no
>=20
> Clearly I'm doing something wrong!

Yes, setting PACKAGECONFIG in wrong place.

bitbake -e qtbase | grep ^PACKAGECONFIG=3D

is what you need to check.

> [1] Will _read_ and try to make the config.summary change to yes...
>=20
> [2] When i'm setting my PACKAGECONFIG and i'm having one like:
> PACKAGECONFIG[gles2] =3D "-opengl es2 -eglfs,,virtual/libgles2 virtual/eg=
l"
>=20
> I'm suppose to set:
> PACKAGECONFIG_append_pn-qtbase =3D " virtual/libgles2"
> and not
> PACKAGECONFIG_append_pn-qtbase =3D " gles2"
> ?

The later is less wrong, but setting
PACKAGECONFIG_GL_pn-qtbase =3D "gles2"
is even better.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--RwGu8mu1E+uYXPWP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlOoMzsACgkQN1Ujt2V2gByCUwCfdwoHnaNx7P6B1aBWhLUJFWm2
D20AnAgutP/QD6Ii5hKebkbutaXH8T+9
=hcbj
-----END PGP SIGNATURE-----

--RwGu8mu1E+uYXPWP--
