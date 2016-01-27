Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f48.google.com (mail-wm0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id E4586731A1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Jan 2016 14:49:00 +0000 (UTC)
Received: by mail-wm0-f48.google.com with SMTP id l65so147932284wmf.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Jan 2016 06:49:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=+qVJTu337WnPIUeEMQEOJGmRJoEmZQKW4kctJyUffOQ=;
	b=LM8N6G/DuXd2bRBXnRMAfBmuqQr9DBOPbnuoQOAmwgOMJzvFpS4nfCrBPQStibkNZD
	pRhMaz7XKiq6HMbDJI3gL07OKYU2whoXvmmT2QG2D/81bsWZmEC4QHfLOSYIDxsY9zP/
	oFfwjvUzZGaFsegSQOHnpiFYmX8SLKtF15uUhwsr/QgRFxfC9IF+cu9BrpvFTrF24+OO
	XvYa19KCwx+nBvSX9cSgOflrCp6FjldW6qwyefPFrjjc5F47PPLy2WidarLk5FuFc8Mb
	vfoGHGMkrHYHFDHxwzuWp+6168QlOAwdETSgwzb7ZKyw5Ze0uYZeb2bfp9cMfk6vA23L
	FKFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	bh=+qVJTu337WnPIUeEMQEOJGmRJoEmZQKW4kctJyUffOQ=;
	b=XoeiwWwlPHQ1oxo99pR5W4bHE5lNHFWk3hGWEGqwiuI3L01DHgIwIU99FNgW23/9cN
	5p0EB428dMzMcFJilQGd1q+/7rwYLIeGvm2gZnhEoYCBq27S8c07HzaOdMvNEeJlm/ae
	15r17HjdJddjLoZlEuErpdNDEy61aAi4+eAWZmNIF93S05XSJ+d4iWvWoFpyxM1RkwjW
	hT8eMB5O6nUN2ZCqYTMzAmFjJswaXQ+ZYDx8NIYABkSWX1OAlkzK3HPA6WAU3kNmhyoL
	5qMSo+JqvhKETxdrUnUdwo8ucPzPlrebpyTH2pP7JcrnKCdpNV8zLaXQzrVBCDo8C9Bl
	I4eQ==
X-Gm-Message-State: AG10YOQGobJ780x6dBhPM0ut+fXtyMyOzXBB2mdK8tbBywIpW2mRVKeRITISpmhrOZoMUw==
X-Received: by 10.28.184.78 with SMTP id i75mr3212574wmf.22.1453906139845;
	Wed, 27 Jan 2016 06:48:59 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	i63sm7982443wmf.24.2016.01.27.06.48.58
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 27 Jan 2016 06:48:58 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 27 Jan 2016 15:51:10 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160127145110.GH2574@jama>
References: <1452852529-5560-1-git-send-email-daicy.fnst@cn.fujitsu.com>
MIME-Version: 1.0
In-Reply-To: <1452852529-5560-1-git-send-email-daicy.fnst@cn.fujitsu.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: Re: [meta-oe][PATCH] hwdata: add new recipe
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
X-List-Received-Date: Wed, 27 Jan 2016 14:49:02 -0000
X-Groupsio-MsgNum: 59723
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="1EKig6ypoSyM7jaD"
Content-Disposition: inline

--1EKig6ypoSyM7jaD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 15, 2016 at 02:08:49AM -0800, Dai Caiyun wrote:
> Signed-off-by: Dai Caiyun <daicy.fnst@cn.fujitsu.com>
> ---
>  meta-oe/recipes-support/hwdata/hwdata_0.284.bb | 75 ++++++++++++++++++++=
++++++
>  1 file changed, 75 insertions(+)
>  create mode 100644 meta-oe/recipes-support/hwdata/hwdata_0.284.bb
>=20
> diff --git a/meta-oe/recipes-support/hwdata/hwdata_0.284.bb b/meta-oe/rec=
ipes-support/hwdata/hwdata_0.284.bb
> new file mode 100644
> index 0000000..342f1a1
> --- /dev/null
> +++ b/meta-oe/recipes-support/hwdata/hwdata_0.284.bb
> @@ -0,0 +1,75 @@
> +DESCRIPTION =3D "Hardware identification and configuration data"
> +HOMEPAGE =3D "http://git.fedorahosted.org/git/hwdata.git"
> +SECTION =3D "System/Base"
> +
> +LICENSE =3D "GPL-2.0+"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D1556547711e8246992b999edd9445=
a57"
> +
> +SRC_URI =3D "https://git.fedorahosted.org/cgit/hwdata.git/snapshot/${PN}=
-${PV}.tar.gz"
> +
> +SRC_URI[md5sum] =3D "30ba61f058d2c2295fd6b3ab575eb5ce"
> +SRC_URI[sha256sum] =3D "bf08c8e6200467669ffc5919141f7a47cc70756c97b81942=
7e60b6c1a0cdcfa6"
> +
> +inherit autotools-brokensep
> +
> +#PROVIDES by hwdata
> +# the PROVIDES rules is ignore "pciutils-ids  "
> +PROVIDES +=3D "pciutils-ids"
> +RPROVIDES_hwdata +=3D "pciutils-ids"

Causes multiple providers:

NOTE: multiple providers are available for runtime pciutils-ids (hwdata, pc=
iutils)
NOTE: consider defining a PREFERRED_PROVIDER entry to match pciutils-ids


> +
> +
> +#PROVIDES by hwdata-ivi
> +PROVIDES +=3D "hwdata-ivi"
> +
> +#RDEPENDS of hwdata-ivi (${PN}-ivi)
> +RDEPENDS_${PN}-ivi +=3D "hwdata"
> +
> +do_prep() {
> +    cd ${S}
> +    chmod -Rf a+rX,u+w,g-w,o-w ${S}
> +}
> +
> +do_patch_append() {
> +    bb.build.exec_func('do_prep', d)
> +}
> +
> +do_configure() {
> +}
> +
> +do_compile() {
> +    cd ${S}
> +    LANG=3DC
> +    export LANG
> +    unset DISPLAY
> +    LD_AS_NEEDED=3D1; export LD_AS_NEEDED ;
> +=09
> +    autotools_do_configure
> +}
> +
> +do_install() {
> +    export RPM_BUILD_ROOT=3D${D}
> +    cd ${S}
> +    LANG=3DC
> +    export LANG
> +    unset DISPLAY
> +    rm -rf ${D}
> +    mkdir -p ${D}
> +
> +    oe_runmake \
> +        DESTDIR=3D${D} \
> +        INSTALL_ROOT=3D${D} \
> +        BINDIR=3D${prefix}/bin \
> +        install
> +        rm -f ${D}${infodir}/dir
> +        find ${D} -regex ".*\.la$" | xargs rm -f --
> +        find ${D} -regex ".*\.a$" | xargs rm -f --
> +        mkdir -p ${D}${sysconfdir}/modprobe.d
> +        mv ${D}${prefix}/lib/modprobe.d/dist-blacklist.conf \
> +        ${D}${sysconfdir}/modprobe.d/blacklist.conf
> +        rm -rf ${D}${prefix}/lib
> +        install -m644 blacklist.conf ${D}/${sysconfdir}/modprobe.d
> +}
> +
> +PACKAGES =3D "${PN}-dbg ${PN}-doc ${PN}-locale"
> +PACKAGES +=3D " hwdata "

Don't redefine PACKAGES, what are you trying to achieve with this?

> +
> --=20
> 1.9.1
>=20
>=20
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--1EKig6ypoSyM7jaD
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlao2V4ACgkQN1Ujt2V2gBxd4ACgsp/Pm5gtBdNvOxvMgSTW0BY4
+/gAn3FXEPmdrvkg7v6y5+3UwGpvKCgt
=wQLA
-----END PGP SIGNATURE-----

--1EKig6ypoSyM7jaD--
