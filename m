Return-Path: <christophe.priouzeau@st.com>
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
	[91.207.212.93])
	by mail.openembedded.org (Postfix) with ESMTP id 123737F995
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Oct 2019 09:34:38 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
	x9O9V0BZ011913 for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Oct 2019 11:34:39 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
	h=from : to : cc : subject
	: date : message-id : references : in-reply-to : content-type :
	content-transfer-encoding : mime-version; s=STMicroelectronics;
	bh=U7XlPe4WHEXlJ5PtPd3qOKwrJIsNtyFY5zk8CnOyJto=;
	b=DfE6+6dk4eiXmum51kxOBNr79x+fpS4gCIE5jDixrgG8AXkzjNCezfHfL5xvkoHHhZLk
	Kno43OrUfqOLQWg32dnujfDxD0ms3zKwEB0cN7C9w01Nq3eGK+5SFz+LCrBB7qBKx85R
	9WQYUsgroL2PW4RBTuECiw1Q97A9xeHs4UVTs7wm4Sp+JJ2tuih/w2hBExR9geKaKp4B
	0HUO8qR/Qrs1oCd3W3KsWgv0c3P9ltLupgysGqbBJ725wnPOQfpdlrA1SeZCzs7V9rBq
	YG8XB3ZLlPqydG7uxnI+3m/hlUADlXqaeCEM1AiVA7d/geRsC0yGZg1ApnWQ+lvTvBE6
	NQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by mx08-00178001.pphosted.com with ESMTP id 2vt9s50sk1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT) for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Oct 2019 11:34:39 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 64A91100039
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Oct 2019 11:34:39 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5F32721F169
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Oct 2019 11:34:39 +0200 (CEST)
Received: from SFHDAG6NODE2.st.com (10.75.127.17) by SFHDAG6NODE2.st.com
	(10.75.127.17) with Microsoft SMTP Server (TLS) id 15.0.1347.2;
	Thu, 24 Oct 2019 11:34:39 +0200
Received: from SFHDAG6NODE2.st.com ([fe80::a56f:c186:bab7:13d6]) by
	SFHDAG6NODE2.st.com ([fe80::a56f:c186:bab7:13d6%20]) with mapi id
	15.00.1347.000; Thu, 24 Oct 2019 11:34:39 +0200
From: Christophe PRIOUZEAU <christophe.priouzeau@st.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [meta-python][PATCH 08/10] Python: pynetlinux: Clarify BSD
	license variant
Thread-Index: AQHVik5BywXEkzoWb0WaM/9rGfS9xg==
Date: Thu, 24 Oct 2019 09:34:39 +0000
Message-ID: <20191024093428.4538-8-christophe.priouzeau@st.com>
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
Subject: [meta-python][PATCH 08/10] Python: pynetlinux: Clarify BSD license variant
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
X-List-Received-Date: Thu, 24 Oct 2019 09:34:39 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

The License of python pynetlinux is BSD-3-Clause.

Signed-off-by: Christophe Priouzeau <christophe.priouzeau@st.com>
---
 meta-python/recipes-devtools/python/python-pynetlinux.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python-pynetlinux.inc b/me=
ta-python/recipes-devtools/python/python-pynetlinux.inc
index 6a3989627..c755c0ae9 100644
--- a/meta-python/recipes-devtools/python/python-pynetlinux.inc
+++ b/meta-python/recipes-devtools/python/python-pynetlinux.inc
@@ -2,7 +2,7 @@ SUMMARY =3D "Linux network configuration library for Python=
"
 DESCRIPTION =3D "This library contains Python bindings to ioctl calls"
 SECTION =3D "devel/python"
 HOMEPAGE =3D "http://github.com/rlisagor/pynetlinux"
-LICENSE =3D "BSD"
+LICENSE =3D "BSD-3-Clause"
 LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D74e1861736ee959824fe7542323=
c12e9"
=20
 inherit pypi
--=20
2.17.1

