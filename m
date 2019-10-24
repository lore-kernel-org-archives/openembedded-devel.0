Return-Path: <christophe.priouzeau@st.com>
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
	[62.209.51.94])
	by mail.openembedded.org (Postfix) with ESMTP id 8E3477F999
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Oct 2019 09:34:38 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
	x9O9PtN0003808 for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Oct 2019 11:34:39 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
	h=from : to : cc : subject
	: date : message-id : references : in-reply-to : content-type :
	content-transfer-encoding : mime-version; s=STMicroelectronics;
	bh=O1OBjT8pkyC+H+QNAS/Oz8dBwM5xpkVfrR0ufgBm92k=;
	b=U8AxJGods7KIk1BZM/mANiOCQwIh6ab8D7r/w8GX2wYYH0ptC8b7GDqRsDSNcP7F0vVF
	1oulz4sIrVhZHHhYGV74DrZcH+tNv3Oil2060nkOijthCbgia3OUJlCgEklaA6XTONe8
	0uvfLmITFWUe3n6OHObLZCHs+2nzV6xo4/UgRayMh5J5skAl+MM6cNN9joS//U1kfNGT
	Jued1hyVuoZC6n7sjY3b2E5RDsGqW6tDVAhvkfo7j+whAkf8d1pXLpMMaItQRqACuNLK
	V/nJA4nj6Oyt7SHBRq9Npo2/wPSMzmXfMhhy9xlMU+5FpcSnhaf3mJ04dPLoy0TnOHJ6
	Mg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by mx07-00178001.pphosted.com with ESMTP id 2vt9s1rur4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT) for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Oct 2019 11:34:39 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id A3648100034
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Oct 2019 11:34:38 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 9D8F821F169
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Oct 2019 11:34:38 +0200 (CEST)
Received: from SFHDAG6NODE2.st.com (10.75.127.17) by SFHDAG6NODE1.st.com
	(10.75.127.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3;
	Thu, 24 Oct 2019 11:34:38 +0200
Received: from SFHDAG6NODE2.st.com ([fe80::a56f:c186:bab7:13d6]) by
	SFHDAG6NODE2.st.com ([fe80::a56f:c186:bab7:13d6%20]) with mapi id
	15.00.1347.000; Thu, 24 Oct 2019 11:34:38 +0200
From: Christophe PRIOUZEAU <christophe.priouzeau@st.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [meta-python][PATCH 06/10] Python: isodate: Clarify BSD license
	variant
Thread-Index: AQHVik5Bec7YauJ3/kWwvUx4+hC6gw==
Date: Thu, 24 Oct 2019 09:34:38 +0000
Message-ID: <20191024093428.4538-6-christophe.priouzeau@st.com>
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
Subject: [meta-python][PATCH 06/10] Python: isodate: Clarify BSD license variant
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

The License of python isodate is BSD-3-Clause.

Signed-off-by: Christophe Priouzeau <christophe.priouzeau@st.com>
---
 meta-python/recipes-devtools/python/python-isodate.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python-isodate.inc b/meta-=
python/recipes-devtools/python/python-isodate.inc
index 3cb6bb816..8c128919e 100644
--- a/meta-python/recipes-devtools/python/python-isodate.inc
+++ b/meta-python/recipes-devtools/python/python-isodate.inc
@@ -1,5 +1,5 @@
 SUMMARY =3D "ISO 8601 date/time parser"
-LICENSE =3D "BSD"
+LICENSE =3D "BSD-3-Clause"
 LIC_FILES_CHKSUM =3D "file://PKG-INFO;beginline=3D8;endline=3D8;md5=3De910=
b35b0ef4e1f665b9a75d6afb7709"
=20
 SRC_URI[md5sum] =3D "0e1203fce27ce65e2d01c5f21c4d428f"
--=20
2.17.1

