Return-Path: <christophe.priouzeau@st.com>
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
	[91.207.212.93])
	by mail.openembedded.org (Postfix) with ESMTP id 9EC697F82D
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Oct 2019 15:15:55 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
	by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
	x9NFETPJ025714 for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Oct 2019 17:15:56 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
	h=from : to : cc : subject
	: date : message-id : references : in-reply-to : content-type :
	content-transfer-encoding : mime-version; s=STMicroelectronics;
	bh=KDsfk13OG3J5mYtTHfoU1hmPiTcWLKqpjIauPdDA/DQ=;
	b=L+WfmOS+Ebb+Nwas1Igqz6BL2LZwmMH09Ja7Bg8IewgZRA2iTyvDDxV6QsIUFInzfuWs
	jsz/kFxPfME5faAwb3sAC2Lgqxtd7W8bDCYpRy2kPLAyrKZheKAWUJ4+uIY9wFHUfz8s
	oCGJZfJ1loPxjR1bC2js4ZhnuRsfh2z0R5m2TQwta8hG/mZMu+caR1CiIZVnWfDKk1iv
	Va0xyyAW7qqiyHwWw433I4r1Inr0oVZpcygJu0BFy6bulUD2zojVF/VwR1AtHS0PNpiw
	3hY5Pyz8SsNxf6hmxZEyGnZZ9yAXs5E7Gm0uCIug55E6CYvwSwyy6zHga2pzvrJutkSe
	pQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by mx08-00178001.pphosted.com with ESMTP id 2vt9s74dqy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT) for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Oct 2019 17:15:56 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id DCBD2100034
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Oct 2019 17:15:55 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D640E2B1D56
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Oct 2019 17:15:55 +0200 (CEST)
Received: from SFHDAG6NODE2.st.com (10.75.127.17) by SFHDAG6NODE3.st.com
	(10.75.127.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3;
	Wed, 23 Oct 2019 17:15:55 +0200
Received: from SFHDAG6NODE2.st.com ([fe80::a56f:c186:bab7:13d6]) by
	SFHDAG6NODE2.st.com ([fe80::a56f:c186:bab7:13d6%20]) with mapi id
	15.00.1347.000; Wed, 23 Oct 2019 17:15:55 +0200
From: Christophe PRIOUZEAU <christophe.priouzeau@st.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [meta-oe][PATCH 08/10] cmpi binding: Clarify BSD license variant
Thread-Index: AQHVibTEJ3KbYm+7YkKZiOjRbzFPUA==
Date: Wed, 23 Oct 2019 15:15:55 +0000
Message-ID: <20191023151549.22648-8-christophe.priouzeau@st.com>
References: <20191023151549.22648-1-christophe.priouzeau@st.com>
In-Reply-To: <20191023151549.22648-1-christophe.priouzeau@st.com>
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
Subject: [meta-oe][PATCH 08/10] cmpi binding: Clarify BSD license variant
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
X-List-Received-Date: Wed, 23 Oct 2019 15:15:56 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

The License of cmpi binding is BSD-3-Clause.

Signed-off-by: Christophe Priouzeau <christophe.priouzeau@st.com>
---
 meta-oe/recipes-extended/cmpi-bindings/cmpi-bindings_1.0.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/cmpi-bindings/cmpi-bindings_1.0.1.bb =
b/meta-oe/recipes-extended/cmpi-bindings/cmpi-bindings_1.0.1.bb
index 987c09fe5..251c5d0f5 100644
--- a/meta-oe/recipes-extended/cmpi-bindings/cmpi-bindings_1.0.1.bb
+++ b/meta-oe/recipes-extended/cmpi-bindings/cmpi-bindings_1.0.1.bb
@@ -1,7 +1,7 @@
 SUMMARY =3D "Adapter to write and run CMPI-type CIM providers"
 DESCRIPTION =3D "CMPI-compliant provider interface for various languages v=
ia SWIG"
 HOMEPAGE =3D "http://github.com/kkaempf/cmpi-bindings"
-LICENSE =3D "BSD"
+LICENSE =3D "BSD-3-Clause"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db19ee058d2d5f69af45da98051d9106=
4"
 SECTION =3D "Development/Libraries"
 DEPENDS =3D "swig-native python3 sblim-cmpi-devel"
--=20
2.17.1

