Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 57B4577D70
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 May 2017 08:58:47 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id y10so1890515wmh.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 May 2017 01:58:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=Sma7dej2TAHI/KBtONRwiKS+hFr5lY4HemH+RDUkucs=;
	b=hFSm5EZkzy3B0vp2JFTp5SQix4Rh8gfWODCKzUwpjND7KhhHUoPCjQYxQIia6ZJx/3
	Q6P77Q1MtaoMR7uDcCgINPtOhEmpP4T5++CEgj45wVwQGsAEP78m/JE9GGRdbpn/ln+u
	XGfbU4xC4VkSMQmdkruCzUFhzcql3fzqHzfjp3arHyuQRHGB8dsPR3KontY+p7WnLXkQ
	YstvrkUjuJp01tP90ezDXxboMO1hI6T9uxxyaLnsTrnnGMrNxbxSjRcfQ3knb9LQtLNJ
	OcFQ6yFAb2dRmxX8L6DLnK9KPtOBcZkWjr3NwJuvI1XgdmEScvDMBB2i9zWL/3qLsgW3
	AZXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=Sma7dej2TAHI/KBtONRwiKS+hFr5lY4HemH+RDUkucs=;
	b=oob0fmUIGXqJEXkTxa9aJnMugsKxDdn18GvB3btrT6mip1b41EUtcExaCZ5QjknIQp
	HUtV4erSQfrquuGNuyBXmaydbwtwK1uRZtj27qBf6dzTP+Qq6ou7sCY613FXISs0z0rt
	LH/fm1z1LRm0+hspb7QpYTbzYFW2KXmiePVAnF0HMsZLjpWSQXxvQ2xMOtq/SafDmuw7
	6i1D7fDYqs3k4IiXi2HY+nNAMpUwYCicJaHgh/9WAnY/YVvnclM6XW/+XqLdN5hTGXms
	RcERhEW4rhnrHKKOTjzf99gTfZ1x+HzM5NaeCOxobXIIIBVO+CJyow46gPkw3JC8wnT+
	LOfQ==
X-Gm-Message-State: AODbwcABYSXk8/vkvtItXw9MiFRFgX8J0xfkCpJgdQFfv6X7e7aLSiaq
	MWrvbJ4n+ZwMck8e
X-Received: by 10.28.193.198 with SMTP id r189mr8981542wmf.82.1495011528614;
	Wed, 17 May 2017 01:58:48 -0700 (PDT)
Received: from localhost ([217.30.68.212])
	by smtp.gmail.com with ESMTPSA id v52sm998110wrc.53.2017.05.17.01.58.47
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 17 May 2017 01:58:47 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 17 May 2017 10:59:39 +0200
To: Chang Rebecca Swee Fun <rebecca.swee.fun.chang@intel.com>
Message-ID: <20170517085939.GC3086@jama>
References: <1494743864-167898-1-git-send-email-rebecca.swee.fun.chang@intel.com>
MIME-Version: 1.0
In-Reply-To: <1494743864-167898-1-git-send-email-rebecca.swee.fun.chang@intel.com>
User-Agent: Mutt/1.8.2 (2017-04-18)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe] [PATCH] libdbus-c++: remove PNBLACKLIST
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
X-List-Received-Date: Wed, 17 May 2017 08:58:48 -0000
X-Groupsio-MsgNum: 66779
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="MnLPg7ZWsaic7Fhd"
Content-Disposition: inline

--MnLPg7ZWsaic7Fhd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, May 14, 2017 at 02:37:44PM +0800, Chang Rebecca Swee Fun wrote:
> This recipe has been tested against meta-openembedded master branch
> and the build failure was unable to reproduce.
>=20
> The build issues encountered earlier could have been fixed by
> some other dependencies.

Try with gold, I can still reproduce it here:
http://errors.yoctoproject.org/Errors/Details/142781/


>=20
> Signed-off-by: Chang Rebecca Swee Fun <rebecca.swee.fun.chang@intel.com>
> ---
>  meta-oe/recipes-core/dbus/libdbus-c++_0.9.0.bb | 2 --
>  1 file changed, 2 deletions(-)
>=20
> diff --git a/meta-oe/recipes-core/dbus/libdbus-c++_0.9.0.bb b/meta-oe/rec=
ipes-core/dbus/libdbus-c++_0.9.0.bb
> index 4412716..9b053fe 100644
> --- a/meta-oe/recipes-core/dbus/libdbus-c++_0.9.0.bb
> +++ b/meta-oe/recipes-core/dbus/libdbus-c++_0.9.0.bb
> @@ -27,5 +27,3 @@ PACKAGE_BEFORE_PN =3D "${PN}-tools"
>  FILES_${PN}-tools =3D "${bindir}"
> =20
>  BBCLASSEXTEND =3D "native"
> -
> -PNBLACKLIST[libdbus-c++] ?=3D "Fails to build with RSS http://errors.yoc=
toproject.org/Errors/Details/130644/ - the recipe will be removed on 2017-0=
9-01 unless the issue is fixed"
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

--MnLPg7ZWsaic7Fhd
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWRwQ+gAKCRA3VSO3ZXaA
HOcSAJ9NhMw7gBpy4l3tDePLOetgtP0WowCbBsbSXJcI2XGXb1FKis15ztg+w0w=
=EVrr
-----END PGP SIGNATURE-----

--MnLPg7ZWsaic7Fhd--
