Return-Path: <christophe.priouzeau@st.com>
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
	[91.207.212.93])
	by mail.openembedded.org (Postfix) with ESMTP id 06C8F7F81C
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Oct 2019 15:15:52 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
	by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
	x9NFETPI025714 for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Oct 2019 17:15:53 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
	h=from : to : cc : subject
	: date : message-id : references : in-reply-to : content-type :
	content-transfer-encoding : mime-version; s=STMicroelectronics;
	bh=Pv1WQQe1iKi+dyyL9uSeKKFeyEH2ujHrGEuFPbHeY+o=;
	b=qEbyt9vzxwO5Ij5D22kRCcDBcIXueJScjHfgTpEN1tn63946FlK2yCRgdlX1bSiv6C22
	sgPSLRz8AXnEVx6N7LfT2WTx8aj2gHYJ2pDNwzpAEldzeZJk3GSLGc7emNgZodczoLz6
	x13bDS0gZct7Z/nOdyiclCsEPzXfgAzHYhx3XPPW2m2sa8nJAnTS/VhGnk4sC0Rr8pKb
	oxgJARl0uBMO8+JHB5wVQ0RvZBWSVApAmPqbXBQNR8dPoUdB4bTpp3qz0+Kpr+3a6tvm
	vzg3YkFGoXxdHHHTqDbZl2//6aPeGHiSgYiqUmUBrF6ud/74t8Y0uMrOxA3Uxem3p2LI
	FQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by mx08-00178001.pphosted.com with ESMTP id 2vt9s74dqh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT) for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Oct 2019 17:15:53 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id EDF8E10003A
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Oct 2019 17:15:52 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E61F02BF6AB
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Oct 2019 17:15:52 +0200 (CEST)
Received: from SFHDAG6NODE2.st.com (10.75.127.17) by SFHDAG6NODE3.st.com
	(10.75.127.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3;
	Wed, 23 Oct 2019 17:15:52 +0200
Received: from SFHDAG6NODE2.st.com ([fe80::a56f:c186:bab7:13d6]) by
	SFHDAG6NODE2.st.com ([fe80::a56f:c186:bab7:13d6%20]) with mapi id
	15.00.1347.000; Wed, 23 Oct 2019 17:15:52 +0200
From: Christophe PRIOUZEAU <christophe.priouzeau@st.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [meta-oe][PATCH 02/10] libnet: Clarify BSD license variant
Thread-Index: AQHVibTCy1LBHk13bkSc8xb2/p+XJQ==
Date: Wed, 23 Oct 2019 15:15:52 +0000
Message-ID: <20191023151549.22648-2-christophe.priouzeau@st.com>
References: <20191023151549.22648-1-christophe.priouzeau@st.com>
In-Reply-To: <20191023151549.22648-1-christophe.priouzeau@st.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.51]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
	definitions=2019-10-23_04:2019-10-23,2019-10-23 signatures=0
Cc: Christophe PRIOUZEAU <christophe.priouzeau@st.com>
Subject: [meta-oe][PATCH 02/10] libnet: Clarify BSD license variant
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
X-List-Received-Date: Wed, 23 Oct 2019 15:15:53 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

The License of libnet is BSD-2-Clause.

Signed-off-by: Christophe Priouzeau <christophe.priouzeau@st.com>
---
 meta-oe/recipes-connectivity/libnet/libnet_1.2-rc3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-connectivity/libnet/libnet_1.2-rc3.bb b/meta-o=
e/recipes-connectivity/libnet/libnet_1.2-rc3.bb
index c9913444d..785abf66d 100644
--- a/meta-oe/recipes-connectivity/libnet/libnet_1.2-rc3.bb
+++ b/meta-oe/recipes-connectivity/libnet/libnet_1.2-rc3.bb
@@ -2,7 +2,7 @@ SUMMARY =3D "A packet dissection and creation library"
 # libnet at packetfactory.net is dead
 HOMEPAGE =3D "https://github.com/sam-github/libnet"
 SECTION =3D "libs"
-LICENSE =3D "BSD"
+LICENSE =3D "BSD-2-Clause"
 LIC_FILES_CHKSUM =3D "file://doc/COPYING;md5=3D3ec839e00408b484d33b472a86b=
7c266"
 DEPENDS =3D "libpcap"
 # There are major API changes beween libnet v1.0 and libnet v1.1
--=20
2.17.1

