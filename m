Return-Path: <christophe.priouzeau@st.com>
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
	[62.209.51.94])
	by mail.openembedded.org (Postfix) with ESMTP id 8888C7F85A
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Oct 2019 15:16:39 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
	x9NFChWY002278 for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Oct 2019 17:16:40 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
	h=from : to : cc : subject
	: date : message-id : references : in-reply-to : content-type :
	content-transfer-encoding : mime-version; s=STMicroelectronics;
	bh=77Pn/DFgM71Ht0Qe1Yvtm3vs23DujCv52/dvQrweVZo=;
	b=pgMlhrRYQpgc02yLbgFsVerhgItBAaVzTIFp8IutaaTDeDmEpfp4Fnwq22dz1JQRuFKr
	XzL89iXVJ9e6o7UjI79zGQaHtwEjkT99KJYr8rf+Ckzbx7pc7WEeRD09E8AdUuvmKTXv
	kVA4TNUmOtP62TzTSpEgcQNzMuIsMBWY0iKoMM15EckZNtRj4VhHAH4yns1Nt7S0f/cG
	ByCnBNb9UmCYSq6ydB0jFm5PgRa2g1LodknTBCjKrQey3OaYwHh6CRsGP6UBBabB9loH
	3q4zj4dCKauEWEm9lC0sR3WXNL3xT8uLLmeQ0PMpIOvgaVlLbkX1IbL27VDRlwmiz9KN
	mA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by mx07-00178001.pphosted.com with ESMTP id 2vt9s44dex-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT) for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Oct 2019 17:16:40 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id D8B9210002A
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Oct 2019 17:16:39 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D32512B1D56
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Oct 2019 17:16:39 +0200 (CEST)
Received: from SFHDAG6NODE2.st.com (10.75.127.17) by SFHDAG6NODE1.st.com
	(10.75.127.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3;
	Wed, 23 Oct 2019 17:16:39 +0200
Received: from SFHDAG6NODE2.st.com ([fe80::a56f:c186:bab7:13d6]) by
	SFHDAG6NODE2.st.com ([fe80::a56f:c186:bab7:13d6%20]) with mapi id
	15.00.1347.000; Wed, 23 Oct 2019 17:16:39 +0200
From: Christophe PRIOUZEAU <christophe.priouzeau@st.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [meta-oe][PATCH 09/10] passwdqc: Clarify BSD license variant
Thread-Index: AQHVibTehffYuPzTVUuVGDuxOqIO5Q==
Date: Wed, 23 Oct 2019 15:16:39 +0000
Message-ID: <20191023151634.32423-9-christophe.priouzeau@st.com>
References: <20191023151634.32423-1-christophe.priouzeau@st.com>
In-Reply-To: <20191023151634.32423-1-christophe.priouzeau@st.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.51]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
	definitions=2019-10-23_04:2019-10-23,2019-10-23 signatures=0
Cc: Christophe PRIOUZEAU <christophe.priouzeau@st.com>
Subject: [meta-oe][PATCH 09/10] passwdqc: Clarify BSD license variant
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
X-List-Received-Date: Wed, 23 Oct 2019 15:16:40 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

The License of passwdqc is BSD-1-Clause.
---
 meta-oe/recipes-security/passwdqc/passwdqc_1.3.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-security/passwdqc/passwdqc_1.3.1.bb b/meta-oe/=
recipes-security/passwdqc/passwdqc_1.3.1.bb
index 8fc0b3591..ed90352fc 100644
--- a/meta-oe/recipes-security/passwdqc/passwdqc_1.3.1.bb
+++ b/meta-oe/recipes-security/passwdqc/passwdqc_1.3.1.bb
@@ -24,7 +24,7 @@ DEPENDS +=3D "libpam"
 inherit distro_features_check
 REQUIRED_DISTRO_FEATURES =3D "pam"
=20
-LICENSE =3D "BSD"
+LICENSE =3D "BSD-1-Clause"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D1b4af6f3d4ee079a38107366e93b334=
d"
=20
 SRC_URI =3D "http://www.openwall.com/${BPN}/${BP}.tar.gz \
--=20
2.17.1

