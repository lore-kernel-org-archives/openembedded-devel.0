Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 42C957787D
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  8 Mar 2017 10:17:52 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id u132so5209923wmg.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 08 Mar 2017 02:17:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=JenwiBXmiR6q9IFEDsSesBQmPDOyTR3m7Mgh2cC4IsA=;
	b=MDLTXWY6eVltzyJ5ASHLMgzr/O2KdNoMVQHPlok76vtXwelYIWt6tPLQwoCoMiH3KW
	UcZwQE20ME4MBlVj3JSK2/Bi5kWWAU2vR8GYzBZVtigP3WRLaTDHQ9aahmxmz/UUntss
	5QlWnRmwZUW9iNp6xaQN4HEJt6SY/aNU1Snfn8IJKUOF01Vc4afuhE4pd2uTrPmnr64Y
	e/7MiIezvE/fMwPQ5X9ABLoH9jykpCOZN3d1M/5aeUy8v6UJ/1txOudQezoEOUr/cAuO
	cUKhXXl44SJqYsjZuXoZ4FWU9sQkmBvXUgYbgItUIEHSJpZm3YBtJosxPcYnguZrMvWt
	Q6WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=JenwiBXmiR6q9IFEDsSesBQmPDOyTR3m7Mgh2cC4IsA=;
	b=Cl5D5KLdfqOWF2wRFG9Ue74FXBmZH7EkaFrIc5lOX4AEOkrpIVhYvm8Xwk49Sem6Bp
	7Y+YLiqjFH9PzJ6tXCCDvvD+xYCOUT21HoE6qCH4qmDsXr3Db0/mEH9UgfFM4VNwIwJK
	B1+S+yI6sOwrI+0woQ8ElKu9Z4sY6cf8Hu/W6A7rgYn2/nqNFSn32PodQKsR3SOPHRyK
	vvOlxarZIQ6MDjqUA4pQZEdeYhWnWG70s0OjzwVJdBfSS5XZketbd1d/1sJd7o6X68UM
	o6T9ebS3gtwY1gOWJxVUvjWkcLHIbZ93+296A6KCMbzhQ97vOLaqCEnvoYbEDAzodOXc
	E+5g==
X-Gm-Message-State: AMke39kFWUtOfzEq2oERRw5K/Lm+En2L5ePZdovqKbFftyAIN2LUVB+GWqT2E1lRI6iU6A==
X-Received: by 10.28.203.204 with SMTP id b195mr16214569wmg.51.1488968273820; 
	Wed, 08 Mar 2017 02:17:53 -0800 (PST)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	q75sm4069171wmd.27.2017.03.08.02.17.52
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 08 Mar 2017 02:17:52 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 8 Mar 2017 11:17:54 +0100
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20170308101754.GB3279@jama>
References: <20170307071349.16444-1-raj.khem@gmail.com>
	<20170307071349.16444-14-raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20170307071349.16444-14-raj.khem@gmail.com>
User-Agent: Mutt/1.8.0 (2017-02-23)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH 14/14] libtorrent, rtorrent: Update to 0.13.6+git
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
X-List-Received-Date: Wed, 08 Mar 2017 10:17:53 -0000
X-Groupsio-MsgNum: 65721
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="aM3YZ0Iwxop3KEKx"
Content-Disposition: inline

--aM3YZ0Iwxop3KEKx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 06, 2017 at 11:13:49PM -0800, Khem Raj wrote:
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  .../{libtorrent_0.13.3.bb =3D> libtorrent_0.13.6.bb}          | 13 +++++=
+++++---
>  .../rtorrent/{rtorrent_0.9.3.bb =3D> rtorrent_0.9.6.bb}       | 12 +++++=
++++---
>  2 files changed, 19 insertions(+), 6 deletions(-)
>  rename meta-oe/recipes-connectivity/libtorrent/{libtorrent_0.13.3.bb =3D=
> libtorrent_0.13.6.bb} (60%)
>  rename meta-oe/recipes-connectivity/rtorrent/{rtorrent_0.9.3.bb =3D> rto=
rrent_0.9.6.bb} (57%)
>=20
> diff --git a/meta-oe/recipes-connectivity/libtorrent/libtorrent_0.13.3.bb=
 b/meta-oe/recipes-connectivity/libtorrent/libtorrent_0.13.6.bb
> similarity index 60%
> rename from meta-oe/recipes-connectivity/libtorrent/libtorrent_0.13.3.bb
> rename to meta-oe/recipes-connectivity/libtorrent/libtorrent_0.13.6.bb
> index 4af3a6a6a..7153cff6c 100644
> --- a/meta-oe/recipes-connectivity/libtorrent/libtorrent_0.13.3.bb
> +++ b/meta-oe/recipes-connectivity/libtorrent/libtorrent_0.13.6.bb
> @@ -6,12 +6,19 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D393a5ca445f6=
965873eca0259a17f833"
> =20
>  DEPENDS =3D "libsigc++-2.0 openssl cppunit"
> =20
> -SRC_URI =3D "http://libtorrent.rakshasa.no/downloads/${BP}.tar.gz \
> +SRC_URI =3D "git://github.com/rakshasa/libtorrent;protocol=3Dgit;branch=
=3Dmaster \

Drop protocol and branch

>      file://don-t-run-code-while-configuring-package.patch \
>  "
> +SRCREV =3D "c167c5a9e0bcf0df23ae5efd91396aae0e37eb87"
> =20
> -SRC_URI[md5sum] =3D "e94f6c590bb02aaf4d58618f738a85f2"
> -SRC_URI[sha256sum] =3D "34317d6783b7f8d0805274c9467475b5432a246c0de8e28f=
c16e3b0b43f35677"
> +PV .=3D "+git${SRCPV}"

Please rename the recipe and set whole version inside.

> +
> +S =3D "${WORKDIR}/git"
> =20
>  inherit autotools pkgconfig
> =20
> +EXTRA_OECONF =3D "--without-zlib"

For some reason even with this it tries to use zlib:

| ../../../../git/src/torrent/utils/log.cc:51:18: fatal error: zlib.h:
No such file or directory
|  #include <zlib.h>
|                   ^
| compilation terminated.
| Makefile:485: recipe for target 'log.lo' failed

http://errors.yoctoproject.org/Errors/Details/134814/

> +
> +do_configure_prepend() {
> +    (cd ${S}; ./autogen.sh; cd -)
> +}
> diff --git a/meta-oe/recipes-connectivity/rtorrent/rtorrent_0.9.3.bb b/me=
ta-oe/recipes-connectivity/rtorrent/rtorrent_0.9.6.bb
> similarity index 57%
> rename from meta-oe/recipes-connectivity/rtorrent/rtorrent_0.9.3.bb
> rename to meta-oe/recipes-connectivity/rtorrent/rtorrent_0.9.6.bb
> index eb0a39af5..817c24345 100644
> --- a/meta-oe/recipes-connectivity/rtorrent/rtorrent_0.9.3.bb
> +++ b/meta-oe/recipes-connectivity/rtorrent/rtorrent_0.9.6.bb
> @@ -5,11 +5,17 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D94d55d512a9b=
a36caa9b7df079bae19f"
> =20
>  DEPENDS =3D "libsigc++-2.0 curl cppunit libtorrent ncurses"
> =20
> -SRC_URI =3D "http://libtorrent.rakshasa.no/downloads/${BP}.tar.gz \
> +SRC_URI =3D "git://github.com/rakshasa/rtorrent;protocol=3Dgit;branch=3D=
master \
>      file://don-t-run-code-while-configuring-package.patch \
>  "
> +SRCREV =3D "226e670decf92e7adaa845a6982aca4f164ea740"
> =20
> -SRC_URI[md5sum] =3D "0bf2f262faa8c8c8d3b11ce286ea2bf2"
> -SRC_URI[sha256sum] =3D "9e93ca41beb1afe74ad7ad8013e0d53ae3586c9b0e97263d=
722f721535cc7310"
> +PV .=3D "+git${SRCPV}"
> +
> +S =3D "${WORKDIR}/git"
> =20
>  inherit autotools pkgconfig
> +
> +do_configure_prepend() {
> +    (cd ${S}; ./autogen.sh; cd -)
> +}
> --=20
> 2.12.0
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--aM3YZ0Iwxop3KEKx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWL/aUQAKCRA3VSO3ZXaA
HM2VAJwK44HxbtG4NGtKBxNgaAzwZiUzzACglKXu6co4zYs6StDHb0NLOzvftp4=
=fpIN
-----END PGP SIGNATURE-----

--aM3YZ0Iwxop3KEKx--
