Return-Path: <christophe.priouzeau@st.com>
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
	[62.209.51.94])
	by mail.openembedded.org (Postfix) with ESMTP id B42F97F985
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Oct 2019 09:20:38 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
	x9O9GQ6V013911 for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Oct 2019 11:20:39 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
	h=from : to : cc : subject
	: date : message-id : references : in-reply-to : content-type :
	content-transfer-encoding : mime-version; s=STMicroelectronics;
	bh=BJPrTniP1BV8H9x1avl6wLnak7cg+hx2fH3ZwCmGsT0=;
	b=bZ2Nh77u3poVy+wrJunZXEhODdBfkZRPsw9W2V2bOhDUNPl85ToIoXvHsnmv9UeGqyj7
	TDZsf6lLPF2TdtlcCLZ9Cd3OMD47lFoYe2SZ7dbQT3HOnrLtr/TxND1KRj8Lkw+4Mo+5
	/U8Ia5Nq4VhdG9ry4oJhAJpwB+X3rAY49ArMbYMhYYtq/tgr07JHR11AWdV1TC0h+Mdo
	AI2cI/bejk/lLkvkl1okeO+dvMrq9Ae9wjUCYoVlKpvvAPyyS4kUJZCy+6aW/TADEw/S
	jO9/zpLKnR8DB2wJx9i/jow1bIKinnMpMTS+DuPyS+6knB3uqXwRTcLEBUhSj2h1f6/u
	rg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by mx07-00178001.pphosted.com with ESMTP id 2vt9s48scu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT) for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Oct 2019 11:20:39 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 24D6610003B
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Oct 2019 11:20:39 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1D67A21EAF1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Oct 2019 11:20:39 +0200 (CEST)
Received: from SFHDAG6NODE2.st.com (10.75.127.17) by SFHDAG6NODE2.st.com
	(10.75.127.17) with Microsoft SMTP Server (TLS) id 15.0.1347.2;
	Thu, 24 Oct 2019 11:20:38 +0200
Received: from SFHDAG6NODE2.st.com ([fe80::a56f:c186:bab7:13d6]) by
	SFHDAG6NODE2.st.com ([fe80::a56f:c186:bab7:13d6%20]) with mapi id
	15.00.1347.000; Thu, 24 Oct 2019 11:20:38 +0200
From: Christophe PRIOUZEAU <christophe.priouzeau@st.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [meta-python][PATCH 10/10] Python: h5py: Clarify BSD license
	variant
Thread-Index: AQHVikxMa2ZLJxupdUq9g6edo4NSHw==
Date: Thu, 24 Oct 2019 09:20:38 +0000
Message-ID: <20191024092032.2430-10-christophe.priouzeau@st.com>
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
Subject: [meta-python][PATCH 10/10] Python: h5py: Clarify BSD license variant
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
X-List-Received-Date: Thu, 24 Oct 2019 09:20:39 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

The License of python h5py is BSD-3-Clause.

Signed-off-by: Christophe Priouzeau <christophe.priouzeau@st.com>
---
 meta-python/recipes-devtools/python/python3-h5py_2.9.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-h5py_2.9.0.bb b/me=
ta-python/recipes-devtools/python/python3-h5py_2.9.0.bb
index bca7757ad..7822e463e 100644
--- a/meta-python/recipes-devtools/python/python3-h5py_2.9.0.bb
+++ b/meta-python/recipes-devtools/python/python3-h5py_2.9.0.bb
@@ -1,7 +1,7 @@
 SUMMARY =3D "Provides both a high- and low-level interface to the HDF5 lib=
rary from Python. "
 HOMEPAGE =3D "https://www.h5py.org/"
 SECTION =3D "devel/python"
-LICENSE =3D "BSD"
+LICENSE =3D "BSD-3-Clause"
 LIC_FILES_CHKSUM =3D "file://setup.py;beginline=3D107;endline=3D107;md5=3D=
795ecad0d261c998cc526c84a822dff6"
=20
 SRC_URI =3D "git://github.com/h5py/h5py.git \
--=20
2.17.1

