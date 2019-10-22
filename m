Return-Path: <christophe.priouzeau@st.com>
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
	[91.207.212.93])
	by mail.openembedded.org (Postfix) with ESMTP id 6F9307F72A
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Oct 2019 14:19:09 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
	by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
	x9ME0sNi011276 for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Oct 2019 16:19:10 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
	h=from : to : cc : subject
	: date : message-id : content-type : content-transfer-encoding :
	mime-version; s=STMicroelectronics;
	bh=XlPuWBM2+oRRX8+kl+je8yTdIWPVmDb5MbMEl60wEjk=;
	b=SFXr3PEen00oTb4KjsZz3QJNJBy0FZ6qMY87Z6QZ80VV+LavyK5D63kKllMgWFulY1td
	bwiofg/xwJ8r+xR4D/DtcMtiqMjRgzUf6taWlyALBN3Px28sx2d1jVeo0BwPBNW/DdVC
	c8ZEtpLlJA7h9EtxN/j/Uw6qNlAFPCL2VzPwEc+BnN/2q/MXa2xFyCuJj6vWpA+/fv79
	4wdHBA1sNgzxzulSeOHs04paOgfzB+ftiB7M6delVCu+eb7kyGoNQKxnGj1PuN9zQFTo
	LNvBTwxkQFepQ3mjfhcm2DFQLwjva/rVzZpPmIdusc5Q+2TfqJmBeYnkJJ2UNL0HigNF
	bg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by mx08-00178001.pphosted.com with ESMTP id 2vqwva6wb9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT) for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Oct 2019 16:19:10 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 301EF100034
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Oct 2019 16:19:10 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1AAF32B28E0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Oct 2019 16:19:10 +0200 (CEST)
Received: from SFHDAG6NODE2.st.com (10.75.127.17) by SFHDAG6NODE3.st.com
	(10.75.127.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3;
	Tue, 22 Oct 2019 16:19:09 +0200
Received: from SFHDAG6NODE2.st.com ([fe80::a56f:c186:bab7:13d6]) by
	SFHDAG6NODE2.st.com ([fe80::a56f:c186:bab7:13d6%20]) with mapi id
	15.00.1347.000; Tue, 22 Oct 2019 16:19:09 +0200
From: Christophe PRIOUZEAU <christophe.priouzeau@st.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [meta-networking][PATCH 01/16] libnet: Clarify BSD license
	variant
Thread-Index: AQHViOOr91OwX/XaM0KO/ZpDV2XUOg==
Date: Tue, 22 Oct 2019 14:19:09 +0000
Message-ID: <20191022141907.4412-1-christophe.priouzeau@st.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.49]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
	definitions=2019-10-22_03:2019-10-22,2019-10-22 signatures=0
Cc: Christophe PRIOUZEAU <christophe.priouzeau@st.com>
Subject: [meta-networking][PATCH 01/16] libnet: Clarify BSD license variant
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
X-List-Received-Date: Tue, 22 Oct 2019 14:19:11 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

The License of libnet is BSD-3-Clause.

Signed-off-by: Christophe Priouzeau <christophe.priouzeau@st.com>
---
 meta-networking/recipes-connectivity/libdnet/libdnet_1.12.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-connectivity/libdnet/libdnet_1.12.bb b=
/meta-networking/recipes-connectivity/libdnet/libdnet_1.12.bb
index 53ba25e23..5b6e45c7b 100644
--- a/meta-networking/recipes-connectivity/libdnet/libdnet_1.12.bb
+++ b/meta-networking/recipes-connectivity/libdnet/libdnet_1.12.bb
@@ -1,7 +1,7 @@
 SUMMARY =3D "dumb networking library"
 HOMEPAGE =3D "http://code.google.com/p/libdnet/"
 SECTION =3D "libs"
-LICENSE =3D "BSD"
+LICENSE =3D "BSD-3-Clause"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D0036c1b155f4e999f3e0a373490b5db=
9"
=20
 SRC_URI =3D "git://github.com/dugsong/libdnet.git;nobranch=3D1"
--=20
2.17.1

