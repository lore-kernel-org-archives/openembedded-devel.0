Return-Path: <christophe.priouzeau@st.com>
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
	[91.207.212.93])
	by mail.openembedded.org (Postfix) with ESMTP id 42B6E6D561
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Oct 2019 07:39:33 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
	x9P7a6fj001669 for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Oct 2019 09:39:34 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
	h=from : to : cc : subject
	: date : message-id : content-type : content-transfer-encoding :
	mime-version; s=STMicroelectronics;
	bh=Q0BqEnY2fgRGW+RZQhXuyMW7syVDIU3Q1Nftpsaj/T0=;
	b=z5MZe7RBVoI92TkBqUxD6Vifak0ls+PGMAg1t41PD+U6QyZOT3kCC6zWVAXABo79UeBg
	6MMwscWsX9eky9BYVgmlxYRVlHtHFRyr9/u18rvVClei7E/AmDMmIm6fUrsXCo7EpIf5
	NxBcOEojijuyvpb7NvAdQth2zzz/cKmd6ZAamD7zlm5qxnPqZOVioeN5bxjvN/bz7q8p
	5HzyAE6IQXcgtXqE5Vsh1O45cX2f58rv9UfWA6pp+UmiH6vz1/fnhbyBIBiUBB+oObYG
	PBczka3HR73c4kVXMoPTNi4CGzAHlvQVebmHTCDskPgj34ScwyWUjLgGNXCUdsjH7Kda
	mQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by mx08-00178001.pphosted.com with ESMTP id 2vt9s567b5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT) for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Oct 2019 09:39:34 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 372E910002A
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Oct 2019 09:39:34 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 281082B97A2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Oct 2019 09:39:34 +0200 (CEST)
Received: from SFHDAG6NODE2.st.com (10.75.127.17) by SFHDAG6NODE3.st.com
	(10.75.127.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3;
	Fri, 25 Oct 2019 09:39:33 +0200
Received: from SFHDAG6NODE2.st.com ([fe80::a56f:c186:bab7:13d6]) by
	SFHDAG6NODE2.st.com ([fe80::a56f:c186:bab7:13d6%20]) with mapi id
	15.00.1347.000; Fri, 25 Oct 2019 09:39:33 +0200
From: Christophe PRIOUZEAU <christophe.priouzeau@st.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [meta-python][PATCH 1/5] Python: babel: Clarify BSD license
	variant
Thread-Index: AQHViwdXI4LRMo0zPkeyYZn83+LoNg==
Date: Fri, 25 Oct 2019 07:39:33 +0000
Message-ID: <20191025073919.16425-1-christophe.priouzeau@st.com>
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
Subject: [meta-python][PATCH 1/5] Python: babel: Clarify BSD license variant
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

The License of python babel is BSD-3-Clause.

Signed-off-by: Christophe Priouzeau <christophe.priouzeau@st.com>
---
 meta-python/recipes-devtools/python/python-babel.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python-babel.inc b/meta-py=
thon/recipes-devtools/python/python-babel.inc
index 427467294..e6e686250 100644
--- a/meta-python/recipes-devtools/python/python-babel.inc
+++ b/meta-python/recipes-devtools/python/python-babel.inc
@@ -1,6 +1,6 @@
 DESCRIPTION =3D "A collection of tools for internationalizing Python appli=
cations"
 HOMEPAGE =3D "http://babel.edgewall.org/"
-LICENSE =3D "BSD"
+LICENSE =3D "BSD-3-Clause"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D942469df9305abb1c59e95f77831038=
4"
=20
 SRC_URI[md5sum] =3D "83c158b7dae9135750a7cf204e6e2eea"
--=20
2.17.1

