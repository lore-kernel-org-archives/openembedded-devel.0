Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f171.google.com (mail-wr0-f171.google.com
	[209.85.128.171])
	by mail.openembedded.org (Postfix) with ESMTP id E9253777BB
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  4 Mar 2017 11:54:33 +0000 (UTC)
Received: by mail-wr0-f171.google.com with SMTP id g10so88784381wrg.2
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 04 Mar 2017 03:54:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=zRxLDA0rXkaD+PMrydG2ioVe7jF75WpXII9CW+3PgBo=;
	b=VdYe9adLxWhWjh9CnIapZepbIZEJzvv+rIfezgv3GWrh3rpmw1iqJOa0JyePmiWu0j
	h7r27HkLUEe+JpfP5RYB0wZRXPmlwLffvWHyb/0gkI6kGB847X0GNOKCOArjzu7otVnC
	EsShy5iIu6iKN70XL1Znzbap+/kzfWbV8gnyfO+HngyCDMj3bgzK7YGi/gPjQer55fDc
	dk2SQObSXp0PdvUkuxqROT03FQ9v1FIVQyom47DsZkDe6bkmp+62dzrCMTxcZJnB0ibK
	1uRbwEtboVa1PeObgAL7kIiOnDRa+MlYiLrEJfy5yplmQdixxKxIo1AIelyrviHyXX0f
	MfmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=zRxLDA0rXkaD+PMrydG2ioVe7jF75WpXII9CW+3PgBo=;
	b=eD6iF1MVYQTDhb1yq+axii9kJzKptD9faLnS7khznsb/LitPchIyAeqnD8gQ2rCsOS
	XY1TafK/JclOqZDAUlptuveC9Wumi70aJ2/9jlct+GCsSAMPFDCXtCjAd27VKiQ4zEis
	gdim22mbgYFk/Jhx/SMgHIFPpXUNCbcYBBGobeog+ADcUzODm14PGTPNFSCwakNb9mMl
	IKhpbCLvsJmVu5CUljoFd/+KyHrqmRR+8vEFrbJXOhIIkGYIQ5icE4E3ZfVpEoO2KjTu
	cW6ad5wGzsCq9moqTmBN1ejChYHvNudEeRiwWDKUtGfkq8My+LiDrOAPQhrMldYOVXmW
	cwvg==
X-Gm-Message-State: AMke39mSBpzNtD+jJ4f5LzEUHF0KDfstRBRRWz6IVoyj5vMwRhSnmccx8X7Skgegmi91kg==
X-Received: by 10.223.142.201 with SMTP id q67mr6234222wrb.182.1488628474359; 
	Sat, 04 Mar 2017 03:54:34 -0800 (PST)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	j74sm3865238wrj.21.2017.03.04.03.54.33
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 04 Mar 2017 03:54:33 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Sat, 4 Mar 2017 12:54:36 +0100
To: Yann PERON <yann.peron@optimatic.fr>
Message-ID: <20170304115436.GD3025@jama>
References: <1488363425-824-1-git-send-email-yann.peron@optimatic.fr>
MIME-Version: 1.0
In-Reply-To: <1488363425-824-1-git-send-email-yann.peron@optimatic.fr>
User-Agent: Mutt/1.8.0 (2017-02-23)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-qt5][PATCH] Ajout de qtSerialBus dans la toolchain
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
X-List-Received-Date: Sat, 04 Mar 2017 11:54:34 -0000
X-Groupsio-MsgNum: 65675
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="EP0wieDxd4TSJjHq"
Content-Disposition: inline

--EP0wieDxd4TSJjHq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 01, 2017 at 11:17:05AM +0100, Yann PERON wrote:
> ---

Please use English.

>  recipes-qt/packagegroups/packagegroup-qt5-toolchain-target.bb | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/recipes-qt/packagegroups/packagegroup-qt5-toolchain-target.b=
b b/recipes-qt/packagegroups/packagegroup-qt5-toolchain-target.bb
> index 1521dbf..2735135 100755
> --- a/recipes-qt/packagegroups/packagegroup-qt5-toolchain-target.bb
> +++ b/recipes-qt/packagegroups/packagegroup-qt5-toolchain-target.bb
> @@ -83,6 +83,8 @@ RDEPENDS_${PN} +=3D " \
>      ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'qtsensors-qmlplug=
ins', '', d)} \
>      qtserialport-dev \
>      qtserialport-mkspecs \
> +    qtserialbus-dev \
> +    qtserialbus-mkspecs \
>      qtsvg-dev \
>      qtsvg-mkspecs \
>      qtsvg-plugins \
> --=20
> 2.1.4
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--EP0wieDxd4TSJjHq
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWLqq+wAKCRA3VSO3ZXaA
HC4dAJ95dgGINDbuSQ1xrWd8onP67QXgjQCffRvzf5pu91LazXTqCtsKaG7upP4=
=Y4+G
-----END PGP SIGNATURE-----

--EP0wieDxd4TSJjHq--
