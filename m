Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f48.google.com (mail-wm0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id 499786FF80
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  3 Feb 2016 17:04:57 +0000 (UTC)
Received: by mail-wm0-f48.google.com with SMTP id l66so173357898wml.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 03 Feb 2016 09:04:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=WROvq0j7Z8+TXQgi1NYnxKm7EtppkezEIO4ZF9Gl2p4=;
	b=jBBgQsSMYEJ/j05FEB0+AHO0UAGk8R/SlzOFICh7UMaWen6rScLsBQM2hOmpB7KrBi
	cQmHbb2Z3iVZJOSp/oUbBR+NxSOJCFGZEu3PK7z4+060ovS4n+TDMs3P4QJ7j5pSVGC0
	B5Nsr9VBSWQ7DXt3/iKXSDwsKVzL0jhZo31jJwBPFRtcw2IcSAByylUi5QuO/qgMj7aP
	IaEQbgvNqGDDNkDA0JrX2ydFdcv1H4AwhwlBKDWUg+sHEsFYoOlq7c316qotITC+Uktp
	ozM+cdpGg65qqwkPh8C2LPPAa1oo9TDUYghhtfgk9vfVmEWlX+xT9pBh4gO35gtSEJEY
	kYnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	bh=WROvq0j7Z8+TXQgi1NYnxKm7EtppkezEIO4ZF9Gl2p4=;
	b=E+N5QcXRMzsiIjfg/Kwi+/4WEdFshMP8IvvuQmkNefAWiEhQbGboqzavyuwxxC6eiv
	wF0ME8EtYcATHSCIIIZvYONdglWqG1ygg7khAmXRaxQDUYo6ABfILspIOYmwweV92pRk
	W8lsBXFiP0zg1Lq1Anm9sFxp2k9uQjpq849bAUNGuLkNjFfDcIPh5y5swOxM+qxfP2ru
	brZRhMdCqA4T5Y1Zv96hICLE6CQkdRS+glaAlP2QU/HyLoKrwT/ZikxBYZWXfW3I0Vpk
	4CPeE7z3QBW3mSzNI/4scZUDew7KE+NLuMf7PeQlfo737CQNW55gYQd/nj4NkP8ELjOe
	IK0g==
X-Gm-Message-State: AG10YORWXFDBvzxvLGrl6hCpHeC6jRXpRb5XZ9Ks29iZkC9GcyUwFHAKJ7SSrR/vXkIg1A==
X-Received: by 10.28.194.136 with SMTP id s130mr8909911wmf.23.1454519098220;
	Wed, 03 Feb 2016 09:04:58 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id di1sm7409784wjc.3.2016.02.03.09.04.57
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 03 Feb 2016 09:04:57 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 3 Feb 2016 18:08:08 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160203170808.GD2567@jama>
References: <1454517902-21801-1-git-send-email-dv@pseudoterminal.org>
MIME-Version: 1.0
In-Reply-To: <1454517902-21801-1-git-send-email-dv@pseudoterminal.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: Re: [meta-oe][PATCH] ne10: add recipe
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
X-List-Received-Date: Wed, 03 Feb 2016 17:04:58 -0000
X-Groupsio-MsgNum: 59830
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="SO98HVl1bnMOfKZd"
Content-Disposition: inline

--SO98HVl1bnMOfKZd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 03, 2016 at 05:45:02PM +0100, Carlos Rafael Giani wrote:
> Add recipe for the Ne10 library ( http://projectne10.github.io/Ne10/ ).
> This library provides heavily ARM NEON optimized versions of functions
> that are commonly used.
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
> index 0000000..a465e7d
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
> +SRCREV =3D "v${PV}"

please set SRCREV to git hash, so that fetcher won't try to access
remote repo to translate tag name to SRCREV.

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
> +        install -d ${D}${libdir}
> +        install -d ${D}${includedir}
> +        install -m 0644 ${S}/inc/NE10*.h ${D}${includedir}/
> +        install -m 0644 ${B}/modules/libNE10.a ${D}${libdir}/
> +        install -m 0755 ${B}/modules/libNE10.so.* ${D}${libdir}/
> +        cp -a ${B}/modules/libNE10.so ${D}${libdir}/

Use 4 spaces for indentation.

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

--SO98HVl1bnMOfKZd
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlayM/gACgkQN1Ujt2V2gByeMgCgtsSuX7VucIIzVg3RrJ1YSewu
IlIAoJCHE3vFzxpBgdvrDM+XsxHHYMu7
=fXTi
-----END PGP SIGNATURE-----

--SO98HVl1bnMOfKZd--
