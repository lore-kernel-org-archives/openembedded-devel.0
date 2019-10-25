Return-Path: <christophe.priouzeau@st.com>
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
	[62.209.51.94])
	by mail.openembedded.org (Postfix) with ESMTP id 8BC237FA6A
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Oct 2019 07:40:44 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
	x9P7ZiGj019914 for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Oct 2019 09:40:45 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
	h=from : to : cc : subject
	: date : message-id : references : in-reply-to : content-type :
	content-transfer-encoding : mime-version; s=STMicroelectronics;
	bh=oO8gxZVlUWgDW32LCCa5eMGbi4o3MtCGsFL0cxq6mJw=;
	b=w0Rv3wq06T49rgSl8XSEGzD01mjgG75wtpfppjtVj0wFXkVXGKOcB1JORVbwgzifaErj
	HFgCn3s2LvGcdA3yPmeTDe+5l1ONl6/48u5iAdtONuOd0j6zknV1YFNaxMCWnOug+0TQ
	0le1fO03WKPtKWKLYV1xOpUhaR3YozC02Dx7xbmyzUtmNUbKk2NT9uCOXM/NSuDNV5i1
	zzgR4ffv9ntImcwOnGGhEwzbDp5iPhXxCZ20r8VZDU6c4BFDZb1uiDCp+qxYpdnCPt8o
	r+nE7mDcOSG9AXzwiq/aNm6I2v1FrVCjS1DODqlr2hWyMooXXyULzrekLZoF8aK0ouLP
	rQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by mx07-00178001.pphosted.com with ESMTP id 2vt9s1x91v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT) for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Oct 2019 09:40:45 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id E7F9D100034
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Oct 2019 09:40:44 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E25BB2B97A1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Oct 2019 09:40:44 +0200 (CEST)
Received: from SFHDAG6NODE2.st.com (10.75.127.17) by SFHDAG6NODE1.st.com
	(10.75.127.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3;
	Fri, 25 Oct 2019 09:40:44 +0200
Received: from SFHDAG6NODE2.st.com ([fe80::a56f:c186:bab7:13d6]) by
	SFHDAG6NODE2.st.com ([fe80::a56f:c186:bab7:13d6%20]) with mapi id
	15.00.1347.000; Fri, 25 Oct 2019 09:40:44 +0200
From: Christophe PRIOUZEAU <christophe.priouzeau@st.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [meta-python][PATCH 08/10] Python: pyhamcrest: Clarify BSD
	license variant
Thread-Index: AQHViweCfohBwz6BDky4ua4ug2v56A==
Date: Fri, 25 Oct 2019 07:40:44 +0000
Message-ID: <20191025074040.16602-8-christophe.priouzeau@st.com>
References: <20191025074040.16602-1-christophe.priouzeau@st.com>
In-Reply-To: <20191025074040.16602-1-christophe.priouzeau@st.com>
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
Subject: [meta-python][PATCH 08/10] Python: pyhamcrest: Clarify BSD license variant
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
X-List-Received-Date: Fri, 25 Oct 2019 07:40:45 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

The License of python pyhamcrest is BSD-3-Clause.

Signed-off-by: Christophe Priouzeau <christophe.priouzeau@st.com>
---
 meta-python/recipes-devtools/python/python-pyhamcrest_1.9.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python-pyhamcrest_1.9.0.bb=
 b/meta-python/recipes-devtools/python/python-pyhamcrest_1.9.0.bb
index 02d4f54e1..8dbb79a42 100644
--- a/meta-python/recipes-devtools/python/python-pyhamcrest_1.9.0.bb
+++ b/meta-python/recipes-devtools/python/python-pyhamcrest_1.9.0.bb
@@ -1,5 +1,5 @@
 SUMMARY =3D "Hamcrest framework for matcher objects"
-LICENSE =3D "BSD"
+LICENSE =3D "BSD-3-Clause"
 LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3Df6df1318c6071dd1707f5e3b6c1=
1f24f"
=20
 PYPI_PACKAGE =3D "PyHamcrest"
--=20
2.17.1

