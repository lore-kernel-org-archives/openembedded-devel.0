Return-Path: <martin.jansa@gmail.com>
Received: from mail-wj0-f194.google.com (mail-wj0-f194.google.com
	[209.85.210.194])
	by mail.openembedded.org (Postfix) with ESMTP id A795E71975
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  9 Dec 2016 21:40:09 +0000 (UTC)
Received: by mail-wj0-f194.google.com with SMTP id he10so3987004wjc.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 09 Dec 2016 13:40:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=LfLwEHKeVB2+qgwew9JIP0t/sHhM/7m6cCKCm8A/l9Q=;
	b=o97HPzHLQulIMK53zzSE0oOjCQzGUPVLAVvz/0jwVQkuranmCcYSiIFSH8VsFsW9VF
	oDIeEuhZED7fI3WXcnnOxAxS9gTWfyp4X4SuuO7CAA5/QuK1fbgs70iP4b0Vf7O0E4g5
	ElQzTt6vpERzz5FFq0MKB0h5hOOtIoYKDkH/Q9/HF1aORQ0uOpvr6/hatKqLhPgEnu6o
	IVUPuzkoiWLel/yjWkwHKq2mrjzLm0FhHslSyt2F945PrSCZXAZ/JatHA+qTu08mdAmF
	3xidoDnf/aYJL7XKvSi3TokHcC8SFaVjeNtrTVhp/IEA7rBXudl22c1Mg9kkwCU5znZv
	z8Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=LfLwEHKeVB2+qgwew9JIP0t/sHhM/7m6cCKCm8A/l9Q=;
	b=fNzeTDO9LwN4TvLxrUXTvkWnW3+l91DxaG89DAX0ijTDhuipELXiIcQs362ArtMQgG
	aXmqAfgb5PglkilGDOt+Py277EWaj4aJyYfNoVLMVSdGm/0E5UOA6ro1GxmfV0Oaw9Ox
	zHR6X7TfKIe1IEWH2w4rd3LnMVuuaIk1ARhVYHy5T7NjgKrNDE2NVaBk6bhDQQbbdTDN
	ovPXPrNBDH95qVcktScPWaQEq6tPOzCRK8JCVEIV0s8PCu2rxidRGZML6cTcboLdstoR
	O0Z+fAl6ct+V+I9hP1EWtrA0jq7fifmYx+tmzQaBOQ2GxUlPeEAaBRVHuVMrQgwid4wS
	O3Mw==
X-Gm-Message-State: AKaTC01ppPF7KOdDTlMUzBGJsUqE5xiADDrXm7X9QhS+6FjU1TTt88p7JQkf7GBNhJQ/yA==
X-Received: by 10.194.96.110 with SMTP id dr14mr53226900wjb.209.1481319609928; 
	Fri, 09 Dec 2016 13:40:09 -0800 (PST)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	z6sm44310645wjt.24.2016.12.09.13.40.08
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 09 Dec 2016 13:40:09 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 9 Dec 2016 22:40:09 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20161209214009.GD3327@jama>
References: <20161203030422.17285-1-raj.khem@gmail.com>
	<20161203030422.17285-8-raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20161203030422.17285-8-raj.khem@gmail.com>
User-Agent: Mutt/1.7.2 (2016-11-26)
Subject: Re: [meta-oe][PATCH 8/8] loop-aes: Add recipe
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
X-List-Received-Date: Fri, 09 Dec 2016 21:40:19 -0000
X-Groupsio-MsgNum: 64275
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="eheScQNz3K90DVRs"
Content-Disposition: inline

--eheScQNz3K90DVRs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 02, 2016 at 07:04:22PM -0800, Khem Raj wrote:
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta-oe/recipes-support/loop-aes/loop-aes_v3.7j.bb | 22 ++++++++++++++++=
++++++
>  1 file changed, 22 insertions(+)
>  create mode 100644 meta-oe/recipes-support/loop-aes/loop-aes_v3.7j.bb
>=20
> diff --git a/meta-oe/recipes-support/loop-aes/loop-aes_v3.7j.bb b/meta-oe=
/recipes-support/loop-aes/loop-aes_v3.7j.bb
> new file mode 100644
> index 0000000..fa60c7b
> --- /dev/null
> +++ b/meta-oe/recipes-support/loop-aes/loop-aes_v3.7j.bb
> @@ -0,0 +1,22 @@
> +SUMMARY =3D "Loop-aes - replacement for loop driver that can do aes encr=
yption"
> +DESCRIPTION =3D "Fast and transparent file system and swap encryption pa=
ckage for \
> +               linux. No source code changes to linux kernel. Works with=
 3.x,\
> +               2.6, 2.4, 2.2 and 2.0 kernels."
> +HOMEPAGE =3D "http://sourceforge.net/projects/loop-aes/"
> +LICENSE =3D "GPL-2.0"
> +
> +LIC_FILES_CHKSUM =3D "file://aes-GPL.diff;md5=3Dbf349af3486306c2e4d85de5=
b6fa3bb4"
> +
> +SRC_URI =3D "http://loop-aes.sourceforge.net/loop-AES/loop-AES-${PV}.tar=
=2Ebz2"
> +SRC_URI[md5sum] =3D "335238a7cfd45f157935c59156533a05"
> +SRC_URI[sha256sum] =3D "67ede839d4cac657359c39b05eac46f6991054768a7e1096=
bef5b92edb3b8aba"
> +
> +inherit module
> +
> +S =3D "${WORKDIR}/loop-AES-${PV}"
> +
> +EXTRA_OEMAKE +=3D "LINUX_SOURCE=3D${STAGING_KERNEL_DIR} INSTALL_MOD_PATH=
=3D${D} MODINST=3Dn"
> +
> +do_install () {
> +     install -D -m 0655 loop.ko ${D}${base_libdir}/modules/${KERNEL_VERS=
ION}/misc/loop.ko

Please use 4 spaces when updating.

> +}

It conflicts with linux-yocto:
http://errors.yoctoproject.org/Errors/Details/112197/

> --=20
> 2.10.2
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--eheScQNz3K90DVRs
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWEskuAAKCRA3VSO3ZXaA
HH+2AJ9M1mXNjRaH8p6YjoTvMWMa6Ey80ACgkLGY1qJFvrWa3HU3eLVqU02iXQc=
=3tsX
-----END PGP SIGNATURE-----

--eheScQNz3K90DVRs--
