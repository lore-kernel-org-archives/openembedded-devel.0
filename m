Return-Path: <christophe.priouzeau@st.com>
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
	[62.209.51.94])
	by mail.openembedded.org (Postfix) with ESMTP id DB9BA7FA84
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Oct 2019 07:40:44 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
	x9P7ZkJm020005 for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Oct 2019 09:40:45 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
	h=from : to : cc : subject
	: date : message-id : references : in-reply-to : content-type :
	content-transfer-encoding : mime-version; s=STMicroelectronics;
	bh=nXAEvLT5vdd/BU4432Pd3gJY9M0InuK/zxaQiXL6lV0=;
	b=IbF49N1riA/9LJXEbDmzjGaq8MEq3erMU/mQcv26eQHcj4p+WcpSdTGuk92N+S25GdPs
	0RQeibzPjDTsB4lczxEgJBFaiPbp49dzU8zWuLenSKl1sK58O0Ojvzc8t33tk3yHBTsB
	aD1S0Ey79+/UQCqQnVAjFWZ6IqTB8kRYUoxhkGmzu8EIUOhXGyQr77OLUdgu/qMkqHku
	7KgUqV0hgGB0CJdW4xduFeaYoIzJ5uuoLSaxMerGQkUd5E8HFzdM2fBo6nEsQToXuzrI
	S6AM8FPodjvCYASreztjAnyARDVbx1mhbtkfoJ28MYbYB9UoPzNBgi58b16XW1UAkpmi
	ow== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by mx07-00178001.pphosted.com with ESMTP id 2vt9s1x91w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT) for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Oct 2019 09:40:45 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 411E010002A
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Oct 2019 09:40:45 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 3B1E22B97A1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Oct 2019 09:40:45 +0200 (CEST)
Received: from SFHDAG6NODE2.st.com (10.75.127.17) by SFHDAG6NODE2.st.com
	(10.75.127.17) with Microsoft SMTP Server (TLS) id 15.0.1347.2;
	Fri, 25 Oct 2019 09:40:44 +0200
Received: from SFHDAG6NODE2.st.com ([fe80::a56f:c186:bab7:13d6]) by
	SFHDAG6NODE2.st.com ([fe80::a56f:c186:bab7:13d6%20]) with mapi id
	15.00.1347.000; Fri, 25 Oct 2019 09:40:44 +0200
From: Christophe PRIOUZEAU <christophe.priouzeau@st.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [meta-python][PATCH 09/10] Python: pyusb: Clarify BSD license
	variant
Thread-Index: AQHViweCrfJHm6vam0Wxrc8kSbN/ew==
Date: Fri, 25 Oct 2019 07:40:44 +0000
Message-ID: <20191025074040.16602-9-christophe.priouzeau@st.com>
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
Subject: [meta-python][PATCH 09/10] Python: pyusb: Clarify BSD license variant
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
X-List-Received-Date: Fri, 25 Oct 2019 07:40:45 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

The License of python pyusb is BSD-3-Clause.

Signed-off-by: Christophe Priouzeau <christophe.priouzeau@st.com>
---
 meta-python/recipes-devtools/python/python-pyusb.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python-pyusb.inc b/meta-py=
thon/recipes-devtools/python/python-pyusb.inc
index baf2db530..e783dd432 100644
--- a/meta-python/recipes-devtools/python/python-pyusb.inc
+++ b/meta-python/recipes-devtools/python/python-pyusb.inc
@@ -1,6 +1,6 @@
 SUMMARY =3D "PyUSB provides USB access on the Python language"
 HOMEPAGE =3D "http://pyusb.sourceforge.net/"
-LICENSE =3D "BSD"
+LICENSE =3D "BSD-3-Clause"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D51691ed11cc2c7ae93e383f60ed49b0=
f"
 DEPENDS +=3D "libusb1"
=20
--=20
2.17.1

