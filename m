Received: from arroyo.ext.ti.com ([192.94.94.40])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <chase.maupin@ti.com>) id 1QEn3t-0003rU-5r
	for openembedded-devel@lists.openembedded.org;
	Tue, 26 Apr 2011 20:33:07 +0200
Received: from dlep34.itg.ti.com ([157.170.170.115])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id p3QIU5be023667
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Apr 2011 13:30:05 -0500
Received: from dlep26.itg.ti.com (localhost [127.0.0.1])
	by dlep34.itg.ti.com (8.13.7/8.13.7) with ESMTP id p3QIU41F004743
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Apr 2011 13:30:04 -0500 (CDT)
Received: from dlee73.ent.ti.com (localhost [127.0.0.1])
	by dlep26.itg.ti.com (8.13.8/8.13.8) with ESMTP id p3QIU4fc007079
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Apr 2011 13:30:04 -0500 (CDT)
Received: from dlee06.ent.ti.com ([157.170.170.11]) by dlee73.ent.ti.com
	([157.170.170.88]) with mapi; Tue, 26 Apr 2011 13:29:44 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Date: Tue, 26 Apr 2011 13:29:37 -0500
Thread-Topic: [oe] [PATCH v2 1/1] am-benchmarks: add return values
Thread-Index: AcwEPaRPUhjWv+5QTHe2p3phtGBF+QAAjVbQ
Message-ID: <131E5DFBE7373E4C8D813795A6AA7F08034AA10F8A@dlee06.ent.ti.com>
References: <1303931258-6394-1-git-send-email-j-lance1@ti.com>
In-Reply-To: <1303931258-6394-1-git-send-email-j-lance1@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
Cc: "Lance, Jeff" <j-lance1@ti.com>
Subject: Re: [PATCH v2 1/1] am-benchmarks: add return values
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
X-List-Received-Date: Tue, 26 Apr 2011 18:33:08 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org
> [mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf Of
> Jeff Lance
> Sent: Wednesday, April 27, 2011 2:08 PM
> To: openembedded-devel@lists.openembedded.org
> Cc: Lance, Jeff
> Subject: [oe] [PATCH v2 1/1] am-benchmarks: add return values
>=20
>  * add return values to dhrystone and linpack for automated test
>=20
> Signed-off-by: Jeff Lance  <j-lance1@ti.com>
>=20
> ---
>  Updated in version 2:
>     * added space before bulleted list
> ---
>  recipes/ti/am-benchmarks_1.2.bb |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
>=20
> diff --git a/recipes/ti/am-benchmarks_1.2.bb b/recipes/ti/am-
> benchmarks_1.2.bb
> index 38c7056..21e62a7 100644
> --- a/recipes/ti/am-benchmarks_1.2.bb
> +++ b/recipes/ti/am-benchmarks_1.2.bb
> @@ -8,7 +8,7 @@ LICENSE =3D "BSD"
>  SECTION =3D "system"
>  PRIORITY =3D "optional"
>=20
> -SRCREV =3D "60"
> +SRCREV =3D "61"
>  PR =3D "r2+svnr${SRCPV}"
>=20
>  COMPATIBLE_MACHINE =3D "(dm365|omapl138|omap3|ti816x|ti814x)"

Acked-by: Chase Maupin <chase.maupin@ti.com>

> --
> 1.7.0.4
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


