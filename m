Return-Path: <christophe.priouzeau@st.com>
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
	[91.207.212.93])
	by mail.openembedded.org (Postfix) with ESMTP id 109617F828
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Oct 2019 15:15:53 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
	x9NFDixx011284 for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Oct 2019 17:15:54 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
	h=from : to : cc : subject
	: date : message-id : references : in-reply-to : content-type :
	content-transfer-encoding : mime-version; s=STMicroelectronics;
	bh=7IwuTM3ymhlEzX46E9JI4zO74ABIEk3+JAgROpS5+ak=;
	b=got3lk0h2UOTu9GE9JjofJ7Y9VN/76gifgy9HPjoEeepyyFYMpmFtIKCU23aSZZkAUOb
	dvWg0Af4cDSAtBHJn45rxJrWjUs4KM0GGwQRUPFRRnK23kw8stcaqb9Mj0HZxo+QSQa8
	DoZlc3Kmd6HkUsV+ynM0OV0t5dLVcLGCwq8yyA/0LqMSne2pZf/lfpBL8l6yOQzs/D2V
	0rD3Mwb1T/0ZvqgrbFBROaZ2uL+iNnBW4/22mpoHiR1M5INtpOonvS/HKANM+/fJGz/5
	mHW/xwGuOf1vD9HTjYqZbDvoIDHzwshe5iS0IOdALIqOD9nr+KCOxXk/mWutWDahnFNt
	Gg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by mx08-00178001.pphosted.com with ESMTP id 2vt9s4vdjk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT) for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Oct 2019 17:15:54 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 5C6A210002A
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Oct 2019 17:15:54 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 56A602B1D56
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Oct 2019 17:15:54 +0200 (CEST)
Received: from SFHDAG6NODE2.st.com (10.75.127.17) by SFHDAG6NODE1.st.com
	(10.75.127.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3;
	Wed, 23 Oct 2019 17:15:53 +0200
Received: from SFHDAG6NODE2.st.com ([fe80::a56f:c186:bab7:13d6]) by
	SFHDAG6NODE2.st.com ([fe80::a56f:c186:bab7:13d6%20]) with mapi id
	15.00.1347.000; Wed, 23 Oct 2019 17:15:54 +0200
From: Christophe PRIOUZEAU <christophe.priouzeau@st.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [meta-oe][PATCH 05/10] cscope: Clarify BSD license variant
Thread-Index: AQHVibTD6F0/UMjaFU2FhhuN5r2TYQ==
Date: Wed, 23 Oct 2019 15:15:53 +0000
Message-ID: <20191023151549.22648-5-christophe.priouzeau@st.com>
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
Subject: [meta-oe][PATCH 05/10] cscope: Clarify BSD license variant
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
X-List-Received-Date: Wed, 23 Oct 2019 15:15:54 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

The License of cscope is BSD-3-Clause.

Signed-off-by: Christophe Priouzeau <christophe.priouzeau@st.com>
---
 meta-oe/recipes-devtools/cscope/cscope_15.8b.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/cscope/cscope_15.8b.bb b/meta-oe/reci=
pes-devtools/cscope/cscope_15.8b.bb
index 8aa5947d0..199c31e15 100644
--- a/meta-oe/recipes-devtools/cscope/cscope_15.8b.bb
+++ b/meta-oe/recipes-devtools/cscope/cscope_15.8b.bb
@@ -11,7 +11,7 @@ DESCRIPTION =3D "Cscope is a developer's tool for browsin=
g source code. \
=20
 HOMEPAGE =3D "http://cscope.sourceforge.net/"
=20
-LICENSE =3D "BSD"
+LICENSE =3D "BSD-3-Clause"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd4667b67b483823043fcffa489ea343=
b"
=20
 inherit autotools
--=20
2.17.1

