Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 8B12B73259
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 13 Feb 2016 10:42:57 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id p63so7011258wmp.1
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 13 Feb 2016 02:42:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=tfPFO8Sx+4TF/yI/FTjcJbZqBpejXaClMgT/ni2plyQ=;
	b=VKoIYhwbGiP7MPfPYR5UCYpMMnqp7unm1i2mECxa0rEfcMIZajQ6sMdwHdAuxVVQ9l
	WLnGcrGiN6F8XD76URTOKq25yvtVJ9cUP7dF0DYXdSLrfMSnFUXv2elHOwz/qxyZqGAE
	LIOAORNWo0PmimiLpz2NYtkagH8UyBy5akmTOAN5jYcAogg2ZBk2ejDAjdL48Vx2mUyu
	4qNZ9BDylzOYyHVhm3L1ktGDpQT0bdLbGeh3TCpRVgdvqnXCWhN6q0EimVU/wTporCs6
	oYC3tByoRhw3FAhV10vC4BouQ/gT0rhQZe6828+g2sPgXXEQmwm+pGJEkCyFjFOWQlUP
	URSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	bh=tfPFO8Sx+4TF/yI/FTjcJbZqBpejXaClMgT/ni2plyQ=;
	b=G09zAfGUoJkncdOJ1V+x5s70vlSUKH/wmh0hQZ0wfZR5XKSJYa4/s2oX00F3NMoy51
	BKyWTZq5rHuE3hIbpI4G2AoGk50UejF24Wq+/mmQEUTIdkGgmYfvlADnDxurSNbRUMrg
	NasmNmR0EDsEK4lGr2g+C8zxDzPIpR4KXJnrprZW4nW/0srn16bwD6acQyvOdo/kgCLZ
	3UXMhPqbtXX0fq1mp+lWK6Cg/t86F5FRELhDZS9EX6iKymEMVFqGeLq0vFzuLLNCvpZ2
	g84KdaHoo87TlpRO6v3pZkJSfcGMd2O3mC5BsIC3w9UL/zQGEAbdfBlxCKS9b65Kp3uI
	V2pg==
X-Gm-Message-State: AG10YOSiYOmzO/aCSKrfx3gqCJadN/XxPAjjq2b9af+ZkNxMwwqAewYRvDRllxp759rFhA==
X-Received: by 10.194.47.133 with SMTP id d5mr6810897wjn.87.1455360177383;
	Sat, 13 Feb 2016 02:42:57 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	s8sm15944341wje.35.2016.02.13.02.42.56
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 13 Feb 2016 02:42:56 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Sat, 13 Feb 2016 11:47:07 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160213104707.GB3028@jama>
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
X-List-Received-Date: Sat, 13 Feb 2016 10:42:59 -0000
X-Groupsio-MsgNum: 59958
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="GID0FwUMdk1T2AWN"
Content-Disposition: inline

--GID0FwUMdk1T2AWN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 03, 2016 at 06:15:25PM +0100, Carlos Rafael Giani wrote:
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

Maybe you should drop bb.note as well, it's a bit confusing when you run
something like:
# bitbake perl
it will show:
Parsing recipes...NOTE: Building Ne10 for armv7
even when ne10 won't be built.

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

--GID0FwUMdk1T2AWN
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAla/CasACgkQN1Ujt2V2gBzskACfdhE6qnEzvSZ5ZO3wMSnfuUkA
Z+kAnj8zqFdanYuBq3nIHZln4upV4uHe
=5M6e
-----END PGP SIGNATURE-----

--GID0FwUMdk1T2AWN--
