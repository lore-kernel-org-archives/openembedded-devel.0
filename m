Return-Path: <christophe.priouzeau@st.com>
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
	[62.209.51.94])
	by mail.openembedded.org (Postfix) with ESMTP id 714DA7F83D
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Oct 2019 15:16:37 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
	x9NFBXGo014775 for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Oct 2019 17:16:37 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
	h=from : to : cc : subject
	: date : message-id : references : in-reply-to : content-type :
	content-transfer-encoding : mime-version; s=STMicroelectronics;
	bh=49YnbNguPHKIpb1JoScwIyWdqdx0mWpVJ0XH4KO0RII=;
	b=R58lLHlDxmMf4z43WI+x+b550UYz0CJjw6Rx+nMxhOrfdgpmaJ4RZURpE1qUGDkQpmhd
	IT5U+gSDjXWJqKgcBmJSRnV8e4rJ2YUMae9CAaIXrDJhQyT4GeGRJlUD5wgmbopuz/zT
	E3kXwkNZIp2dpiNIr2HevmWYmSIp+e71RSdK8XF6m+SO+4Dps22ZkiLEjiqBIvh1sUAS
	X1anJU0dNLQZ/ARmJpAzcj7+A0rKDJFMI+3JPpgbnOJtEqGrcY8dCeAdCpaxKzwBP/p8
	zU7r6US12+rIOuS80XrG3k1bf2szrwmtpt8IB/v2JrTsQxxmFQ1+KFdgASntyOdv8H2+
	Lw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by mx07-00178001.pphosted.com with ESMTP id 2vt9s1mdkb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT) for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Oct 2019 17:16:37 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 24435100038
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Oct 2019 17:16:37 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1DE372BF6AD
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Oct 2019 17:16:37 +0200 (CEST)
Received: from SFHDAG6NODE2.st.com (10.75.127.17) by SFHDAG6NODE2.st.com
	(10.75.127.17) with Microsoft SMTP Server (TLS) id 15.0.1347.2;
	Wed, 23 Oct 2019 17:16:36 +0200
Received: from SFHDAG6NODE2.st.com ([fe80::a56f:c186:bab7:13d6]) by
	SFHDAG6NODE2.st.com ([fe80::a56f:c186:bab7:13d6%20]) with mapi id
	15.00.1347.000; Wed, 23 Oct 2019 17:16:36 +0200
From: Christophe PRIOUZEAU <christophe.priouzeau@st.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [meta-oe][PATCH 02/10] pmdk: Clarify BSD license variant
Thread-Index: AQHVibTcHZB/+B4T6Um1f41jAl7I2g==
Date: Wed, 23 Oct 2019 15:16:36 +0000
Message-ID: <20191023151634.32423-2-christophe.priouzeau@st.com>
References: <20191023151634.32423-1-christophe.priouzeau@st.com>
In-Reply-To: <20191023151634.32423-1-christophe.priouzeau@st.com>
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
Subject: [meta-oe][PATCH 02/10] pmdk: Clarify BSD license variant
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
X-List-Received-Date: Wed, 23 Oct 2019 15:16:38 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

The License of pmdk is BSD-3-Clause.

Signed-off-by: Christophe Priouzeau <christophe.priouzeau@st.com>
---
 meta-oe/recipes-extended/pmdk/pmdk_1.7.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/pmdk/pmdk_1.7.bb b/meta-oe/recipes-ex=
tended/pmdk/pmdk_1.7.bb
index 96da266e6..f5066da0d 100644
--- a/meta-oe/recipes-extended/pmdk/pmdk_1.7.bb
+++ b/meta-oe/recipes-extended/pmdk/pmdk_1.7.bb
@@ -2,7 +2,7 @@ SUMMARY =3D "Persistent Memory Development Kit"
 DESCRIPTION =3D "Persistent Memory Development Kit"
 HOMEPAGE =3D "http://pmem.io"
 SECTION =3D "libs"
-LICENSE =3D "BSD"
+LICENSE =3D "BSD-3-Clause"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D7db1106255a1baa80391fd2e21eebab=
7"
 DEPENDS =3D "ndctl"
=20
--=20
2.17.1

