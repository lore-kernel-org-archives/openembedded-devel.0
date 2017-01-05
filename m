Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 2F2CA71A92
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Jan 2017 18:04:09 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id m203so97990920wma.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Jan 2017 10:04:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=WEEs4YkyYhtGaxTzlSZJnVIXNkFBreMhqcf2tapaKVs=;
	b=EaqY3/dLTkrJ6M1iSVkeMxjiPPpd523v+VZF9Fv0OlRfyoUy5Hb5ASPZZqbVJLO6nK
	IuPWYtqFkXNcrWe0sWBNnLd51Bmh26ITDrDh/oApKawTXbGnVCh176fpEcJJIsfAgnI3
	uXMMaveSLhUC5Ob+PNyOKmUpEvl+e7X3D8FplwunVLjk0GIAfymvZ2NwwF90tv0Rfuwf
	CaKKfc24DfJtpXBdpIj2aqHk5BoWFDYdA47LpL5jo7p7j9U9HlKohl3tKrOfm/mJpi6L
	nB3XpFSqBZn6yV3chFRxR60Qn1KAb2aYzlA5IEdQ3/I1uKTGZH0lIVsHapMiILpwM25c
	gxJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=WEEs4YkyYhtGaxTzlSZJnVIXNkFBreMhqcf2tapaKVs=;
	b=OK0+nmYONyU9GabO63a6T+JP6ngrSdH4XLXxCbf5wq1kjJ5sqEbZoOtJmXdAxjcokJ
	CDfyww/XOPEXcCrDMBttad3cWUjIPTdvupUxP1cYUHgXa+MWgRvnBWsMuANakI6VTxqZ
	5jF/DH0M76FPld81+hF9MXF/LspPPnlRlEUydgkHVFOSxOHPbvuZhqcVR1TTGvf33Lsl
	MXTOGn9AcQx7ES0u8kYEcihWsoZbAt0kPlrlKjQ5nxT4pIyY73y5ZRM3mctz1waU3Zuz
	lfoFTYW8z2qL2qFJGI7DpJVTqTQYzO1mCxGt1Y4wa/y4BZw+j98yWKHnaDRHh8OTo/kh
	7QLQ==
X-Gm-Message-State: AIkVDXKlUJRlY3gx4l+KtGnF2iU6un07/UmdkC1Fi6nAhE/EFxzGY6ZmJOhT2EQokcAqmQ==
X-Received: by 10.28.9.131 with SMTP id 125mr61779142wmj.22.1483639449690;
	Thu, 05 Jan 2017 10:04:09 -0800 (PST)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	ke6sm104987943wjb.21.2017.01.05.10.04.08
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 05 Jan 2017 10:04:08 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 5 Jan 2017 19:04:09 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20170105180409.GB3243@jama>
References: <CA+chaQc2H42_1M5Asu8XDJnRW=SWgWSjn=yGCaL4+vBbJ2DcvQ@mail.gmail.com>
	<20170104162043.15103-1-haris.okanovic@ni.com>
MIME-Version: 1.0
In-Reply-To: <20170104162043.15103-1-haris.okanovic@ni.com>
User-Agent: Mutt/1.7.2 (2016-11-26)
Cc: haris.okanovic@ni.com
Subject: Re: [meta-oe][PATCH v3] hwloc: Add
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
X-List-Received-Date: Thu, 05 Jan 2017 18:04:10 -0000
X-Groupsio-MsgNum: 64643
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="JP+T4n/bALQSJXh8"
Content-Disposition: inline

--JP+T4n/bALQSJXh8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 04, 2017 at 10:20:43AM -0600, Haris Okanovic wrote:
> https://www.open-mpi.org/projects/hwloc/
>=20
> "The Portable Hardware Locality (hwloc) software package provides a
> portable abstraction (across OS, versions, architectures, ...) of the
> hierarchical topology of modern architectures, including NUMA memory
> nodes, sockets, shared caches, cores and simultaneous multithreading.
> It also gathers various system attributes such as cache and memory
> information as well as the locality of I/O devices such as network
> interfaces, InfiniBand HCAs or GPUs."
>=20
> This recipe adds libhwloc and lstopo utility as two packages.
>=20
> Testing: Built in OE/Krogoth. Installed to x86_64 machine. Successfully
> ran `lstopo` and verified it printed correct CPU and cache info.
>=20
> Signed-off-by: Haris Okanovic <haris.okanovic@ni.com>
> ---
>  meta-oe/recipes-extended/hwloc/hwloc_1.11.5.bb | 22 ++++++++++++++++++++=
++
>  1 file changed, 22 insertions(+)
>  create mode 100644 meta-oe/recipes-extended/hwloc/hwloc_1.11.5.bb
>=20
> diff --git a/meta-oe/recipes-extended/hwloc/hwloc_1.11.5.bb b/meta-oe/rec=
ipes-extended/hwloc/hwloc_1.11.5.bb
> new file mode 100644
> index 0000000..1bf7a55
> --- /dev/null
> +++ b/meta-oe/recipes-extended/hwloc/hwloc_1.11.5.bb
> @@ -0,0 +1,22 @@
> +SUMMARY =3D "Portable Hardware Locality (hwloc) software package"
> +DESCRIPTION =3D "The Portable Hardware Locality (hwloc) software package=
 \
> + provides a portable abstraction of the hierarchical topology of modern \
> + architectures."
> +HOMEPAGE =3D "https://www.open-mpi.org/software/hwloc/"
> +SECTION =3D "base"
> +LICENSE =3D "BSD"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D3282e20dc3cec311deda3c6d4b1f9=
90b"
> +
> +SRC_URI =3D "https://www.open-mpi.org/software/${PN}/v1.11/downloads/${B=
P}.tar.bz2"
> +SRC_URI[md5sum] =3D "96c34136ff416d2b13a7821c27477bed"
> +SRC_URI[sha256sum] =3D "95d80286dfe658a3f79e2ac90698782bb36e5504f4bac1bb=
a2394ba14dbbad24"
> +
> +inherit autotools
> +
> +# Split hwloc library into separate subpackage
> +PACKAGES_prepend =3D " lib${PN} "
> +FILES_lib${PN} +=3D "${libdir}/lib${PN}.so*"
> +RDEPENDS_${PN} +=3D "lib${PN} (=3D ${EXTENDPKGV})"
> +
> +# XXX dev-so QA check doesn't like soname symlinks in non-dev packages
> +INSANE_SKIP_lib${PN} +=3D "dev-so"

Still a lot of missing/autodetected dependencies I've reported in v1:

WARN: hwloc: hwloc rdepends on cairo, but it isn't a build dependency?
WARN: hwloc: hwloc rdepends on ncurses-libtinfo, but it isn't a build
dependency?
WARN: hwloc: libhwloc rdepends on libpciaccess, but it isn't a build
dependency?
WARN: hwloc: libhwloc rdepends on libudev, but it isn't a build
dependency?
WARN: hwloc: libhwloc rdepends on libxml2, but it isn't a build
dependency?
WARN: hwloc: libhwloc rdepends on numactl, but it isn't a build
dependency?
WARN: hwloc: libhwloc rdepends on zlib, but it isn't a build dependency?
> --=20
> 2.10.1
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--JP+T4n/bALQSJXh8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWG6KmAAKCRA3VSO3ZXaA
HLieAJ0Zl1yAOh3P/WZegAUcBcWilkoatACeMEZRGicxShqQlssL9L16lP632MY=
=tBvV
-----END PGP SIGNATURE-----

--JP+T4n/bALQSJXh8--
