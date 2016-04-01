Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 2CEE375E2D
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Apr 2016 11:35:54 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id p65so3897399wmp.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 01 Apr 2016 04:35:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=s/FzrbbSbOszntlvhDMe0yxqtJ+gUAcm7Qnxg6ML4ZM=;
	b=ew+EdYc1076tP5VDqP4L/+HX2DdYA6GP5eiNfAGBm/go1WdWQaEY5L3NAApA7+XFMl
	+UEIS5u5MlmsOvuxxECbKlOFpzeb3VNoUQ8T79p/R+DBAxKWWKslyXNCBPmP2Hp0/92Q
	AZfGNh9h6ow1YHQxwFzVb/C9X2f3BhPybbjWYig5eSOaJlMybec22F1nw5APNS3LG6WN
	M/8zpAVXFQ5JkQqiYCGONoQzAumpxnMvucsEJGadOSB1ETrulFlrWCsDDbgLOS1LFY5p
	rsHA4OaWqz7Qu3afiNgyEIY9va1aUAzS2cbcerVjxSpkAUsOxeOSKo9TbIQg55qHjZ4Q
	sWYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=s/FzrbbSbOszntlvhDMe0yxqtJ+gUAcm7Qnxg6ML4ZM=;
	b=BZ1W61oxt9Cq5WhoFkAPjI/kkaAuWKfAJcr679K2P5nipvhrTHdhtUGUKAsXYD0LOZ
	WUEr56SzEcGFP806zkQiMvWDcMiHZuc9yRDuOCQKe3zxWo9t5lehvjbwo1VfNP3MQ6uR
	zsJ420WdCKmvHX4hBSH5YiUgIK1OyGZuen8m+u3UbFk8VHgNovITiYZU9qyMwa8jLZ9F
	ej+7+pr6UjyBBGgQeCyM2Pt3natj/dZPPpSNHKzN1T7x6Tp/vk8yc3Ec9Pf7+CFTvADK
	PrOLgdIclOM56O7FfyA7ayprZn1pwjL+orcgcxRe47EKcNHf4UTYApErHUDmRHkseO7r
	6O5A==
X-Gm-Message-State: AD7BkJLWZiQJP9hZMOErQxaNbC243753LBuLhi+OquztBTUrjp3jztD4K/DfX6VgWdVQxQ==
X-Received: by 10.28.85.137 with SMTP id j131mr3235209wmb.15.1459510554947;
	Fri, 01 Apr 2016 04:35:54 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	w8sm13627607wjf.19.2016.04.01.04.35.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 01 Apr 2016 04:35:53 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 1 Apr 2016 13:36:08 +0200
To: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
Message-ID: <20160401113608.GD2567@jama>
References: <1458640636-9492-1-git-send-email-adrian.ratiu@ni.com>
MIME-Version: 1.0
In-Reply-To: <1458640636-9492-1-git-send-email-adrian.ratiu@ni.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: James Minor <james.minor@ni.com>, openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] ti-wifi-utils: add recipe
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
X-List-Received-Date: Fri, 01 Apr 2016 11:35:56 -0000
X-Groupsio-MsgNum: 60776
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="zS7rBR6csb6tI2e1"
Content-Disposition: inline

--zS7rBR6csb6tI2e1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 22, 2016 at 11:57:16AM +0200, Ioan-Adrian Ratiu wrote:
> This recipe is for a TI WiFi calibrator utility [1]. The firmware from
> this project is already shipped inside linux-firmware so we do not
> package it in this recipe.
>=20
> [1] http://linuxwireless.sipsolutions.net/en/users/Drivers/wl12xx/#Calibr=
ation
>=20
> Signed-off-by: James Minor <james.minor@ni.com>
> Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
> ---
>  .../ti-wifi-utils/ti-wifi-utils_git.bb             | 24 ++++++++++++++++=
++++++
>  1 file changed, 24 insertions(+)
>  create mode 100644 meta-oe/recipes-connectivity/ti-wifi-utils/ti-wifi-ut=
ils_git.bb
>=20
> diff --git a/meta-oe/recipes-connectivity/ti-wifi-utils/ti-wifi-utils_git=
=2Ebb b/meta-oe/recipes-connectivity/ti-wifi-utils/ti-wifi-utils_git.bb
> new file mode 100644
> index 0000000..fcae729
> --- /dev/null
> +++ b/meta-oe/recipes-connectivity/ti-wifi-utils/ti-wifi-utils_git.bb
> @@ -0,0 +1,24 @@
> +SUMMARY =3D "The calibrator and other useful utilities for TI wireless s=
olution based on wl12xx driver"
> +LICENSE =3D "BSD-3-Clause"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D4725015cb0be7be389cf06deeae36=
83d"
> +
> +DEPENDS =3D "libnl"
> +
> +PV =3D "0.1+gitr${SRCPV}"
> +
> +SRCREV =3D "b03d9ce6362e6d22d6929f2736409af3b0fd3c88"
> +SRC_URI =3D "git://github.com/TI-OpenLink/ti-utils.git;branch=3Dr5-jb"
> +
> +S =3D "${WORKDIR}/git"
> +
> +EXTRA_OEMAKE =3D 'CROSS_COMPILE=3D${TARGET_PREFIX} \
> +                CC=3D"${TARGET_PREFIX}gcc ${TOOLCHAIN_OPTIONS}" \

This doesn't respect all flags usually available in $CC variable, why
haven't you used $CC?

Maybe it's other part of Makefiles which is using CROSS_COMPILE instead
of CC, but currently it's failing e.g. for hardfloat builds with
typical:

=2E./SYSROOT/MACHINE/usr/include/gnu/stubs.h:7:29: fatal error: gnu/stubs-s=
oft.h: No such file or directory

because the build doesn't have correct -mfloat-abi parameter

| arm-DISTRO-linux-gnueabi-gcc  --sysroot=3D/SYSROOTS/MACHINE -O2 -pipe -g =
-feliminate-unused-debug-types -fdebug-prefix-map=3DTMPDIRwork/MACHINE-DIST=
RO-linux-gnueabi/ti-wifi-utils/0.1+gitrAUTOINC+b03d9ce636-r0=3D/usr/src/deb=
ug/ti-wifi-utils/0.1+gitrAUTOINC+b03d9ce636-r0 -fdebug-prefix-map=3DTMPDIRs=
ysroots/x86_64-linux=3D -fdebug-prefix-map=3D/SYSROOTS/MACHINE=3D  -I/SYSRO=
OTS/MACHINE/usr/include/libnl3 -DCONFIG_LIBNL20   -c -o misc_cmds.o misc_cm=
ds.c

> +                CFLAGS=3D"${CFLAGS} -I${STAGING_INCDIR}/libnl3 -DCONFIG_=
LIBNL20" NLVER=3D3 \
> +                LDFLAGS=3D"${LDFLAGS} ${TOOLCHAIN_OPTIONS}" \
> +'
> +
> +#only install the calibrator utility, firmware is already within linux-f=
irmware
> +do_install() {
> +    install -d ${D}${bindir}
> +    install -m 0755 calibrator ${D}${bindir}/
> +}
> --=20
> 2.7.4
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--zS7rBR6csb6tI2e1
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlb+XScACgkQN1Ujt2V2gByf6QCfRZtQDS619/rClwE/oiuO+bZB
IbYAn3xa8RoKtbAN+YamoDKOILK9Uen7
=OiEc
-----END PGP SIGNATURE-----

--zS7rBR6csb6tI2e1--
