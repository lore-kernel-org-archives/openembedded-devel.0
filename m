Received: from comal.ext.ti.com ([198.47.26.152])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <chase.maupin@ti.com>) id 1Q9zDu-0000g6-HB
	for openembedded-devel@lists.openembedded.org;
	Wed, 13 Apr 2011 14:31:06 +0200
Received: from dlep33.itg.ti.com ([157.170.170.112])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id p3DCSoox021753
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Apr 2011 07:28:50 -0500
Received: from dlep26.itg.ti.com (localhost [127.0.0.1])
	by dlep33.itg.ti.com (8.13.7/8.13.7) with ESMTP id p3DCSn9Y019739
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Apr 2011 07:28:49 -0500 (CDT)
Received: from dlee74.ent.ti.com (localhost [127.0.0.1])
	by dlep26.itg.ti.com (8.13.8/8.13.8) with ESMTP id p3DCSnAp017007
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Apr 2011 07:28:49 -0500 (CDT)
Received: from dlee06.ent.ti.com ([157.170.170.11]) by dlee74.ent.ti.com
	([157.170.170.8]) with mapi; Wed, 13 Apr 2011 07:28:35 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Date: Wed, 13 Apr 2011 07:28:33 -0500
Thread-Topic: [oe] [PATCH] ti-ipc: Add version 1.22.05.27
Thread-Index: Acv47uKxJL4YHEoURt2ChHvKRAvMMQA50IDg
Message-ID: <131E5DFBE7373E4C8D813795A6AA7F080340D3954A@dlee06.ent.ti.com>
References: <1302598309-3878-1-git-send-email-heroor@ti.com>
In-Reply-To: <1302598309-3878-1-git-send-email-heroor@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
Cc: "Heroor, Siddharth" <heroor@ti.com>
Subject: Re: [PATCH] ti-ipc: Add version 1.22.05.27
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
X-List-Received-Date: Wed, 13 Apr 2011 12:31:06 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org
> [mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf Of
> Siddharth Heroor
> Sent: Tuesday, April 12, 2011 3:52 AM
> To: openembedded-devel@lists.openembedded.org
> Cc: Heroor, Siddharth
> Subject: [oe] [PATCH] ti-ipc: Add version 1.22.05.27
>=20
>=20
> Signed-off-by: Siddharth Heroor <heroor@ti.com>
> ---
>  recipes/ti/ti-ipc_1.22.05.27.bb |    6 ++++++
>  1 files changed, 6 insertions(+), 0 deletions(-)
>  create mode 100644 recipes/ti/ti-ipc_1.22.05.27.bb
>=20
> diff --git a/recipes/ti/ti-ipc_1.22.05.27.bb b/recipes/ti/ti-
> ipc_1.22.05.27.bb
> new file mode 100644
> index 0000000..c3d25a6
> --- /dev/null
> +++ b/recipes/ti/ti-ipc_1.22.05.27.bb
> @@ -0,0 +1,6 @@
> +require ti-ipc.inc
> +
> +PV =3D "1_22_05_27"
> +
> +SRC_URI[ipcbin.md5sum] =3D "bd35d75b754f0fc54d7ad74cfc971987"
> +SRC_URI[ipcbin.sha256sum] =3D
> "b61969dc8b5bf01ee6f68151d2c8e123b1b3b425990987fe64288085d8cc15b7"
> --
> 1.7.0.4

Acked-by: Chase Maupin <chase.maupin@ti.com>

>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


