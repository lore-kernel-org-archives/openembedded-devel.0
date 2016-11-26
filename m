Return-Path: <martin.jansa@gmail.com>
Received: from mail-wj0-f193.google.com (mail-wj0-f193.google.com
	[209.85.210.193])
	by mail.openembedded.org (Postfix) with ESMTP id A5A296071F
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Nov 2016 00:15:10 +0000 (UTC)
Received: by mail-wj0-f193.google.com with SMTP id o2so3328007wje.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Nov 2016 16:15:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=nyoOaLASp5+sxiGoxLSKQpz+doSj0w3SpfYioXW1mQQ=;
	b=WUUH963DUeus8iqtJCorSTttaJ2Bk9EbppVTwHtR+NKPIuVNTgKpWiPzhupu9G2m59
	JeeWqosg/PxQ9lrO0LfSbBx/N22wveIsU51cacCQl8OW05Hn1qEH7mtoU1fAhwBe0tcm
	iFf+4mq/brMqGxB1PiZMqHFB/dNe+v6LbcMAESbQfL6pCdwR/W8fmxbGJV06BUSCesvv
	clupALNr4NF2CIUrOY/vw7elqe1sILVoNTLo4SkSYu1xrwCJWheGZ9E3Rx3MNLTogUYd
	dn2CHjVqkpA13eax1EC+0gE6l9IlSmLZgxfJ57Xpmi8pEXetEQMxTj4l6FtKp+8HMLkU
	4tDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=nyoOaLASp5+sxiGoxLSKQpz+doSj0w3SpfYioXW1mQQ=;
	b=NaH69enazG2ZGQRHMyzpdAxdqauUeVIAjVd2YMQK9TRNVuJorHK42si5uaKP3OHTS3
	ny1fn+wcywlbSs5IGNaGz40keg7W7j79xHcbO3mDD+N/3ZygOok1+fwnGg7kyyvgZQYT
	coBfh8vqnc18uFF/721ASGFmVtijslJgIBObP9ka2KzKEtCLynwAW3VncrOZAd7otsiC
	sSNYEpDMgXPGcbHL+q0iwMamkla+6RFhKLTGLMY6XLLFTFBZQKo9eJPE52N8yeXvooSo
	8yJ4PIGubjK2pKhsvDexBfJPwSD4AofF2JlUEhUgV4Ksm6XF/at6BUv58Bm38cdJW+q4
	pRpQ==
X-Gm-Message-State: AKaTC00TjbKcqvogVYNt6AFC9Ec/TLgKwLR/pUuR+iwizep+HO6qCyKvp/oNu75qivQcZQ==
X-Received: by 10.194.221.4 with SMTP id qa4mr10936543wjc.179.1480119311461;
	Fri, 25 Nov 2016 16:15:11 -0800 (PST)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	v2sm49524636wja.41.2016.11.25.16.15.10
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 25 Nov 2016 16:15:10 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Sat, 26 Nov 2016 01:15:15 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20161126001515.GB8369@jama>
References: <20161123092209.23699-1-raj.khem@gmail.com>
	<20161123092209.23699-8-raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20161123092209.23699-8-raj.khem@gmail.com>
User-Agent: Mutt/1.7.1 (2016-10-04)
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [meta-multimedia][PATCH 08/49] kodi: Add krypton/17.x Jarvis/16.x recipes
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
X-List-Received-Date: Sat, 26 Nov 2016 00:15:11 -0000
X-Groupsio-MsgNum: 64044
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="xgyAXRrhYN0wYx8y"
Content-Disposition: inline

--xgyAXRrhYN0wYx8y
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 23, 2016 at 01:21:28AM -0800, Khem Raj wrote:
> 16.x is the default since its the latest released version
>=20
> remove obsoleted xbmc recipes
> rename to recipes-mediacenter
> +S =3D "${WORKDIR}/git"
> +
> +# breaks compilation
> +ASNEEDED =3D ""
> +
> +ACCEL ?=3D ""
> +ACCEL_x86 =3D "vaapi vdpau"
> +ACCEL_x86-64 =3D "vaapi vdpau"
> +
> +PACKAGECONFIG ??=3D "${ACCEL}"
> +PACKAGECONFIG_append +=3D "${@bb.utils.contains('DISTRO_FEATURES', 'x11'=
, ' x11', '', d)}"
> +PACKAGECONFIG_append +=3D "${@bb.utils.contains('DISTRO_FEATURES', 'open=
gl', ' opengl', ' openglesv2', d)}"
> +
> +PACKAGECONFIG[opengl] =3D "--enable-gl,--enable-gles,"
> +PACKAGECONFIG[openglesv2] =3D "--enable-gles,--enable-gl,virtual/egl"
> +PACKAGECONFIG[vaapi] =3D "--enable-vaapi,--disable-vaapi,libva"
> +PACKAGECONFIG[vdpau] =3D "--enable-vdpau,--disable-vdpau,libvdpau"
> +PACKAGECONFIG[mysql] =3D "--enable-mysql,--disable-mysql,mysql5"
> +PACKAGECONFIG[x11] =3D "--enable-x11,--disable-x11,libxinerama libxmu li=
bxrandr libxtst"
> +PACKAGECONFIG[pulseaudio] =3D "--enable-pulse,--disable-pulse,pulseaudio"

Did I overlook libva recipe somewhere?

It doesn't even start building for qemux86* because of this libva and
for qemuarm it fails to configure:
http://lists.openembedded.org/pipermail/openembedded-devel/2016-November/11=
0050.html

--xgyAXRrhYN0wYx8y
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWDjUEgAKCRA3VSO3ZXaA
HA2kAKC7ys9fA6QKk8YEb4/bSVg7cUrgpwCgr7ESqyQY2LmIXCzfL5znHy1RLC0=
=yqGa
-----END PGP SIGNATURE-----

--xgyAXRrhYN0wYx8y--
