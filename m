Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 6015C71989
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Oct 2016 14:30:49 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id y138so3597011wme.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Oct 2016 07:30:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=yb5yek9BuxIJXqnHQj6ImpJfci0RmpbnlSSCI+mHfs4=;
	b=FnYKAFNpxjufeC5TkObUl+gGDtMSa/gYI/vFubjqr/tbFH0+gGSrhIf6EP5+tAMg7Q
	Sf8k8Wzmdjcg7WuQ0k9yn0M/9aMvo6hB3wXjx5ctcbJ6ixXuJ12IRXvrTV2MhmIhUPTs
	l1KTA92gy42R4sEZ7Ae1fGFP3xMJXsrqEOcno76jiV4ob8pf35YdMhN1q4X1IvxbCNBe
	HXDaXSIOAdXCTJbRdYx0W/ApCwRzYDt0kG58nApK6tKvTSSLuuuA2rZd+ZTKwbldDbT9
	ZMJP5B+HMI5GXi9GBqyD7dv0u+DT89+hSPPuFwwDBxxO0LJnv07C3gN5qY604V8jz0Rk
	YSMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=yb5yek9BuxIJXqnHQj6ImpJfci0RmpbnlSSCI+mHfs4=;
	b=VHsAObgPwDpP/sSzSuUopfUkU52/THUJLkRdxXcEglFxoFVO6r5Z/8y/HIb5siYMn2
	fHBfpocGu0a31si1EZLTSFC+R7BtGLC7JLot7kc2+7SdXh35wMAVr7bYehSXWyvQvR6W
	k8rKU1+B72D14LWTMLh3xcLR3UF0jT7l7IptwPIkzj+ncMY7vMoxyzHlYX664/WRODHn
	FWisvN1Umi9fD8Uh+/z7ryobyUdzov8AG2TV5A1fzfE5s1aWbprmARpASruKINFdcdaX
	WteQD6KesXs3o9/u5NLA4rD5CY9E5zAHPVxC+umphjrRRHJRLa8v5GB0Ao1rJ5odpFtf
	rHvA==
X-Gm-Message-State: ABUngvcX+wwZCkeH5VT1ka+lNcB2I38ACF6RJmtGIDHwoWU8j6uGHjecWnJOTxUwKQkm/w==
X-Received: by 10.28.172.6 with SMTP id v6mr8432982wme.36.1477492250098;
	Wed, 26 Oct 2016 07:30:50 -0700 (PDT)
Received: from localhost (ip-89-176-50-133.net.upcbroadband.cz.
	[89.176.50.133]) by smtp.gmail.com with ESMTPSA id
	h133sm9935722wmg.23.2016.10.26.07.30.49
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 26 Oct 2016 07:30:49 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 26 Oct 2016 16:30:50 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20161026143050.GE4096@jama>
References: <1474826085-1209-1-git-send-email-dachaac@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1474826085-1209-1-git-send-email-dachaac@gmail.com>
User-Agent: Mutt/1.7.1 (2016-10-04)
Subject: Re: [meta-qt5][krogoth][PATCH] Update Qt's git repositories to match new location
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
X-List-Received-Date: Wed, 26 Oct 2016 14:30:50 -0000
X-Groupsio-MsgNum: 63613
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="imjhCm/Pyz7Rq5F2"
Content-Disposition: inline

--imjhCm/Pyz7Rq5F2
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 25, 2016 at 08:54:45PM +0300, Vesa J=E4=E4skel=E4inen wrote:
> Signed-off-by: Vesa J=E4=E4skel=E4inen <dachaac@gmail.com>
> ---
>  conf/layer.conf | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/conf/layer.conf b/conf/layer.conf
> index b7207e6..9220a75 100644
> --- a/conf/layer.conf
> +++ b/conf/layer.conf
> @@ -27,5 +27,5 @@ LICENSE_PATH +=3D "${LAYERDIR}/licenses"
> =20
>  IMAGE_FEATURES[validitems] +=3D "qtcreator-debug"
> =20
> -QT_GIT ?=3D "git://github.com/qtproject"
> +QT_GIT ?=3D "git://github.com/qt"
>  QT_GIT_PROTOCOL ?=3D "git"

This isn't in master yet, so it cannot be applied in krogoth and it also
breaks qt5everywheredemo fetch
http://errors.yoctoproject.org/Errors/Details/93069/

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--imjhCm/Pyz7Rq5F2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAlgQvhoACgkQN1Ujt2V2gBzDXQCgiqp5fW4VPuUNzA8481fkbrNU
b/YAnA9KQCqwb7LJsB30IKnLnBp/k/SV
=JYd/
-----END PGP SIGNATURE-----

--imjhCm/Pyz7Rq5F2--
