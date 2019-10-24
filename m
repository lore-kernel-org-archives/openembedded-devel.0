Return-Path: <christophe.priouzeau@st.com>
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
	[62.209.51.94])
	by mail.openembedded.org (Postfix) with ESMTP id 933AE7F983
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Oct 2019 09:20:37 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
	x9O9GRij013919 for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Oct 2019 11:20:38 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
	h=from : to : cc : subject
	: date : message-id : references : in-reply-to : content-type :
	content-transfer-encoding : mime-version; s=STMicroelectronics;
	bh=IUPqc02xXKzyldRT7XQ4cneaeS6WuXM705d2LCaW/yA=;
	b=MhSsDtWurgzQSex/7V7SDNzuHm1CzdHrTaAZ/0rLqoisJPG/FruYI1kYWtsCk6GQPDAK
	+U3N35QqcKjJ6NCH3vBjHv/3d3QlWAakJ4NDIOHfrHJSlli10/En36a5uduAcGUt0w8l
	zZ/xcyEz8zfxmsNII/+p9gUOeRj2hnyUyCel4PPTMaGQPgQoRShYtrbzUgzeoXJifiiS
	oEzTe0QZDmIwEgcx8qtSk/PTHwlBe/iWKuGZSIT3Y1mMq31yNvUse1INHkhAfGMNueqh
	moo8y+ImvLnQu4oeW5OVDzrJMTeJ0voZQliiSomzCnbgfElXPkn7e0harKhWE6KuTaWr
	Ng== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by mx07-00178001.pphosted.com with ESMTP id 2vt9s48scn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT) for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Oct 2019 11:20:38 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id EA55F100034
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Oct 2019 11:20:37 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E2C4321EAF1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Oct 2019 11:20:37 +0200 (CEST)
Received: from SFHDAG6NODE2.st.com (10.75.127.17) by SFHDAG6NODE1.st.com
	(10.75.127.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3;
	Thu, 24 Oct 2019 11:20:37 +0200
Received: from SFHDAG6NODE2.st.com ([fe80::a56f:c186:bab7:13d6]) by
	SFHDAG6NODE2.st.com ([fe80::a56f:c186:bab7:13d6%20]) with mapi id
	15.00.1347.000; Thu, 24 Oct 2019 11:20:37 +0200
From: Christophe PRIOUZEAU <christophe.priouzeau@st.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [meta-python][PATCH 07/10] Python: speaklater: Clarify BSD
	license variant
Thread-Index: AQHVikxMj2Yk7mxpykWwEOcE6qh/FA==
Date: Thu, 24 Oct 2019 09:20:37 +0000
Message-ID: <20191024092032.2430-7-christophe.priouzeau@st.com>
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
Subject: [meta-python][PATCH 07/10] Python: speaklater: Clarify BSD license variant
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

The License of python speaklater is BSD-3-Clause.

Signed-off-by: Christophe Priouzeau <christophe.priouzeau@st.com>
---
 meta-python/recipes-devtools/python/python-speaklater.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python-speaklater.inc b/me=
ta-python/recipes-devtools/python/python-speaklater.inc
index 94fa8a6c0..a2534e401 100644
--- a/meta-python/recipes-devtools/python/python-speaklater.inc
+++ b/meta-python/recipes-devtools/python/python-speaklater.inc
@@ -1,5 +1,5 @@
 DESCRIPTION =3D "Media asset management for Python, with glue code for var=
ious frameworks"
-LICENSE =3D "BSD"
+LICENSE =3D "BSD-3-Clause"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Db810770075a29bf44b96607440e7c80=
1"
=20
 SRC_URI[md5sum] =3D "e8d5dbe36e53d5a35cff227e795e8bbf"
--=20
2.17.1

