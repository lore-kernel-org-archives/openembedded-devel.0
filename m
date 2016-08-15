Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 75EF8770E3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Aug 2016 10:28:33 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id i5so10376618wmg.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Aug 2016 03:28:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=wrCOLncblrV96hmKEMv75Hws2v6YCxx33v6kAtm6bF0=;
	b=vH7K/6+1Zouazz8GkVzUFWzehIuYLTge/SJrcf1q0XEWwais6y4a61z9em3P+Rrp8m
	HZkkUtDX8PYaujn1/kJAUy4dOn85BK0wJDbbe4RUoYDIMq0BvAfu2VDyG9QBRxwcu/4+
	U3hsiLOoR2ei0Qg4kKv9hYlneKzp5IEPMNRbBIoFY1FmvH4YjZb46xYBf7uhGnsfcneL
	CmaMfRAjBZzmyZjz7nlz+7NJm2KqDHNawJPSQh9h7M3kpwV0A/ZOBnjRf5KmmGiFc4KZ
	X5k/XDRRTZ+4dC0XF7eHgWrSsFpJkXPsBnxt5uuEQldLMb5mTLgvCWAChJOw9S6zr7jt
	TSgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=wrCOLncblrV96hmKEMv75Hws2v6YCxx33v6kAtm6bF0=;
	b=SXZKXx4FFYnYN7wcraI7/b+SlcTO/j2JDmczr9DqF3RHbfHnRAJ/IXp1y45sunyHxl
	l92z3K3bpGiBFEtJz5PJRI1ZmKtoSUC3q1Z+pD9DuYPKDbGXgqRubxXSqUmgBfRzJXJx
	HoTM8RSSduEYj+NoUBtRH4rHg1KjFEaGOKz0KrUbOpXwePiQI++4dBWWv98y+/wlGu7u
	MCd5Qcw9YyjWoW4boZK6lxQW2DdtUFe0pNWEM9Evv5F0ElFKMQovxVFHXOLdhKBNahUL
	SUS5GIgOpioiJvueQa/xfPScs8nPuu2xLUx8sEQVZnxc0dMmvBWohoF80Uf+QygVJO0f
	wetw==
X-Gm-Message-State: AEkoouvbEPE//N8QsNkKIYQkXx3HBK3jNtQKfQaghhGbFLnr9OGFcg4SAQrkuHgF0Lie1w==
X-Received: by 10.194.118.70 with SMTP id kk6mr29512735wjb.180.1471256913145; 
	Mon, 15 Aug 2016 03:28:33 -0700 (PDT)
Received: from localhost (ip-89-176-104-169.net.upcbroadband.cz.
	[89.176.104.169]) by smtp.gmail.com with ESMTPSA id
	gg10sm20798888wjd.4.2016.08.15.03.28.31
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 15 Aug 2016 03:28:32 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 15 Aug 2016 12:28:35 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160815102835.frrnyyh4kldfslg3@jama>
References: <1470692494-32623-1-git-send-email-Randy.MacLeod@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1470692494-32623-1-git-send-email-Randy.MacLeod@windriver.com>
User-Agent: Mutt/1.6.2 (2016-06-11)
Subject: Re: [PATCH] imagemagick: upgrade from 6.9.2 to 7.0.2
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
X-List-Received-Date: Mon, 15 Aug 2016 10:28:34 -0000
X-Groupsio-MsgNum: 62628
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="qve5tplxfkhz2qyj"
Content-Disposition: inline

--qve5tplxfkhz2qyj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 08, 2016 at 05:41:34PM -0400, Randy MacLeod wrote:
> The copyright end year update made the LICENSE file checksum change.
> That line is in the middle of the file so the license checksum
> has been updated rather than specifying two ranges of lines.

You forgot to update FILES variable, I did that in master-next, but
next time please test your changes for QA issues before sending them.

WARNING: imagemagick-7.0.2-r0 do_package: QA Issue: imagemagick: Files/dire=
ctories were installed but not shipped in any package:
  /usr/lib/ImageMagick-7.0.2
  /usr/lib/ImageMagick-7.0.2/config-Q16HDRI
  /usr/lib/ImageMagick-7.0.2/config-Q16HDRI/configure.xml
  /usr/share/ImageMagick-7
  /usr/share/ImageMagick-7/english.xml
  /usr/share/ImageMagick-7/francais.xml
  /usr/share/ImageMagick-7/locale.xml

>=20
> Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
> ---
>  .../imagemagick/{imagemagick_6.9.2.bb =3D> imagemagick_7.0.2.bb}    | 8 =
++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>  rename meta-oe/recipes-support/imagemagick/{imagemagick_6.9.2.bb =3D> im=
agemagick_7.0.2.bb} (94%)
>=20
> diff --git a/meta-oe/recipes-support/imagemagick/imagemagick_6.9.2.bb b/m=
eta-oe/recipes-support/imagemagick/imagemagick_7.0.2.bb
> similarity index 94%
> rename from meta-oe/recipes-support/imagemagick/imagemagick_6.9.2.bb
> rename to meta-oe/recipes-support/imagemagick/imagemagick_7.0.2.bb
> index a9f0134..a5a239c 100644
> --- a/meta-oe/recipes-support/imagemagick/imagemagick_6.9.2.bb
> +++ b/meta-oe/recipes-support/imagemagick/imagemagick_7.0.2.bb
> @@ -1,18 +1,18 @@
>  SUMMARY =3D "ImageMagick is an image convertion tools"
>  SECTION =3D "console/utils"
>  LICENSE =3D "ImageMagick"
> -LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D0887b670be7ef0c3cb37092b64d57=
514"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D22d47a47bf252ca3ed7f71273b536=
12e"
>  # FIXME: There are many more checked libraries. All should be added or e=
xplicitly disabled to get consistent results.
>  DEPENDS =3D "lcms bzip2 jpeg libpng librsvg tiff zlib virtual/fftw freet=
ype"
> =20
>  # Important note: tarballs for all patchsets within a version are delete=
d when
>  # a new pachset is created. To avoid multiple patches for each patchset,=
 try to
>  # update to the last pachset of a version
> -PATCHSET =3D "0"
> +PATCHSET =3D "7"
>  SRC_URI =3D "http://www.imagemagick.org/download/releases/ImageMagick-${=
PV}-${PATCHSET}.tar.xz \
>  "
> -SRC_URI[md5sum] =3D "99471c8c3f38c9264faf5c4ca7a31287"
> -SRC_URI[sha256sum] =3D "07a2de28f7f9ab888ef47c02eb7e10cc3e0dd0e9797c5d71=
d6e71d19f842399e"
> +SRC_URI[md5sum] =3D "bd66b19bd6fc3d320bd8d51869c874f9"
> +SRC_URI[sha256sum] =3D "1168f44cfcd1243acda6bb9663f5d9b3a4bca2acd372e979=
b97b58ecf5c713e2"
> =20
>  S =3D "${WORKDIR}/ImageMagick-${PV}-${PATCHSET}"
> =20
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

--qve5tplxfkhz2qyj
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlexmVIACgkQN1Ujt2V2gBxYLgCguARJD6rU87pvigljOnQOAm/+
5d8An1L5uLApmTc+5Aq0xaFNA40SBeoD
=efY9
-----END PGP SIGNATURE-----

--qve5tplxfkhz2qyj--
