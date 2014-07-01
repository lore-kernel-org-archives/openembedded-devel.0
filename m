Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f174.google.com (mail-we0-f174.google.com
	[74.125.82.174])
	by mail.openembedded.org (Postfix) with ESMTP id F03A56AC78
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  1 Jul 2014 16:15:33 +0000 (UTC)
Received: by mail-we0-f174.google.com with SMTP id u57so10058049wes.19
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 Jul 2014 09:15:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=x711IDl50eYQyaK0YdVlFYZZ4bmImPOeWWXp/pcdmsg=;
	b=FamTea4nlCWNOr0mVQzEtGE893FKVsxyko+mEYOe8QQhmvnCRr7xVbGlwCSkCGvrc3
	lqBRMzW0+vR2wFdMrbnSeW+abZdjE0j0eUTn2s/ctnOB2wFBtQeuzgFNX9KsjGNvDiU9
	ag0XtC2od8yvq9NbyuncbYz9JbYfpP86DFDWY8m8b2k8iXyYSpLEBt/2IZVmyCF6g+Q5
	WFvi8YizvPy+kmFF3nUgwDqyfgDyQGfkvxnOaKlzAutpJMAsThR4oDEgNzVEp3n2s0c+
	d9EPErVo5X/siE6PKhfFwR8IsCE0iv3yQFg8XaPW4qtQJhBxxnMZiOCpeQShTge5WVRn
	uGxw==
X-Received: by 10.180.75.212 with SMTP id e20mr38554580wiw.5.1404231334177;
	Tue, 01 Jul 2014 09:15:34 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	ec8sm25919693wic.10.2014.07.01.09.15.32
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 01 Jul 2014 09:15:32 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 1 Jul 2014 18:15:42 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140701161542.GI2437@jama>
References: <1404158675-20358-1-git-send-email-neena.busireddy@freescale.com>
	<1404158675-20358-5-git-send-email-neena.busireddy@freescale.com>
MIME-Version: 1.0
In-Reply-To: <1404158675-20358-5-git-send-email-neena.busireddy@freescale.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [PATCH 4/8] qt5nmapcarousedemo: Create recipe to demonstrate qt5 example.
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
X-List-Received-Date: Tue, 01 Jul 2014 16:15:44 -0000
X-Groupsio-MsgNum: 50648
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="np3HfElajyDBpWGr"
Content-Disposition: inline

--np3HfElajyDBpWGr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 30, 2014 at 03:04:31PM -0500, Neena Busireddy wrote:
> Qt5 Nmapcarousel demonstrates the normal mapping technique using Qt5
>=20
> This recipe originated from the wandboard wiki page
> http://wiki.wandboard.org/index.php/Integrate_Qt5_into_yocto_sato_image_o=
n_Wandboard
>=20
> Signed-off-by: Neena Busireddy <neena.busireddy@freescale.com>
> ---
>  recipes-qt/examples/qt5nmapcarousedemo_1.0.bb |   29 +++++++++++++++++++=
++++++
>  1 file changed, 29 insertions(+)
>  create mode 100644 recipes-qt/examples/qt5nmapcarousedemo_1.0.bb
>=20
> diff --git a/recipes-qt/examples/qt5nmapcarousedemo_1.0.bb b/recipes-qt/e=
xamples/qt5nmapcarousedemo_1.0.bb
> new file mode 100644
> index 0000000..40265de
> --- /dev/null
> +++ b/recipes-qt/examples/qt5nmapcarousedemo_1.0.bb
> @@ -0,0 +1,29 @@
> +SUMMARY =3D "NMap Carousel application is demonstrating the=20
> +normal mapping technique using Qt5"
> +DESCRIPTION =3D "Normal mapping is used for making the icons=20
> +appear 3D with lighting and shadows"

It's incorrectly wrapped (maybe by your e-mail client)

ERROR: ParseError at
/OE/build/oe-core/meta-qt5/recipes-qt/examples/qt5nmapcarousedemo_1.0.bb:1:
unparsed line: 'SUMMARY =3D "NMap Carousel application is demonstrating
the'


> +HOMEPAGE =3D "http://quitcoding.com/?page=3Dwork#cinex"
> +LICENSE =3D "CC-BY-3.0"
> +LIC_FILES_CHKSUM =3D "file://README;beginline=3D44;endline=3D55;md5=3D3a=
9db934c393a0cf198cbe7e73ebec86"
> +
> +DEPENDS =3D "qtdeclarative qtgraphicaleffects"
> +
> +SRC_URI =3D "http://quitcoding.com/download/Qt5_NMap_CarouselDemo_1.0.tg=
z"
> +SRC_URI[md5sum] =3D "c1b4568cdbb6b3af4ca10c5a90aa8128"
> +SRC_URI[sha256sum] =3D "445da212074a10a432f4508d125814212bbe7a967bfa47b0=
15b92dfac6bfd65f"
> +
> +S =3D "${WORKDIR}/Qt5_NMap_CarouselDemo_1.0"
> +
> +require recipes-qt/qt5/qt5.inc
> +
> +do_install() {
> +    install -d ${D}${datadir}/${P}
> +    install -m 0755 ${B}/Qt5_NMap_CarouselDemo ${D}${datadir}/${P} =20
> +    cp ${S}/Qt5_NMap_CarouselDemo.qml ${D}${datadir}/${P} =20
> +    cp -a ${S}/content ${D}${datadir}/${P} =20
> +}
> +
> +FILES_${PN}-dbg +=3D "${datadir}/${P}/.debug"
> +FILES_${PN} +=3D "${datadir}"
> +
> +RDEPENDS_${PN} =3D "qtdeclarative-qmlplugins qtgraphicaleffects-qmlplugi=
ns"
> --=20
> 1.7.9.5
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--np3HfElajyDBpWGr
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlOy3q4ACgkQN1Ujt2V2gBwdlACgtkMs/TXpzIiHjTuJYTSXtC8X
HUAAn24AdxkiXiriU+NAq6+aJ2orLK9J
=hxCK
-----END PGP SIGNATURE-----

--np3HfElajyDBpWGr--
