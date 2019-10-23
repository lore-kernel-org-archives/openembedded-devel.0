Return-Path: <christophe.priouzeau@st.com>
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
	[62.209.51.94])
	by mail.openembedded.org (Postfix) with ESMTP id 4EDFA7F83E
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Oct 2019 15:16:38 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
	x9NFBWDw014768 for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Oct 2019 17:16:39 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
	h=from : to : cc : subject
	: date : message-id : references : in-reply-to : content-type :
	content-transfer-encoding : mime-version; s=STMicroelectronics;
	bh=3jQY0Ct2JAOrFrxyl8b3puhBb53UAv06AOwHloO5Xp4=;
	b=v6xu7WchPGsS/JT5kT5j8rWWCTXHyXGYCo8Y5PZnTnKlkm/hatr8ltHJrUHH9N4EaAEN
	wI1hwOXRXV5TDKwWc7iXS1/StupEjiyc+Nrc7sKo7JU/GFjPs7Q1SRObe4njKcL4pOn9
	+DcdYX+olHmq5d1h2IMb6QqU7ocKI+s6tq/6nwKrB2tcVRREXh4wehnUvgVUvrJ4I8AW
	aWZdZMM9mmXun6vbGIGD/0IVyiMcVTOIrrhcfMEyrMCPeRC2WFdWMTWFAcmorOgub66U
	UrFIeImLuWG+pYPrktqvCNatdu3Gjl4v2mY6JWGoaUZ0PvVBpwbQUY27BZnKetwDUFhs
	1A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by mx07-00178001.pphosted.com with ESMTP id 2vt9s1mdkm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT) for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Oct 2019 17:16:39 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id AD602100034
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Oct 2019 17:16:38 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A79742B1D56
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Oct 2019 17:16:38 +0200 (CEST)
Received: from SFHDAG6NODE2.st.com (10.75.127.17) by SFHDAG6NODE3.st.com
	(10.75.127.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3;
	Wed, 23 Oct 2019 17:16:38 +0200
Received: from SFHDAG6NODE2.st.com ([fe80::a56f:c186:bab7:13d6]) by
	SFHDAG6NODE2.st.com ([fe80::a56f:c186:bab7:13d6%20]) with mapi id
	15.00.1347.000; Wed, 23 Oct 2019 17:16:38 +0200
From: Christophe PRIOUZEAU <christophe.priouzeau@st.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [meta-oe][PATCH 06/10] opus-tools: Clarify BSD license variant
Thread-Index: AQHVibTdirwF4ii5AEO9iG8nGaTZ6A==
Date: Wed, 23 Oct 2019 15:16:38 +0000
Message-ID: <20191023151634.32423-6-christophe.priouzeau@st.com>
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
Subject: [meta-oe][PATCH 06/10] opus-tools: Clarify BSD license variant
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

The License of opus-tools is BSD-2-Clause.

Signed-off-by: Christophe Priouzeau <christophe.priouzeau@st.com>
---
 meta-oe/recipes-multimedia/opus-tools/opus-tools_0.1.8.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-multimedia/opus-tools/opus-tools_0.1.8.bb b/me=
ta-oe/recipes-multimedia/opus-tools/opus-tools_0.1.8.bb
index ff6311147..a84f2bf07 100644
--- a/meta-oe/recipes-multimedia/opus-tools/opus-tools_0.1.8.bb
+++ b/meta-oe/recipes-multimedia/opus-tools/opus-tools_0.1.8.bb
@@ -1,7 +1,7 @@
 SUMMARY =3D "Opus Audio Tools"
 HOMEPAGE =3D "http://www.opus-codec.org/"
=20
-LICENSE =3D "BSD"
+LICENSE =3D "BSD-2-Clause"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D843a066da9f1facfcc6ea6f616ffecb=
1"
=20
 SRC_URI =3D "http://downloads.xiph.org/releases/opus/opus-tools-${PV}.tar.=
gz"
--=20
2.17.1

