Return-Path: <pascal.bach@siemens.com>
Received: from goliath.siemens.de (goliath.siemens.de [192.35.17.28])
	by mail.openembedded.org (Postfix) with ESMTP id 97C0478645
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  5 Mar 2018 12:44:14 +0000 (UTC)
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id w25CiEr4011153
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK); 
	Mon, 5 Mar 2018 13:44:14 +0100
Received: from DEFTHW99ERGMSX.ww902.siemens.net
	(defthw99ergmsx.ww902.siemens.net [139.22.70.132])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTPS id w25CiDKu009631
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK); 
	Mon, 5 Mar 2018 13:44:14 +0100
Received: from DEFTHW99ERPMSX.ww902.siemens.net (139.22.70.202) by
	DEFTHW99ERGMSX.ww902.siemens.net (139.22.70.132) with Microsoft SMTP
	Server (TLS) id 14.3.361.1; Mon, 5 Mar 2018 13:44:13 +0100
Received: from DEFTHW99EH4MSX.ww902.siemens.net ([169.254.2.118]) by
	DEFTHW99ERPMSX.ww902.siemens.net ([139.22.70.202]) with mapi id
	14.03.0361.001; Mon, 5 Mar 2018 13:44:10 +0100
From: "Bach, Pascal" <pascal.bach@siemens.com>
To: Armin Kuster <akuster808@gmail.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [meta-oe][PATCH 32/36] rocksdb: move to recipes-bsp
Thread-Index: AQHTroDB7sqoR2ZId0+yM3GOWx/226PBoZfA
Date: Mon, 5 Mar 2018 12:44:09 +0000
Message-ID: <355BE46A91031048906B695426A8D8E61733E141@DEFTHW99EH4MSX.ww902.siemens.net>
References: <1519594406-24490-1-git-send-email-akuster808@gmail.com>
	<1519594406-24490-32-git-send-email-akuster808@gmail.com>
In-Reply-To: <1519594406-24490-32-git-send-email-akuster808@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [139.22.70.9]
MIME-Version: 1.0
Subject: Re: [meta-oe][PATCH 32/36] rocksdb: move to recipes-bsp
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
X-List-Received-Date: Mon, 05 Mar 2018 12:44:15 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Armin

Why was this moved to recipes-bsp? I don't see the relation.
The same question is why leveldb was moved to recipes-security?

What did I miss?

Pascal

> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org
> [mailto:openembedded-devel-bounces@lists.openembedded.org] On
> Behalf Of Armin Kuster
> Sent: Sonntag, 25. Februar 2018 22:33
> To: openembedded-devel@lists.openembedded.org
> Subject: [oe] [meta-oe][PATCH 32/36] rocksdb: move to recipes-bsp
>=20
> Signed-off-by: Armin Kuster <akuster808@gmail.com>
> ---
>  meta-oe/{recipes-extended =3D> recipes-bsp}/rocksdb/rocksdb_git.bb | 0
>  1 file changed, 0 insertions(+), 0 deletions(-)  rename meta-oe/{recipes=
-
> extended =3D> recipes-bsp}/rocksdb/rocksdb_git.bb (100%)
>=20
> diff --git a/meta-oe/recipes-extended/rocksdb/rocksdb_git.bb b/meta-
> oe/recipes-bsp/rocksdb/rocksdb_git.bb
> similarity index 100%
> rename from meta-oe/recipes-extended/rocksdb/rocksdb_git.bb
> rename to meta-oe/recipes-bsp/rocksdb/rocksdb_git.bb
> --
> 2.7.4
>=20
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

