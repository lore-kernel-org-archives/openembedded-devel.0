Received: from arroyo.ext.ti.com ([192.94.94.40])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <chase.maupin@ti.com>) id 1QcitZ-0003zw-4A
	for openembedded-devel@lists.openembedded.org;
	Fri, 01 Jul 2011 20:56:53 +0200
Received: from dlep35.itg.ti.com ([157.170.170.118])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id p61Ieali006089
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 1 Jul 2011 13:40:36 -0500
Received: from dlep26.itg.ti.com (smtp-le.itg.ti.com [157.170.170.27])
	by dlep35.itg.ti.com (8.13.7/8.13.8) with ESMTP id p61IeZKH014874
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 1 Jul 2011 13:40:35 -0500 (CDT)
Received: from dlee74.ent.ti.com (localhost [127.0.0.1])
	by dlep26.itg.ti.com (8.13.8/8.13.8) with ESMTP id p61IeZwR002306
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 1 Jul 2011 13:40:35 -0500 (CDT)
Received: from dlee06.ent.ti.com ([157.170.170.11]) by dlee74.ent.ti.com
	([157.170.170.8]) with mapi; Fri, 1 Jul 2011 13:40:35 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Date: Fri, 1 Jul 2011 13:40:31 -0500
Thread-Topic: [oe] [PATCH 1/1] matrix-gui: Update SRCREV to revision 292
Thread-Index: Acw4HVW6WypQDEkFT4CJy1f5EM67EgAAPnqQ
Message-ID: <131E5DFBE7373E4C8D813795A6AA7F08034B4D93F0@dlee06.ent.ti.com>
References: <1309545026-29277-1-git-send-email-j-lance1@ti.com>
In-Reply-To: <1309545026-29277-1-git-send-email-j-lance1@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
Cc: "Lance, Jeff" <j-lance1@ti.com>
Subject: Re: [PATCH 1/1] matrix-gui: Update SRCREV to revision 292
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
X-List-Received-Date: Fri, 01 Jul 2011 18:56:53 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org
> [mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf Of
> Jeff Lance
> Sent: Friday, July 01, 2011 1:30 PM
> To: openembedded-devel@lists.openembedded.org
> Cc: Lance, Jeff
> Subject: [oe] [PATCH 1/1] matrix-gui: Update SRCREV to revision 292
>=20
> * Fix Soft AP scipt
> * Fix Multimedia descriptions
>=20
> Signed-off-by: Jeff Lance <j-lance1@ti.com>

Acked-by: Chase Maupin <chase.maupin@ti.com>

> ---
>  recipes/ti/matrix-gui-common_1.4.bb |    4 ++--
>  recipes/ti/matrix-gui-e_1.3.bb      |    4 ++--
>  recipes/ti/matrix-gui_1.3.bb        |    4 ++--
>  3 files changed, 6 insertions(+), 6 deletions(-)
>=20
> diff --git a/recipes/ti/matrix-gui-common_1.4.bb b/recipes/ti/matrix-
> gui-common_1.4.bb
> index 8376e17..1f2db79 100644
> --- a/recipes/ti/matrix-gui-common_1.4.bb
> +++ b/recipes/ti/matrix-gui-common_1.4.bb
> @@ -4,5 +4,5 @@ require matrix-gui-common.inc
>  # prebuilt version in the repository.
>  RRECOMMENDS_${PN} =3D "am-sysinfo"
>=20
> -SRCREV =3D "290"
> -PR =3D "${INC_PR}.14"
> +SRCREV =3D "292"
> +PR =3D "${INC_PR}.15"
> diff --git a/recipes/ti/matrix-gui-e_1.3.bb b/recipes/ti/matrix-gui-
> e_1.3.bb
> index dcad1a6..73e6d63 100644
> --- a/recipes/ti/matrix-gui-e_1.3.bb
> +++ b/recipes/ti/matrix-gui-e_1.3.bb
> @@ -1,5 +1,5 @@
>  require matrix-gui-e.inc
>=20
> -SRCREV =3D "290"
> -PR =3D "${INC_PR}.13"
> +SRCREV =3D "292"
> +PR =3D "${INC_PR}.14"
>=20
> diff --git a/recipes/ti/matrix-gui_1.3.bb b/recipes/ti/matrix-
> gui_1.3.bb
> index e67115c..d9b4895 100644
> --- a/recipes/ti/matrix-gui_1.3.bb
> +++ b/recipes/ti/matrix-gui_1.3.bb
> @@ -1,4 +1,4 @@
>  require matrix-gui.inc
>=20
> -SRCREV =3D "290"
> -PR =3D "${INC_PR}.9"
> +SRCREV =3D "292"
> +PR =3D "${INC_PR}.10"
> --
> 1.7.0.4
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


