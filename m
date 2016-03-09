Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f47.google.com (mail-wm0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id 4631B60721
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  9 Mar 2016 19:12:40 +0000 (UTC)
Received: by mail-wm0-f47.google.com with SMTP id l68so193177253wml.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 09 Mar 2016 11:12:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=hlKmJ7YvlbmjJ9fCnyO0AnRPPtlu+poYyOemNKZKyXU=;
	b=EpmkiO9cJ/KZcwvXi14wAbQ/paImbXpGlRw6ld6qBaXa6U965P3rCAgL4ksc79B8zb
	lyVYHlZrLX8WUkGnv9yWIXxTd9tEBPpzvHCRDO/fSs4OKOlBQs75vH3p0FyNy3bpF1xf
	unsv4qHlm0yxUMTBsRI4zhxRZe+bGBoIEQQuOSmEKMycUyyIYs/F8JleDc2/TxQteYRs
	vdUqeTXYOI/VF4XE5oi37ubtEUTs7pBE2MIVLQTqxEMTy07xERoaovAG1qU6kNIRTPVM
	pfaUSWg9QRFHNTXnbUPMrK/+wmRQktCHOXDHOXGOmQJozdIBMA+Ft0VFgQV10uGxazUb
	SUsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=hlKmJ7YvlbmjJ9fCnyO0AnRPPtlu+poYyOemNKZKyXU=;
	b=AUpElXFJhG/lb56S21y4rb3Syf3gon/yhipOaQAkkxdKdFG6sM2jRct5gXOqfBe5Fh
	D/fcIfdU8KgQEKwa1swy4GmwHSOZo70f70nlEWFq8rdGTxNe/5WafgRg26iphNmH1wn5
	QU4omRERShmjhtKQCHvGeZT0zjymYBJHYqKZnrRY2kcsGd/6S8L4UrCY4vsnO//A3jyl
	ICG5u4QldGIouED8PbtcHB+xmlwkr2yFK6SkTOwZjtZcH2F1YMJJDtnROrmBcaDRK9kq
	oP+YpzDv+xkVASgfyItxjf7Hq6z8gddeOHLiwGJryakAQ+lObi6qbA2fNPWDX/gU7siY
	tZVA==
X-Gm-Message-State: AD7BkJKVjDCH3aTSWtt3y/1kpRyo4vBvO/cKkREBRCLb636gvhLxZHhoAjPkWkKyHXYmRg==
X-Received: by 10.194.92.107 with SMTP id cl11mr42300937wjb.21.1457550760711; 
	Wed, 09 Mar 2016 11:12:40 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id 192sm51967wmw.0.2016.03.09.11.12.38
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 09 Mar 2016 11:12:38 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 9 Mar 2016 20:15:32 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160309191532.GI2542@jama>
References: <1457504433-21548-1-git-send-email-gary@mlbassoc.com>
MIME-Version: 1.0
In-Reply-To: <1457504433-21548-1-git-send-email-gary@mlbassoc.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: Gary Thomas <gary@mlbassoc.com>
Subject: Re: [meta-oe][PATCH] mpv: Media Player
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
X-List-Received-Date: Wed, 09 Mar 2016 19:12:40 -0000
X-Groupsio-MsgNum: 60432
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="huG+SbfbdD6eblZQ"
Content-Disposition: inline

--huG+SbfbdD6eblZQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 09, 2016 at 07:20:33AM +0100, Gary Thomas wrote:
> mpv is a fork of mplayer2 and MPlayer. It shares some features with the f=
ormer projects while introducing many more.
>=20
> Signed-off-by: Gary Thomas <gary@mlbassoc.com>
> ---
>  meta-oe/recipes-multimedia/mplayer/mpv_0.15.0.bb | 60 ++++++++++++++++++=
++++++
>  1 file changed, 60 insertions(+)
>  create mode 100644 meta-oe/recipes-multimedia/mplayer/mpv_0.15.0.bb
>=20
> diff --git a/meta-oe/recipes-multimedia/mplayer/mpv_0.15.0.bb b/meta-oe/r=
ecipes-multimedia/mplayer/mpv_0.15.0.bb
> new file mode 100644
> index 0000000..37e4b02
> --- /dev/null
> +++ b/meta-oe/recipes-multimedia/mplayer/mpv_0.15.0.bb
> @@ -0,0 +1,60 @@
> +SUMMARY =3D "Open Source multimedia player"
> +SECTION =3D "multimedia"
> +HOMEPAGE =3D "http://www.mpv.io/"
> +DEPENDS =3D "zlib ffmpeg jpeg virtual/libx11 xsp libxv libxscrnsaver"
> +
> +# Depends on xsp, libxv, virtual/libx11, libxscrnsaver
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
> +EXTRA_OECONF =3D " \
> +    --prefix=3D${D}/usr \
why not ${prefix} and does it really need to be prefixed with ${D}
(unlike mandir bellow)? Ugly waf.

> +    --mandir=3D${mandir} \
> +    --target=3D${SIMPLE_TARGET_SYS} \
> +    --disable-gl \
> +    --disable-libsmbclient \
> +    --disable-libass \
> +    --disable-lua \
> +    --disable-libass-osd \
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
> +    --enable-libarchive \
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
> +    ../waf install
> +}
> +
> +FILES_${PN} +=3D "/usr/"

${prefix}?

Does it install files in strange directories not covered by standard
FILES?

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--huG+SbfbdD6eblZQ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlbgdlMACgkQN1Ujt2V2gBwuvQCaA5n5PYMxNWLRRxXlrhdN7x9X
A7gAn3llwakJpRcGja+g4Lib/1m+QvIP
=3VLy
-----END PGP SIGNATURE-----

--huG+SbfbdD6eblZQ--
