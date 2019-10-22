Return-Path: <christophe.priouzeau@st.com>
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
	[91.207.212.93])
	by mail.openembedded.org (Postfix) with ESMTP id 84C2F7F74A
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Oct 2019 14:19:14 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
	by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
	x9ME0rjT011264 for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Oct 2019 16:19:15 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
	h=from : to : cc : subject
	: date : message-id : references : in-reply-to : content-type :
	content-transfer-encoding : mime-version; s=STMicroelectronics;
	bh=2sV7lHNAJYyMB58rypCXaQLTUcaiQBz52lQok94DdeI=;
	b=N9Wa8N39IUGXDQL9j9L+YKbVGf+fjzZWs446/lSWprA0pIxVdrvC2uj3ldXuJIJsnlMe
	/YxPPf64lFyem+2pLzs04yUGqgYScGPu74zia4bDPKPMUJyWb8DvXfbRVTh83ixjlM0I
	rkiAr6jsmAcB6BgYDCbpzoyvZ+Y+3SICbUMh/DLv6LiK2eBDAL/pi/qpWyJbE5b2dEy5
	2g74JagoJXmfShYNo0Og3lUzuUCiOhb3jY7dZFeVekelJOmWWucqBm3H41SvD5BIySJT
	DFfJaequdXc7as7jMSAgREyiJqRhKzHe8cJQVDdobaO+DwYpI4uvjxBoLiJ9OjI3Vgsg
	wA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by mx08-00178001.pphosted.com with ESMTP id 2vqwva6wbw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT) for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Oct 2019 16:19:15 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B00A110003D
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Oct 2019 16:19:14 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A9A7C2AEF90
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Oct 2019 16:19:14 +0200 (CEST)
Received: from SFHDAG6NODE2.st.com (10.75.127.17) by SFHDAG6NODE3.st.com
	(10.75.127.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3;
	Tue, 22 Oct 2019 16:19:14 +0200
Received: from SFHDAG6NODE2.st.com ([fe80::a56f:c186:bab7:13d6]) by
	SFHDAG6NODE2.st.com ([fe80::a56f:c186:bab7:13d6%20]) with mapi id
	15.00.1347.000; Tue, 22 Oct 2019 16:19:14 +0200
From: Christophe PRIOUZEAU <christophe.priouzeau@st.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [meta-networking][PATCH 12/16] radiusclient: Clarify BSD license
	variant
Thread-Index: AQHViOOufkyB+wYMC0mR8ry8ZC7S+A==
Date: Tue, 22 Oct 2019 14:19:14 +0000
Message-ID: <20191022141907.4412-12-christophe.priouzeau@st.com>
References: <20191022141907.4412-1-christophe.priouzeau@st.com>
In-Reply-To: <20191022141907.4412-1-christophe.priouzeau@st.com>
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
Subject: [meta-networking][PATCH 12/16] radiusclient: Clarify BSD license variant
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
X-List-Received-Date: Tue, 22 Oct 2019 14:19:15 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

The License of radiusclient is BSD-3-Clause and
BSD-2-Clause and HPND.

Signed-off-by: Christophe Priouzeau <christophe.priouzeau@st.com>
---
 .../recipes-protocols/radiusclient-ng/radiusclient-ng_0.5.6.bb  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-protocols/radiusclient-ng/radiusclient=
-ng_0.5.6.bb b/meta-networking/recipes-protocols/radiusclient-ng/radiusclie=
nt-ng_0.5.6.bb
index 780423f0f..ea3775452 100644
--- a/meta-networking/recipes-protocols/radiusclient-ng/radiusclient-ng_0.5=
.6.bb
+++ b/meta-networking/recipes-protocols/radiusclient-ng/radiusclient-ng_0.5=
.6.bb
@@ -12,7 +12,7 @@ SRC_URI =3D "${DEBIAN_MIRROR}/main/r/${BPN}/${BPN}_${PV}.=
orig.tar.gz \
 SRC_URI[md5sum] =3D "6fb7d4d0aefafaee7385831ac46a8e9c"
 SRC_URI[sha256sum] =3D "282a9f1355f190efbb06c0d7c4e062eaa652caf342ed3ad361=
ac595f72f09f14"
=20
-LICENSE =3D "BSD"
+LICENSE =3D "BSD-3-Clause & BSD-2-Clause & HPND"
 LIC_FILES_CHKSUM =3D "file://COPYRIGHT;md5=3D3e47566c9271b786693d8a08792db=
f41"
=20
 inherit autotools-brokensep
--=20
2.17.1

