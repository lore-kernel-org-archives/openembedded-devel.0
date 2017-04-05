Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f196.google.com (mail-wr0-f196.google.com
	[209.85.128.196])
	by mail.openembedded.org (Postfix) with ESMTP id B644772F30
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  5 Apr 2017 18:36:39 +0000 (UTC)
Received: by mail-wr0-f196.google.com with SMTP id g19so5113174wrb.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 05 Apr 2017 11:36:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=8noMW7wHPcer4xObIQrZ9vNdvTPn10ji8SRv0hfFIKM=;
	b=TlfYl2hAsSaQlxU2l0P3TxLRLp/enFmj0CAFHom3ec5cWiPr6xJiJfO2Aws3P9gUDQ
	VGEVxVegQeNXnJ/rSCnG0M+4Z9LB69mBmwnSWvJGlvBhUDHRKUm0eDZEVyr6sqkNF1uU
	GFV/nhmEgNf3H7Kp36cftFD1VThQZB4xrLxfHjo7239kJyxvdc28WZRv3j8Lf8vE//HV
	hMumVWX0cZv2y0TOPXZyxEw8VcihFonU2vaQdj2jyxUTb4xrNftOogBu5sDzwypGVPw8
	jAsbNmOx8B4wthulxrsW+bxVBNv3Ccmieeq7fCau7U5FK+oeAigwb89jaISFwbEnzuqH
	Pd/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=8noMW7wHPcer4xObIQrZ9vNdvTPn10ji8SRv0hfFIKM=;
	b=YYhZvyL6W1usZcojP/UTujcAXcexolUvh17/dc22mfOnxn2HAZnhfhWPRdBNimQOeM
	1hEeAw8rSyqLlrdAK1+H40aEAVBie6JP1RT8F54J7rUjp809oI+l1M/Vks8ptorqcATz
	4nd4AY9Dq4W/BZY11wtJCf0nsnKxu9COnYfD2Cz0IvBUggD4+bHoDBz5UKekH+PfdJ5d
	bkJ1GhsFk0w0++i61lIS7FscFyZ4BLIRCRMqNbrcfeyB8xV9YDsFMbOtz7/hfCC4v7fx
	bWTzVZAMHgJPjeubXECkOI/FB9yT2p+zgp7l9Xi/f0gVG/OZM8zOpXadIuxdjJYH65LX
	8UzA==
X-Gm-Message-State: AFeK/H20jWdc9rspidm9rygimPF6fkVhPKBvyarM7U9oXeJGNIx4lxiP
	tH2jBIvfSmbsgQ==
X-Received: by 10.28.15.69 with SMTP id 66mr20767408wmp.105.1491417400826;
	Wed, 05 Apr 2017 11:36:40 -0700 (PDT)
Received: from localhost ([217.30.68.212])
	by smtp.gmail.com with ESMTPSA id k8sm2516915wrc.12.2017.04.05.11.36.39
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 05 Apr 2017 11:36:39 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 5 Apr 2017 20:36:40 +0200
To: Jaap de Jong <jaap.dejong@nedap.com>
Message-ID: <20170405183640.GB3301@jama>
References: <5822cba9-6a76-4555-a772-d862f216e0cf@nedap.com>
MIME-Version: 1.0
In-Reply-To: <5822cba9-6a76-4555-a772-d862f216e0cf@nedap.com>
User-Agent: Mutt/1.8.0 (2017-02-23)
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][morty][PATCH] uftp: Add recipe
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
X-List-Received-Date: Wed, 05 Apr 2017 18:36:39 -0000
X-Groupsio-MsgNum: 66120
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="bCsyhTFzCvuiizWE"
Content-Disposition: inline

--bCsyhTFzCvuiizWE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 03, 2017 at 12:54:49PM +0200, Jaap de Jong wrote:
>=20

I don't see this recipe in master branch...


> From cba20c0df65dcdd711009c5587142d2606deb1a9 Mon Sep 17 00:00:00 2001
> From: Jaap de Jong <jaap.dejong@nedap.com>
> Date: Mon, 3 Apr 2017 12:47:17 +0200
> Subject: [meta-networking][morty][PATCH] uftp: Add recipe
> To: openembedded-devel@lists.openembedded.org
>=20
> ---
>  meta-networking/recipes-support/uftp/uftp_4.9.3.bb | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>  create mode 100644 meta-networking/recipes-support/uftp/uftp_4.9.3.bb
>=20
> diff --git a/meta-networking/recipes-support/uftp/uftp_4.9.3.bb b/meta-ne=
tworking/recipes-support/uftp/uftp_4.9.3.bb
> new file mode 100644
> index 0000000..a6eeceb
> --- /dev/null
> +++ b/meta-networking/recipes-support/uftp/uftp_4.9.3.bb
> @@ -0,0 +1,15 @@
> +DESCRIPTION =3D "Encrypted UDP based FTP with multicast"
> +HOMEPAGE =3D "https://sourceforge.net/projects/uftp-multicast"
> +SECTION =3D "libs/network"
> +
> +LICENSE =3D "GPLv3"
> +LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3Dd32239bcb673463ab874e80d4=
7fae504"
> +
> +SRC_URI =3D "${SOURCEFORGE_MIRROR}/uftp-multicast/source-tar/uftp-${PV}.=
tar.gz"
> +
> +SRC_URI[md5sum] =3D "231d6ba7820d89a712fe7d727ab0f8e6"
> +SRC_URI[sha256sum] =3D "9e9215af0315257c6cc4f40fbc6161057e861be1fff10a38=
a5564f699e99c78f"
> +
> +do_install () {
> +	oe_runmake install DESTDIR=3D${D}
> +}
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

--bCsyhTFzCvuiizWE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWOU5OAAKCRA3VSO3ZXaA
HBjkAJ9pI/0wSBwtU0Ejs1DQT0XcKkIoGQCcC44DRCjSqavewbhlhykX/1NgUbc=
=HAe6
-----END PGP SIGNATURE-----

--bCsyhTFzCvuiizWE--
