Received: from comal.ext.ti.com ([198.47.26.152])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eyalr@ti.com>) id 1RAyud-0003Fh-M2
	for openembedded-devel@lists.openembedded.org;
	Tue, 04 Oct 2011 08:55:35 +0200
Received: from dlep36.itg.ti.com ([157.170.170.91])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id p946l4pO016327
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Tue, 4 Oct 2011 01:47:04 -0500
Received: from dlep26.itg.ti.com (smtp-le.itg.ti.com [157.170.170.27])
	by dlep36.itg.ti.com (8.13.8/8.13.8) with ESMTP id p946l4d6024344;
	Tue, 4 Oct 2011 01:47:04 -0500 (CDT)
Received: from dnce72.ent.ti.com (localhost [127.0.0.1])
	by dlep26.itg.ti.com (8.13.8/8.13.8) with ESMTP id p946l3q4006365;
	Tue, 4 Oct 2011 01:47:03 -0500 (CDT)
Received: from dnce02.ent.ti.com ([137.167.131.106]) by dnce72.ent.ti.com
	([137.167.131.87]) with mapi; Tue, 4 Oct 2011 08:47:02 +0200
From: "Reizer, Eyal" <eyalr@ti.com>
To: Eyal Reizer <eyalreizer@googlemail.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Date: Tue, 4 Oct 2011 08:47:01 +0200
Thread-Topic: [PATCH] wpa_supplicant update to use a newer commit
Thread-Index: Acx8JsgRu0EJRdjET267g/d9Lr9dXAGOpjRA
Message-ID: <EC51CDB0807A51469E0C9CB8CF72D65F033369C809@dnce02.ent.ti.com>
References: <1317025776-2433-1-git-send-email-eyalr@ti.com>
In-Reply-To: <1317025776-2433-1-git-send-email-eyalr@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
Subject: Re: [PATCH] wpa_supplicant update to use a newer commit
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
X-List-Received-Date: Tue, 04 Oct 2011 06:55:36 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Ping on this patch.

Best Regards,
Eyal Reizer

> -----Original Message-----
> From: Eyal Reizer [mailto:eyalreizer@googlemail.com]
> Sent: Monday, September 26, 2011 11:30 AM
> To: openembedded-devel@lists.openembedded.org
> Cc: Reizer, Eyal
> Subject: [PATCH] wpa_supplicant update to use a newer commit
>=20
> Signed-off-by: Eyal Reizer <eyalr@ti.com>
> ---
>  recipes/wpa-supplicant/wpa-supplicant_git.bb |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
>=20
> diff --git a/recipes/wpa-supplicant/wpa-supplicant_git.bb
> b/recipes/wpa-supplicant/wpa-supplicant_git.bb
> index 8f6971e..7408808 100644
> --- a/recipes/wpa-supplicant/wpa-supplicant_git.bb
> +++ b/recipes/wpa-supplicant/wpa-supplicant_git.bb
> @@ -1,6 +1,6 @@
>  require wpa-supplicant-0.7.inc
>=20
> -SRCREV =3D "b8fb017272ed4794339978c9fbc0e74571a44728"
> +SRCREV =3D "83fa07226debc2f7082b6ccd62dbb1cd47c30472"
>  PR =3D "r0"
>  PV =3D "0.7.3+0.8.0-rc"
>  PR_append =3D "+gitr${SRCPV}"
> --
> 1.7.0.4



