Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id A531A6FF97
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Mar 2016 13:14:47 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id p65so2383727wmp.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Mar 2016 05:14:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=1sUf6Mps0FGAToCDYDaIz0uTljWtDMIov/ZKCilqyeg=;
	b=k+CEg5RCz6jZOhrEjeGr/rMoOW5mttLeZUODS8YLFwWiNHLTp6/o8JjaOnE3aFUCHL
	FQxU/rdViJabCx/dvAkVnloraPraYv5TbaCDY2sGr46E6UB/XSMIPFUrFP0iYanhlG7v
	HZBWm0QOnllko3mngbdQ6f2iuUD41ieUUudOWCBEySDzWaTsaRWT8YOlOF8cKVeExRAh
	NU5q1zxehYo5Lyfd/JciH+c/OMSNpGA8M/B8uKXNxfvBDTng1TR+LmmUR4O4egFf1hw/
	iFcYZO3REdPfB4aQLpidyUsdJPrAjKN8hdBaimMqzpMtn5ITuGZFn4AOrvzICTM4MVB1
	F58g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=1sUf6Mps0FGAToCDYDaIz0uTljWtDMIov/ZKCilqyeg=;
	b=CP6a/JVnIk1v+N7DIIgsINy1ivWV06m0AykXBNYhxAyDrxQsRZcWfJ6k++hO+upueO
	w6cSo8ADmNlGexPyGj+rIqnPvFw9uiF/5L6SfG+3VB97VKyGgXIgK3oTBD4sZ0edl9ny
	9ni0kGE/R01gaL8ETzYIHBhP3+TgHPC7CrNc86XvBD8X6vH+eavpd2KJhV3yUq8zxbcw
	gNz3DgoWFK+38+PxT55/LkmVrFisI6au49+o5CRRE6ForMj/y1uLw5fiKX9RsTHZBZk9
	2OLBAoEdEpihyXn64JxsM4PuATtyE3TfveHWM5/0Slgh+nUICcoF2yROVgmnzWhxTXaL
	woDw==
X-Gm-Message-State: AD7BkJKrkKFc5Yn+i7UzDg75uqEr14UOZnXb3Sbiv+Y7KuYjMGIdLmvTJioFFC5KjOzAPw==
X-Received: by 10.28.234.201 with SMTP id g70mr2858343wmi.40.1457702087529;
	Fri, 11 Mar 2016 05:14:47 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	jo6sm8384598wjb.48.2016.03.11.05.14.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 11 Mar 2016 05:14:46 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 11 Mar 2016 14:17:52 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160311131752.GA2555@jama>
References: <1457626042-28653-1-git-send-email-gary@mlbassoc.com>
	<1457626042-28653-3-git-send-email-gary@mlbassoc.com>
MIME-Version: 1.0
In-Reply-To: <1457626042-28653-3-git-send-email-gary@mlbassoc.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: Gary Thomas <gary@mlbassoc.com>
Subject: Re: [meta-oe][PATCH v3 2/2] mpv: Media Player
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
X-List-Received-Date: Fri, 11 Mar 2016 13:14:51 -0000
X-Groupsio-MsgNum: 60488
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="jRHKVT23PllUwdXP"
Content-Disposition: inline

--jRHKVT23PllUwdXP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 10, 2016 at 05:07:22PM +0100, Gary Thomas wrote:
> mpv is a fork of mplayer2 and MPlayer. It shares some features with
> the former projects while introducing many more.
>=20
> Signed-off-by: Gary Thomas <gary@mlbassoc.com>
> ---
>  meta-oe/recipes-multimedia/mplayer/mpv_0.15.0.bb | 67 ++++++++++++++++++=
++++++
>  1 file changed, 67 insertions(+)
>  create mode 100644 meta-oe/recipes-multimedia/mplayer/mpv_0.15.0.bb
>=20
> diff --git a/meta-oe/recipes-multimedia/mplayer/mpv_0.15.0.bb b/meta-oe/r=
ecipes-multimedia/mplayer/mpv_0.15.0.bb
> new file mode 100644
> index 0000000..acad319
> --- /dev/null
> +++ b/meta-oe/recipes-multimedia/mplayer/mpv_0.15.0.bb
> @@ -0,0 +1,67 @@
> +SUMMARY =3D "Open Source multimedia player"
> +SECTION =3D "multimedia"
> +HOMEPAGE =3D "http://www.mpv.io/"
> +DEPENDS =3D "zlib ffmpeg jpeg virtual/libx11 xsp libxv \
> +           libxscrnsaver libv4l libxinerama \
> +"

It's failing in world builds

ERROR: mpv-0.15.0-r0 do_compile: Function failed: do_compile (log file is l=
ocated at /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-g=
nueabi/mpv/0.15.0-r0/temp/log.do_compile.11834)
ERROR: Logfile of failure stored in: /home/jenkins/oe/world/shr-core/tmp-gl=
ibc/work/armv5te-oe-linux-gnueabi/mpv/0.15.0-r0/temp/log.do_compile.11834
Log data follows:
| DEBUG: Executing shell function do_compile
| Waf: Entering directory `/home/jenkins/oe/world/shr-core/tmp-glibc/work/a=
rmv5te-oe-linux-gnueabi/mpv/0.15.0-r0/mpv-0.15.0/build'
| [  1/195] Compiling version.sh
| [  2/195] Compiling TOOLS/osxbundle/mpv.app/Contents/Resources/icon.icns
| [  3/195] Compiling video/out/x11_icon.bin
| [  4/195] Compiling etc/input.conf
| [  5/195] Compiling sub/osd_font.otf
| [  6/195] Compiling video/out/opengl/nnedi3_weights.bin
| [  7/195] Compiling player/lua/defaults.lua
| [  8/195] Compiling player/lua/assdraw.lua
| [  9/195] Compiling player/lua/options.lua
| [ 10/195] Compiling player/lua/osc.lua
| [ 11/195] Compiling player/lua/ytdl_hook.lua
| [ 13/195] Processing ebml_types.h: demux/ebml.c demux/demux_mkv.c -> buil=
d/ebml_types.h
| [ 13/195] Compiling demux/ebml.c
| [ 14/195] Compiling DOCS/man/mpv.rst
| Traceback (most recent call last):
|   File "/home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/u=
sr/bin/rst2man.py", line 21, in <module>
|     from docutils.core import publish_cmdline, default_description
| ImportError: No module named docutils.core
|=20
| Waf: Leaving directory `/home/jenkins/oe/world/shr-core/tmp-glibc/work/ar=
mv5te-oe-linux-gnueabi/mpv/0.15.0-r0/mpv-0.15.0/build'
| Build failed
|  -> task in 'rst2man' failed (exit status 1):
| 	{task 139933719149072: rst2man mpv.rst -> mpv.1}
| ' /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/bin=
/rst2man.py ../DOCS/man/mpv.rst DOCS/man/mpv.1 '
| WARNING: exit code 1 from a shell command.
| ERROR: Function failed: do_compile (log file is located at /home/jenkins/=
oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/mpv/0.15.0-r0/tem=
p/log.do_compile.11834)
NOTE: recipe mpv-0.15.0-r0: task do_compile: Failed
ERROR: Task 15304 (/home/jenkins/oe/world/shr-core/meta-openembedded/meta-o=
e/recipes-multimedia/mplayer/mpv_0.15.0.bb, do_compile) failed with exit co=
de '1'


> +
> +REQUIRED_DISTRO_FEATURES =3D "x11"
> +
> +LICENSE =3D "GPLv2+"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D91f1cb870c1cc2d31351a4d259544=
1cb"
> +
> +SRC_URI =3D "https://github.com/mpv-player/mpv/archive/v${PV}.tar.gz;nam=
e=3Dmpv \
> +           http://www.freehackers.org/~tnagy/release/waf-1.8.12;name=3Dw=
af \
> +"
> +SRC_URI[mpv.md5sum] =3D "9042bd3fbff2bc8ba0b7fadaa4a22101"
> +SRC_URI[mpv.sha256sum] =3D "7d31217ba8572f364fcea2955733f821374ae6d8c6d8=
f22f8bc63c44c0400bdc"
> +SRC_URI[waf.md5sum] =3D "cef4ee82206b1843db082d0b0506bf71"
> +SRC_URI[waf.sha256sum] =3D "01bf2beab2106d1558800c8709bc2c8e496d3da4a2ca=
343fe091f22fca60c98b"
> +
> +inherit pkgconfig
> +
> +# Note: both lua and libass are required to get on-screen-display (contr=
ols)
> +PACKAGECONFIG ??=3D "lua libass"
> +PACKAGECONFIG[lua] =3D "--enable-lua,--disable-lua,lua luajit"
> +PACKAGECONFIG[libass] =3D "--enable-libass,--disable-libass,libass"
> +PACKAGECONFIG[libarchive] =3D "--enable-libarchive,--disable-libarchive,=
libarchive"
> +
> +EXTRA_OECONF =3D " \
> +    --prefix=3D${prefix} \
> +    --target=3D${SIMPLE_TARGET_SYS} \

Where is this variable set? git grep in oe-core and meta-oe didn't show any=
thing.

Did you copy it from mplayer2 recipe?

If yes then you forgot to include:
export SIMPLE_TARGET_SYS=3D"$(echo ${TARGET_SYS} | sed s:${TARGET_VENDOR}::=
g)"

> +    --confdir=3D${sysconfdir} \
> +    --datadir=3D${datadir} \
> +    --disable-manpage-build \
> +    --disable-gl \
> +    --disable-libsmbclient \
> +    --disable-encoding \
> +    --disable-libbluray \
> +    --disable-dvdread \
> +    --disable-dvdnav \
> +    --disable-cdda \
> +    --disable-enca \
> +    --disable-libguess \
> +    --disable-uchardet \
> +    --disable-rubberband \
> +    --disable-lcms2 \
> +    --disable-vapoursynth \
> +    --disable-vapoursynth-lazy \
> +"
> +
> +do_configure() {
> +    if [ ! -L ../waf ]; then
> +        chmod a+x ../waf-1.8.12
> +	ln -s waf-1.8.12 ../waf
> +    fi
> +    ../waf configure ${EXTRA_OECONF}
> +}
> +
> +do_compile () {
> +    ../waf build
> +}
> +
> +do_install() {
> +    ../waf install --destdir=3D${D}
> +}
> +
> +FILES_${PN} +=3D "${datadir}/icons"
> --=20
> 2.5.0
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--jRHKVT23PllUwdXP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlbixX4ACgkQN1Ujt2V2gBxxmQCfc/KIgUMof+XTw/yhBEQoIkd/
NjYAn3Vikk3JLjkYiephZzbBgxmGzb+A
=9RjX
-----END PGP SIGNATURE-----

--jRHKVT23PllUwdXP--
