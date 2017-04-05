Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f195.google.com (mail-wr0-f195.google.com
	[209.85.128.195])
	by mail.openembedded.org (Postfix) with ESMTP id 5600460806
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  5 Apr 2017 18:41:14 +0000 (UTC)
Received: by mail-wr0-f195.google.com with SMTP id t20so5144611wra.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 05 Apr 2017 11:41:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=ZslXsvqYKYE1u3QBHHjLyfYF1wsYiOdGQDhrvpLPZRU=;
	b=Iz7wn+/RUzb9WETJBdo0XwrZEKh04hYgc4wjDebYdsp83Q/RiAsUbABzhuRViQfJFd
	o9An6wNmEItxN7LaNPKFMZArEmBic6RgoO4teDPfsi4ZbJpKqRZuuXMRcALzHku7Alqn
	3cAI+zIk17o8whfS2r/Flt5/3ITrhk3jJHFQewfjJ4DKY2ydKWmHbF8Tij6qs/je2XQ8
	XRmFFFhFfb1102YLA0qdnJ0u87hJU9bm9OGXFcL5ljK6y+WeGHKMk2msDew0dRNJKZYx
	mZ7TSulJgKHD1FVVKE4ztalUKCJ+/6QGS8xK3oD/W2RbKmYSTRsdN2XaQrIA0n3eqHp5
	7cjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=ZslXsvqYKYE1u3QBHHjLyfYF1wsYiOdGQDhrvpLPZRU=;
	b=uEzwCzMgAgv7Hsjf2olkh7teQfHHyrfwUXQt7tE+da8mcNeutku8WmqOchj+zHOIeY
	fU8ubKhoCwdcg+7GOXc8KXvx3cEWVqSFAMUOX1foxwkYCXF5X8ItAG8kVNBvsSzvEDEB
	d9enbAWxvccZnrvwoLRy3SYUnQVnnOmmGi+TgtWJuiMpxsOLtT5BV99GFKDiMCFFKAy6
	qYbwMZt7yxSTqmaUZ0BqYPqrOraQVvTGWi49wqDRe3MaKIKSeMMZOi+bSMI694VcX6ow
	mBmO6zQAf+OBh3/QFTHVYlBV08q9TrRBIirB1Yxv2JDwgJ9Nu8qsy5bdZ7ZhG1sHBYAq
	WF/w==
X-Gm-Message-State: AFeK/H0zGtjwnOncT2hF0lgXIhsnij1/t8docyNCO6XDM/I6lrz0fK/31MsVqjn4LWCHUA==
X-Received: by 10.28.148.195 with SMTP id w186mr20639235wmd.35.1491417675183; 
	Wed, 05 Apr 2017 11:41:15 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	140sm23451477wmk.12.2017.04.05.11.41.13
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 05 Apr 2017 11:41:13 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 5 Apr 2017 20:41:14 +0200
To: Benjamin Gaignard <benjamin.gaignard@linaro.org>
Message-ID: <20170405184114.GC3301@jama>
References: <1491396806-3521-1-git-send-email-benjamin.gaignard@linaro.org>
MIME-Version: 1.0
In-Reply-To: <1491396806-3521-1-git-send-email-benjamin.gaignard@linaro.org>
User-Agent: Mutt/1.8.0 (2017-02-23)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-networking][PATCH] tinyproxy: Add recipe
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
X-List-Received-Date: Wed, 05 Apr 2017 18:41:14 -0000
X-Groupsio-MsgNum: 66121
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="zCKi3GIZzVBPywwA"
Content-Disposition: inline

--zCKi3GIZzVBPywwA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 05, 2017 at 02:53:26PM +0200, Benjamin Gaignard wrote:
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@linaro.org>
> ---
>  .../tinyproxy/tinyproxy/tinyproxy.service          | 14 ++++++++++
>  .../recipes-support/tinyproxy/tinyproxy_1.8.4.bb   | 32 ++++++++++++++++=
++++++
>  2 files changed, 46 insertions(+)
>  create mode 100644 meta-networking/recipes-support/tinyproxy/tinyproxy/t=
inyproxy.service
>  create mode 100644 meta-networking/recipes-support/tinyproxy/tinyproxy_1=
=2E8.4.bb
>=20
> diff --git a/meta-networking/recipes-support/tinyproxy/tinyproxy/tinyprox=
y.service b/meta-networking/recipes-support/tinyproxy/tinyproxy/tinyproxy.s=
ervice
> new file mode 100644
> index 0000000..800d2ad
> --- /dev/null
> +++ b/meta-networking/recipes-support/tinyproxy/tinyproxy/tinyproxy.servi=
ce
> @@ -0,0 +1,14 @@
> +[Unit]
> +Description=3DTinyproxy, Lightweight http(s) proxy daemon
> +RequiresMountsFor=3D/var
> +
> +[Service]
> +User=3Droot
> +ExecStartPre=3D/bin/mkdir -p /var/log/tinyproxy
> +ExecStartPre=3D/bin/chown -R nobody.adm /var/log/tinyproxy
> +ExecStartPre=3D/bin/mkdir -p /var/run/tinyproxy
> +ExecStartPre=3D/bin/chown -R nobody.adm /var/run/tinyproxy
> +ExecStart=3D/usr/sbin/tinyproxy -d
> +
> +[Install]
> +WantedBy=3Dmulti-user.target
> diff --git a/meta-networking/recipes-support/tinyproxy/tinyproxy_1.8.4.bb=
 b/meta-networking/recipes-support/tinyproxy/tinyproxy_1.8.4.bb
> new file mode 100644
> index 0000000..76cec63
> --- /dev/null
> +++ b/meta-networking/recipes-support/tinyproxy/tinyproxy_1.8.4.bb
> @@ -0,0 +1,32 @@
> +SUMMARY =3D "Lightweight http(s) proxy daemon"
> +HOMEPAGE =3D "https://tinyproxy.github.io/"
> +LICENSE =3D "GPLv2"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D751419260aa954499f7abaabaa882=
bbe"
> +
> +SRC_URI =3D "https://github.com/tinyproxy/tinyproxy/releases/download/1.=
8.4/tinyproxy-${PV}.tar.gz"

Use ${PV} for 2nd 1.8.4 as well.

You can also replace "tinyproxy-${PV}" with just "${BP}" and tinyproxy
with ${BPN}"

> +SRC_URI +=3D "file://tinyproxy.service"
> +
> +SRC_URI[md5sum] =3D "3b60f7d08e0821ed1a3e2cf1e5778cac"
> +SRC_URI[sha256sum] =3D "8234c879a129feee61efa98bac14a1a3e46e5cf08f01696a=
216940872aa70faf"
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
> +inherit autotools systemd
> +
> +SYSTEMD_PACKAGES +=3D "${PN}"
> +SYSTEMD_SERVICE_${PN} =3D "tinyproxy.service"
> +SYSTEMD_AUTO_ENABLE_${PN} =3D "enable"
> +
> +do_install_append() {
> +	install -d ${D}${systemd_system_unitdir}
> +	install -m 0644 ${WORKDIR}/tinyproxy.service ${D}${systemd_system_unitd=
ir}

IIRC this should respect systemd in DISTRO_FEATURES.

> +}
> +
> +FILES_${PN} =3D+ "${systemd_system_unitdir}/tinyproxy.service"
> --=20
> 1.9.1
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--zCKi3GIZzVBPywwA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWOU6SgAKCRA3VSO3ZXaA
HMkMAKCj5b2wTZ8AxWsVpIBMYthaI0EQ7QCgufcT3mVCu6Yc/F78Wj5j8bCmu14=
=1XT+
-----END PGP SIGNATURE-----

--zCKi3GIZzVBPywwA--
