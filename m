Received: from devils.ext.ti.com ([198.47.26.153])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <chase.maupin@ti.com>) id 1Otm52-0005n9-Ul
	for openembedded-devel@lists.openembedded.org;
	Thu, 09 Sep 2010 20:42:43 +0200
Received: from dlep35.itg.ti.com ([157.170.170.118])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id o89IfvEY029513
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 9 Sep 2010 13:41:57 -0500
Received: from dlep26.itg.ti.com (localhost [127.0.0.1])
	by dlep35.itg.ti.com (8.13.7/8.13.7) with ESMTP id o89Ifu5T002166
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 9 Sep 2010 13:41:56 -0500 (CDT)
Received: from dlee74.ent.ti.com (localhost [127.0.0.1])
	by dlep26.itg.ti.com (8.13.8/8.13.8) with ESMTP id o89Ifum7022766
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 9 Sep 2010 13:41:56 -0500 (CDT)
Received: from dlee06.ent.ti.com ([157.170.170.11]) by dlee74.ent.ti.com
	([157.170.170.8]) with mapi; Thu, 9 Sep 2010 13:41:56 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Date: Thu, 9 Sep 2010 13:41:55 -0500
Thread-Topic: [PATCH 1/2] ti-graphics-sdk: Update download links
Thread-Index: ActKAtySaxb13UKpQ2ODzXd3qqtCugGS2HJA
Message-ID: <131E5DFBE7373E4C8D813795A6AA7F080310BFAB80@dlee06.ent.ti.com>
References: <1283364908-21950-1-git-send-email-chase.maupin@ti.com>
In-Reply-To: <1283364908-21950-1-git-send-email-chase.maupin@ti.com>
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
Subject: Re: [PATCH 1/2] ti-graphics-sdk: Update download links
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
X-List-Received-Date: Thu, 09 Sep 2010 18:42:43 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable


Bump

> -----Original Message-----
> From: Chase Maupin [mailto:chasemaupin03@gmail.com]
> Sent: Wednesday, September 01, 2010 1:15 PM
> To: openembedded-devel@lists.openembedded.org
> Cc: Maupin, Chase
> Subject: [PATCH 1/2] ti-graphics-sdk: Update download links
>=20
> * Changed the download links to point to the specific version
>   of the TI Graphics SDK installer rather than to just the
>   latest.
> * The libgles-omap3.inc file still contains the link to the
>   latest version of the installer.
>=20
> Signed-off-by: Chase Maupin <chase.maupin@ti.com>
> ---
>  recipes/powervr-drivers/libgles-omap3.inc          |    5 ++++-
>  .../powervr-drivers/libgles-omap3_3.01.00.02.bb    |    2 +-
>  .../powervr-drivers/libgles-omap3_3.01.00.06.bb    |    2 +-
>  .../omap3-sgx-modules_1.4.14.2514.bb               |    2 +-
>  .../omap3-sgx-modules_1.4.14.2616.bb               |    2 +-
>  5 files changed, 8 insertions(+), 5 deletions(-)
>=20
> diff --git a/recipes/powervr-drivers/libgles-omap3.inc b/recipes/powervr-
> drivers/libgles-omap3.inc
> index d183486..5b248b0 100644
> --- a/recipes/powervr-drivers/libgles-omap3.inc
> +++ b/recipes/powervr-drivers/libgles-omap3.inc
> @@ -15,7 +15,10 @@ PROVIDES +=3D "virtual/egl"
>  # 1. if you don't already have a ti account get one here. it's free:
>  #  http://www.ti.com/hdr_my_ti
>  # 2. fetch the gl-es bin (full OMAP Graphics SDK) from here:
> -#  http://software-
> dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/gfxsdk/latest/index_FD=
S
> .html
> +#    Check the libgles recipe for your version to find the link to the
> +#    download for that version.  The following link will provide the
> +#    latest version available.
> +#    http://software-
> dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/gfxsdk/latest/index_FD=
S
> .html
>  # 3. put the OMAP35x_*.bin file in $DL_DIR, i.e. downloads/
>  #  mv OMAP35x_Graphics_SDK_setuplinux_3_01_00_06.bin ./downloads/
>  # 4. make the checksum file in ./downloads/ directory:
> diff --git a/recipes/powervr-drivers/libgles-omap3_3.01.00.02.bb
> b/recipes/powervr-drivers/libgles-omap3_3.01.00.02.bb
> index 3b68c18..544fabf 100644
> --- a/recipes/powervr-drivers/libgles-omap3_3.01.00.02.bb
> +++ b/recipes/powervr-drivers/libgles-omap3_3.01.00.02.bb
> @@ -5,7 +5,7 @@ require libgles-omap3.inc
>  PR =3D "r7"
>=20
>  # download required binary distribution from:
> -# http://software-
> dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/gfxsdk/latest/index_FD=
S
> .html
> +# http://software-
> dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/gfxsdk/3_01_00_02/inde=
x
> _FDS.html
>  # see libgles-omap3.inc for detailed installation instructions
>=20
>  SGXPV =3D "3_01_00_02"
> diff --git a/recipes/powervr-drivers/libgles-omap3_3.01.00.06.bb
> b/recipes/powervr-drivers/libgles-omap3_3.01.00.06.bb
> index bb7994f..0d41a23 100644
> --- a/recipes/powervr-drivers/libgles-omap3_3.01.00.06.bb
> +++ b/recipes/powervr-drivers/libgles-omap3_3.01.00.06.bb
> @@ -7,7 +7,7 @@ ES5LOCATION =3D "${S}/gfx_rel_es5.x"
>  require libgles-omap3.inc
>=20
>  # download required binary distribution from:
> -# http://software-
> dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/gfxsdk/latest/index_FD=
S
> .html
> +#  http://software-
> dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/gfxsdk/3_01_00_06/inde=
x
> _FDS.html
>  # see libgles-omap3.inc for detailed installation instructions
>=20
>  SGXPV =3D "3_01_00_06"
> diff --git a/recipes/powervr-drivers/omap3-sgx-modules_1.4.14.2514.bb
> b/recipes/powervr-drivers/omap3-sgx-modules_1.4.14.2514.bb
> index 6f6e073..a2fcf22 100644
> --- a/recipes/powervr-drivers/omap3-sgx-modules_1.4.14.2514.bb
> +++ b/recipes/powervr-drivers/omap3-sgx-modules_1.4.14.2514.bb
> @@ -4,7 +4,7 @@ LICENSE =3D "GPLv2"
>  PR_append =3D "a"
>=20
>  # download required binary distribution from:
> -# http://software-
> dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/gfxsdk/latest/index_FD=
S
> .html
> +# http://software-
> dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/gfxsdk/3_01_00_02/inde=
x
> _FDS.html
>  # see libgles-omap3.inc for detailed installation instructions
>=20
>  TI_BIN_UNPK_CMDS=3D"Y: qY:workdir:Y"
> diff --git a/recipes/powervr-drivers/omap3-sgx-modules_1.4.14.2616.bb
> b/recipes/powervr-drivers/omap3-sgx-modules_1.4.14.2616.bb
> index 0d2818b..4ed2540 100644
> --- a/recipes/powervr-drivers/omap3-sgx-modules_1.4.14.2616.bb
> +++ b/recipes/powervr-drivers/omap3-sgx-modules_1.4.14.2616.bb
> @@ -4,7 +4,7 @@ LICENSE =3D "GPLv2"
>  PR_append =3D "c"
>=20
>  # download required binary distribution from:
> -# http://software-
> dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/gfxsdk/latest/index_FD=
S
> .html
> +# http://software-
> dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/gfxsdk/3_01_00_06/inde=
x
> _FDS.html
>  # see libgles-omap3.inc for detailed installation instructions
>=20
>  TI_BIN_UNPK_CMDS=3D"Y: qY:workdir:Y"
> --
> 1.7.0.4



