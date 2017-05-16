Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id E026E77DE7
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 May 2017 20:07:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id AC43518284;
	Tue, 16 May 2017 22:07:45 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id gQtEtagPf95D; Tue, 16 May 2017 22:07:39 +0200 (CEST)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bastet.se.axis.com (Postfix) with ESMTPS id 2E072184B2;
	Tue, 16 May 2017 22:07:39 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CAAC71E08D;
	Tue, 16 May 2017 22:07:38 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BE4F41E08A;
	Tue, 16 May 2017 22:07:38 +0200 (CEST)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder03.se.axis.com (Postfix) with ESMTP;
	Tue, 16 May 2017 22:07:38 +0200 (CEST)
Received: from XBOX01.axis.com (xbox01.axis.com [10.0.5.15])
	by seth.se.axis.com (Postfix) with ESMTP id B149810F;
	Tue, 16 May 2017 22:07:38 +0200 (CEST)
Received: from XBOX02.axis.com (10.0.5.16) by XBOX01.axis.com (10.0.5.15) with
	Microsoft SMTP Server (TLS) id 15.0.1210.3;
	Tue, 16 May 2017 22:07:38 +0200
Received: from XBOX02.axis.com ([fe80::d00f:cb52:1b56:20d]) by XBOX02.axis.com
	([fe80::d00f:cb52:1b56:20d%21]) with mapi id 15.00.1210.000;
	Tue, 16 May 2017 22:07:39 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe]  [meta-oe] [PATCH] lvm2: 2.02.166 -> 2.02.171
Thread-Index: AQHSzRlYg2+CXkM2/0OHvtQr6ev7Z6H3ZVgw
Date: Tue, 16 May 2017 20:07:39 +0000
Message-ID: <d89815ec842945d692902e605bc6e7fd@XBOX02.axis.com>
References: <1494811117-755-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
In-Reply-To: <1494811117-755-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Subject: Re: [meta-oe] [PATCH] lvm2: 2.02.166 -> 2.02.171
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 16 May 2017 20:07:47 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org
> [mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf Of
> Huang Qiyu
> Sent: den 15 maj 2017 03:19
> To: openembedded-devel@lists.openembedded.org
> Subject: [oe] [meta-oe] [PATCH] lvm2: 2.02.166 -> 2.02.171
>=20
> Upgrade lvm2 from 2.02.166 to 2.02.171.
>=20
> Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
> ---
>  meta-oe/recipes-support/lvm2/{lvm2_2.02.166.bb =3D> lvm2_2.02.171.bb} |
> 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta-oe/recipes-support/lvm2/{lvm2_2.02.166.bb =3D>
> lvm2_2.02.171.bb} (95%)
>=20
> diff --git a/meta-oe/recipes-support/lvm2/lvm2_2.02.166.bb b/meta-
> oe/recipes-support/lvm2/lvm2_2.02.171.bb
> similarity index 95%
> rename from meta-oe/recipes-support/lvm2/lvm2_2.02.166.bb
> rename to meta-oe/recipes-support/lvm2/lvm2_2.02.171.bb
> index 7939f05..38c4414 100644
> --- a/meta-oe/recipes-support/lvm2/lvm2_2.02.166.bb
> +++ b/meta-oe/recipes-support/lvm2/lvm2_2.02.171.bb
> @@ -1,7 +1,7 @@
>  require lvm2.inc
>=20
> -SRC_URI[md5sum] =3D "c5a54ee0b86703daaad6e856439e115a"
> -SRC_URI[sha256sum] =3D
> "e120b066b85b224552efda40204488c5123de068725676fd6e5c8bc655051b94"
> +SRC_URI[md5sum] =3D "153b7bb643eb26073274968e9026fa8f"
> +SRC_URI[sha256sum] =3D
> "b815a711a2fabaa5c3dc1a4a284df0268bf0f325f0fc0f5c9530c9bbb54b9964"
>=20
>  DEPENDS +=3D "autoconf-archive-native"
>=20
> --
> 2.7.4

You forgot to update libdevmapper... (It was recently broken out from=20
the lvm2 recipe.)

//Peter


