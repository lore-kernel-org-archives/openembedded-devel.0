Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f54.google.com (mail-wm0-f54.google.com [74.125.82.54])
	by mail.openembedded.org (Postfix) with ESMTP id 747C077375
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Feb 2016 16:21:27 +0000 (UTC)
Received: by mail-wm0-f54.google.com with SMTP id g62so1630058wme.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Feb 2016 08:21:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=aYhE6ANugPxHHnK7Ws4+9MHVQ+3vA1sGRT64yT01LPw=;
	b=rdglnURyMO7uykzt01UZiOLCopqrm1KS6dcfSdxkwMerfmaKKzWzhrxJmW8DHjjnsM
	+k3jffN+z/pEj1qBSw+D2loOpv9wSSJRtUmAINpeeskRfWA/Yrbue8Vu0AulNgi1VdQn
	HtPzoQcS+DxraaRxgNBpZLIwE88gS5RdDnwvjISFL8RCw5vFTyK5v4GGkhOyA7yQuPbK
	yy1ZY5DOPVe6PCZ46G0DY7n+hHo4IEVTYBzfAFN2dAObcvCKwpBYUKTgDait71pA44JD
	ZnIqBZQ1lchhprkaWb8sV/FOlYpqYQsLwq6giCdaH1LLxf8WU9TESfN4KHOle5GLH2x3
	Mdww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=aYhE6ANugPxHHnK7Ws4+9MHVQ+3vA1sGRT64yT01LPw=;
	b=QuLD0coYyVhi36c8BU0O5xdBMiAtfWeXFKs1grzpAJsNiJI6UaN3cvuYvg86a87ZOL
	mg4O8d/Siz66wHtVq8LyFDS3bVP4R8ifSUW5O6XnfVPP0cY96HHduAwKLiNQu5zSin6b
	wnRscL5ONi28s5v/KdQK7jM1SqN/l8uKV09yFD93Lkwxr0gmtYLwBjifRQqVYUV+K5U7
	ieGjF0dtWhaJkRaTgvzZ2rGh877KDICfjx7D3bdMU8EhvULzDvgeaxNX2vbl9geRiT9D
	6LH5GkD0zyGuIhKp0UCYhyd8vUbYTLcU/6GSn9eQsbGnEg3bEn0oj0bQNTV8Ds0tYd3a
	/d8Q==
X-Gm-Message-State: AG10YOTlZJx1l13yhfPQBSDxop55QFF7N6oA+Cy3jCRhkga0FpvLc/l9hXxg20ncYYHt6w==
X-Received: by 10.28.48.19 with SMTP id w19mr18141241wmw.18.1456244488589;
	Tue, 23 Feb 2016 08:21:28 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	t8sm30455198wjy.41.2016.02.23.08.21.27
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 23 Feb 2016 08:21:27 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 23 Feb 2016 17:22:27 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160223162227.GB2564@jama>
References: <1453809321-10937-1-git-send-email-schnitzeltony@googlemail.com>
	<1453809321-10937-3-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
In-Reply-To: <1453809321-10937-3-git-send-email-schnitzeltony@googlemail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: Re: [PATCH 3/3] geis: initial add 2.2.17
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
X-List-Received-Date: Tue, 23 Feb 2016 16:21:29 -0000
X-Groupsio-MsgNum: 60167
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ftEhullJWpWg/VHq"
Content-Disposition: inline

--ftEhullJWpWg/VHq
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 26, 2016 at 12:55:21PM +0100, Andreas M=FCller wrote:
> Signed-off-by: Andreas M=FCller <schnitzeltony@googlemail.com>
> ---
>  .../canonical-multitouch/geis_2.2.17.bb            | 52 ++++++++++++++++=
++++++
>  1 file changed, 52 insertions(+)
>  create mode 100644 meta-oe/recipes-support/canonical-multitouch/geis_2.2=
=2E17.bb
>=20
> diff --git a/meta-oe/recipes-support/canonical-multitouch/geis_2.2.17.bb =
b/meta-oe/recipes-support/canonical-multitouch/geis_2.2.17.bb
> new file mode 100644
> index 0000000..9403bdf
> --- /dev/null
> +++ b/meta-oe/recipes-support/canonical-multitouch/geis_2.2.17.bb
> @@ -0,0 +1,52 @@
> +SUMMARY =3D "An implementation of the GEIS interface"
> +DESCRIPTION =3D "An implementation of the GEIS (Gesture Engine Interface=
 and Support) \
> +interface\
> +GEIS is a library for applications and toolkit programmers which \
> +provides a consistent platform independent interface for any \
> +system-wide input gesture recognition mechanism."
> +
> +HOMEPAGE =3D "https://launchpad.net/geis"
> +
> +LICENSE =3D "GPLv3 & LGPLv3"
> +LIC_FILES_CHKSUM =3D " \
> +    file://COPYING;md5=3D6a6a8e020838b23406c81b19c1d46df6 \
> +    file://COPYING.GPL;md5=3Df27defe1e96c2e1ecd4e0c9be8967949 \
> +"
> +
> +inherit autotools pkgconfig python3native lib_package
> +
> +DEPENDS +=3D "grail dbus-glib python3"

Fails to build without XCB (building in DISTRO without x11 in DISTRO_FEATUR=
ES)

| configure: error: XCB development libraries not found


> +
> +SRC_URI =3D "https://launchpad.net/${BPN}/trunk/${PV}/+download/${BPN}-$=
{PV}.tar.xz"
> +SRC_URI[md5sum] =3D "2ff9d76a3ea5794516bb02c9d1924faf"
> +SRC_URI[sha256sum] =3D "8a60f5683852094038904e690d23cc5a90a980fc52da67f0=
f28890baa25c70eb"
> +
> +EXTRA_OECONF =3D "--disable-integration-tests"
> +
> +FILES_${PN}-bin =3D "${bindir}"
> +RDEPENDS_${PN}-bin =3D " \
> +    python3-compression \
> +    python3-core \
> +    python3-crypt \
> +    python3-ctypes \
> +    python3-fcntl \
> +    python3-misc \
> +    python3-pickle \
> +    python3-shell \
> +    python3-stringold \
> +    python3-subprocess \
> +    python3-textutils \
> +    python3-threading \
> +"
> +
> +FILES_${PN} +=3D " \
> +    ${datadir}/geisview \
> +    ${libdir}/${PYTHON_DIR}/site-packages/geis* \
> +    ${libdir}/${PYTHON_DIR}/site-packages/_*.so \
> +"
> +
> +FILES_${PN}-dbg +=3D "${libdir}/${PYTHON_DIR}/site-packages/.debug"
> +
> +FILES_${PN}-dev +=3D "${libdir}/${PYTHON_DIR}/site-packages/_*.la"
> +
> +FILES_${PN}-staticdev +=3D "${libdir}/${PYTHON_DIR}/site-packages/_*.a"
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

--ftEhullJWpWg/VHq
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlbMhykACgkQN1Ujt2V2gBx/XgCfeD2Arjty7NXq07b9Y6T7/2nj
xCcAnjcZBfmW9Iv5+KlNdPlkxBeO+MJY
=P5uY
-----END PGP SIGNATURE-----

--ftEhullJWpWg/VHq--
