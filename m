Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id EAF18731E5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Feb 2016 16:58:34 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id g62so11743021wme.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Feb 2016 08:58:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=iaC7G6kackyIa8QSY/Nrt7adryq0KD//f6eIgDlu2wI=;
	b=z6TSvIDashthOz62s+gpPLPd3cBh6844g2L+LK0b7tP0eG+bRN6C38m96jmesvrohS
	lSsFDupGENgicMySxL+wD3x/sAZBsUEpnYMMYioSytFUhBUzgCJKhQHweaDtolzxcmit
	CmL51Ftb1/Al0d/QVP3lgkAGUz046TfSNXXICNq6g+1Dkk1rrVQu0pm2aVfTTXXWck5C
	cBT0egYWWlLXdOid2cK1ZCNfmHlAfJ/D99jjgGU7pC8g7oSdjYtRmNlw+xODlQs3beM1
	6oPoG79SpNsQlZzlQq9yvy3M9bzWt8GaSWle/qu0Nj6DtUEbKiDDep2Liy4neg8uLnDR
	dZuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	bh=iaC7G6kackyIa8QSY/Nrt7adryq0KD//f6eIgDlu2wI=;
	b=XovlwWZDDJp3GaUpVcgcgzUGBBJPAD5NkKM2HwE3O3g9tEuDy5IsQKWI5O+Pp642Tp
	EocEEiFix3LbPO3Fk0kkw2YChprbONsPZtRK0j2P00g2gSfBPGXqJYEDr6xa+pABGhvP
	b0V+MiQ8ZP5pk3fMDzDNz75pAgTEpSmFVrUbaI/iwAvnW0qA5qNMHP2JnOb90yeUpojG
	YOY1S+vXyqiMCUOY5HXEGF33c5SoDg7fdweN6JjfJ/NccZHkXx2BAs7OTyMYstI3NQVM
	+mjJwVIR0qLf+LQpBfh0ABJxDfMl1cN51aF99SsxALMenNCP6f5ND7npw3PreRvUKwXp
	s8Xw==
X-Gm-Message-State: AG10YOQbCX0KsobLOykAg3UfA89Swt3fSwli0lRKv1aCD24pZ4pNUxYk8qkE60QaeKxIyg==
X-Received: by 10.194.123.103 with SMTP id lz7mr52727882wjb.140.1455209914387; 
	Thu, 11 Feb 2016 08:58:34 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	kb5sm8382837wjc.22.2016.02.11.08.58.33
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 11 Feb 2016 08:58:33 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 11 Feb 2016 18:02:36 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160211170236.GC2595@jama>
References: <20160203170808.GD2567@jama>
	<1454519725-18243-1-git-send-email-dv@pseudoterminal.org>
MIME-Version: 1.0
In-Reply-To: <1454519725-18243-1-git-send-email-dv@pseudoterminal.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: Re: [meta-oe][PATCH v2] ne10: add recipe
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
X-List-Received-Date: Thu, 11 Feb 2016 16:58:35 -0000
X-Groupsio-MsgNum: 59946
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="s9fJI615cBHmzTOP"
Content-Disposition: inline

--s9fJI615cBHmzTOP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 03, 2016 at 06:15:25PM +0100, Carlos Rafael Giani wrote:
> Add recipe for the Ne10 library ( http://projectne10.github.io/Ne10/ ).
> This library provides heavily ARM NEON optimized versions of functions
> that are commonly used.

ERROR: QA Issue: ELF binary 'ne10/1.2.1-r0/packages-split/ne10/usr/lib/libN=
E10.so.10' has relocations in .text [textrel]
ERROR: QA Issue: ELF binary 'ne10/1.2.1-r0/packages-split/ne10/usr/lib/libN=
E10.so.10' has relocations in .text [textrel]

>=20
> Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>
> ---
>  meta-oe/recipes-support/ne10/ne10_1.2.1.bb | 38 ++++++++++++++++++++++++=
++++++
>  1 file changed, 38 insertions(+)
>  create mode 100644 meta-oe/recipes-support/ne10/ne10_1.2.1.bb
>=20
> diff --git a/meta-oe/recipes-support/ne10/ne10_1.2.1.bb b/meta-oe/recipes=
-support/ne10/ne10_1.2.1.bb
> new file mode 100644
> index 0000000..5da3137
> --- /dev/null
> +++ b/meta-oe/recipes-support/ne10/ne10_1.2.1.bb
> @@ -0,0 +1,38 @@
> +DESCRIPTION =3D "Library containing NEON-optimized implementations for a=
 common set of functions"
> +HOMEPAGE =3D "http://projectne10.github.io/Ne10/"
> +LICENSE =3D "BSD-3-Clause"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D463ac0a7d64edc2b787c4206635ca=
2b1"
> +SECTION =3D "libs"
> +
> +SRC_URI =3D "git://github.com/projectNe10/Ne10.git"
> +SRCREV =3D "a08b29d88e3c94d32b5b8f827e7fcf0bc2b34ac2"
> +
> +S =3D "${WORKDIR}/git"
> +
> +inherit cmake
> +
> +NE10_TARGET_ARCH =3D ""
> +EXTRA_OECMAKE =3D '-DGNULINUX_PLATFORM=3DON -DNE10_BUILD_SHARED=3DON -DN=
E10_LINUX_TARGET_ARCH=3D"${NE10_TARGET_ARCH}"'
> +
> +COMPATIBLE_MACHINE_aarch64 =3D "(.*)"
> +COMPATIBLE_MACHINE_armv7a =3D "(.*)"
> +
> +python () {
> +    if any(t.startswith('armv7') for t in d.getVar('TUNE_FEATURES', True=
).split()):
> +        d.setVar('NE10_TARGET_ARCH', 'armv7')
> +        bb.note('Building Ne10 for armv7')
> +    elif any(t.startswith('aarch64') for t in d.getVar('TUNE_FEATURES', =
True).split()):
> +        d.setVar('NE10_TARGET_ARCH', 'aarch64')
> +        bb.note('Building Ne10 for aarch64')
> +    else:
> +        raise bb.parse.SkipPackage("Incompatible with archs other than a=
rmv7 and aarch64")
> +}
> +
> +do_install() {
> +    install -d ${D}${libdir}
> +    install -d ${D}${includedir}
> +    install -m 0644 ${S}/inc/NE10*.h ${D}${includedir}/
> +    install -m 0644 ${B}/modules/libNE10.a ${D}${libdir}/
> +    install -m 0755 ${B}/modules/libNE10.so.* ${D}${libdir}/
> +    cp -a ${B}/modules/libNE10.so ${D}${libdir}/
> +}
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

--s9fJI615cBHmzTOP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAla8vqYACgkQN1Ujt2V2gBzCpgCfYlw5nZmqxs41OBIT+/3MpDP0
1IQAmwTcCgY5x3WLHCd1yf4Fvg0Zo83m
=J8Xt
-----END PGP SIGNATURE-----

--s9fJI615cBHmzTOP--
