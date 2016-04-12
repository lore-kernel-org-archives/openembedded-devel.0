Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f41.google.com (mail-wm0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id BE8C370030
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Apr 2016 09:04:03 +0000 (UTC)
Received: by mail-wm0-f41.google.com with SMTP id f198so178327716wme.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Apr 2016 02:04:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=208TZVCm67QRVVmQrMesh/Kt3ygyVs1JBRFAc5iPBZ0=;
	b=Wp8iR+V1eWbADmWhTed2WiPRNZdZszHMnyP61oAdcNTw0TIQyM6sFfB8N2TcDPBjDH
	AOUYRTlrftLb2Rfaww1SFMezYYZUdGFWlId/HWtvxPMkj6/+x5hBxd0JxH+47aN7YOAB
	d0p13M33rbWFxTWvFniw4pCozdFVYiXpmiguuP3WtyjlTSqkC8s1lswy/FwzEovaQcuD
	ZEf5cNjMeFs04zefi3XH0nV1fDzGvFYw9JFg5UiDiBIjTWWGs6DCUwEU6HEBH4u/ZjyI
	D9ySW8uyyXBd+mkeTBmNQ0JwFYoHS/ibLDR4P+0uMpUU4vwou/C+WN92hgaWX+CvMKoA
	4rkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=208TZVCm67QRVVmQrMesh/Kt3ygyVs1JBRFAc5iPBZ0=;
	b=MC5jTNNBO3wNqOSF2r/qdE65HKO2Vg377ADTl0uQnQ2Pwkpg6D1y4KWwd6OMs8R3pt
	P4lEPQTrhiQBtYdSC68BDQPy9D9/W19bwJWMuoRsr/RBUN63qi5N4VQCIDUI9wY/TJhw
	ktwcpAzWW05RLt+3QgUsh87GoVz02QFJ0+FGKsKz7H66USKU3S9FNQB5O6OitZkUDff0
	UalPEJ/7KXQbe4JlhyMv6clN/RW4t6UQjt4VHB+H+qq6hEDthPK02QWlMyn4xna7McvO
	Zr9LL4nObmpny8ukS3XIu5FBeJfUflRVuLzqeM36fdc+fseR4aolk0tagJTtWpc4LCD7
	XgVw==
X-Gm-Message-State: AD7BkJL4QBiBoWjvN8FlObOUqGQjo0QJ+EBSUJN/N8fkgjykj0Bm1Tm53QqsiwdIzxb0NQ==
X-Received: by 10.28.26.138 with SMTP id a132mr22377765wma.20.1460451844058;
	Tue, 12 Apr 2016 02:04:04 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	l124sm21658537wmf.11.2016.04.12.02.04.03
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 12 Apr 2016 02:04:03 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 12 Apr 2016 11:05:35 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160412090535.GB2564@jama>
References: <1459237784-26118-1-git-send-email-rongqing.li@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1459237784-26118-1-git-send-email-rongqing.li@windriver.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: Re: [PATCH][meta-oe] tmon: add recipes
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
X-List-Received-Date: Tue, 12 Apr 2016 09:04:04 -0000
X-Groupsio-MsgNum: 60964
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="wzJLGUyc3ArbnUjN"
Content-Disposition: inline

--wzJLGUyc3ArbnUjN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 29, 2016 at 03:49:44PM +0800, rongqing.li@windriver.com wrote:
> From: Roy Li <rongqing.li@windriver.com>
>=20
> tmon is a monitoring and testing tool for Linux kernel thermal subsystem
>=20
> Signed-off-by: Roy Li <rongqing.li@windriver.com>
> ---
>  meta-oe/recipes-kernel/tmon/tmon.bb | 34 +++++++++++++++++++++++++++++++=
+++
>  1 file changed, 34 insertions(+)
>  create mode 100644 meta-oe/recipes-kernel/tmon/tmon.bb
>=20
> diff --git a/meta-oe/recipes-kernel/tmon/tmon.bb b/meta-oe/recipes-kernel=
/tmon/tmon.bb
> new file mode 100644
> index 0000000..3bf2b3d
> --- /dev/null
> +++ b/meta-oe/recipes-kernel/tmon/tmon.bb
> @@ -0,0 +1,34 @@
> +SUMMARY =3D "A monitoring and testing tool for Linux kernel thermal subs=
ystem"
> +LICENSE =3D "GPLv2"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd7810fab7487fb0aad327b76f1be7=
cd7"
> +DEPENDS =3D "ncurses"
> +
> +inherit kernelsrc kernel-arch
> +
> +do_configure[depends] +=3D "virtual/kernel:do_shared_workdir"
> +do_populate_lic[depends] +=3D "virtual/kernel:do_patch"
> +
> +B =3D "${WORKDIR}/${BPN}-${PV}"
> +
> +EXTRA_OEMAKE =3D '\
> +    -C ${S}/tools/thermal/tmon \
> +    CROSS_COMPILE=3D${TARGET_PREFIX} \
> +    ARCH=3D${ARCH} \
> +    CC=3D"${CC}" \
> +    AR=3D"${AR}" \
> +'
> +do_compile() {
> +	unset CFLAGS
> +	oe_runmake tmon

Use 4 spaces for indentation.

> +}
> +
> +do_install() {
> +	unset CFLAGS
> +	oe_runmake INSTALL_ROOT=3D${D} install
> +}
> +
> +python do_package_prepend() {
> +    d.setVar('PKGV', d.getVar("KERNEL_VERSION", True).split("-")[0])
> +}
> +
> +PACKAGE_ARCH =3D "${MACHINE_ARCH}"
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

--wzJLGUyc3ArbnUjN
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlcMul4ACgkQN1Ujt2V2gByhlACfRoMsdZOzDN+6X7CWi54Yoqyi
fzoAoK8jNfB83c8y9DL9i13qy2dtfKat
=qxSp
-----END PGP SIGNATURE-----

--wzJLGUyc3ArbnUjN--
