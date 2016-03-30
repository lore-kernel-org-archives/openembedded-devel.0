Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 024B66010B
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Mar 2016 10:08:01 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id i204so11458635wmd.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Mar 2016 03:08:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=DvbQMoFk7X3XvnTqSAX69AgC8nrTN9KFLHNkQLDQplw=;
	b=SBIZJGy3GfFzTyvW/cnO/5mcAqS46xqGJ1GajjR7hQsv64nUo8Q1Oncu0R7QGcxaaS
	iZ5D1pbvDH98/ilBpEjH0gkfSN+dxfYsp2qkx1JIOynqwvalgVMYzTeHOWKGZmfXH52Z
	w/h1smdDPUytOlo8lJXVXtelonGtKknZOtTgxcNHSKVLroaxorVum/vFW39GvcrFRp2B
	VqZFbSpkdrg7bkbExRIEHCsXXjP2YWiWKhzj0z8s3LFDxSK/2FGn99BhkerTF7V3c21c
	VAtaea+6jmixFfuHuXnTduvYB8nOp3HkDCkCxXuM57U2jTepmKME3RChXXg8Tpm4Nc5Q
	8wmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=DvbQMoFk7X3XvnTqSAX69AgC8nrTN9KFLHNkQLDQplw=;
	b=i31+sZaXuMDiqFKTzDq5zVc7zdx9W9E8r+85MYApBYCrI0F2exuVL0C4cE/sGjsMoy
	FokEgYuC//gPf2J9+l79/ZsE2rjvao+YdQoDNmVbpotbkB4mmBHAeE13Xn1BEaVcdEwp
	ZFRl4Lpc/WfuGBi9SESVKN4pI0yxNdcfogCDzkH3nBX3IrfEz9A+knNItxfN7qCcGu9S
	oDUpSYpyR12uaPjYE3VYeSmNwin8ieU/6HB/kjC8lb6KYeSonJd3KDVNYeiUhTw1p8II
	bxNu1oSh44/CeBhKcT+Cgjpu8KiWKQtC9Y+A+lPkk/9/W98TVVHXAWE8oNdsYG1o641s
	xHSQ==
X-Gm-Message-State: AD7BkJLxQl+tGpTmzk6YzJBQyoZlRb7TUNXjLWSGHgPYCJTIfzfOxa/FNkYQBPLO69U+OA==
X-Received: by 10.28.136.211 with SMTP id k202mr23700385wmd.93.1459332481998; 
	Wed, 30 Mar 2016 03:08:01 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	m130sm2006173wmf.10.2016.03.30.03.08.00
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 30 Mar 2016 03:08:00 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 30 Mar 2016 12:08:01 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160330100801.GB2557@jama>
References: <1459328887-21295-1-git-send-email-catalin.enache@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1459328887-21295-1-git-send-email-catalin.enache@windriver.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: Re: [PATCH] imagemagick: add PACKAGECONFIG for x11
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
X-List-Received-Date: Wed, 30 Mar 2016 10:08:02 -0000
X-Groupsio-MsgNum: 60734
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="mojUlQ0s9EVzWg2t"
Content-Disposition: inline

--mojUlQ0s9EVzWg2t
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 30, 2016 at 12:08:07PM +0300, Catalin Enache wrote:
> ImageMagick should X11 delegate libraries if they are available
>=20
> Signed-off-by: Catalin Enache <catalin.enache@windriver.com>
> ---
>  meta-oe/recipes-support/imagemagick/imagemagick_6.9.2.bb | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta-oe/recipes-support/imagemagick/imagemagick_6.9.2.bb b/m=
eta-oe/recipes-support/imagemagick/imagemagick_6.9.2.bb
> index 12604c0..a1be5a6 100644
> --- a/meta-oe/recipes-support/imagemagick/imagemagick_6.9.2.bb
> +++ b/meta-oe/recipes-support/imagemagick/imagemagick_6.9.2.bb
> @@ -23,13 +23,14 @@ inherit autotools pkgconfig update-alternatives
>  EXTRA_OECONF =3D "--program-prefix=3D --program-suffix=3D.im6 --without-=
x --without-perl --disable-openmp --without-xml --disable-opencl"

You should remove --without-x from EXTRA_OECONF when adding the
PACKAGECONFIG for it.

> =20
>  CACHED_CONFIGUREVARS =3D "ac_cv_sys_file_offset_bits=3Dyes"
> -PACKAGECONFIG ??=3D ""
> +PACKAGECONFIG ??=3D "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11=
', '', d)}"
>  PACKAGECONFIG[jp2] =3D "--with-jp2,,jasper"
>  PACKAGECONFIG[lzma] =3D "--with-lzma,--without-lzma,xz"
>  PACKAGECONFIG[openjpeg] =3D "--with-openjp2,--without-openjp2,openjpeg"
>  PACKAGECONFIG[pango] =3D "--with-pango,--without-pango,pango cairo"
>  PACKAGECONFIG[webp] =3D "--with-webp,--without-webp,libwebp"
>  PACKAGECONFIG[wmf] =3D "--with-wmf,--without-wmf,libwmf"
> +PACKAGECONFIG[x11] =3D "--with-x,--without-x,virtual/libx11 libxext libx=
t"
> =20
>  FILES_${PN} +=3D "${libdir}/ImageMagick-${PV}/modules-Q16/*/*.so \
>                  ${libdir}/ImageMagick-${PV}/modules-Q16/*/*.la \
> --=20
> 2.7.4
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--mojUlQ0s9EVzWg2t
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlb7pYAACgkQN1Ujt2V2gBwuoACgmtz53ABZ3yLp/TKDu+oHldyA
RKAAn0tJhPDBqhjJtDUDQUuwYHJdwCpO
=ZDcj
-----END PGP SIGNATURE-----

--mojUlQ0s9EVzWg2t--
