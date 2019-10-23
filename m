Return-Path: <christophe.priouzeau@st.com>
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
	[91.207.212.93])
	by mail.openembedded.org (Postfix) with ESMTP id 05DA57F7E5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Oct 2019 15:15:52 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
	by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
	x9NFETGx025710 for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Oct 2019 17:15:53 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
	h=from : to : cc : subject
	: date : message-id : content-type : content-transfer-encoding :
	mime-version; s=STMicroelectronics;
	bh=iB7eW1gkt1Y80IfPgk24tEfcJOQ+bXHHYNb62CjDfJc=;
	b=Lw7//Qfl6tzFifjU/trxTqPs/mrxr+iWb61jWoIKq5XV2anlDUbwKuVwBxp3cKztatff
	Nt1uLMvaI5ZT9kffK796eRNnWzNBu1BvlSZr0ztgyITqJ7XV7QsVFii+2AquMaC9ZTpF
	Rynj2HBPJczZg0PYInqvQ08xyzItorqy6lpsNpA9XzdBb291GNKNR2mEWjxjUsyFohW1
	YFMiegPriBAZDjymxU22e6WLmDSouV2I+yl/bl9wM4+X2aDgS5xQMrTIbjikD+P0DXSh
	FKMUyjbN4qu+6J+dHjTGea17PdH4lEvBcN3rbOHj0j4FTUpkHiQZATF8uyNQqpZm13jd
	KA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by mx08-00178001.pphosted.com with ESMTP id 2vt9s74dqg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT) for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Oct 2019 17:15:53 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 8D94A100039
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Oct 2019 17:15:52 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7D0792BF6AB
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Oct 2019 17:15:52 +0200 (CEST)
Received: from SFHDAG6NODE2.st.com (10.75.127.17) by SFHDAG6NODE1.st.com
	(10.75.127.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3;
	Wed, 23 Oct 2019 17:15:52 +0200
Received: from SFHDAG6NODE2.st.com ([fe80::a56f:c186:bab7:13d6]) by
	SFHDAG6NODE2.st.com ([fe80::a56f:c186:bab7:13d6%20]) with mapi id
	15.00.1347.000; Wed, 23 Oct 2019 17:15:52 +0200
From: Christophe PRIOUZEAU <christophe.priouzeau@st.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [meta-oe][PATCH 01/10] iperf3: Clarify BSD license variant
Thread-Index: AQHVibTC8Myz0tMzckyykVwmKcaklA==
Date: Wed, 23 Oct 2019 15:15:52 +0000
Message-ID: <20191023151549.22648-1-christophe.priouzeau@st.com>
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
Subject: [meta-oe][PATCH 01/10] iperf3: Clarify BSD license variant
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

The License of iperf3 is BSD-3-Clause.

Signed-off-by: Christophe Priouzeau <christophe.priouzeau@st.com>
---
 meta-oe/recipes-benchmark/iperf3/iperf3_3.7.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-benchmark/iperf3/iperf3_3.7.bb b/meta-oe/recip=
es-benchmark/iperf3/iperf3_3.7.bb
index d5296d733..98d2faabf 100644
--- a/meta-oe/recipes-benchmark/iperf3/iperf3_3.7.bb
+++ b/meta-oe/recipes-benchmark/iperf3/iperf3_3.7.bb
@@ -8,7 +8,7 @@ HOMEPAGE =3D "http://software.es.net/iperf/"
 SECTION =3D "console/network"
 BUGTRACKER =3D "https://github.com/esnet/iperf/issues"
 AUTHOR =3D "ESNET <info@es.net>, Lawrence Berkeley National Laboratory <we=
bsupport@lbl.gov>"
-LICENSE =3D "BSD"
+LICENSE =3D "BSD-3-Clause"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Df9088fe7ffdccd042f7645f1012d7f7=
0"
=20
 DEPENDS =3D "openssl"
--=20
2.17.1

