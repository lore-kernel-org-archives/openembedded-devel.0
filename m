Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id E3DF5731F4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Apr 2016 07:51:36 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id r12so10367894wme.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Apr 2016 00:51:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=2L48TNBMqe6LXQwZzEmB7K/Enq03at3u8n/2vHPMT/8=;
	b=C0nJF9j4w4ZaxABX2iXmnWnIgSq/bP+5BHB95Gmz6S8DDpYsxuV0pOAharpAjYuJfl
	GSS6UFC6cp2ikZ52NOqFdFO6E6SGquvgr12WivqXE6TNd242alncRipVI1znugXkiReK
	PI2BmfObbIsN08Ry7ESBc4/b4WNqxzl49KkSQdkMLCLio1gRSLFZyZSD4AQHzEXwv6KG
	9BNZaZOezTyZqi5Gtcq7IHxgbwxwxLGLWVye01IIYGVEpav+IE56RPigpsiNoHJqmguc
	TylKrX0PA//LhYNk6qBQLlGEKCtprk5X3Sf6Bu36L4cJzqQF+hopq0Mkkai/2WfDy/O+
	pVng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=2L48TNBMqe6LXQwZzEmB7K/Enq03at3u8n/2vHPMT/8=;
	b=OWpEnOwJE2a+mN4kPK2APXbuSgCg2G6+9Gx1mG0y8zbFivOEJurHevYXrXr3NZweVJ
	DOKnCFnIxgNn80x4K6FGULI1nC629f7JjHgsvpnO+/024yTluDwUp1psZnJGWTPn4BsH
	ahWAE3fxLz5KfHGJg2XKnzOhbjZgYZiL74IvXzXsdb9J0KUTRCEpfbcc1mKXW+Rb/7xg
	2nKgIQBIg9WWbllsSCX+c6ifSk38UqZQk11Y4E0C3l18087Ymu29nnwEl/iRiSyVlCra
	KqoO/HxkGRz11YzOXqg4dUr9T1fHAIBi6f9Ta50aqmV8iy8fAW5TpB4zjZRfJqF3XMZ1
	UHhw==
X-Gm-Message-State: AOPr4FVuAH5qF7v8WgVhIMTw9EAR3/AJhoprhxAOILVDYWeYlJhFzTROSyca4k/wFGUIlQ==
X-Received: by 10.28.26.78 with SMTP id a75mr17455505wma.59.1461743497515;
	Wed, 27 Apr 2016 00:51:37 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	e16sm18934570wmc.3.2016.04.27.00.51.35
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 27 Apr 2016 00:51:35 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 27 Apr 2016 09:52:06 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160427075206.GE2559@jama>
References: <1461602537-19434-1-git-send-email-bruno.bottazzini@intel.com>
MIME-Version: 1.0
In-Reply-To: <1461602537-19434-1-git-send-email-bruno.bottazzini@intel.com>
User-Agent: Mutt/1.6.0 (2016-04-01)
Subject: Re: [meta-oe] libmicrohttpd: update to 0.9.49
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
X-List-Received-Date: Wed, 27 Apr 2016 07:51:37 -0000
X-Groupsio-MsgNum: 61198
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="pY3vCvL1qV+PayAL"
Content-Disposition: inline

--pY3vCvL1qV+PayAL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 25, 2016 at 01:42:17PM -0300, Bruno Bottazzini wrote:
> Signed-off-by: Bruno Bottazzini <bruno.bottazzini@intel.com>
> ---
>  .../{libmicrohttpd_0.9.34.bb =3D> libmicrohttpd_0.9.49.bb}            | =
6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>  rename meta-oe/recipes-support/libmicrohttpd/{libmicrohttpd_0.9.34.bb =
=3D> libmicrohttpd_0.9.49.bb} (82%)
>=20
> diff --git a/meta-oe/recipes-support/libmicrohttpd/libmicrohttpd_0.9.34.b=
b b/meta-oe/recipes-support/libmicrohttpd/libmicrohttpd_0.9.49.bb
> similarity index 82%
> rename from meta-oe/recipes-support/libmicrohttpd/libmicrohttpd_0.9.34.bb
> rename to meta-oe/recipes-support/libmicrohttpd/libmicrohttpd_0.9.49.bb
> index e3c833b..7b29065 100644
> --- a/meta-oe/recipes-support/libmicrohttpd/libmicrohttpd_0.9.34.bb
> +++ b/meta-oe/recipes-support/libmicrohttpd/libmicrohttpd_0.9.49.bb
> @@ -6,10 +6,10 @@ SECTION =3D "net"
>  DEPENDS =3D "libgcrypt gnutls file"
> =20
>  SRC_URI =3D "http://ftp.gnu.org/gnu/libmicrohttpd/${BPN}-${PV}.tar.gz"
> -SRC_URI[md5sum] =3D "2947eee13c2c8affb95023a0cb6fda0c"
> -SRC_URI[sha256sum] =3D "29a2bfd4fd2ddf60c756b8c283291a134898e3cc143843be=
421a040be1b25a88"
> +SRC_URI[md5sum] =3D "3209aa2ac6199b874a6325342b86edbc"
> +SRC_URI[sha256sum] =3D "9407d8252548ab97ace3276e0032f073820073c0599d43ba=
ff832902a8dab11c"
> =20
> -inherit autotools lib_package
> +inherit autotools lib_package pkgconfig

I've reported this in 0.9.48 upgrade:
http://lists.openembedded.org/pipermail/openembedded-devel/2016-March/10667=
2.html

libmicrohttpd-0.9.49: libmicrohttpd: configure was passed unrecognised
options: --disable-spdy [unknown-configure-option]

This time I'll make sure to hold this patch until it's resolved.

>  # disable spdy, because it depends on openssl
>  EXTRA_OECONF +=3D "--disable-static --with-gnutls=3D${STAGING_LIBDIR}/..=
/ --disable-spdy"
> --=20
> 2.7.1
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--pY3vCvL1qV+PayAL
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlcgb6UACgkQN1Ujt2V2gBzZYgCffu8gVPsRxHce4wIzPvz2Uoiu
WicAniW17mtz5bHi6kQaEQJNrQQyVrVD
=/gZm
-----END PGP SIGNATURE-----

--pY3vCvL1qV+PayAL--
