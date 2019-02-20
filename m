Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1C88F7CAB0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Feb 2019 14:47:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id AFE0C184E3;
	Wed, 20 Feb 2019 15:47:57 +0100 (CET)
X-Axis-User: NO
X-Axis-NonUser: YES
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id XH3Lswgx6YRH; Wed, 20 Feb 2019 15:47:56 +0100 (CET)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bastet.se.axis.com (Postfix) with ESMTPS id 93D5D1851B;
	Wed, 20 Feb 2019 15:47:56 +0100 (CET)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 839EB1A075;
	Wed, 20 Feb 2019 15:47:56 +0100 (CET)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 789AF1A06D;
	Wed, 20 Feb 2019 15:47:56 +0100 (CET)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder02.se.axis.com (Postfix) with ESMTP;
	Wed, 20 Feb 2019 15:47:56 +0100 (CET)
Received: from XBOX02.axis.com (xbox02.axis.com [10.0.5.16])
	by thoth.se.axis.com (Postfix) with ESMTP id 6D06F1D6A;
	Wed, 20 Feb 2019 15:47:56 +0100 (CET)
Received: from xbox11.axis.com (10.0.5.25) by XBOX02.axis.com (10.0.5.16) with
	Microsoft SMTP Server (TLS) id 15.0.1365.1;
	Wed, 20 Feb 2019 15:47:56 +0100
Received: from XBOX04.axis.com (10.0.5.18) by xbox11.axis.com (10.0.5.25) with
	Microsoft SMTP Server (TLS) id 15.0.1365.1;
	Wed, 20 Feb 2019 15:47:56 +0100
Received: from XBOX04.axis.com ([fe80::210a:724b:68cb:a917]) by
	XBOX04.axis.com ([fe80::210a:724b:68cb:a917%22]) with mapi id
	15.00.1365.000; Wed, 20 Feb 2019 15:47:56 +0100
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: "changqing.li@windriver.com" <changqing.li@windriver.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [PATCH 2/5] syslog-ng: upgrade 3.26.1 -> 3.19.1
Thread-Index: AQHUyPo//IMWLWy8u0eZxzGbaln1o6XoxD7Q
Date: Wed, 20 Feb 2019 14:47:55 +0000
Message-ID: <a0949d10ee244ac0b2a67399875c3fde@XBOX04.axis.com>
References: <1550652980-292761-1-git-send-email-changqing.li@windriver.com>
	<1550652980-292761-3-git-send-email-changqing.li@windriver.com>
In-Reply-To: <1550652980-292761-3-git-send-email-changqing.li@windriver.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Subject: Re: [PATCH 2/5] syslog-ng: upgrade 3.26.1 -> 3.19.1
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
X-List-Received-Date: Wed, 20 Feb 2019 14:47:57 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org <openembedded-
> devel-bounces@lists.openembedded.org> On Behalf Of
> changqing.li@windriver.com
> Sent: den 20 februari 2019 09:56
> To: openembedded-devel@lists.openembedded.org
> Subject: [oe] [PATCH 2/5] syslog-ng: upgrade 3.26.1 -> 3.19.1

That should obviously be:

Subject: [oe] [PATCH 2/5] syslog-ng: upgrade 3.16.1 -> 3.19.1

>=20
> From: Changqing Li <changqing.li@windriver.com>
>=20
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
>  .../syslog-ng/{syslog-ng_3.16.1.bb =3D> syslog-ng_3.19.1.bb} | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta-oe/recipes-support/syslog-ng/{syslog-ng_3.16.1.bb =3D> syslo=
g-ng_3.19.1.bb} (81%)
>=20
> diff --git a/meta-oe/recipes-support/syslog-ng/syslog-ng_3.16.1.bb b/meta=
-oe/recipes-support/syslog-ng/syslog-ng_3.19.1.bb
> similarity index 81%
> rename from meta-oe/recipes-support/syslog-ng/syslog-ng_3.16.1.bb
> rename to meta-oe/recipes-support/syslog-ng/syslog-ng_3.19.1.bb
> index b5f42cf..4eecf6b 100644
> --- a/meta-oe/recipes-support/syslog-ng/syslog-ng_3.16.1.bb
> +++ b/meta-oe/recipes-support/syslog-ng/syslog-ng_3.19.1.bb
> @@ -12,5 +12,5 @@ SRC_URI =3D "https://github.com/balabit/syslog-
> ng/releases/download/${BP}/${BP}.ta
>             file://0001-syslog-ng-fix-segment-fault-during-service-
> start.patch \
>             "
>=20
> -SRC_URI[md5sum] =3D "72d44ad02c2e9ba0748b3ecd3f15a7ff"
> -SRC_URI[sha256sum] =3D "c7ee6f1d5e98d86f191964e580111bfa71081ecbb3275cea=
035bbba177b73a29"
> +SRC_URI[md5sum] =3D "aa79bc13d9fd925aa5fb9516e87aacd3"
> +SRC_URI[sha256sum] =3D "5cf931a9d7bead0e6d9a2c65eee8f6005a005878f59aa280=
f3c4294257ed5178"
> --
> 2.7.4

//Peter


