Received: from devils.ext.ti.com ([198.47.26.153])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <chase.maupin@ti.com>) id 1Otm5B-0005tW-9L
	for openembedded-devel@lists.openembedded.org;
	Thu, 09 Sep 2010 20:42:50 +0200
Received: from dlep33.itg.ti.com ([157.170.170.112])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id o89Ig62a029535
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 9 Sep 2010 13:42:06 -0500
Received: from dlep26.itg.ti.com (localhost [127.0.0.1])
	by dlep33.itg.ti.com (8.13.7/8.13.7) with ESMTP id o89Ig5d6016391
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 9 Sep 2010 13:42:05 -0500 (CDT)
Received: from dlee74.ent.ti.com (localhost [127.0.0.1])
	by dlep26.itg.ti.com (8.13.8/8.13.8) with ESMTP id o89Ig59i022830
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 9 Sep 2010 13:42:05 -0500 (CDT)
Received: from dlee06.ent.ti.com ([157.170.170.11]) by dlee74.ent.ti.com
	([157.170.170.8]) with mapi; Thu, 9 Sep 2010 13:42:05 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Date: Thu, 9 Sep 2010 13:42:04 -0500
Thread-Topic: [PATCH 2/2] ti-graphics-sdk: display full license during build
Thread-Index: ActKAurneG2Oh/9DQXakHjOskZqYSAGS5Eow
Message-ID: <131E5DFBE7373E4C8D813795A6AA7F080310BFAB82@dlee06.ent.ti.com>
References: <1283364908-21950-1-git-send-email-chase.maupin@ti.com>
	<1283364908-21950-2-git-send-email-chase.maupin@ti.com>
In-Reply-To: <1283364908-21950-2-git-send-email-chase.maupin@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 198.47.26.153
X-SA-Exim-Mail-From: chase.maupin@ti.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 2/2] ti-graphics-sdk: display full license during build
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
X-List-Received-Date: Thu, 09 Sep 2010 18:42:50 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Bump

> -----Original Message-----
> From: Chase Maupin [mailto:chasemaupin03@gmail.com]
> Sent: Wednesday, September 01, 2010 1:15 PM
> To: openembedded-devel@lists.openembedded.org
> Cc: Maupin, Chase
> Subject: [PATCH 2/2] ti-graphics-sdk: display full license during build
>=20
> * Change the TI_BIN_UNPK_CMDS to feed in enought spaces to
>   display the entire EULA during the build process.
>=20
> Signed-off-by: Chase Maupin <chase.maupin@ti.com>
> ---
>  recipes/powervr-drivers/libgles-omap3.inc          |    7 +++++--
>  .../omap3-sgx-modules_1.4.14.2514.bb               |    5 ++++-
>  .../omap3-sgx-modules_1.4.14.2616.bb               |    5 ++++-
>  3 files changed, 13 insertions(+), 4 deletions(-)
>=20
> diff --git a/recipes/powervr-drivers/libgles-omap3.inc b/recipes/powervr-
> drivers/libgles-omap3.inc
> index 5b248b0..1c00708 100644
> --- a/recipes/powervr-drivers/libgles-omap3.inc
> +++ b/recipes/powervr-drivers/libgles-omap3.inc
> @@ -1,7 +1,7 @@
>  DESCRIPTION =3D "libGLES for the omap3"
>  LICENSE =3D "proprietary-binary"
>=20
> -PR =3D "r6"
> +PR =3D "r7"
>=20
>  COMPATIBLE_MACHINE =3D "(dm37x-evm|am37x-evm|am3517-evm|beagleboard|cm-
> t35|igep0020|omap3-pandora|omap3-
> touchbook|omap3evm|omapzoom|omapzoom2|overo|palmpre)"
>=20
> @@ -37,7 +37,10 @@ SRC_URI =3D
> "http://install.source.dir.local/OMAP35x_Graphics_SDK_setuplinux_${SGX
>  S =3D "${WORKDIR}/OMAP35x_Graphics_SDK_${SGXPV}"
>=20
>  # Logic to unpack installjammer file
> -TI_BIN_UNPK_CMDS=3D"Y: qY:workdir:Y"
> +# NOTE: It takes 16 spaces to display the full EULA.  Too many spaces
> +#       will cause the package to be installed into the wrong directory
> +#       and you will see build failures.  This EULA should not change.
> +TI_BIN_UNPK_CMDS=3D"Y:                qY:workdir:Y"
>  require ../ti/ti-eula-unpack.inc
>=20
>  BINLOCATION ?=3D "${S}/gfx_rel"
> diff --git a/recipes/powervr-drivers/omap3-sgx-modules_1.4.14.2514.bb
> b/recipes/powervr-drivers/omap3-sgx-modules_1.4.14.2514.bb
> index a2fcf22..350dc09 100644
> --- a/recipes/powervr-drivers/omap3-sgx-modules_1.4.14.2514.bb
> +++ b/recipes/powervr-drivers/omap3-sgx-modules_1.4.14.2514.bb
> @@ -7,7 +7,10 @@ PR_append =3D "a"
>  # http://software-
> dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/gfxsdk/3_01_00_02/inde=
x
> _FDS.html
>  # see libgles-omap3.inc for detailed installation instructions
>=20
> -TI_BIN_UNPK_CMDS=3D"Y: qY:workdir:Y"
> +# NOTE: It takes 16 spaces to display the full EULA.  Too many spaces
> +#       will cause the package to be installed into the wrong directory
> +#       and you will see build failures.  This EULA should not change.
> +TI_BIN_UNPK_CMDS=3D"Y:                qY:workdir:Y"
>  require ../ti/ti-eula-unpack.inc
>=20
>  SGXPV =3D "3_01_00_02"
> diff --git a/recipes/powervr-drivers/omap3-sgx-modules_1.4.14.2616.bb
> b/recipes/powervr-drivers/omap3-sgx-modules_1.4.14.2616.bb
> index 4ed2540..ba6e925 100644
> --- a/recipes/powervr-drivers/omap3-sgx-modules_1.4.14.2616.bb
> +++ b/recipes/powervr-drivers/omap3-sgx-modules_1.4.14.2616.bb
> @@ -7,7 +7,10 @@ PR_append =3D "c"
>  # http://software-
> dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/gfxsdk/3_01_00_06/inde=
x
> _FDS.html
>  # see libgles-omap3.inc for detailed installation instructions
>=20
> -TI_BIN_UNPK_CMDS=3D"Y: qY:workdir:Y"
> +# NOTE: It takes 16 spaces to display the full EULA.  Too many spaces
> +#       will cause the package to be installed into the wrong directory
> +#       and you will see build failures.  This EULA should not change.
> +TI_BIN_UNPK_CMDS=3D"Y:                qY:workdir:Y"
>  require ../ti/ti-eula-unpack.inc
>=20
>  SGXPV =3D "3_01_00_06"
> --
> 1.7.0.4



