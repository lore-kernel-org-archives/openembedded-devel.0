Return-Path: <christophe.priouzeau@st.com>
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
	[91.207.212.93])
	by mail.openembedded.org (Postfix) with ESMTP id 42F2E7FA3F
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Oct 2019 07:39:34 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
	x9P7a6JS001666 for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Oct 2019 09:39:34 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
	h=from : to : cc : subject
	: date : message-id : references : in-reply-to : content-type :
	content-transfer-encoding : mime-version; s=STMicroelectronics;
	bh=LNVR1HZhPRVLDSyWAbvWt5q7k+Coe7uhENR4IDOR27Q=;
	b=RZ9tftcLlte+Gh7bajwWW2J0voRGxCVgeo1RVl0+qprhCtH1bcVRhpBTwh77w1LcmIhq
	wnf0l/LnbtLMbxjzBOS9EJiOtj2+Ub1lIPm7/V2CoKQRcb66QdXL/T1J9+vibTLIFM5J
	QoqD0h82rbkyLdLYF9o21E8SZl/MIFMWipRBbn8O+WMukReglcjljY/qgiv8pJHRLu/F
	KOfXFs4+piij5/tFnezPEyu6Jf0+p9CzZxV207M346DrjIdn7IS8TxPU3BdiIk3kiv2s
	q8LPj/p5CEwE0i1jf38aBRpSJusaIPoEtWcX5uKFAd/Ig3ejrkQuLdQtaMyVz8udmjnH
	DA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by mx08-00178001.pphosted.com with ESMTP id 2vt9s567b7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT) for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Oct 2019 09:39:34 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7F3AE100034
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Oct 2019 09:39:34 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 799982B97A2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Oct 2019 09:39:34 +0200 (CEST)
Received: from SFHDAG6NODE2.st.com (10.75.127.17) by SFHDAG6NODE1.st.com
	(10.75.127.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3;
	Fri, 25 Oct 2019 09:39:33 +0200
Received: from SFHDAG6NODE2.st.com ([fe80::a56f:c186:bab7:13d6]) by
	SFHDAG6NODE2.st.com ([fe80::a56f:c186:bab7:13d6%20]) with mapi id
	15.00.1347.000; Fri, 25 Oct 2019 09:39:33 +0200
From: Christophe PRIOUZEAU <christophe.priouzeau@st.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [meta-python][PATCH 2/5] Python: flask user: Clarify BSD license
	variant
Thread-Index: AQHViwdYpM3XUpafU0mjB4lQuKqNzQ==
Date: Fri, 25 Oct 2019 07:39:33 +0000
Message-ID: <20191025073919.16425-2-christophe.priouzeau@st.com>
References: <20191025073919.16425-1-christophe.priouzeau@st.com>
In-Reply-To: <20191025073919.16425-1-christophe.priouzeau@st.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.51]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
	definitions=2019-10-25_04:2019-10-23,2019-10-25 signatures=0
Cc: Christophe PRIOUZEAU <christophe.priouzeau@st.com>
Subject: [meta-python][PATCH 2/5] Python: flask user: Clarify BSD license variant
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
X-List-Received-Date: Fri, 25 Oct 2019 07:39:34 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

The License of python flask user is BSD-2-Clause.

Signed-off-by: Christophe Priouzeau <christophe.priouzeau@st.com>
---
 meta-python/recipes-devtools/python/python-flask-user.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python-flask-user.inc b/me=
ta-python/recipes-devtools/python/python-flask-user.inc
index c2b71829c..adef32cc8 100644
--- a/meta-python/recipes-devtools/python/python-flask-user.inc
+++ b/meta-python/recipes-devtools/python/python-flask-user.inc
@@ -3,7 +3,7 @@ DESCRIPTION =3D "Customizable User Account Management for F=
lask; Register \
 Confirm email, Login, Change username, Change password, Forgot Password \
 and more."
 HOMEPAGE =3D " https://github.com/lingthio/Flask-User"
-LICENSE =3D "BSD"
+LICENSE =3D "BSD-2-Clause"
 LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D97de97cd9d6e23c88129d884588=
ce71a"
=20
 SRC_URI[md5sum] =3D "f7965e66ca139c8436896da07e66c21f"
--=20
2.17.1

