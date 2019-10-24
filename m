Return-Path: <christophe.priouzeau@st.com>
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
	[91.207.212.93])
	by mail.openembedded.org (Postfix) with ESMTP id 485707F984
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Oct 2019 09:20:37 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
	x9O9GLPj020801 for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Oct 2019 11:20:38 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
	h=from : to : cc : subject
	: date : message-id : references : in-reply-to : content-type :
	content-transfer-encoding : mime-version; s=STMicroelectronics;
	bh=o7rG8fD3JetIcjm7EBH9ubWmMBAlYUUNJnu54A+LN/w=;
	b=hNliLcbYRyNvLJFCxq+jp9HcoFG0k14xFVRLASSnC2elOWmdma4Ucqj8n5YjR2rIHl+3
	QuYDn26i78mo7mzBEpwoWJs/KqdB86h49kJeZ1yAARX8V01EJ+p4mGEA/jx6wqfC2x0P
	G7I6j7+ogmwH2Yk+DIxDAvzZ03MPV2EkvzyXAbeSogDCip54Reny5rCBMl537DIxoA4p
	VZh08Nm5CoPaP9noRZAiX6J2w+4xeWOe7rH//jmgW9FgatAsiBzYigIhbSNK4Uf2dk4Y
	d99VE20IdMuoFeeFroDwfMblcCwe13BsEeSSETsbDJ2adbAg/AjwTI9XE6BCyOc/z4PM
	nQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by mx08-00178001.pphosted.com with ESMTP id 2vt9s50q5u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT) for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Oct 2019 11:20:37 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7B4E010002A
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Oct 2019 11:20:37 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7469E21EAF1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Oct 2019 11:20:37 +0200 (CEST)
Received: from SFHDAG6NODE2.st.com (10.75.127.17) by SFHDAG6NODE2.st.com
	(10.75.127.17) with Microsoft SMTP Server (TLS) id 15.0.1347.2;
	Thu, 24 Oct 2019 11:20:37 +0200
Received: from SFHDAG6NODE2.st.com ([fe80::a56f:c186:bab7:13d6]) by
	SFHDAG6NODE2.st.com ([fe80::a56f:c186:bab7:13d6%20]) with mapi id
	15.00.1347.000; Thu, 24 Oct 2019 11:20:37 +0200
From: Christophe PRIOUZEAU <christophe.priouzeau@st.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [meta-python][PATCH 06/10] Python: pysmi: Clarify BSD license
	variant
Thread-Index: AQHVikxLEsRDfpr0a0i/6ZDdAyYccw==
Date: Thu, 24 Oct 2019 09:20:37 +0000
Message-ID: <20191024092032.2430-6-christophe.priouzeau@st.com>
References: <20191024092032.2430-1-christophe.priouzeau@st.com>
In-Reply-To: <20191024092032.2430-1-christophe.priouzeau@st.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.45]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
	definitions=2019-10-24_06:2019-10-23,2019-10-24 signatures=0
Cc: Christophe PRIOUZEAU <christophe.priouzeau@st.com>
Subject: [meta-python][PATCH 06/10] Python: pysmi: Clarify BSD license variant
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
X-List-Received-Date: Thu, 24 Oct 2019 09:20:37 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

The License of python pysmi is BSD-2-Clause.

Signed-off-by: Christophe Priouzeau <christophe.priouzeau@st.com>
---
 meta-python/recipes-devtools/python/python-pysmi_0.2.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python-pysmi_0.2.2.bb b/me=
ta-python/recipes-devtools/python/python-pysmi_0.2.2.bb
index 24759b5d6..7a2d89d99 100644
--- a/meta-python/recipes-devtools/python/python-pysmi_0.2.2.bb
+++ b/meta-python/recipes-devtools/python/python-pysmi_0.2.2.bb
@@ -5,7 +5,7 @@ DESCRIPTION =3D "A pure-Python implementation of SNMP/SMI M=
IB \
 HOMEPAGE =3D "https://pypi.python.org/pypi/pysmi"
 SECTION =3D "devel/python"
=20
-LICENSE =3D "BSD"
+LICENSE =3D "BSD-2-Clause"
 LIC_FILES_CHKSUM =3D "file://LICENSE.rst;md5=3Dd8b1bbadd635f187dee74d999a8=
c67b8"
=20
 SRC_URI[md5sum] =3D "3b0f71e4e9f730d211f09d8ef5371140"
--=20
2.17.1

