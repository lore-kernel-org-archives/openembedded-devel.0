Return-Path: <christophe.priouzeau@st.com>
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
	[91.207.212.93])
	by mail.openembedded.org (Postfix) with ESMTP id C99AF6D561
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Oct 2019 07:39:34 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
	by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
	x9P7aElt025012 for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Oct 2019 09:39:35 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
	h=from : to : cc : subject
	: date : message-id : references : in-reply-to : content-type :
	content-transfer-encoding : mime-version; s=STMicroelectronics;
	bh=/uQrDDdVHYrAtFExzH1uBAd5x4Ugf4XGBtSjWYhsZ5U=;
	b=aDMS4TTBfq0GyTbIRkYJMB14vVLyZ5kfhJuIVB3DkB/XWfAVbKYhJODElIz4rqERcECZ
	1bNJq2FIv9hqPn/l9clnhCJNIsbRcfo4cSg5atMh2ByA/uJ3Og0fyZF10eJlA5TIn/zD
	MQi+ey/ZB4HXb4vwK5mz/T8C2E4UEFFfFVfF7Kqb24+WjIAJxNd7UxAla+b6clfaBrfY
	bz++ez4qxMq25PPUNCZtsLNCsiB8OrR6TiXMUMeBhdq0FWkPW2STqH18+wh8lEHMIye+
	FTENyFNg812nuXFA18CDm6VyGW8Oi63WTbUOkPAeHEIUUR1OyrWGF7t3nSyQu2pFXATi
	nA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by mx08-00178001.pphosted.com with ESMTP id 2vt9s7e71r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT) for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Oct 2019 09:39:35 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id E8B31100038
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Oct 2019 09:39:34 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E35112B97A2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Oct 2019 09:39:34 +0200 (CEST)
Received: from SFHDAG6NODE2.st.com (10.75.127.17) by SFHDAG6NODE3.st.com
	(10.75.127.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3;
	Fri, 25 Oct 2019 09:39:34 +0200
Received: from SFHDAG6NODE2.st.com ([fe80::a56f:c186:bab7:13d6]) by
	SFHDAG6NODE2.st.com ([fe80::a56f:c186:bab7:13d6%20]) with mapi id
	15.00.1347.000; Fri, 25 Oct 2019 09:39:34 +0200
From: Christophe PRIOUZEAU <christophe.priouzeau@st.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [meta-python][PATCH 3/5] Python: jsonpointer: Clarify BSD
	license variant
Thread-Index: AQHViwdYOZOVe+yhlEmzWdpYlGaCLA==
Date: Fri, 25 Oct 2019 07:39:34 +0000
Message-ID: <20191025073919.16425-3-christophe.priouzeau@st.com>
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
Subject: [meta-python][PATCH 3/5] Python: jsonpointer: Clarify BSD license variant
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
X-List-Received-Date: Fri, 25 Oct 2019 07:39:35 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

The License of python jsonpointer is BSD-3-Clause.

Signed-off-by: Christophe Priouzeau <christophe.priouzeau@st.com>
---
 meta-python/recipes-devtools/python/python-jsonpointer.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python-jsonpointer.inc b/m=
eta-python/recipes-devtools/python/python-jsonpointer.inc
index 4ed01ed6c..d36f0294a 100644
--- a/meta-python/recipes-devtools/python/python-jsonpointer.inc
+++ b/meta-python/recipes-devtools/python/python-jsonpointer.inc
@@ -1,6 +1,6 @@
 SUMMARY =3D "Resolve JSON Pointers in Python"
 HOMEPAGE =3D "https://github.com/stefankoegl/python-json-pointer"
-LICENSE =3D "BSD"
+LICENSE =3D "BSD-3-Clause"
 LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D32b15c843b7a329130f4e266a28=
1ebb3"
=20
 inherit pypi
--=20
2.17.1

