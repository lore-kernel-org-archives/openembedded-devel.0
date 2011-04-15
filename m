Received: from bear.ext.ti.com ([192.94.94.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eyalr@ti.com>) id 1QAkmt-0005QL-4z
	for openembedded-devel@lists.openembedded.org;
	Fri, 15 Apr 2011 17:18:23 +0200
Received: from dlep36.itg.ti.com ([157.170.170.91])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id p3FFG4XX016050
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Apr 2011 10:16:04 -0500
Received: from dlep26.itg.ti.com (localhost [127.0.0.1])
	by dlep36.itg.ti.com (8.13.8/8.13.8) with ESMTP id p3FFG4nA017199
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Apr 2011 10:16:04 -0500 (CDT)
Received: from dnce72.ent.ti.com (localhost [127.0.0.1])
	by dlep26.itg.ti.com (8.13.8/8.13.8) with ESMTP id p3FFFl0J002418
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Apr 2011 10:16:04 -0500 (CDT)
Received: from dnce02.ent.ti.com ([137.167.131.106]) by dnce72.ent.ti.com
	([137.167.131.87]) with mapi; Fri, 15 Apr 2011 17:15:45 +0200
From: "Reizer, Eyal" <eyalr@ti.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Date: Fri, 15 Apr 2011 17:15:44 +0200
Thread-Topic: Ping: [PATCHv2] ti-wifi-utils: update to a newer git commit
Thread-Index: Acv6CIf36PuzVizIRFqupQ+dwlSHmABd2Q9Q
Message-ID: <EC51CDB0807A51469E0C9CB8CF72D65F033202A729@dnce02.ent.ti.com>
References: <y> <1302718350-6429-1-git-send-email-eyalr@ti.com>
In-Reply-To: <1302718350-6429-1-git-send-email-eyalr@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
Subject: Ping: [PATCHv2] ti-wifi-utils: update to a newer git commit
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
X-List-Received-Date: Fri, 15 Apr 2011 15:18:23 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Eyal Reizer [mailto:eyalreizer@googlemail.com]
> Sent: Wednesday, April 13, 2011 1:13 PM
> To: openembedded-devel@lists.openembedded.org
> Cc: Reizer, Eyal
> Subject: [PATCHv2] ti-wifi-utils: update to a newer git commit
>=20
> * Change to a newer calibrator version supporting new wl12xx chips.
> * Add a PR number
>=20
> Signed-off-by: Eyal Reizer <eyalr@ti.com>
> ---
>  recipes/ti/ti-wifi-utils_git.bb |    3 ++-
>  1 files changed, 2 insertions(+), 1 deletions(-)
>=20
> diff --git a/recipes/ti/ti-wifi-utils_git.bb b/recipes/ti/ti-wifi-
> utils_git.bb
> index 92edb7f..1ee5f2d 100644
> --- a/recipes/ti/ti-wifi-utils_git.bb
> +++ b/recipes/ti/ti-wifi-utils_git.bb
> @@ -3,10 +3,11 @@ LICENSE =3D "TI-BSD"
>=20
>  DEPENDS =3D "libnl"
>=20
> +PR =3D"r1"
>  PV =3D"0.0"
>  PR_append =3D "+gitr${SRCPV}"
>=20
> -SRCREV =3D "6de17deb67a1313b5cc8"
> +SRCREV =3D "7f63af54eb66e5b2515f92c59fcc19a8065ce481"
>  SRC_URI =3D "git://github.com/gxk/ti-utils.git;protocol=3Dgit"
>=20
>  S =3D "${WORKDIR}/git"
> --
> 1.7.0.4



