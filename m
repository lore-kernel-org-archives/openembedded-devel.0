Return-Path: <christophe.priouzeau@st.com>
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
	[62.209.51.94])
	by mail.openembedded.org (Postfix) with ESMTP id 4BA847F94E
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Oct 2019 09:20:41 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
	x9O9GOIH016300 for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Oct 2019 11:20:41 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
	h=from : to : cc : subject
	: date : message-id : references : in-reply-to : content-type :
	content-transfer-encoding : mime-version; s=STMicroelectronics;
	bh=lJlbh5DrW1lzn0l837k8nJjOK8vsgNvOajHfJ9+o5Qc=;
	b=GjxGUxaj4UP4LfSi8WiSvkseSqrb81u2UNUDKG4mvmmlmyrmtfLfEoYbCV3Zjzp/gwUK
	A0C9N4r1qafyzXbOrjLWCP2LwPzQ5LCGA/26gqMf9qkc/UjYs/gpcdX5s/3EnQBYQ3Xu
	I33cA8CSLx/RDqzDei36UvWyO6EfpmjUtOipXWeAWNp4Fz9D6Y3VNjOtunMlWfC4cpog
	fJlAyj1J2hIVQRNCPsXC4WG9soj6BmHwRBQ2zQDMW5rByIymVxhGpj/k/nEsNZd9HXAy
	2KtI7DBXKD5gfgjEPVJxTLg14zlLcNQwfq/roZtI4RNzfi+XLmRKS8kjPjZG5wmLS+w/
	kw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by mx07-00178001.pphosted.com with ESMTP id 2vt9s1rs9e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT) for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Oct 2019 11:20:41 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id AB4A4100034
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Oct 2019 11:20:38 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A402921EAF1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Oct 2019 11:20:38 +0200 (CEST)
Received: from SFHDAG6NODE2.st.com (10.75.127.17) by SFHDAG6NODE2.st.com
	(10.75.127.17) with Microsoft SMTP Server (TLS) id 15.0.1347.2;
	Thu, 24 Oct 2019 11:20:38 +0200
Received: from SFHDAG6NODE2.st.com ([fe80::a56f:c186:bab7:13d6]) by
	SFHDAG6NODE2.st.com ([fe80::a56f:c186:bab7:13d6%20]) with mapi id
	15.00.1347.000; Thu, 24 Oct 2019 11:20:38 +0200
From: Christophe PRIOUZEAU <christophe.priouzeau@st.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [meta-python][PATCH 09/10] Python: xlrd: Clarify BSD license
	variant
Thread-Index: AQHVikxMlVEXd3FgbUeECnaNa3x4eA==
Date: Thu, 24 Oct 2019 09:20:38 +0000
Message-ID: <20191024092032.2430-9-christophe.priouzeau@st.com>
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
Subject: [meta-python][PATCH 09/10] Python: xlrd: Clarify BSD license variant
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
X-List-Received-Date: Thu, 24 Oct 2019 09:20:41 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

The License of python xlrd is BSD-3-Clause.

Signed-off-by: Christophe Priouzeau <christophe.priouzeau@st.com>
---
 meta-python/recipes-devtools/python/python-xlrd.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python-xlrd.inc b/meta-pyt=
hon/recipes-devtools/python/python-xlrd.inc
index 893e82e05..1478a474b 100644
--- a/meta-python/recipes-devtools/python/python-xlrd.inc
+++ b/meta-python/recipes-devtools/python/python-xlrd.inc
@@ -3,7 +3,7 @@ DESCRIPTION =3D "Extract data from Excel spreadsheets (.xls=
 and .xlsx,\
  versions 2.0 onwards) on any platform. Pure Python (2.6, 2.7, 3.2+). \
 Strong support for Excel dates. Unicode-aware."
 HOMEPAGE =3D "http://www.python-excel.org/"
-LICENSE =3D "BSD"
+LICENSE =3D "BSD-3-Clause"
 LIC_FILES_CHKSUM =3D "file://PKG-INFO;md5=3D08bd814936237b6e1355e6370b24b2=
c1"
=20
 SRC_URI[md5sum] =3D "b85c9916ac755cad489a9005f5a0d390"
--=20
2.17.1

