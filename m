Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f66.google.com (mail-pg0-f66.google.com [74.125.83.66])
	by mail.openembedded.org (Postfix) with ESMTP id AD48A719AC
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Apr 2017 19:47:24 +0000 (UTC)
Received: by mail-pg0-f66.google.com with SMTP id g2so26915651pge.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Apr 2017 12:47:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to; bh=b9FZBhxAIG21UpQOweG6VDcRWJCGSjkmqWkQ2NFgeEU=;
	b=OnTrD0hddlFbS6dbp09J0qwZxXmofVhRTNfQqOQZhL3Tg9BDpVaKd3SBgkvd5SWApG
	Eb6gyZMQgNT3NYXjtK9VQm2RHbH2fziPCUC/f97cjF3ndLRajLLuhDYddWwPgVp1rBeo
	Hz3m2Kbok8mXw03J3FbSb+6996fYT4IhGADxtuJhEa+/vAJ4mjmQMCkJeOn4fyFxYWx6
	J99hLkjtPWk/zrnXx5YMdF22e3/RVZnhqww/+i2O60/tZG/CMagsQ5SEFZ87QYq1BZSW
	shZSgOGEqFolspj6aYoMqb4mQ30zOC/uTXD+XiL/POo6GQVLwfh+TYKOQjUTGzm74ddb
	XsDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to;
	bh=b9FZBhxAIG21UpQOweG6VDcRWJCGSjkmqWkQ2NFgeEU=;
	b=L26ENhjvu0Fj5lU+HLCYqqonKsdorSzUTqU/5Uo5h5eWOS0owo5Z9zaflIK8jaCpys
	WdPnF42d8wb3nWge/5NK9Uye/mP4rirWqMyaK0+SCojRlvM78tdaDwm1rhqLDumQpRVF
	HQlsvyPYizIAWnTU9vR7F+sFyjqOe7DAdwj96V9BcCoKFM34zkzHPFzEjvTCjwK6cUJs
	FToDI4Oqx7HgzRS/lSOlSg+geBsvJk041W4b1Kp/usEiHo0wxYbtmx+kuA5RcR2sFy5L
	HGGwLqYqPGXfut48bejKHFLJOqOgMgMjoPCQ8LVYnX7PfihTb0tms5ySda7x+kJUcPAz
	qSNA==
X-Gm-Message-State: AFeK/H0MFo1wcQNo/utLwF/MAm8LGj2HqYPYD2kr5z7YCdWuf0OiXudXGIb25PDNrI8ZWA==
X-Received: by 10.84.217.149 with SMTP id p21mr69049450pli.59.1491853645837;
	Mon, 10 Apr 2017 12:47:25 -0700 (PDT)
Received: from CACSVMO-14452.local ([2601:646:8882:b8c:a551:b153:de27:f516])
	by smtp.gmail.com with ESMTPSA id
	u198sm26199287pgb.45.2017.04.10.12.47.24
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 10 Apr 2017 12:47:24 -0700 (PDT)
To: openembedded-devel@lists.openembedded.org
References: <1491591433-19590-1-git-send-email-andrey.konovalov@linaro.org>
	<004901d2b1b9$6cb39420$461abc60$@neuf.fr>
From: Khem Raj <raj.khem@gmail.com>
Message-ID: <68ada87a-f066-2954-b085-b93476c1f106@gmail.com>
Date: Mon, 10 Apr 2017 12:47:15 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:45.0)
	Gecko/20100101 Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <004901d2b1b9$6cb39420$461abc60$@neuf.fr>
Subject: Re: ***SPAM*** [PATCH] chromium: enable aarch64 support
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
X-List-Received-Date: Mon, 10 Apr 2017 19:47:25 -0000
X-Groupsio-MsgNum: 66187
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="80lRAIMR2Ka1TWEi4L7S9DaLA0QXIarfS"

--80lRAIMR2Ka1TWEi4L7S9DaLA0QXIarfS
Content-Type: multipart/mixed; boundary="Q1E34eNoVoJEwxfA1d2x2Fph3i1v9MGsT";
 protected-headers="v1"
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <68ada87a-f066-2954-b085-b93476c1f106@gmail.com>
Subject: Re: [oe] ***SPAM*** [PATCH] chromium: enable aarch64 support
References: <1491591433-19590-1-git-send-email-andrey.konovalov@linaro.org>
 <004901d2b1b9$6cb39420$461abc60$@neuf.fr>
In-Reply-To: <004901d2b1b9$6cb39420$461abc60$@neuf.fr>

--Q1E34eNoVoJEwxfA1d2x2Fph3i1v9MGsT
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

whoever comes up with patch, we will start the discussions and try to
get it in

On 4/9/17 10:15 PM, Herve Jourdain wrote:
> Hi,
>=20
> And in more recent / GN based versions of Chromium, no specific patch i=
s
> even needed, as aarch64 is "natively" supported by the codebase.
> I guess recipes for those will come soon, since it seems several differ=
ent
> persons/groups came with their own flavor of GN build...
>=20
> Cheers,
> Herve
>=20
> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org
> [mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf Of=

> Andrey Konovalov
> Sent: vendredi 7 avril 2017 20:57
> To: openembedded-devel@lists.openembedded.org
> Subject: ***SPAM*** [oe] [PATCH] chromium: enable aarch64 support
>=20
> Tested by running:
> - chromium-wayland on HiKey
> - chromium on dragonboard-410c
>=20
> Signed-off-by: Andrey Konovalov <andrey.konovalov@linaro.org>
> ---
>  recipes-browser/chromium/chromium.inc                   |  1 +
>  recipes-browser/chromium/files/aarch64/include.gypi     |  6 ++++++
>  recipes-browser/chromium/files/aarch64/oe-defaults.gypi | 15
> +++++++++++++++
>  3 files changed, 22 insertions(+)
>  create mode 100644 recipes-browser/chromium/files/aarch64/include.gypi=

>  create mode 100644 recipes-browser/chromium/files/aarch64/oe-defaults.=
gypi
>=20
> diff --git a/recipes-browser/chromium/chromium.inc
> b/recipes-browser/chromium/chromium.inc
> index 60edccb..c0c3b94 100644
> --- a/recipes-browser/chromium/chromium.inc
> +++ b/recipes-browser/chromium/chromium.inc
> @@ -7,6 +7,7 @@ COMPATIBLE_MACHINE_x86-64 =3D "(.*)"
>  COMPATIBLE_MACHINE_armv6 =3D "(.*)"
>  COMPATIBLE_MACHINE_armv7a =3D "(.*)"
>  COMPATIBLE_MACHINE_armv7ve =3D "(.*)"
> +COMPATIBLE_MACHINE_aarch64 =3D "(.*)"
> =20
>  # The build type defaults to Release. If you want a Debug build, you c=
an
> set  # the variable CHROMIUM_BUILD_TYPE to "Debug" in your conf/local.c=
onf
> file.
> diff --git a/recipes-browser/chromium/files/aarch64/include.gypi
> b/recipes-browser/chromium/files/aarch64/include.gypi
> new file mode 100644
> index 0000000..ad0347a
> --- /dev/null
> +++ b/recipes-browser/chromium/files/aarch64/include.gypi
> @@ -0,0 +1,6 @@
> +{
> +  'variables': {
> +    # Configure for aarch64 compilation
> +    'target_arch': 'arm64',
> +  },
> +}
> diff --git a/recipes-browser/chromium/files/aarch64/oe-defaults.gypi
> b/recipes-browser/chromium/files/aarch64/oe-defaults.gypi
> new file mode 100644
> index 0000000..27e1cfe
> --- /dev/null
> +++ b/recipes-browser/chromium/files/aarch64/oe-defaults.gypi
> @@ -0,0 +1,15 @@
> +{
> +  'variables': {
> +    'use_system_bzip2': 1,
> +    'disable_nacl': 1,
> +    'proprietary_codecs': 1,
> +    'v8_use_snapshot': 1,
> +    'use_system_ffmpeg': 0,
> +    'linux_use_tcmalloc': 0,
> +    'linux_link_kerberos': 0,
> +    'use_kerberos': 0,
> +    'use_cups': 0,
> +    'use_gnome_keyring': 0,
> +    'linux_link_gnome_keyring': 0
> +  },
> +}
> --
> 2.1.4
>=20
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>=20


--Q1E34eNoVoJEwxfA1d2x2Fph3i1v9MGsT--

--80lRAIMR2Ka1TWEi4L7S9DaLA0QXIarfS
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAljr4UsACgkQuwUzVZGdMxRT0gCaAxhcsQWUeXGcgWNSU1DtSwCp
a1gAoIjy3Q5WqKf2CwLnE2M7GQYtSckH
=QCQ1
-----END PGP SIGNATURE-----

--80lRAIMR2Ka1TWEi4L7S9DaLA0QXIarfS--
