Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f54.google.com (mail-wm0-f54.google.com [74.125.82.54])
	by mail.openembedded.org (Postfix) with ESMTP id B683370030
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Apr 2016 09:05:38 +0000 (UTC)
Received: by mail-wm0-f54.google.com with SMTP id v188so118200929wme.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Apr 2016 02:05:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=a29aQXHbJKcBLiF1mlrBJQx1K9RqNs9heSyDCPL6is0=;
	b=wYPJ1x18PGKqXwm8ig0gev6G+dIYXTk+YCUW9mAPTV2aV2gGmkkqv0tMfZTQOEm0Ep
	OqT/5q7u83W09JulI9wspQvCo3YDITWD8hdIK56qn2DvT0UHFhjG9vQhTTmUihouz0Cm
	iqYC7M4FZZoEOJhuBGniybz4XDC/nSOE+dniLrDgZZOYN0VrHh6sYVOBa54EojYISUlW
	J5SRWV+KqDKaWBbQJsbPAbTViERxXyqoRgz0LyIaWdDI6l+pf21MaQEW3svJIM3xo4KR
	fkqEu3N8V0JUd5FtU3sIN3ue1s1NP6f+qtWNDeP2AC1oT+4WKX3/gOItWTsXf86njGtw
	irYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=a29aQXHbJKcBLiF1mlrBJQx1K9RqNs9heSyDCPL6is0=;
	b=BQo28FYLxrr7JGiwwaWZjRm7q/WQa7PLTsVpZjDbzXfNkDCVezr0UJOz0ovWvgp1NH
	7P0laidpYJnr08AbcumDCcpMjan/HOBooZO4+BxXPzpX2e7FIiSOG4w+nJL59EIsJnfm
	LLxOrgHV38C2k1OJAYclfkt3jS76Zt0JaqicqyyHGmsiZtgNFOFJ239bDKQ8xWeNuNVz
	oJxJhN9Nj1JsXIjMVtCSGfddHUKkuwzLnSAIuIdWOqYPhM19zHitzG3CJJZpdqTweMcI
	TkVckB5ZyHTDIYoCDAbbN6zc1yxapTyMCv2dPg/NVmLq487BAR5Ko9/FjQUlJmWh5f6Y
	E09w==
X-Gm-Message-State: AOPr4FW8DhlgekTPFn2il2Z2EXd+RTpE+4EYfbotLuKbV2PoNA9aPqgkP523xpFJNT/mdQ==
X-Received: by 10.194.9.201 with SMTP id c9mr2285551wjb.7.1460451938797;
	Tue, 12 Apr 2016 02:05:38 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	xx3sm32216551wjc.32.2016.04.12.02.05.37
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 12 Apr 2016 02:05:37 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 12 Apr 2016 11:07:10 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160412090710.GC2564@jama>
References: <1459318294-8974-1-git-send-email-rongqing.li@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1459318294-8974-1-git-send-email-rongqing.li@windriver.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: Re: [PATCH][meta-oe] minicoredumper: add the recipe
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
X-List-Received-Date: Tue, 12 Apr 2016 09:05:40 -0000
X-Groupsio-MsgNum: 60965
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Izn7cH1Com+I3R9J"
Content-Disposition: inline

--Izn7cH1Com+I3R9J
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 30, 2016 at 02:11:34PM +0800, rongqing.li@windriver.com wrote:
> From: Roy Li <rongqing.li@windriver.com>
>=20
> minicoredumper provides an alternate core dump facility for Linux
> to allow minimal and customized crash dumps
>=20
> Signed-off-by: Roy Li <rongqing.li@windriver.com>
> ---
>  .../minicoredumper/files/minicoredumper.service    |  9 ++++++++
>  .../minicoredumper/minicoredumper_1.0.2.bb         | 24 ++++++++++++++++=
++++++
>  2 files changed, 33 insertions(+)
>  create mode 100644 meta-oe/recipes-kernel/minicoredumper/files/minicored=
umper.service
>  create mode 100644 meta-oe/recipes-kernel/minicoredumper/minicoredumper_=
1.0.2.bb
>=20
> diff --git a/meta-oe/recipes-kernel/minicoredumper/files/minicoredumper.s=
ervice b/meta-oe/recipes-kernel/minicoredumper/files/minicoredumper.service
> new file mode 100644
> index 0000000..161ce88
> --- /dev/null
> +++ b/meta-oe/recipes-kernel/minicoredumper/files/minicoredumper.service
> @@ -0,0 +1,9 @@
> +[Unit]
> +Description=3DEnable minicoredumper.
> +
> +[Service]
> +Type=3Doneshot
> +ExecStart=3D/bin/sh -c '/bin/echo "|/usr/bin/minicoredumper %%p %%u %%g =
%%s %%t %%h %%e" > /proc/sys/kernel/core_pattern'
> +
> +[Install]
> +WantedBy=3Dmulti-user.target
> diff --git a/meta-oe/recipes-kernel/minicoredumper/minicoredumper_1.0.2.b=
b b/meta-oe/recipes-kernel/minicoredumper/minicoredumper_1.0.2.bb
> new file mode 100644
> index 0000000..6b55732
> --- /dev/null
> +++ b/meta-oe/recipes-kernel/minicoredumper/minicoredumper_1.0.2.bb
> @@ -0,0 +1,24 @@
> +SUMMARY =3D "minicoredumper provides an alternate core dump facility for=
 Linux \
> +to allow minimal and customized crash dumps"
> +LICENSE =3D " LGPLv2.1 & BSD"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D45445387350de96a0e70410470ee5=
cab"
> +DEPENDS =3D "elfutils dbus dbus-glib-native glib-2.0 dbus-glib util-linu=
x"
> +
> +inherit autotools pkgconfig systemd
> +
> +SRC_URI =3D "https://linutronix.de/${BPN}/files/${BPN}-${PV}.tar.gz \
> +           file://minicoredumper.service \
> +"
> +SRC_URI[md5sum] =3D "5ba9d116b52a8e2fb93456260644e753"
> +SRC_URI[sha256sum] =3D "1b0eeb3d70dbd2ad6f2f673e4e3446e5dd784e132730e21d=
8f9dc0977e47dd9a"
> +
> +SYSTEMD_SERVICE_${PN} =3D "minicoredumper.service"
> +SYSTEMD_AUTO_ENABLE =3D "enable"
> +
> +do_install_append() {
> +	install -d ${D}/${sysconfdir}/minicoredumper
> +	cp -rf ${S}/etc/* ${D}/${sysconfdir}/
> +
> +	install -d ${D}${systemd_unitdir}/system
> +	install -m 0644 ${WORKDIR}/minicoredumper.service ${D}${systemd_unitdir=
}/system

Use 4 spaces for indentation.

> +}
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

--Izn7cH1Com+I3R9J
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlcMur0ACgkQN1Ujt2V2gBxmUgCfadRVcvwR8IoHESzW3PJmwB1/
IFEAoK3rd66eFeFHnlcSJTBhiuUhCcLl
=lmXv
-----END PGP SIGNATURE-----

--Izn7cH1Com+I3R9J--
