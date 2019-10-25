Return-Path: <christophe.priouzeau@st.com>
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
	[62.209.51.94])
	by mail.openembedded.org (Postfix) with ESMTP id 43C627FA63
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Oct 2019 07:40:43 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
	x9P7Zl8a020010 for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Oct 2019 09:40:44 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
	h=from : to : cc : subject
	: date : message-id : references : in-reply-to : content-type :
	content-transfer-encoding : mime-version; s=STMicroelectronics;
	bh=uf7RTA3c7qhL/Q2BCYFYHHAww4OmwwglhE2oDsflwVI=;
	b=QHdKFRIKb/ZsxwtVwASvPoR1R61eRKEQq0/MFuvDWNwV6UdJkPsTLM/YHGjUPLYVVuk2
	vuKXVT0vB8cWlQeETotlVCc2SWyWCJvE2IF7Oxfg4Df78dqyq2wApy91xwPUggsWkM7q
	121MqBZurU7LdSMn1YhchNZ4y2GsuJlUIR2w1eLITGiPzCPbsR9/jx0fbA6cicLPrjF8
	wgZpHTp+6ZQG2bChLPCn8fCSdQM/9rP726mR4W/5P6yyxuDxSfK8t2QucX3PVpIavEl9
	BY2i964hD34Mr4vLLrVEbyGSmFfHBy16RaeUJ+8iIYCfu4jM3ROs3pPrc+GOifldfkyE
	6Q== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by mx07-00178001.pphosted.com with ESMTP id 2vt9s1x91n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT) for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Oct 2019 09:40:44 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id A247510002A
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Oct 2019 09:40:43 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 9CB582B97A1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Oct 2019 09:40:43 +0200 (CEST)
Received: from SFHDAG6NODE2.st.com (10.75.127.17) by SFHDAG6NODE2.st.com
	(10.75.127.17) with Microsoft SMTP Server (TLS) id 15.0.1347.2;
	Fri, 25 Oct 2019 09:40:43 +0200
Received: from SFHDAG6NODE2.st.com ([fe80::a56f:c186:bab7:13d6]) by
	SFHDAG6NODE2.st.com ([fe80::a56f:c186:bab7:13d6%20]) with mapi id
	15.00.1347.000; Fri, 25 Oct 2019 09:40:43 +0200
From: Christophe PRIOUZEAU <christophe.priouzeau@st.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [meta-python][PATCH 05/10] Python: ndg httpsclient: Clarify BSD
	license variant
Thread-Index: AQHViweBm0rHt2vvwkugqG5LTO5kgw==
Date: Fri, 25 Oct 2019 07:40:42 +0000
Message-ID: <20191025074040.16602-5-christophe.priouzeau@st.com>
References: <20191025074040.16602-1-christophe.priouzeau@st.com>
In-Reply-To: <20191025074040.16602-1-christophe.priouzeau@st.com>
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
Subject: [meta-python][PATCH 05/10] Python: ndg httpsclient: Clarify BSD license variant
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

The License of python ndg httpsclient is BSD-3-Clause.

Signed-off-by: Christophe Priouzeau <christophe.priouzeau@st.com>
---
 meta-python/recipes-devtools/python/python-ndg-httpsclient.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python-ndg-httpsclient.inc=
 b/meta-python/recipes-devtools/python/python-ndg-httpsclient.inc
index 91235b961..bca58f764 100644
--- a/meta-python/recipes-devtools/python/python-ndg-httpsclient.inc
+++ b/meta-python/recipes-devtools/python/python-ndg-httpsclient.inc
@@ -1,6 +1,6 @@
 DESCRIPTION =3D "Provides enhanced HTTPS support for httplib and urllib2 u=
sing PyOpenSSL"
 HOMEPAGE =3D "http://python-requests.org"
-LICENSE =3D "BSD"
+LICENSE =3D "BSD-3-Clause"
 LIC_FILES_CHKSUM =3D "file://MANIFEST.in;md5=3Dce22c0cd986d2de3f7073cd6b55=
23ae0"
=20
 SRC_URI[md5sum] =3D "b0fc8ea38f87d2c1ab1ed79a95c078f9"
--=20
2.17.1

