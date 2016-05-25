Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id B56FC6FF73
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 May 2016 12:42:44 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id 67so15009771wmg.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 May 2016 05:42:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=RqkyDhmy21Zx14N/qQY46bNRzXQrPIHO1z5EmwTF1mg=;
	b=zXJO7w1rV0P9RfG3vBrgpriB1UTO02jRyfiD9hU52boPcXxyadhtej1vH58tGaGPkb
	QoodRHmbY5/qT2k9JEsEsFVLlW4Fjpr3HZoSFHZtUx6dH6yyHpElp0xMDPEgeC6zytaK
	40A6InnYFqtfkWAj1MdikzotxI4QOmgtd5LiH53NMnv2OpCF+L+DHJhL44rfbadee+5Q
	Qb7Qogu6eXgQgbV4SApatGsFpFDnpdM4uVpZ3XmU4Fc+UDYe8Q/uy0ZpjOgDZ+P+EEmE
	U8p9quWUJ7Mio5FKw96MDRV5TRKEHzLafTO539dP1/lj/qvzuTOXqv4/qO3PCUFFREUM
	zE7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=RqkyDhmy21Zx14N/qQY46bNRzXQrPIHO1z5EmwTF1mg=;
	b=V4BDJIDQI0PHC1xxiJ/F7y1djMdpdzw3PAIQXKcjRf91uupa3mtwVXT4vcjHs8LTdS
	P5n2X6gP1+y6KYhi+/WQ1NpIVzN+rlb+dwrE7+FtGDxQJb43AGa6H+AWTo0z6snGyP6T
	YtoOrVrJCBbUv7z0jtQwoG+q5Y3a0W4cQyzzSbwzYEOV81VIb/gDfAfya/Bs0W0Ubb1q
	n9SkOs6vBQaeIeNSpQ+lJ2N7wJxItMk8HkKJYFE5suviwWUjaiLuRMlzU90O/XBoekbi
	Nl4tgWX0lan7ySaWIlTobORkk9LQwW3lZn2u+JVLCELDwG/NzPdbE36+zNfKxEY+A8Qe
	5KNw==
X-Gm-Message-State: ALyK8tIpfuhrasz7pJIHb99rAwoRjpJREBIIAFy/fZ7JFsIx4RB73xfPpF/0XrifoYPLNQ==
X-Received: by 10.194.80.162 with SMTP id s2mr3691848wjx.116.1464180164486;
	Wed, 25 May 2016 05:42:44 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id i1sm8644059wjm.12.2016.05.25.05.42.43
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 25 May 2016 05:42:43 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 25 May 2016 14:42:56 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160525124256.GA2568@jama>
References: <1464116871-38779-1-git-send-email-abdur_rehman@mentor.com>
	<1464116871-38779-2-git-send-email-abdur_rehman@mentor.com>
MIME-Version: 1.0
In-Reply-To: <1464116871-38779-2-git-send-email-abdur_rehman@mentor.com>
User-Agent: Mutt/1.6.1 (2016-04-27)
Cc: Gary Thomas <gary@mlbassoc.com>
Subject: Re: [meta-oe][PATCH v4 2/2] mpv: Media Player
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
X-List-Received-Date: Wed, 25 May 2016 12:42:45 -0000
X-Groupsio-MsgNum: 61618
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="SUOF0GtieIMvvwua"
Content-Disposition: inline

--SUOF0GtieIMvvwua
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 25, 2016 at 12:07:51AM +0500, Abdur Rehman wrote:
> mpv is a fork of mplayer2 and MPlayer. It shares some features with
> the former projects while introducing many more.
>=20
> Signed-off-by: Gary Thomas <gary@mlbassoc.com>
> Signed-off-by: Abdur Rehman <abdur_rehman@mentor.com>
> ---
>  meta-oe/recipes-multimedia/mplayer/mpv_0.15.0.bb | 69 ++++++++++++++++++=
++++++
>  1 file changed, 69 insertions(+)
>  create mode 100644 meta-oe/recipes-multimedia/mplayer/mpv_0.15.0.bb
>=20
> diff --git a/meta-oe/recipes-multimedia/mplayer/mpv_0.15.0.bb b/meta-oe/r=
ecipes-multimedia/mplayer/mpv_0.15.0.bb
> new file mode 100644
> index 0000000..e5d5c53
> --- /dev/null
> +++ b/meta-oe/recipes-multimedia/mplayer/mpv_0.15.0.bb
> @@ -0,0 +1,69 @@
> +SUMMARY =3D "Open Source multimedia player"
> +SECTION =3D "multimedia"
> +HOMEPAGE =3D "http://www.mpv.io/"
> +DEPENDS =3D "zlib ffmpeg jpeg virtual/libx11 xsp libxv \
> +           libxscrnsaver libv4l libxinerama \
> +"
> +
> +REQUIRED_DISTRO_FEATURES =3D "x11"

You need to inherit distro_features_check for this to work.

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
> +inherit pkgconfig pythonnative
> +
> +# Note: both lua and libass are required to get on-screen-display (contr=
ols)
> +PACKAGECONFIG ??=3D "lua libass"
> +PACKAGECONFIG[lua] =3D "--enable-lua,--disable-lua,lua luajit"
> +PACKAGECONFIG[libass] =3D "--enable-libass,--disable-libass,libass"
> +PACKAGECONFIG[libarchive] =3D "--enable-libarchive,--disable-libarchive,=
libarchive"
> +PACKAGECONFIG[jack] =3D "--enable-jack, --disable-jack, jack"
> +
> +EXTRA_OECONF =3D " \
> +    --prefix=3D${prefix} \
> +    --target=3D${SIMPLE_TARGET_SYS} \
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
> +    export SIMPLE_TARGET_SYS=3D"$(echo ${TARGET_SYS} | sed s:${TARGET_VE=
NDOR}::g)"
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
> 2.8.1
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--SUOF0GtieIMvvwua
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAldFnVYACgkQN1Ujt2V2gBzCSQCfZCpfqV098yaZyPz/0PMOOyx4
8iwAniTVS4F0VgCEcjy0Bmyq7p/w3POi
=qxDb
-----END PGP SIGNATURE-----

--SUOF0GtieIMvvwua--
