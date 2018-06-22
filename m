Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f195.google.com (mail-wr0-f195.google.com
	[209.85.128.195])
	by mail.openembedded.org (Postfix) with ESMTP id 5A59174D46
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Jun 2018 18:59:25 +0000 (UTC)
Received: by mail-wr0-f195.google.com with SMTP id h10-v6so7624238wrq.8
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Jun 2018 11:59:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=5qXT+Au6F626vPeQsmXwH/sldwczEdXUDuSSForAJOA=;
	b=YrRc1i08yVbVYVBRknfpUAvxWxHc+uQfMccI+8ZDZJYqxAYgh5cuuq2FJqNxUnBb0u
	f3BBs/eZsiFk22yQ+CZwi23TT7p6PrZpbdyReNwu56fqO+Risgx3BIc1AfPdk2HI8jAL
	SUI+Pk/RfGUxkLYAYXVO9vgBBx8i+PupM3G6C1mFPll6lus8Yx3bwsH2L43b16Tb8Iyu
	xVNu16M+LAzf2QxXAljeVHlfFfk3xMJ14ghAKEM5uK1tt0lo1M1KBvlOXdTGEirDGGld
	n549lrzyiyEcFVOZJMSHBQ95A9xrhdoVLkzZRyNDHURSQtKj3QoQ4+zx7HRKCyWZZ+yE
	mJGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=5qXT+Au6F626vPeQsmXwH/sldwczEdXUDuSSForAJOA=;
	b=UkmKGbWq0Hn65xUTGFUoEAO+F1Pd+CX3whnGQNtm7IEJd+7J3mzFPdmi4X34AS1SJT
	sUdzmhqQfrBnsbcE7uwvigQBw7juUuPjYFamPzazhinkctng9jKFy9dbT/bZ6M2xWh3R
	Z9Rc1UKGlmt9FdM6PlaOcDwhmCzIIIbq5YxX4SB3r+UrMArNo/UVu/cUrmd4nyW0G/PF
	5/smx0wE5VY/IiIfaD7LhLQYkaUV+x6S7CPspTWyJVD7lcm4Hc7vazVE2a0loIWMhIHk
	LBmP/UXaiqdeq6b3VnI//OAaUQ4dyy+K3iBXtvRl/yuJrMLOsSXuDFcEYJKoIERJl80L
	D6uQ==
X-Gm-Message-State: APt69E194Foevj5qDU09VSJ6R+tDlI9PgIVPdegoaH4mZFAniH2KUMGn
	jRkGHbBTiLy41FrLBp2wgLY=
X-Google-Smtp-Source: AAOMgpe/Psz+O7QcHUDEdDDlvPw62klV8DeKnDsxrDNKuXz6GlkHeQ5o+WFY8k6vS6KPWRE/Hn/hHw==
X-Received: by 2002:adf:92e7:: with SMTP id 94-v6mr2528575wrn.70.1529693965939;
	Fri, 22 Jun 2018 11:59:25 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	h11-v6sm7759624wrs.85.2018.06.22.11.59.24
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 22 Jun 2018 11:59:25 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 22 Jun 2018 20:59:26 +0200
To: Otavio Salvador <otavio@ossystems.com.br>
Message-ID: <20180622185926.GB1842@jama>
References: <20180622183246.6608-1-otavio@ossystems.com.br>
MIME-Version: 1.0
In-Reply-To: <20180622183246.6608-1-otavio@ossystems.com.br>
User-Agent: Mutt/1.10.0 (2018-05-17)
Cc: Meta-OpenEmbedded Mailing listing
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5 PATCH] README: Rework to start using GitHub for development
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
X-List-Received-Date: Fri, 22 Jun 2018 18:59:25 -0000
X-Groupsio-MsgNum: 72994
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="0eh6TmSyL6TZE2Uz"
Content-Disposition: inline

--0eh6TmSyL6TZE2Uz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 22, 2018 at 03:32:46PM -0300, Otavio Salvador wrote:
> This changes the content so we start sending people to GitHub and
> deprecate the OpenEmbedded-Devel mailing list as the place for patch
> submission.
>=20
> The content has been reworked so it renders better inside GitHub and
> provide a more structured content.

I'm done with patchwork.

If anyone has some pending changes which I haven't merged to master-next
last night, then send pings or re-submit them as pull-requests. Pending
changes from master-next will be merged to master together with 5.11.1
upgrade soon.

Acked-by: Martin Jansa <Martin.Jansa@gmail.com>
=20
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ---
>=20
>  README    | 33 ---------------------------------
>  README.md | 32 ++++++++++++++++++++++++++++++++
>  2 files changed, 32 insertions(+), 33 deletions(-)
>  delete mode 100644 README
>  create mode 100644 README.md
>=20
> diff --git a/README b/README
> deleted file mode 100644
> index 9817851..0000000
> --- a/README
> +++ /dev/null
> @@ -1,33 +0,0 @@
> -This layer depends on:
> -
> -URI: git://github.com/openembedded/oe-core.git
> -branch: master
> -revision: HEAD
> -
> -When building stuff like qtdeclarative, qtquick, qtwebkit, make sure that
> -you have required PACKAGECONFIG options enabled in qtbase build, see qtb=
ase.inc
> -for detail.
> -
> -Send pull requests to openembedded-devel@lists.openembedded.org with '[m=
eta-qt5]' in the subject'
> -
> -When sending single patches, please using something like:
> -
> -git send-email -M -1 --to openembedded-devel@lists.openembedded.org --su=
bject-prefix=3D'meta-qt5][PATCH'
> -
> -Change option '-1' to '-n' for n number of patches in series
> -
> -You are encouraged to fork the mirror on github[1] to share your
> -patches. This is preferred for patch sets consisting of more than one
> -patch. Other services like gitlab, repo.or.cz or self hosted setups
> -are of course accepted as well, 'git fetch <remote>' works the same on
> -all of them. We recommend github because it is free, easy to use, has
> -been proven to be reliable and has a really good web GUI.
> -
> -1. https://github.com/meta-qt5/meta-qt5/
> -
> -meta-qt5 has Yocto Project Compatible status since 2013:
> -https://www.yoctoproject.org/product/meta-qt5
> -
> -Main layer maintainers:
> -  Martin 'JaMa' Jansa <martin.jansa@gmail.com>
> -  Otavio Salvador <otavio@ossystems.com.br>
> diff --git a/README.md b/README.md
> new file mode 100644
> index 0000000..fe94321
> --- /dev/null
> +++ b/README.md
> @@ -0,0 +1,32 @@
> +Qt5 OpenEmbedded/Yocto Project layer
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +This layer depends on:
> +
> +URI: https://github.com/openembedded/openembedded-core
> +branch: master
> +revision: HEAD
> +
> +When building stuff like `qtdeclarative`, `qtquick`, `qtwebkit`, make
> +sure that you have required `PACKAGECONFIG` options enabled in qtbase
> +build, see `qtbase` recipe for detail.
> +
> +
> +Contributing
> +------------
> +
> +Please submit any patches against the `meta-qt5` layer by using the
> +GitHub pull-request feature.  Fork the repo, make a branch, do the
> +work, rebase from upstream, create the pull request, yada-yada.
> +
> +Maintainers
> +-----------
> +
> +- Martin 'JaMa' Jansa <martin.jansa@gmail.com>
> +- Otavio Salvador <otavio@ossystems.com.br>
> +
> +Yocto Project Compatible
> +------------------------
> +
> +meta-qt5 has Yocto Project Compatible status since 2013:
> +https://www.yoctoproject.org/product/meta-qt5
> --=20
> 2.17.1
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--0eh6TmSyL6TZE2Uz
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWy1HDQAKCRA3VSO3ZXaA
HAi+AKCmb8I/kz9e2PPuFChr3jCO3QAiGQCdECRATkwOMpLLBVH/JdV7Nl7ZAPI=
=f3/j
-----END PGP SIGNATURE-----

--0eh6TmSyL6TZE2Uz--
