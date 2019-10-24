Return-Path: <christophe.priouzeau@st.com>
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
	[91.207.212.93])
	by mail.openembedded.org (Postfix) with ESMTP id 53D367F9C0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Oct 2019 14:56:09 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
	by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
	x9OEu6Kf020681 for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Oct 2019 16:56:10 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
	h=from : to : cc : subject
	: date : message-id : references : in-reply-to : content-type :
	content-transfer-encoding : mime-version; s=STMicroelectronics;
	bh=m58oifFJltT9i9J7z9vPBrj+b5wl6ILZfcOC+dhqGxM=;
	b=P8/f7fhB95heZ7tcvDgQ7GGwn+71asrbWrOQgFjCcM902RnWVlNQ8yXa0fWS+vxSkYMM
	3lFgsccByYXzx+xq6yQ6ey2vYP5kyKF2++oBSxB2IDlxEUvSD8KxWYFJ3eiHXtndV3U5
	TjwsSaTvvAZQVCzjEdXtzahAFsy+9DeDYf9RfttWQ+oI3pY84io7xeTjB9EzGIUSmeQO
	ZetD5uE6JqHno7yxpanAskfrSF0eJrrsmpsu2jxFf5ayu0m+vrg8hMq1iXEWAS0Y1iq+
	ZovjCgjQ/TL68Z7cX5HOl0uq5MAktKLDm+Ur/8uuNA42l+5JRt1zrg3HIiStZHtGVvjb
	jQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by mx08-00178001.pphosted.com with ESMTP id 2vt9s7acqe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT) for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Oct 2019 16:56:09 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7926610003A
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Oct 2019 16:56:09 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 73E722C38B7
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Oct 2019 16:56:09 +0200 (CEST)
Received: from SFHDAG6NODE2.st.com (10.75.127.17) by SFHDAG6NODE3.st.com
	(10.75.127.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3;
	Thu, 24 Oct 2019 16:56:08 +0200
Received: from SFHDAG6NODE2.st.com ([fe80::a56f:c186:bab7:13d6]) by
	SFHDAG6NODE2.st.com ([fe80::a56f:c186:bab7:13d6%20]) with mapi id
	15.00.1347.000; Thu, 24 Oct 2019 16:56:08 +0200
From: Christophe PRIOUZEAU <christophe.priouzeau@st.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [meta-python][PATCH 9/9] Python: pysnmp: Clarify BSD license
	variant
Thread-Index: AQHVinsrOoxF8gV25E2h9HJQnZ4d3Q==
Date: Thu, 24 Oct 2019 14:56:08 +0000
Message-ID: <20191024145603.21854-9-christophe.priouzeau@st.com>
References: <20191024145603.21854-1-christophe.priouzeau@st.com>
In-Reply-To: <20191024145603.21854-1-christophe.priouzeau@st.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.47]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
	definitions=2019-10-24_09:2019-10-23,2019-10-24 signatures=0
Cc: Christophe PRIOUZEAU <christophe.priouzeau@st.com>
Subject: [meta-python][PATCH 9/9] Python: pysnmp: Clarify BSD license variant
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
X-List-Received-Date: Thu, 24 Oct 2019 14:56:09 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

The License of python pysnmp is BSD-2-Clause.

Signed-off-by: Christophe Priouzeau <christophe.priouzeau@st.com>
---
 meta-python/recipes-devtools/python/python-pysnmp_4.4.9.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python-pysnmp_4.4.9.bb b/m=
eta-python/recipes-devtools/python/python-pysnmp_4.4.9.bb
index 9ff4df2c9..8883df9d8 100644
--- a/meta-python/recipes-devtools/python/python-pysnmp_4.4.9.bb
+++ b/meta-python/recipes-devtools/python/python-pysnmp_4.4.9.bb
@@ -5,7 +5,7 @@ DESCRIPTION =3D "SNMP v1/v2c/v3 engine and apps written in =
pure-Python. \
 "
 HOMEPAGE =3D "https://pypi.python.org/pypi/pysnmp"
 SECTION =3D "devel/python"
-LICENSE =3D "BSD"
+LICENSE =3D "BSD-2-Clause"
 LIC_FILES_CHKSUM =3D "file://LICENSE.rst;md5=3Db15d29f500f748d1c2a15709769=
090a8"
=20
 SRCNAME =3D "pysnmp"
--=20
2.17.1

