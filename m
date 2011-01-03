Received: from arroyo.ext.ti.com ([192.94.94.40])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <chase.maupin@ti.com>) id 1PZojI-000226-EG
	for openembedded-devel@lists.openembedded.org;
	Mon, 03 Jan 2011 19:02:01 +0100
Received: from dlep34.itg.ti.com ([157.170.170.115])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id p03I1OjL005930
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 3 Jan 2011 12:01:32 -0600
Received: from dlep26.itg.ti.com (localhost [127.0.0.1])
	by dlep34.itg.ti.com (8.13.7/8.13.7) with ESMTP id p03I1N6b008902
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 3 Jan 2011 12:01:23 -0600 (CST)
Received: from dlee74.ent.ti.com (localhost [127.0.0.1])
	by dlep26.itg.ti.com (8.13.8/8.13.8) with ESMTP id p03I1N8Y028931
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 3 Jan 2011 12:01:23 -0600 (CST)
Received: from dlee06.ent.ti.com ([157.170.170.11]) by dlee74.ent.ti.com
	([157.170.170.8]) with mapi; Mon, 3 Jan 2011 12:01:23 -0600
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Date: Mon, 3 Jan 2011 12:01:19 -0600
Thread-Topic: [oe] [PATCH] ti-pru-sw: Update SRC_REV
Thread-Index: AcurbyvQnJi2iJPESr6Ulh52SmH91gAAKi9w
Message-ID: <131E5DFBE7373E4C8D813795A6AA7F080329E937A9@dlee06.ent.ti.com>
References: <1294062372-16433-1-git-send-email-m-watkins@ti.com>
In-Reply-To: <1294062372-16433-1-git-send-email-m-watkins@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
Cc: "Watkins, Melissa" <m-watkins@ti.com>
Subject: Re: [PATCH] ti-pru-sw: Update SRC_REV
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 03 Jan 2011 18:02:01 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org
> [mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf Of
> Melissa Watkins
> Sent: Monday, January 03, 2011 7:46 AM
> To: openembedded-devel@lists.openembedded.org
> Cc: Watkins, Melissa
> Subject: [oe] [PATCH] ti-pru-sw: Update SRC_REV
>=20
> For the ti-pru-sw-examples, ti-pru-sw-app-loader, ti-pru-sw-edma-driver,
> ti-pru-sw-edma-library:
>=20
> * Bump PR
> * Update SRC_REV
>=20
> Signed-off-by: Melissa Watkins <m-watkins@ti.com>

Acked-by: Chase Maupin <chase.maupin@ti.com>

> ---
>  recipes/ti/ti-pru-sw-app-loader_1.00.00.bb   |    4 ++--
>  recipes/ti/ti-pru-sw-edma-driver_1.00.00.bb  |    2 +-
>  recipes/ti/ti-pru-sw-edma-library_1.00.00.bb |    4 ++--
>  recipes/ti/ti-pru-sw-examples_1.00.00.bb     |    4 ++--
>  4 files changed, 7 insertions(+), 7 deletions(-)
>=20
> diff --git a/recipes/ti/ti-pru-sw-app-loader_1.00.00.bb b/recipes/ti/ti-
> pru-sw-app-loader_1.00.00.bb
> index 6b7514d..394862e 100644
> --- a/recipes/ti/ti-pru-sw-app-loader_1.00.00.bb
> +++ b/recipes/ti/ti-pru-sw-app-loader_1.00.00.bb
> @@ -1,13 +1,13 @@
>  DESCRIPTION =3D "PRU sw application loader"
>  HOMEPAGE =3D "https://gforge.ti.com/gf/project/pru_sw/"
>  LICENSE =3D "BSD"
> -PR =3D "r1+svnr${SRCPV}"
> +PR =3D "r2+svnr${SRCPV}"
>=20
>  COMPATIBLE_MACHINE =3D "omapl138"
>=20
>  SRC_URI =3D
> "svn://gforge.ti.com/svn/pru_sw/;module=3Dtrunk;proto=3Dhttps;user=3Danon=
ymous;p
> swd=3D''"
>=20
> -SRCREV =3D "20"
> +SRCREV =3D "21"
>  S =3D "${WORKDIR}/trunk/app_loader"
>=20
>  do_compile () {
> diff --git a/recipes/ti/ti-pru-sw-edma-driver_1.00.00.bb b/recipes/ti/ti-
> pru-sw-edma-driver_1.00.00.bb
> index b975d78..8b1cd0c 100644
> --- a/recipes/ti/ti-pru-sw-edma-driver_1.00.00.bb
> +++ b/recipes/ti/ti-pru-sw-edma-driver_1.00.00.bb
> @@ -6,7 +6,7 @@ COMPATIBLE_MACHINE =3D "omapl138"
>=20
>  SRC_URI =3D
> "svn://gforge.ti.com/svn/pru_sw/;module=3Dtrunk;proto=3Dhttps;user=3Danon=
ymous;p
> swd=3D''"
>=20
> -SRCREV =3D "20"
> +SRCREV =3D "21"
>  S =3D "${WORKDIR}/trunk/peripheral_lib/edma_driver/module"
>=20
>  PACKAGE_STRIP =3D "no"
> diff --git a/recipes/ti/ti-pru-sw-edma-library_1.00.00.bb b/recipes/ti/ti=
-
> pru-sw-edma-library_1.00.00.bb
> index cb517de..3dc6154 100644
> --- a/recipes/ti/ti-pru-sw-edma-library_1.00.00.bb
> +++ b/recipes/ti/ti-pru-sw-edma-library_1.00.00.bb
> @@ -1,7 +1,7 @@
>  DESCRIPTION =3D "eDMA library for use by PRU sw example applications"
>  HOMEPAGE =3D "https://gforge.ti.com/gf/project/pru_sw/"
>  LICENSE =3D "BSD"
> -PR =3D "r2+svnr${SRCPV}"
> +PR =3D "r3+svnr${SRCPV}"
>=20
>  DEPENDS +=3D "virtual/kernel ti-pru-sw-edma-driver"
>  PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> @@ -10,7 +10,7 @@ COMPATIBLE_MACHINE =3D "omapl138"
>=20
>  SRC_URI =3D
> "svn://gforge.ti.com/svn/pru_sw/;module=3Dtrunk;proto=3Dhttps;user=3Danon=
ymous;p
> swd=3D''"
>=20
> -SRCREV =3D "20"
> +SRCREV =3D "21"
>  S =3D "${WORKDIR}/trunk/peripheral_lib/edma_driver/interface"
>=20
>  do_compile () {
> diff --git a/recipes/ti/ti-pru-sw-examples_1.00.00.bb b/recipes/ti/ti-pru=
-
> sw-examples_1.00.00.bb
> index 5df6c6e..2f70241 100644
> --- a/recipes/ti/ti-pru-sw-examples_1.00.00.bb
> +++ b/recipes/ti/ti-pru-sw-examples_1.00.00.bb
> @@ -3,13 +3,13 @@ HOMEPAGE =3D "https://gforge.ti.com/gf/project/pru_sw/"
>  LICENSE =3D "BSD"
>  DEPENDS +=3D "ti-pru-sw-app-loader ti-pru-sw-edma-library"
>  RDEPENDS +=3D "ti-pru-sw-edma-driver kernel-module-uio-pru"
> -PR =3D "r2+svnr${SRCPV}"
> +PR =3D "r3+svnr${SRCPV}"
>=20
>  COMPATIBLE_MACHINE =3D "omapl138"
>=20
>  SRC_URI =3D
> "svn://gforge.ti.com/svn/pru_sw/;module=3Dtrunk;proto=3Dhttps;user=3Danon=
ymous;p
> swd=3D''"
>=20
> -SRCREV =3D "20"
> +SRCREV =3D "21"
>  S =3D "${WORKDIR}/trunk"
>=20
>  do_compile () {
> --
> 1.7.0.4
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


