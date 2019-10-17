Return-Path: <christophe.priouzeau@st.com>
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
	[91.207.212.93])
	by mail.openembedded.org (Postfix) with ESMTP id C2DC17F6C5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Oct 2019 14:47:03 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
	x9HEkUuG011911 for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Oct 2019 16:47:04 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
	h=from : to : cc : subject
	: date : message-id : references : in-reply-to : content-type :
	content-transfer-encoding : mime-version; s=STMicroelectronics;
	bh=FjplOwKpcPGGjR1BVmy3TTALVI+jeUX7pmnXR6csvLM=;
	b=IWJSM7ITuKZ3yJvBXaJlvk7uQwaVLbs5Lu2EWDRYvEGpXSVTlRgrQfY+faE2nXbWpC64
	ZTj2Vdl3Nq3boyTh42c5yTaYnoQRdObagu4ReuNerE5qQGdpvEBDDlk+xKXl+t4u4cH/
	PiTmqCIE2mKtmV5f4wgj4oexNfK6hieFz+a/MfKs6XgbjFL1OyK5fobu4JV1UVSfn+7G
	X1fC/sADEFvD7h+01ppVs4+wkgdDT5h/i7t3WbXPu7id8nl5t20jwzyyHTXTA3G95gMn
	0xjEl+UkMcnFu63BhsVQU4yhIpC4aH858NzGKZQYAdIMR39+Z98hamM4DjEWI77ocp7a
	Xw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by mx08-00178001.pphosted.com with ESMTP id 2vk3ya51h7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT) for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Oct 2019 16:47:04 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id DA4BC100038
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Oct 2019 16:47:03 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D4C942B5D7A
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Oct 2019 16:47:03 +0200 (CEST)
Received: from SFHDAG6NODE2.st.com (10.75.127.17) by SFHDAG6NODE3.st.com
	(10.75.127.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3;
	Thu, 17 Oct 2019 16:47:03 +0200
Received: from SFHDAG6NODE2.st.com ([fe80::a56f:c186:bab7:13d6]) by
	SFHDAG6NODE2.st.com ([fe80::a56f:c186:bab7:13d6%20]) with mapi id
	15.00.1347.000; Thu, 17 Oct 2019 16:47:03 +0200
From: Christophe PRIOUZEAU <christophe.priouzeau@st.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [meta-oe][PATCH 6/7] gperftools: Clarify BSD license variant
Thread-Index: AQHVhPm9kBflwyN12kSy+j1+P+leJw==
Date: Thu, 17 Oct 2019 14:47:03 +0000
Message-ID: <20191017144659.24850-6-christophe.priouzeau@st.com>
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
Subject: [meta-oe][PATCH 6/7] gperftools: Clarify BSD license variant
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
X-List-Received-Date: Thu, 17 Oct 2019 14:47:04 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

The License of gperftools is BSD-3-Clause

Signed-off-by: Christophe Priouzeau <christophe.priouzeau@st.com>
---
 meta-oe/recipes-support/gperftools/gperftools_2.7.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/gperftools/gperftools_2.7.bb b/meta-oe=
/recipes-support/gperftools/gperftools_2.7.bb
index c48a98183..fdb82519b 100644
--- a/meta-oe/recipes-support/gperftools/gperftools_2.7.bb
+++ b/meta-oe/recipes-support/gperftools/gperftools_2.7.bb
@@ -1,6 +1,6 @@
 SUMMARY =3D "Fast, multi-threaded malloc() and nifty performance analysis =
tools"
 HOMEPAGE =3D "https://github.com/gperftools/gperftools"
-LICENSE =3D "BSD"
+LICENSE =3D "BSD-3-Clause"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D762732742c73dc6c7fbe8632f06c059=
a"
 DEPENDS +=3D "libunwind"
=20
--=20
2.17.1

