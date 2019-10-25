Return-Path: <christophe.priouzeau@st.com>
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
	[62.209.51.94])
	by mail.openembedded.org (Postfix) with ESMTP id CE4557F8AD
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Oct 2019 07:40:42 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
	x9P7ZiGg019914 for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Oct 2019 09:40:43 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
	h=from : to : cc : subject
	: date : message-id : content-type : content-transfer-encoding :
	mime-version; s=STMicroelectronics;
	bh=RCSn9dWaf4m2tHwWrahshApqVQebHscOyTaxmPijY4I=;
	b=t9l7cmwqEu6cUNScgdNnQ7bOntaykaIHZGkGqYzyUJU3FF1sNKsEuUovU5BvabwCVXYK
	SftT9MDU6mqmEyPahUtVbvR+FtyRiSsOjraWsBV4WMByBMvytKEpn5spxKh5fXrvfg12
	aj6nItdFym5uz9dbzRSw5soTcs4dz7dw9iNsQQ9sd2EOxtdKgIro9q6LNLVpUZZKfjHY
	Mw6dOcm+l3OXVfludeMUGp7Sg8SEKcWPVZczkFbm0X5CM9EnqU1+MXhJydI5JsYN7Fs+
	1bz/F44saEivlVK0GFT5apUZsx7GfP3L94V06rGyrDxg1sgCbPekukZCbsnU7z5SLGea
	zQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by mx07-00178001.pphosted.com with ESMTP id 2vt9s1x91k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT) for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Oct 2019 09:40:43 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id BD82E100039
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Oct 2019 09:40:42 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B7BDE2B97A4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Oct 2019 09:40:42 +0200 (CEST)
Received: from SFHDAG6NODE2.st.com (10.75.127.17) by SFHDAG6NODE3.st.com
	(10.75.127.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3;
	Fri, 25 Oct 2019 09:40:41 +0200
Received: from SFHDAG6NODE2.st.com ([fe80::a56f:c186:bab7:13d6]) by
	SFHDAG6NODE2.st.com ([fe80::a56f:c186:bab7:13d6%20]) with mapi id
	15.00.1347.000; Fri, 25 Oct 2019 09:40:41 +0200
From: Christophe PRIOUZEAU <christophe.priouzeau@st.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [meta-python][PATCH 01/10] Python: dnspython: Clarify BSD
	license variant
Thread-Index: AQHViweAsT5ljRn4WkSTZKEhzD9+JA==
Date: Fri, 25 Oct 2019 07:40:41 +0000
Message-ID: <20191025074040.16602-1-christophe.priouzeau@st.com>
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
Subject: [meta-python][PATCH 01/10] Python: dnspython: Clarify BSD license variant
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
X-List-Received-Date: Fri, 25 Oct 2019 07:40:43 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

The License of python dnspython is ISC.

Signed-off-by: Christophe Priouzeau <christophe.priouzeau@st.com>
---
 meta-python/recipes-devtools/python/python-dnspython.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python-dnspython.inc b/met=
a-python/recipes-devtools/python/python-dnspython.inc
index 6a04429b7..1b5f7160f 100644
--- a/meta-python/recipes-devtools/python/python-dnspython.inc
+++ b/meta-python/recipes-devtools/python/python-dnspython.inc
@@ -1,6 +1,6 @@
 DESCRIPTION =3D "DNS toolkit for Python"
 HOMEPAGE =3D "http://www.dnspython.org/"
-LICENSE =3D "BSD"
+LICENSE =3D "ISC"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Db9d855ee0d7bea17c8b0994d37985e1=
e"
=20
 SRC_URI[md5sum] =3D "05d33ffb5d8f35ae0474bb952778a344"
--=20
2.17.1

