Return-Path: <christophe.priouzeau@st.com>
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
	[91.207.212.93])
	by mail.openembedded.org (Postfix) with ESMTP id E45E17F9D2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Oct 2019 15:07:46 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
	x9OF27Tr028794 for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Oct 2019 17:07:47 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
	h=from : to : cc : subject
	: date : message-id : references : in-reply-to : content-type :
	content-transfer-encoding : mime-version; s=STMicroelectronics;
	bh=WcGYwvzHMT/9q5tnL3CN/vj48llqEDdoTZMOzquj8is=;
	b=AIzRRPeo5jx7ld1z8GDTNZrd///ANDpaDPLo6OjXXtUUu3L92rBXJo2kLsk4iI095NVw
	qHYoepXt+1w0jhwihJ338Q1HZgaj1C9MZTIv6Ot1LFygGXNvWmNW2KIVFQj5gNaB0YiR
	y0bJSg1qj2obIryWkYlcRV2isLBrmLjE9KpyxOUB38Wo1tWpBjrlxb4PZqi7ubvf88F/
	KMz2cAvz/5iqUweHULPwDQnxIFphFX81LItjt6SSiIFWZo/BqAMCwZra1aRERyS6EfaA
	sYa5kMavycT7ZYobz8qMya45nvbWlPyVhNH3AXljyc04NjhDSCju5iWSkmLLTVbk5xeU
	4w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by mx08-00178001.pphosted.com with ESMTP id 2vt9s52ex8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT) for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Oct 2019 17:07:47 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 33474100034
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Oct 2019 17:07:47 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2C65C2C38D8
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Oct 2019 17:07:47 +0200 (CEST)
Received: from SFHDAG6NODE2.st.com (10.75.127.17) by SFHDAG6NODE1.st.com
	(10.75.127.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3;
	Thu, 24 Oct 2019 17:07:46 +0200
Received: from SFHDAG6NODE2.st.com ([fe80::a56f:c186:bab7:13d6]) by
	SFHDAG6NODE2.st.com ([fe80::a56f:c186:bab7:13d6%20]) with mapi id
	15.00.1347.000; Thu, 24 Oct 2019 17:07:46 +0200
From: Christophe PRIOUZEAU <christophe.priouzeau@st.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [meta-python][PATCH 9/9] Python: click: Clarify BSD license
	variant
Thread-Index: AQHVinzK/No1HysUAUiayrZuQ3mkkg==
Date: Thu, 24 Oct 2019 15:07:46 +0000
Message-ID: <20191024150740.22983-9-christophe.priouzeau@st.com>
References: <20191024150740.22983-1-christophe.priouzeau@st.com>
In-Reply-To: <20191024150740.22983-1-christophe.priouzeau@st.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.46]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
	definitions=2019-10-24_09:2019-10-23,2019-10-24 signatures=0
Cc: Christophe PRIOUZEAU <christophe.priouzeau@st.com>
Subject: [meta-python][PATCH 9/9] Python: click: Clarify BSD license variant
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
X-List-Received-Date: Thu, 24 Oct 2019 15:07:47 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

The License of python click is BSD-3-Clause.

Signed-off-by: Christophe Priouzeau <christophe.priouzeau@st.com>
---
 meta-python/recipes-devtools/python/python-click.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python-click.inc b/meta-py=
thon/recipes-devtools/python/python-click.inc
index 60bc46f82..f9dfd5627 100644
--- a/meta-python/recipes-devtools/python/python-click.inc
+++ b/meta-python/recipes-devtools/python/python-click.inc
@@ -5,7 +5,7 @@ in a composable way with as little code as necessary. It's =
the "Command \
 Line Interface Creation Kit". It's highly configurable but comes with \
 sensible defaults out of the box."
 HOMEPAGE =3D "http://click.pocoo.org/"
-LICENSE =3D "BSD"
+LICENSE =3D "BSD-3-Clause"
 LIC_FILES_CHKSUM =3D "file://LICENSE.rst;md5=3Dc13ed890b210a882c1778216694=
c98c7"
=20
 SRC_URI[md5sum] =3D "7f53d50f7b7373ebc7963f9ff697450a"
--=20
2.17.1

