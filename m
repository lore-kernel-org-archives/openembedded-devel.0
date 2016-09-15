Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 179FF73695
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Sep 2016 08:20:06 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id b187so5903885wme.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Sep 2016 01:20:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=JDajzuf997VcxRbrBG5kGni14y6CirFBOY1UWMJY8ac=;
	b=xJIx1fXe70DHKfiQVjyOW8QwfOKRIoYaovHWAZouWQcnofGksg/tqsfcqi40/2qpUh
	PGFSQa+OUAsZYv+FfSVlKoZkCiqK+ZJXQeqHmyA8joOPtdmZrXXL4IFveGlsHq2I4O9Y
	fueVsRlm1iwS9YsTLUb9dRRkiFp6EeYwIulXb/1BtKbl+pK9aPIi4qRRZpo3337NPfW6
	+fRuX/HWaBLRPGpCQ19pmNoWTaQGDadPs0t850MjGVn/L4MgdBl5KhGT9tS6kxL2dxzX
	c/reOz1CqGaoCkPY4U6Fa3RKf7q2JJY5dY78G645vsgDTIQ0bcU5CXDY5xJsX6A1Lg+J
	trOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=JDajzuf997VcxRbrBG5kGni14y6CirFBOY1UWMJY8ac=;
	b=MC5g3I+txta7yNj2MzMKV3e0q6DLQAcnj3N1ENBIGDfQBYadUgaTC9+Tz9K7zkbZZH
	McnSIgMW51Btdtv4eUr7pyURNO+FXT3nDm6Xv9NO7pulyhFAbnrFiR8QI8lL9ISEojuu
	ZP01qleo+GR/kUQ5f68R4bsp8ebNYweoqaR251zR3HGOYG+47HwgrUUVS7qRKohCgqzT
	Gg8WW2y/+WqKwdD5eDVIb7D52M98Oe+QCFWawZRhu444Wl1m9CJ9Jvco7PtDrj7kg9vJ
	uOXbwkHO7aQoYjX2Sb3WkvDxkrchbetlY8BlfbrbF/68eivoJbhUH385ozbZ0hfq8QxJ
	ETAg==
X-Gm-Message-State: AE9vXwNLqaogRieY4fbklDzi6ygOLiCry+zMWb7bJwhxf+/nbTUR1CS2+XdUc2zOrnU7QQ==
X-Received: by 10.28.153.70 with SMTP id b67mr1907272wme.84.1473927606667;
	Thu, 15 Sep 2016 01:20:06 -0700 (PDT)
Received: from localhost (ip-89-176-104-169.net.upcbroadband.cz.
	[89.176.104.169]) by smtp.gmail.com with ESMTPSA id
	yt4sm2146856wjc.48.2016.09.15.01.20.05
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 15 Sep 2016 01:20:05 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 15 Sep 2016 10:20:04 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160915082004.GA2641@jama>
References: <20160915080551.15057-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20160915080551.15057-1-Martin.Jansa@gmail.com>
User-Agent: Mutt/1.7.0 (2016-08-17)
Subject: Re: [meta-browser][PATCH] chromium-wayland: include 0006-Remove-GBM-support-from-wayland.gyp.patch only with CHROMIUM_ENABLE_WAYLAND
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 15 Sep 2016 08:20:11 -0000
X-Groupsio-MsgNum: 63122
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="VbJkn9YxBvnuCH5J"
Content-Disposition: inline

--VbJkn9YxBvnuCH5J
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 15, 2016 at 10:05:51AM +0200, Martin Jansa wrote:
> * otherwise build fails to apply, because there is no ozone directory
>   No file to patch.  Skipping patch.

BTW: now that chromium-wayland was successfully built for first time
since it was separated, it shows couple of autodetected X11 dependencies
in last "world status" report:

count: 1	issue: textrel
chromium-wayland-48.0.2548.0: ELF binary '/tmp/work/i586-oe-linux/chromium-=
wayland/48.0.2548.0-r0/packages-split/chromium-wayland/usr/bin/chromium/chr=
ome' has relocations in .text [textrel]


count: 10	issue: build-deps
chromium-wayland-48.0.2548.0: chromium-wayland rdepends on atk, but it isn'=
t a build dependency, missing atk in DEPENDS or PACKAGECONFIG? [build-deps]
chromium-wayland-48.0.2548.0: chromium-wayland rdepends on gdk-pixbuf, but =
it isn't a build dependency, missing gdk-pixbuf in DEPENDS or PACKAGECONFIG=
? [build-deps]
chromium-wayland-48.0.2548.0: chromium-wayland rdepends on gtk+, but it isn=
't a build dependency, missing gtk+ in DEPENDS or PACKAGECONFIG? [build-dep=
s]
chromium-wayland-48.0.2548.0: chromium-wayland rdepends on libxcomposite, b=
ut it isn't a build dependency, missing libxcomposite in DEPENDS or PACKAGE=
CONFIG? [build-deps]
chromium-wayland-48.0.2548.0: chromium-wayland rdepends on libxcursor, but =
it isn't a build dependency, missing libxcursor in DEPENDS or PACKAGECONFIG=
? [build-deps]
chromium-wayland-48.0.2548.0: chromium-wayland rdepends on libxscrnsaver, b=
ut it isn't a build dependency, missing libxscrnsaver in DEPENDS or PACKAGE=
CONFIG? [build-deps]

>=20
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  recipes-browser/chromium/chromium-wayland_48.0.2548.0.bb | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>=20
> diff --git a/recipes-browser/chromium/chromium-wayland_48.0.2548.0.bb b/r=
ecipes-browser/chromium/chromium-wayland_48.0.2548.0.bb
> index 8db8a4e..f7ad2ce 100644
> --- a/recipes-browser/chromium/chromium-wayland_48.0.2548.0.bb
> +++ b/recipes-browser/chromium/chromium-wayland_48.0.2548.0.bb
> @@ -7,7 +7,6 @@ SRC_URI +=3D "\
>          file://0003-Remove-hard-coded-values-for-CC-and-CXX.patch \
>          file://0004-Create-empty-i18n_process_css_test.html-file-to-avoi=
=2Epatch \
>          file://0005-Override-root-filesystem-access-restriction.patch \
> -	file://chromium-wayland/0006-Remove-GBM-support-from-wayland.gyp.patch \
>  	file://chromium-wayland/0007-Workaround-for-glib-related-build-error-wi=
th-ozone-w.patch \
>          file://chromium-wayland/0011-Replace-readdir_r-with-readdir.patc=
h \
>          file://chromium-wayland/remove-Werror.patch \
> @@ -22,7 +21,7 @@ SRC_URI[sha256sum] =3D "4ca4e2adb340b3fb4d502266ad7d6bd=
a45fa3519906dbf63cce11a63f6
>  OZONE_WAYLAND_GIT_BRANCH =3D "Milestone-SouthSister"
>  OZONE_WAYLAND_GIT_SRCREV =3D "c605505044af3345a276abbd7c29fd53db1dea40"
> =20
> -SRC_URI +=3D "${@base_conditional('CHROMIUM_ENABLE_WAYLAND', '1', 'git:/=
/github.com/01org/ozone-wayland.git;destsuffix=3D${OZONE_WAYLAND_GIT_DESTSU=
FFIX};branch=3D${OZONE_WAYLAND_GIT_BRANCH};rev=3D${OZONE_WAYLAND_GIT_SRCREV=
}', '', d)}"
> +SRC_URI +=3D "${@base_conditional('CHROMIUM_ENABLE_WAYLAND', '1', 'git:/=
/github.com/01org/ozone-wayland.git;destsuffix=3D${OZONE_WAYLAND_GIT_DESTSU=
FFIX};branch=3D${OZONE_WAYLAND_GIT_BRANCH};rev=3D${OZONE_WAYLAND_GIT_SRCREV=
} file://chromium-wayland/0006-Remove-GBM-support-from-wayland.gyp.patch', =
'', d)}"
> =20
>  # Component build is unsupported in ozone-wayland for Chromium 48
>  python() {
> --=20
> 2.10.0
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--VbJkn9YxBvnuCH5J
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAlfaWbMACgkQN1Ujt2V2gBwyMwCffA2VED16bLj8B9lgCyT8VsIy
y4kAoJp4E7bphYs9VJTjri8xnh/Q60My
=OhDK
-----END PGP SIGNATURE-----

--VbJkn9YxBvnuCH5J--
