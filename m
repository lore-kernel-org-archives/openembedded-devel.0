Return-Path: <christophe.priouzeau@st.com>
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
	[91.207.212.93])
	by mail.openembedded.org (Postfix) with ESMTP id A4C1E7F99E
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Oct 2019 09:34:39 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
	x9O9UxHC011908 for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Oct 2019 11:34:40 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
	h=from : to : cc : subject
	: date : message-id : references : in-reply-to : content-type :
	content-transfer-encoding : mime-version; s=STMicroelectronics;
	bh=zoTk0MEXcxOm4oTGK7YjYLxOQZ8NtcErFF5McJZkBy4=;
	b=tBA5bLw/sW80keBBN2eEumK61BuXhOqawPfO4/G1Yl2rTpTharxzavhJFMjdBfCRMhmY
	2FKrkD2+N1rFtym/WZ1YCyCnsiuKpoBbbo7yG9CWQC+AOafkuR/G3qlUjsXGbIDwfepQ
	Ier74XyvPNKCU0Bw2dpx0hPp5I5hWhC+pGI3jRDzHhqklbyfdcL4T861HF8P4EoklMd2
	AObJHPsI8Osq3o6LTtCT+cMHcV7N7Nv0n8X/IWyrdFZqt6LWu/V7ET0zABIHuJ7WO3HC
	PSqsNo5kZB667/uPg8YYnIbpglGzE48GAG2PaMtbUCXa9NqLB+kL1erZl9tsWX5o3FkD
	eA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by mx08-00178001.pphosted.com with ESMTP id 2vt9s50sk8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT) for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Oct 2019 11:34:40 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id F319910002A
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Oct 2019 11:34:39 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id EC73E21F169
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Oct 2019 11:34:39 +0200 (CEST)
Received: from SFHDAG6NODE2.st.com (10.75.127.17) by SFHDAG6NODE3.st.com
	(10.75.127.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3;
	Thu, 24 Oct 2019 11:34:39 +0200
Received: from SFHDAG6NODE2.st.com ([fe80::a56f:c186:bab7:13d6]) by
	SFHDAG6NODE2.st.com ([fe80::a56f:c186:bab7:13d6%20]) with mapi id
	15.00.1347.000; Thu, 24 Oct 2019 11:34:39 +0200
From: Christophe PRIOUZEAU <christophe.priouzeau@st.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [meta-python][PATCH 09/10] Python: webcolors: Clarify BSD
	license variant
Thread-Index: AQHVik5BmiypAsVHwUy3cjK/nEGvIg==
Date: Thu, 24 Oct 2019 09:34:39 +0000
Message-ID: <20191024093428.4538-9-christophe.priouzeau@st.com>
References: <20191024093428.4538-1-christophe.priouzeau@st.com>
In-Reply-To: <20191024093428.4538-1-christophe.priouzeau@st.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.47]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
	definitions=2019-10-24_06:2019-10-23,2019-10-24 signatures=0
Cc: Christophe PRIOUZEAU <christophe.priouzeau@st.com>
Subject: [meta-python][PATCH 09/10] Python: webcolors: Clarify BSD license variant
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
X-List-Received-Date: Thu, 24 Oct 2019 09:34:40 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

The License of python webcolors is BSD-3-Clause.

Signed-off-by: Christophe Priouzeau <christophe.priouzeau@st.com>
---
 meta-python/recipes-devtools/python/python-webcolors.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python-webcolors.inc b/met=
a-python/recipes-devtools/python/python-webcolors.inc
index a02bbbbed..ef254e33b 100644
--- a/meta-python/recipes-devtools/python/python-webcolors.inc
+++ b/meta-python/recipes-devtools/python/python-webcolors.inc
@@ -1,5 +1,5 @@
 SUMMARY =3D "Simple Python module for working with HTML/CSS color definiti=
ons."
-LICENSE =3D "BSD"
+LICENSE =3D "BSD-3-Clause"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D197add016087e6884a012b0f185d44a=
d"
=20
 SRC_URI[md5sum] =3D "40890db38b2a856e526a568864025fe6"
--=20
2.17.1

