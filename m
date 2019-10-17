Return-Path: <christophe.priouzeau@st.com>
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
	[91.207.212.93])
	by mail.openembedded.org (Postfix) with ESMTP id 23AD47F6BA
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Oct 2019 14:47:02 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
	x9HEkTba011901 for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Oct 2019 16:47:03 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
	h=from : to : cc : subject
	: date : message-id : references : in-reply-to : content-type :
	content-transfer-encoding : mime-version; s=STMicroelectronics;
	bh=y8AIC1ynZ3/TZt8pjWJXOAbMAA+Dvv52J7Hyje9ZyKM=;
	b=pP7rZQ9oxMo1d5po+Cj1blXLF2udkNOmDV9LOSvFQ2z0X4as67E33yDlK6y85YulRZKO
	mYiBdjwZgYepllaCo+m+RgdMKLBC5V4/TsOXohsXNwZfxT4KqQxHatfdxoCGOLIRrQ9e
	JdHvyk2DKWiQoWQN2+0ZyLiQHAwrnT8bahWRxs46Z90pR9fmy5+MQScdPstgBfszyOyn
	yG04oyBenZ8OCUveNz5QTWea+vw9lzWAUIQZbT1dWNMTt2u+soMz17Ezs+hcIGup8dGI
	tUwT8BBzcnA3xU/u5BUjLijGdY/12mkbkSObR0+Y7AvCItyr4SOxhyqhsyXnR4xUHMd6
	uA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by mx08-00178001.pphosted.com with ESMTP id 2vk3ya51h6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT) for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Oct 2019 16:47:03 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 35F6010002A
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Oct 2019 16:47:03 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 30E022B5D7A
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Oct 2019 16:47:03 +0200 (CEST)
Received: from SFHDAG6NODE2.st.com (10.75.127.17) by SFHDAG6NODE2.st.com
	(10.75.127.17) with Microsoft SMTP Server (TLS) id 15.0.1347.2;
	Thu, 17 Oct 2019 16:47:02 +0200
Received: from SFHDAG6NODE2.st.com ([fe80::a56f:c186:bab7:13d6]) by
	SFHDAG6NODE2.st.com ([fe80::a56f:c186:bab7:13d6%20]) with mapi id
	15.00.1347.000; Thu, 17 Oct 2019 16:47:02 +0200
From: Christophe PRIOUZEAU <christophe.priouzeau@st.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [meta-oe][PATCH 4/7] libsmi: Clarify BSD license variant
Thread-Index: AQHVhPm8X3Rh7Eh3Z0a/kogMaywdZg==
Date: Thu, 17 Oct 2019 14:47:02 +0000
Message-ID: <20191017144659.24850-4-christophe.priouzeau@st.com>
References: <20191017144659.24850-1-christophe.priouzeau@st.com>
In-Reply-To: <20191017144659.24850-1-christophe.priouzeau@st.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.46]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
	definitions=2019-10-17_05:2019-10-17,2019-10-17 signatures=0
Cc: Christophe PRIOUZEAU <christophe.priouzeau@st.com>
Subject: [meta-oe][PATCH 4/7] libsmi: Clarify BSD license variant
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
X-List-Received-Date: Thu, 17 Oct 2019 14:47:03 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

The License of libsmi is BSD-3-Clause and TCL.

Signed-off-by: Christophe Priouzeau <christophe.priouzeau@st.com>
---
 meta-oe/recipes-support/libsmi/libsmi_0.5.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/libsmi/libsmi_0.5.0.bb b/meta-oe/recip=
es-support/libsmi/libsmi_0.5.0.bb
index b537ce67d..c2142a628 100644
--- a/meta-oe/recipes-support/libsmi/libsmi_0.5.0.bb
+++ b/meta-oe/recipes-support/libsmi/libsmi_0.5.0.bb
@@ -1,7 +1,7 @@
 SUMMARY =3D "A Library to Access SMI MIB Information"
 HOMEPAGE =3D "https://www.ibr.cs.tu-bs.de/projects/libsmi"
=20
-LICENSE =3D "BSD"
+LICENSE =3D "BSD-3-Clause && TCL"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D3ad3076f9332343a21636cfd351f05b=
7"
=20
 SRC_URI =3D "https://www.ibr.cs.tu-bs.de/projects/${BPN}/download/${BP}.ta=
r.gz \
--=20
2.17.1

