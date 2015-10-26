Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f196.google.com (mail-wi0-f196.google.com
	[209.85.212.196])
	by mail.openembedded.org (Postfix) with ESMTP id 0B25373D27;
	Mon, 26 Oct 2015 13:28:03 +0000 (UTC)
Received: by wicuk10 with SMTP id uk10so20425785wic.1;
	Mon, 26 Oct 2015 06:28:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=OrGI5N3QgQCZXa8fAh5mDPfZZl8PB8HeJbhL5TF2zmo=;
	b=qXWDAySeOeHfFia4QUz+YwdLcuFZBiqG37Djwit0/fcMvYZMFDh/aOi/Qtrmng6gf3
	PKCJ7T/yjdEeSLCepF60IMWBpghtle6vwZVWKkCn0vSg20gIHQWBSKTPMZQ5Vqi9AdIV
	mHP6vrx8qMYQuFFMlcKJt2U+vw4NW+ocmhjJyimRwQGusQFwquK5WIjaa1FzT/8ToL9d
	jPIpJzo6tehR6fdzdlAuwy6t5as9mmsG3kuAY91PoYIiu2bHB9HMHrVL/j/KBdvYp+wO
	TDXrvq7S5J7cA0HFyG6DyRQ0OBYaqGEHcAmALFm83d1O3OtZYz6ola640oNWxh+HcAdR
	L3ow==
X-Received: by 10.194.223.39 with SMTP id qr7mr24644712wjc.92.1445866083273;
	Mon, 26 Oct 2015 06:28:03 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	nd9sm13952256wic.0.2015.10.26.06.28.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 26 Oct 2015 06:28:02 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 26 Oct 2015 14:28:13 +0100
To: openembedded-devel@lists.openembedded.org,
	Andreas =?iso-8859-1?Q?M=FCller?= <schnitzeltony@googlemail.com>
Message-ID: <20151026132813.GC2554@jama>
References: <20150908142441.20F8650290@opal.openembedded.org>
MIME-Version: 1.0
In-Reply-To: <20150908142441.20F8650290@opal.openembedded.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: openembedded-commits@lists.openembedded.org
Subject: =?UTF-8?B?UmU6IFtvZS1jb21taXRzXSBBbmRyZWFzIE3DvGxsZXIgOiBmb250Zm9yZ2U6IHVwZGF0ZSB0byAyMDE1MDgyNA==?=
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 26 Oct 2015 13:28:05 -0000
X-Groupsio-MsgNum: 58024
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="eRtJSFbw+EEWtPj3"
Content-Disposition: inline

--eRtJSFbw+EEWtPj3
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 08, 2015 at 02:24:41PM +0000, git@git.openembedded.org wrote:
> Module: meta-openembedded.git
> Branch: master
> Commit: de033e18d168af57cab6ce1aa6b01d2999f322b5
> URL:    http://git.openembedded.org/?p=3Dmeta-openembedded.git&a=3Dcommit=
;h=3Dde033e18d168af57cab6ce1aa6b01d2999f322b5
>=20
> Author: Andreas M=FCller <schnitzeltony@googlemail.com>
> Date:   Sun Aug 30 12:33:55 2015 +0200
>=20
> fontforge: update to 20150824
>=20
> * LICENSE was rewrittem stating out more clearly that huge parts were ini=
tially
>   licensed under BSD clause 3 - so add that licence.
> * Follow suggestion not to use github release tarballs [1] and use git as
>   source.
>=20
> [1] http://lists.openembedded.org/pipermail/openembedded-devel/2015-Augus=
t/102843.html
>=20
> Signed-off-by: Andreas M=FCller <schnitzeltony@googlemail.com>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>=20
> ---
>=20
>  .../{fontforge_20141126.bb =3D> fontforge_20150824.bb}          | 11 +++=
+++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
>=20
> diff --git a/meta-oe/recipes-graphics/fontforge/fontforge_20141126.bb b/m=
eta-oe/recipes-graphics/fontforge/fontforge_20150824.bb
> similarity index 77%
> rename from meta-oe/recipes-graphics/fontforge/fontforge_20141126.bb
> rename to meta-oe/recipes-graphics/fontforge/fontforge_20150824.bb
> index a2d6cc6..eb58d8f 100644
> --- a/meta-oe/recipes-graphics/fontforge/fontforge_20141126.bb
> +++ b/meta-oe/recipes-graphics/fontforge/fontforge_20150824.bb
> @@ -1,9 +1,9 @@
>  SUMMARY =3D "A font editor"
>  HOMEPAGE =3D "http://fontforge.github.io/en-US/"
> -LICENSE =3D "GPLv3"
> +LICENSE =3D "BSD-3-Clause & GPLv3"
>  LIC_FILES_CHKSUM =3D " \
>      file://COPYING.gplv3;md5=3Dd32239bcb673463ab874e80d47fae504 \
> -    file://LICENSE;md5=3D71d636ba7678baa1573e1b531041386e \
> +    file://LICENSE;md5=3D3f922b42ed0033fa0fd4cd3268f6429c \
>  "
> =20
>  inherit autotools pkgconfig pythonnative distro_features_check
> @@ -12,9 +12,10 @@ DEPENDS =3D "glib-2.0 pango giflib tiff libxml2 jpeg p=
ython libtool"
>  DEPENDS_append_class-target =3D " libxi"
>  REQUIRED_DISTRO_FEATURES_append_class-target =3D " x11"
> =20
> -SRC_URI =3D "https://github.com/${BPN}/${BPN}/archive/${PV}.tar.gz"
> -SRC_URI[md5sum] =3D "0d6f5112c4e5689087339a94aceadf77"
> -SRC_URI[sha256sum] =3D "9c90c640023463c0b2b97b87575a014fcf44f688c3763f4c=
d136d3c267092106"
> +SRC_URI =3D "git://github.com/${BPN}/${BPN}.git"
> +# tag 20150824
> +SRCREV =3D "07d5ccff2704f8a56f1b3cc6695a4e31f85f88e6"
> +S =3D "${WORKDIR}/git"

Can you please check why it downloads gnulib in do_configure and prevent it=
 to do that?

It just failed in my world build with:

| bootstrap: running: libtoolize --force --quiet
| bootstrap: running: git clone --depth 365 'git://git.sv.gnu.org/gnulib' '=
gnulib'
| fatal: read error: Connection reset by peer
| Cloning into 'gnulib'...
=2E.
| configure.ac:677: error: required file 'lib/Makefile.in' not found
| Makefile.am:63: error: required directory ./lib does not exist
| Unicode/Makefile.am: installing 'config/depcomp'
| autoreconf: automake failed with exit status: 1

http://errors.yoctoproject.org/Errors/Details/21031/

> =20
>  EXTRA_OECONF_append_class-native =3D " with_x=3Dno --disable-python-exte=
nsion --disable-python-scripting"
> =20
>=20
> --=20
> _______________________________________________
> Openembedded-commits mailing list
> Openembedded-commits@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-commits

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--eRtJSFbw+EEWtPj3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlYuKmgACgkQN1Ujt2V2gBwZaACfWd10Pytu0mUhbq3is1Pi2NxG
PeAAmgJL/jPsU8AbBPqy8RaJnaVKwn00
=kJXh
-----END PGP SIGNATURE-----

--eRtJSFbw+EEWtPj3--
