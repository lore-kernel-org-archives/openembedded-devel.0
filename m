Return-Path: <christophe.priouzeau@st.com>
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
	[91.207.212.93])
	by mail.openembedded.org (Postfix) with ESMTP id 238897F830
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Oct 2019 15:15:54 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
	x9NFDfpv011266 for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Oct 2019 17:15:55 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
	h=from : to : cc : subject
	: date : message-id : references : in-reply-to : content-type :
	content-transfer-encoding : mime-version; s=STMicroelectronics;
	bh=hInb9fdyuCupffrG5RkPWh9jJ4NuhJkw0jLZTUGDYeQ=;
	b=xGgH8BSb82GG7QnLyjCQZ1JeuBosv4tlHmLR+Yl6Q+IcRfphVcCee5M7n2fcvQ7RO29D
	6JBVTvRi1cYGIObORSc7uwgzMuDWBKMypwxxN6qTtu+yguxou4Qu1/P/d2jOGJ9LmITX
	oYpDQVXz2j+Q/UD7/STfxrFZKeBUzC3vv5j35nETdzaWiCWIA5xtugNL2qdIhLFpKK58
	xpe688Ti7gXSo6mzyXADyOykCwWr9kJ/cjd8y9PZ4U5b2MBClDZxmBT23HuGh4cNAyx6
	P8LsLMTWrIAzbBfX6xSGPwDHmNBhy6CknqEZvFgdCZREc7LJ2/OzuV3aHtt1SUIIV/0p
	zw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by mx08-00178001.pphosted.com with ESMTP id 2vt9s4vdjq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT) for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Oct 2019 17:15:55 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7092D10002A
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Oct 2019 17:15:55 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 6A7C12B1D56
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Oct 2019 17:15:55 +0200 (CEST)
Received: from SFHDAG6NODE2.st.com (10.75.127.17) by SFHDAG6NODE1.st.com
	(10.75.127.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3;
	Wed, 23 Oct 2019 17:15:55 +0200
Received: from SFHDAG6NODE2.st.com ([fe80::a56f:c186:bab7:13d6]) by
	SFHDAG6NODE2.st.com ([fe80::a56f:c186:bab7:13d6%20]) with mapi id
	15.00.1347.000; Wed, 23 Oct 2019 17:15:55 +0200
From: Christophe PRIOUZEAU <christophe.priouzeau@st.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [meta-oe][PATCH 07/10] yasm: Clarify BSD license variant
Thread-Index: AQHVibTD/Ij0BWfX6Uap9yxmD2snQA==
Date: Wed, 23 Oct 2019 15:15:55 +0000
Message-ID: <20191023151549.22648-7-christophe.priouzeau@st.com>
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
Subject: [meta-oe][PATCH 07/10] yasm: Clarify BSD license variant
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
X-List-Received-Date: Wed, 23 Oct 2019 15:15:55 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

The License of yasm is MIT.

Signed-off-by: Christophe Priouzeau <christophe.priouzeau@st.com>
---
 meta-oe/recipes-devtools/yasm/yasm_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/yasm/yasm_git.bb b/meta-oe/recipes-de=
vtools/yasm/yasm_git.bb
index b20d4c05c..dc4fbf7f5 100644
--- a/meta-oe/recipes-devtools/yasm/yasm_git.bb
+++ b/meta-oe/recipes-devtools/yasm/yasm_git.bb
@@ -1,5 +1,5 @@
 SUMMARY =3D "x86 (SSE) assembler supporting NASM and GAS-syntaxes"
-LICENSE =3D "BSD"
+LICENSE =3D "MIT"
 HOMEPAGE =3D "http://www.tortall.net/projects/yasm/"
=20
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Da12d8903508fb6bfd49d8d82c6170dd=
9"
--=20
2.17.1

