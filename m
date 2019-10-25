Return-Path: <christophe.priouzeau@st.com>
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
	[62.209.51.94])
	by mail.openembedded.org (Postfix) with ESMTP id BC1A17FA63
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Oct 2019 07:40:43 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
	x9P7Zjgr019955 for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Oct 2019 09:40:44 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
	h=from : to : cc : subject
	: date : message-id : references : in-reply-to : content-type :
	content-transfer-encoding : mime-version; s=STMicroelectronics;
	bh=9uwYb+YXlxq81lIqlif2i2HdM/SRET+kMQPMqCncjaU=;
	b=uo9m1U8bMS/RjXuED/k2v6fDgoIJgSBDtQEPVI6BkBwEiNy4ip4dnKnO9IofjDOaHZ5f
	YcYuEl+gg82tkPf+bTPAkBGv5XgFqWEHkN3mzRK0vxwqHX0jKzPybl77EBrEt1H5U/aE
	aS1cY70vqzPG9vyXe9aZLtKvfBwaAjExamMMSLktbk1HFQeGcBPeJPugEGjR5wRH/q6Z
	af7w8cyM/OKpVcv042QDWyaVyxieLuY/EAFzkiIAzCNXoNmoAvkP19HBBezqDMQgoHxm
	Hxha4j6LN9e3YcU0C+X1kSXMyW+ZmxmfiLTmqVL/Ci9cXvVofGp4pE6391vpiYAPgk5Q
	eA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by mx07-00178001.pphosted.com with ESMTP id 2vt9s1x91t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT) for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Oct 2019 09:40:44 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 16E11100034
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Oct 2019 09:40:44 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 102C92B97A1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Oct 2019 09:40:44 +0200 (CEST)
Received: from SFHDAG6NODE2.st.com (10.75.127.17) by SFHDAG6NODE2.st.com
	(10.75.127.17) with Microsoft SMTP Server (TLS) id 15.0.1347.2;
	Fri, 25 Oct 2019 09:40:43 +0200
Received: from SFHDAG6NODE2.st.com ([fe80::a56f:c186:bab7:13d6]) by
	SFHDAG6NODE2.st.com ([fe80::a56f:c186:bab7:13d6%20]) with mapi id
	15.00.1347.000; Fri, 25 Oct 2019 09:40:43 +0200
From: Christophe PRIOUZEAU <christophe.priouzeau@st.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [meta-python][PATCH 06/10] Python: oauthlib: Clarify BSD license
	variant
Thread-Index: AQHViweB/gGXMD2PbkGu8Wb073UY8Q==
Date: Fri, 25 Oct 2019 07:40:43 +0000
Message-ID: <20191025074040.16602-6-christophe.priouzeau@st.com>
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
Subject: [meta-python][PATCH 06/10] Python: oauthlib: Clarify BSD license variant
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
X-List-Received-Date: Fri, 25 Oct 2019 07:40:44 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

The License of python oauthlib is BSD-3-Clause.

Signed-off-by: Christophe Priouzeau <christophe.priouzeau@st.com>
---
 meta-python/recipes-devtools/python/python-oauthlib.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python-oauthlib.inc b/meta=
-python/recipes-devtools/python/python-oauthlib.inc
index c5de8a091..fea071449 100644
--- a/meta-python/recipes-devtools/python/python-oauthlib.inc
+++ b/meta-python/recipes-devtools/python/python-oauthlib.inc
@@ -1,7 +1,7 @@
 SUMMARY =3D "A generic, spec-compliant, thorough implementation of the OAu=
th request-signing logic"
 HOMEPAGE =3D "https://github.com/idan/oauthlib"
=20
-LICENSE =3D "BSD"
+LICENSE =3D "BSD-3-Clause"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D5ba9ce41463615e082609806255bce1=
b"
=20
 SRC_URI =3D "https://pypi.python.org/packages/a5/8a/212e9b47fb54be109f3ff0=
684165bb38c51117f34e175c379fce5c7df754/oauthlib-${PV}.tar.gz"
--=20
2.17.1

