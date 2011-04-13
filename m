Received: from bear.ext.ti.com ([192.94.94.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <chase.maupin@ti.com>) id 1QA0Y8-0000Au-H5
	for openembedded-devel@lists.openembedded.org;
	Wed, 13 Apr 2011 15:56:05 +0200
Received: from dlep36.itg.ti.com ([157.170.170.91])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id p3DDrlVr018302
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Apr 2011 08:53:47 -0500
Received: from dlep26.itg.ti.com (localhost [127.0.0.1])
	by dlep36.itg.ti.com (8.13.8/8.13.8) with ESMTP id p3DDrld2015977
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Apr 2011 08:53:47 -0500 (CDT)
Received: from dlee74.ent.ti.com (localhost [127.0.0.1])
	by dlep26.itg.ti.com (8.13.8/8.13.8) with ESMTP id p3DDrlRS012130
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Apr 2011 08:53:47 -0500 (CDT)
Received: from dlee06.ent.ti.com ([157.170.170.11]) by dlee74.ent.ti.com
	([157.170.170.8]) with mapi; Wed, 13 Apr 2011 08:53:33 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Date: Wed, 13 Apr 2011 08:53:31 -0500
Thread-Topic: [oe] [PATCH] ti-wifi-utils: update to a newer git commit
Thread-Index: Acv5XIIr3Pl5jM1WQHqE7LKdPFEdqwAhXVEg
Message-ID: <131E5DFBE7373E4C8D813795A6AA7F080340D39583@dlee06.ent.ti.com>
References: <y> <1302645315-24883-1-git-send-email-eyalr@ti.com>
In-Reply-To: <1302645315-24883-1-git-send-email-eyalr@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
Cc: "Reizer, Eyal" <eyalr@ti.com>
Subject: Re: [PATCH] ti-wifi-utils: update to a newer git commit
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
X-List-Received-Date: Wed, 13 Apr 2011 13:56:05 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org
> [mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf Of
> Eyal Reizer
> Sent: Tuesday, April 12, 2011 4:55 PM
> To: openembedded-devel@lists.openembedded.org
> Cc: Reizer, Eyal
> Subject: [oe] [PATCH] ti-wifi-utils: update to a newer git commit

Please add a better commit message.  See http://wiki.openembedded.net/index=
.php/Commit_Policy.

Also, I think you should define a PR value of r1.  If not I don't think you=
 can guarantee that this package version will sort properly.

>=20
> Signed-off-by: Eyal Reizer <eyalr@ti.com>
> ---
>  recipes/ti/ti-wifi-utils_git.bb |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
>=20
> diff --git a/recipes/ti/ti-wifi-utils_git.bb b/recipes/ti/ti-wifi-
> utils_git.bb
> index 92edb7f..600e21f 100644
> --- a/recipes/ti/ti-wifi-utils_git.bb
> +++ b/recipes/ti/ti-wifi-utils_git.bb
> @@ -6,7 +6,7 @@ DEPENDS =3D "libnl"
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
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


