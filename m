Return-Path: <christophe.priouzeau@st.com>
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
	[62.209.51.94])
	by mail.openembedded.org (Postfix) with ESMTP id 9A8E97F6BA
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Oct 2019 14:47:02 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
	x9HEk2GT023544 for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Oct 2019 16:47:03 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
	h=from : to : cc : subject
	: date : message-id : references : in-reply-to : content-type :
	content-transfer-encoding : mime-version; s=STMicroelectronics;
	bh=1G8CB1ipwcziWrkj1dvpSb5xTsC4Q+pyMCLosLnIYVQ=;
	b=k8faIenlIwcE2j0WHq3T1bG91ZG1X68lw7H/n1aGYdSf0auqhgqtC6j0KfrlAzOsl1iE
	AxmnFOmWuhmEHeOrWaZy175Kso2uZ1PIDEqY73aZ4/2jDhIAHR5/++DJ0EitNtSfGb1u
	ovwNRNuEV2HBUGgFE5XqQVqN2JxhN4FAImG8WKCHuYvfdqFu9H2eWgs/tZusYfUkO9iY
	IGIBNd903LT+LQDuuwM6Asn1n4jucU/FvmeGv790q/hbMofqIrQ/uIXyaeMtL/qWpS5V
	iZduEGsiDCH/DZnsPNOKs7R5k+pTyhiB3PpPAZot/90huw+phmrVPfZWZwBF8+b2uQti
	Tw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by mx07-00178001.pphosted.com with ESMTP id 2vk4kxcfbe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT) for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Oct 2019 16:47:03 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id CC23E10003A
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Oct 2019 16:47:02 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C67CA2B5D7A
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Oct 2019 16:47:02 +0200 (CEST)
Received: from SFHDAG6NODE2.st.com (10.75.127.17) by SFHDAG6NODE1.st.com
	(10.75.127.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3;
	Thu, 17 Oct 2019 16:47:02 +0200
Received: from SFHDAG6NODE2.st.com ([fe80::a56f:c186:bab7:13d6]) by
	SFHDAG6NODE2.st.com ([fe80::a56f:c186:bab7:13d6%20]) with mapi id
	15.00.1347.000; Thu, 17 Oct 2019 16:47:02 +0200
From: Christophe PRIOUZEAU <christophe.priouzeau@st.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [meta-oe][PATCH 3/7] libssh2: Clarify BSD license variant
Thread-Index: AQHVhPm8Irv5w0phTUizfggIhKx+/g==
Date: Thu, 17 Oct 2019 14:47:02 +0000
Message-ID: <20191017144659.24850-3-christophe.priouzeau@st.com>
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
Subject: [meta-oe][PATCH 3/7] libssh2: Clarify BSD license variant
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

The License of of libssh2 is BSD-3-Clause.

Signed-off-by: Christophe Priouzeau <christophe.priouzeau@st.com>
---
 meta-oe/recipes-support/libssh2/libssh2_1.8.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/libssh2/libssh2_1.8.2.bb b/meta-oe/rec=
ipes-support/libssh2/libssh2_1.8.2.bb
index fe853cde4..6428958f9 100644
--- a/meta-oe/recipes-support/libssh2/libssh2_1.8.2.bb
+++ b/meta-oe/recipes-support/libssh2/libssh2_1.8.2.bb
@@ -4,7 +4,7 @@ SECTION =3D "libs"
=20
 DEPENDS =3D "zlib"
=20
-LICENSE =3D "BSD"
+LICENSE =3D "BSD-3-Clause"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dc5cf34fc0acb44b082ef50ef5e4354c=
a"
=20
 SRC_URI =3D "http://www.libssh2.org/download/${BP}.tar.gz"
--=20
2.17.1

