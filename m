Received: from comal.ext.ti.com ([198.47.26.152])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eyalr@ti.com>) id 1QMhvD-0002ZE-Eo
	for openembedded-devel@lists.openembedded.org;
	Wed, 18 May 2011 16:40:23 +0200
Received: from dlep36.itg.ti.com ([157.170.170.91])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id p4IEbQWa003254
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Wed, 18 May 2011 09:37:27 -0500
Received: from dlep26.itg.ti.com (localhost [127.0.0.1])
	by dlep36.itg.ti.com (8.13.8/8.13.8) with ESMTP id p4IEbQTd023248;
	Wed, 18 May 2011 09:37:26 -0500 (CDT)
Received: from DNCE73.ent.ti.com (localhost [127.0.0.1])
	by dlep26.itg.ti.com (8.13.8/8.13.8) with ESMTP id p4IEbQEB003543;
	Wed, 18 May 2011 09:37:26 -0500 (CDT)
Received: from dnce02.ent.ti.com ([137.167.131.106]) by DNCE73.ent.ti.com
	([137.167.130.158]) with mapi; Wed, 18 May 2011 16:37:25 +0200
From: "Reizer, Eyal" <eyalr@ti.com>
To: Eyal Reizer <eyalreizer@googlemail.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Date: Wed, 18 May 2011 16:37:23 +0200
Thread-Topic: Ping: [PATCH] ti-wifi-utils: update to use the latest release
Thread-Index: AcwUXgdFWBSiMAgsQEWChAq9t8CF9gBCuy7w
Message-ID: <EC51CDB0807A51469E0C9CB8CF72D65F03323CEDC7@dnce02.ent.ti.com>
References: <y> <1305614722-5460-1-git-send-email-eyalr@ti.com>
In-Reply-To: <1305614722-5460-1-git-send-email-eyalr@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
Subject: Ping: [PATCH] ti-wifi-utils: update to use the latest release
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
X-List-Received-Date: Wed, 18 May 2011 14:40:23 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,

Is there anything holding this patch from being accepted?

Best Regards,
Eyal Reizer

> -----Original Message-----
> From: Eyal Reizer [mailto:eyalreizer@googlemail.com]
> Sent: Tuesday, May 17, 2011 9:45 AM
> To: openembedded-devel@lists.openembedded.org
> Cc: Reizer, Eyal
> Subject: [PATCH] ti-wifi-utils: update to use the latest release
>=20
> * Change to a newer calibrator version supporting latest mac80211
> release.
> * Bump PR number
>=20
> Signed-off-by: Eyal Reizer <eyalr@ti.com>
> ---
>  recipes/ti/ti-wifi-utils_git.bb |    4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/recipes/ti/ti-wifi-utils_git.bb b/recipes/ti/ti-wifi-
> utils_git.bb
> index 1ee5f2d..8d10051 100644
> --- a/recipes/ti/ti-wifi-utils_git.bb
> +++ b/recipes/ti/ti-wifi-utils_git.bb
> @@ -3,11 +3,11 @@ LICENSE =3D "TI-BSD"
>=20
>  DEPENDS =3D "libnl"
>=20
> -PR =3D"r1"
> +PR =3D"r2"
>  PV =3D"0.0"
>  PR_append =3D "+gitr${SRCPV}"
>=20
> -SRCREV =3D "7f63af54eb66e5b2515f92c59fcc19a8065ce481"
> +SRCREV =3D "268dbf03091b632c2697eb8028e90fe40513a9d8"
>  SRC_URI =3D "git://github.com/gxk/ti-utils.git;protocol=3Dgit"
>=20
>  S =3D "${WORKDIR}/git"
> --
> 1.7.0.4



