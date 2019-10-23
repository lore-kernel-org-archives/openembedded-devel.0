Return-Path: <christophe.priouzeau@st.com>
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
	[91.207.212.93])
	by mail.openembedded.org (Postfix) with ESMTP id 6521B7F821
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Oct 2019 15:15:53 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
	x9NFDfpu011266 for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Oct 2019 17:15:53 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
	h=from : to : cc : subject
	: date : message-id : references : in-reply-to : content-type :
	content-transfer-encoding : mime-version; s=STMicroelectronics;
	bh=Ykau8LemBjJ9B2PkZFv3jE0HuOVVEXH3Syhm4jhX0JY=;
	b=ojGi9Z9WkzNjTQ9lZ32UsWoInCwuyElZwnRvBs7dD60+IdTsAJysWnREwXrw7Oztg1qg
	7eNY4iq44QlyCqUQp60dR0qeV12EuObw0pVuBUSEpYn4UddFDH78kj/y2Z92XxBHizqW
	SIdL41eynBVB9eWa9XCs2/J514HYGdeCAOQDOwBXF9EmJ+nhk6ByOfAXJbLlhHI00Sol
	68Kwq7kFhgWAEQZ39nACeTAhEHG+V+98m1BZZBEIeFHDk+U1aAPkUCwqqK0EA8TZSXHB
	HKLegiCOhMT7yiVSrfI0C+/DvIDxK0QgWulstryPvY+sS12oP3lNZD4IhAWy4hAL52m1
	jQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by mx08-00178001.pphosted.com with ESMTP id 2vt9s4vdjh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT) for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Oct 2019 17:15:53 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 610D610002A
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Oct 2019 17:15:53 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5A2DA2BF6AB
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Oct 2019 17:15:53 +0200 (CEST)
Received: from SFHDAG6NODE2.st.com (10.75.127.17) by SFHDAG6NODE2.st.com
	(10.75.127.17) with Microsoft SMTP Server (TLS) id 15.0.1347.2;
	Wed, 23 Oct 2019 17:15:53 +0200
Received: from SFHDAG6NODE2.st.com ([fe80::a56f:c186:bab7:13d6]) by
	SFHDAG6NODE2.st.com ([fe80::a56f:c186:bab7:13d6%20]) with mapi id
	15.00.1347.000; Wed, 23 Oct 2019 17:15:53 +0200
From: Christophe PRIOUZEAU <christophe.priouzeau@st.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [meta-oe][PATCH 03/10] rfkill: Clarify BSD license variant
Thread-Index: AQHVibTCLd2geWx9VUeBxaJlMaF30Q==
Date: Wed, 23 Oct 2019 15:15:52 +0000
Message-ID: <20191023151549.22648-3-christophe.priouzeau@st.com>
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
Subject: [meta-oe][PATCH 03/10] rfkill: Clarify BSD license variant
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

The License of rfkill is BSD-0-Clause.

Signed-off-by: Christophe Priouzeau <christophe.priouzeau@st.com>
---
 meta-oe/recipes-connectivity/rfkill/rfkill_0.5.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-connectivity/rfkill/rfkill_0.5.bb b/meta-oe/re=
cipes-connectivity/rfkill/rfkill_0.5.bb
index 3e644760c..5c19e65b0 100644
--- a/meta-oe/recipes-connectivity/rfkill/rfkill_0.5.bb
+++ b/meta-oe/recipes-connectivity/rfkill/rfkill_0.5.bb
@@ -1,7 +1,7 @@
 SUMMARY =3D "Radio enable/disable command line utility"
 HOMEPAGE =3D "http://linuxwireless.org/en/users/Documentation/rfkill"
 SECTION =3D "base"
-LICENSE =3D "BSD"
+LICENSE =3D "BSD-0-Clause"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dc6036d0eb7edbfced28c4160e5d3fa9=
4"
=20
 SRC_URI =3D "http://www.kernel.org/pub/software/network/${BPN}/${BP}.tar.b=
z2 \
--=20
2.17.1

