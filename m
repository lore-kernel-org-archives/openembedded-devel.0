Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 917F171DD9
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Apr 2017 07:09:00 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id z129so8951397wmb.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Apr 2017 00:09:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=KFihbIqFYyCO+zwL9CTbe0zrRXvlnCzO6Y9U3g5IqkQ=;
	b=PK+kauYkMmU2YfyfY9ahuakIxPS2O7CwnkoGvni2N40c09M0Y43Ylf183eqEwaroNr
	DrH0QcQFZz93AMpdQNix3kFq+5fQCyPYy0KpmxQPfs14aEZtMmkIzWA+HOTMyNFYYTdg
	YepXKCgzCYpH6ujMYSPtuEcI1xzgJlKykNchqUS0UmhuJW1wRCqcG3QsxI9IP7EmUU30
	LA2ULOxx4FzWJQZnptJgNccRMPZDBc47lKnzNw5oOMIPNnsL1LJ5pMGd7vvbqg3IMJ0K
	jl2y8snl6GU+YtOtf0M5wBtOkD3Wq8zXsmYOC96MbWyAsasqu2MjLmBANqQCJVHpDgKX
	jP+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=KFihbIqFYyCO+zwL9CTbe0zrRXvlnCzO6Y9U3g5IqkQ=;
	b=d9fR5QI6Wm1hEa+3031Ui43qfyNFZHo9Slsu3b9OWVCKUAFRQChl4HPDmHUDITWTqh
	S9xDRpmB69FvAxsHt3+MeXFxcLLx00wR4NHC6DcAOPuiuAzWzCZT78Iyefh03QlkIhfC
	pnPsDRxctgTN9nNEXhphka4FcT4jg098ybsB/zQj01yflLjex87iD4cMeVfWIDuJyD8O
	AH1rJTX8GC3Qb4LQ79+tBFCOPuyCjlYprdkfNZZP+lGz99PR428un6c+jeuFheG9G8yn
	0/u5NbQBL2iY8IuEkbNoLj6gvBuSLU6gEx7/e9kRXyVStJUVUKFp2zUoSLraohjeo3u+
	riow==
X-Gm-Message-State: AN3rC/7rpfsEv0M4vRHToS2DzIYbzVwTisKsvDuIo6mpusBQdncPkG94
	gs8oaiCV1iyIyK3S
X-Received: by 10.28.30.23 with SMTP id e23mr1616181wme.94.1492672141777;
	Thu, 20 Apr 2017 00:09:01 -0700 (PDT)
Received: from localhost ([217.30.68.212])
	by smtp.gmail.com with ESMTPSA id x70sm6833360wmf.1.2017.04.20.00.09.00
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 20 Apr 2017 00:09:00 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 20 Apr 2017 09:09:08 +0200
To: Benjamin Gaignard <benjamin.gaignard@linaro.org>
Message-ID: <20170420070908.GB3059@jama>
References: <1492086867-15041-1-git-send-email-benjamin.gaignard@linaro.org>
MIME-Version: 1.0
In-Reply-To: <1492086867-15041-1-git-send-email-benjamin.gaignard@linaro.org>
User-Agent: Mutt/1.8.1 (2017-04-11)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-networking][PATCH v3] tinyproxy: Add recipe
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
X-List-Received-Date: Thu, 20 Apr 2017 07:09:00 -0000
X-Groupsio-MsgNum: 66399
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="JYK4vJDZwFMowpUq"
Content-Disposition: inline

--JYK4vJDZwFMowpUq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 13, 2017 at 02:34:27PM +0200, Benjamin Gaignard wrote:
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@linaro.org>
> ---
>  .../tinyproxy/tinyproxy/tinyproxy.service          | 14 ++++++++
>  .../recipes-support/tinyproxy/tinyproxy_1.8.4.bb   | 39 ++++++++++++++++=
++++++
>  2 files changed, 53 insertions(+)
>  create mode 100644 meta-networking/recipes-support/tinyproxy/tinyproxy/t=
inyproxy.service
>  create mode 100644 meta-networking/recipes-support/tinyproxy/tinyproxy_1=
=2E8.4.bb

Still fails:
http://errors.yoctoproject.org/Errors/Details/140513/

>=20
> diff --git a/meta-networking/recipes-support/tinyproxy/tinyproxy/tinyprox=
y.service b/meta-networking/recipes-support/tinyproxy/tinyproxy/tinyproxy.s=
ervice
> new file mode 100644
> index 0000000..ea079f9
> --- /dev/null
> +++ b/meta-networking/recipes-support/tinyproxy/tinyproxy/tinyproxy.servi=
ce
> @@ -0,0 +1,14 @@
> +[Unit]
> +Description=3DTinyproxy, Lightweight http(s) proxy daemon
> +RequiresMountsFor=3D/var
> +
> +[Service]
> +Group=3Dtinyproxy
> +ExecStartPre=3D/bin/mkdir -p /var/log/tinyproxy
> +ExecStartPre=3D/bin/chown -R nobody.tinyproxy /var/log/tinyproxy
> +ExecStartPre=3D/bin/mkdir -p /var/run/tinyproxy
> +ExecStartPre=3D/bin/chown -R nobody.tinyproxy /var/run/tinyproxy
> +ExecStart=3D/usr/sbin/tinyproxy -d
> +
> +[Install]
> +WantedBy=3Dmulti-user.target
> diff --git a/meta-networking/recipes-support/tinyproxy/tinyproxy_1.8.4.bb=
 b/meta-networking/recipes-support/tinyproxy/tinyproxy_1.8.4.bb
> new file mode 100644
> index 0000000..f0374b8
> --- /dev/null
> +++ b/meta-networking/recipes-support/tinyproxy/tinyproxy_1.8.4.bb
> @@ -0,0 +1,39 @@
> +SUMMARY =3D "Lightweight http(s) proxy daemon"
> +HOMEPAGE =3D "https://tinyproxy.github.io/"
> +LICENSE =3D "GPLv2"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D751419260aa954499f7abaabaa882=
bbe"
> +
> +SRC_URI =3D "https://github.com/${BPN}/${BPN}/releases/download/${PV}/${=
BP}.tar.gz \
> +		   file://tinyproxy.service"
> +
> +SRC_URI[md5sum] =3D "3b60f7d08e0821ed1a3e2cf1e5778cac"
> +SRC_URI[sha256sum] =3D "8234c879a129feee61efa98bac14a1a3e46e5cf08f01696a=
216940872aa70faf"
> +
> +DEPENDS =3D "asciidoc-native libxml2-native libxslt-native"
> +
> +EXTRA_OECONF +=3D " \
> +	--enable-filter \
> +	--enable-transparent \
> +	--disable-regexcheck \
> +	--enable-reverse \
> +	--enable-upstream \
> +	--enable-xtinyproxy \
> +	"
> +
> +inherit autotools systemd useradd
> +
> +#User specific
> +USERADD_PACKAGES =3D "${PN}"
> +USERADD_PARAM_${PN} =3D "nobody"
> +GROUPADD_PARAM_${PN} =3D "--system tinyproxy"
> +
> +SYSTEMD_PACKAGES +=3D "${BPN}"
> +SYSTEMD_SERVICE_${PN} =3D "tinyproxy.service"
> +SYSTEMD_AUTO_ENABLE_${PN} =3D "enable"
> +
> +do_install_append() {
> +	if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', =
d)}; then
> +		install -d ${D}${systemd_system_unitdir}
> +		install -m 0644 ${WORKDIR}/tinyproxy.service ${D}${systemd_system_unit=
dir}
> +	fi
> +}
> --=20
> 1.9.1
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--JYK4vJDZwFMowpUq
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWPhekwAKCRA3VSO3ZXaA
HHztAJ9dI1PTnUJ523rg/qUpgkq7q9P15QCgoAy6eat61Esc64Yme/lhnEaYHC8=
=+cUL
-----END PGP SIGNATURE-----

--JYK4vJDZwFMowpUq--
