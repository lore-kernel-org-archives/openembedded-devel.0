Return-Path: <christophe.priouzeau@st.com>
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
	[91.207.212.93])
	by mail.openembedded.org (Postfix) with ESMTP id 2EE9F7F985
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Oct 2019 09:20:37 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
	by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
	x9O9GSln030530 for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Oct 2019 11:20:38 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
	h=from : to : cc : subject
	: date : message-id : references : in-reply-to : content-type :
	content-transfer-encoding : mime-version; s=STMicroelectronics;
	bh=RPI4deCWV5wPbHD+msLeiA7jWKAU0XM1r+q6B36qUJc=;
	b=hEJpmY7qPQcYVtmxF9nUxg6bDrzpAc9K0K3ZQu92eR4Dwu9JRcFlm838ULkviIXnmvft
	yrvIdUDsbAvI7AFSECDzTYevli9DyrP6qYhJVN7O370BLRfmWVMKjucpZwBO5s2iw1rg
	Cl8TI8yll/3BFOVjJDXDS4gT9Hv57rTTa1oJH6XCI3hy67TescpsNCaOudUkojmx+C0M
	j3yQZ598KtztgHrw/kqvEiG+Knf2ygWoNdfYGK3L6t3sUND/h5/J07/trAhF0VY2HIud
	DqdGfVLDujOsg506+4vtM9K6T4uwLsACCc11jAGLahhEaDP2/AGYHusiMaczuOI0+l6V
	Vw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by mx08-00178001.pphosted.com with ESMTP id 2vt9s78q2j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT) for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Oct 2019 11:20:38 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 63F6610002A
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Oct 2019 11:20:38 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5D84021EAF1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Oct 2019 11:20:38 +0200 (CEST)
Received: from SFHDAG6NODE2.st.com (10.75.127.17) by SFHDAG6NODE3.st.com
	(10.75.127.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3;
	Thu, 24 Oct 2019 11:20:37 +0200
Received: from SFHDAG6NODE2.st.com ([fe80::a56f:c186:bab7:13d6]) by
	SFHDAG6NODE2.st.com ([fe80::a56f:c186:bab7:13d6%20]) with mapi id
	15.00.1347.000; Thu, 24 Oct 2019 11:20:38 +0200
From: Christophe PRIOUZEAU <christophe.priouzeau@st.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [meta-python][PATCH 08/10] Python: wrapt: Clarify BSD license
	variant
Thread-Index: AQHVikxM+bQTb4qvvUiZ/RumJ/4H8g==
Date: Thu, 24 Oct 2019 09:20:37 +0000
Message-ID: <20191024092032.2430-8-christophe.priouzeau@st.com>
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
Subject: [meta-python][PATCH 08/10] Python: wrapt: Clarify BSD license variant
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
X-List-Received-Date: Thu, 24 Oct 2019 09:20:38 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

The License of python wrapt is BSD-2-Clause.

Signed-off-by: Christophe Priouzeau <christophe.priouzeau@st.com>
---
 meta-python/recipes-devtools/python/python-wrapt.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python-wrapt.inc b/meta-py=
thon/recipes-devtools/python/python-wrapt.inc
index ed49811fe..496c73fa8 100644
--- a/meta-python/recipes-devtools/python/python-wrapt.inc
+++ b/meta-python/recipes-devtools/python/python-wrapt.inc
@@ -1,6 +1,6 @@
 SUMMARY =3D "A Python module for decorators, wrappers and monkey patching.=
"
 HOMEPAGE =3D "http://wrapt.readthedocs.org/"
-LICENSE =3D "BSD"
+LICENSE =3D "BSD-2-Clause"
 SECTION =3D "devel/python"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dfdfc019b57affbe1d7a32e3d34e83db=
4"
=20
--=20
2.17.1

