Return-Path: <christophe.priouzeau@st.com>
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
	[91.207.212.93])
	by mail.openembedded.org (Postfix) with ESMTP id DBC617F996
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Oct 2019 09:34:37 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
	x9O9UxHB011908 for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Oct 2019 11:34:38 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
	h=from : to : cc : subject
	: date : message-id : references : in-reply-to : content-type :
	content-transfer-encoding : mime-version; s=STMicroelectronics;
	bh=jwFaT+c+gfXAI945mQfX4B+BLYL7JfkD0RNOrKOsuR4=;
	b=d1GmY0KxUxAFk2WyTqYEJtt1ZtwggRXQ5Z0mdaAptyiVpy7Yh1Yne4F2zior9h/H7yu8
	H2z38FiSZSlHvR7Jq8Zx/4i8vkBznegSNb6taf70YTI5W1pjcIqT4+oSZ0l+F00/i9n7
	KfUjqj3AP7a+XOiG0GN2t3dkRCYwZtcyQJn8ic9vgX68LXmdHsfVOqTTH9L+2URC8EjX
	+3PCZ+3FIOFNRSOqTHTo53D1aqOsxT/5lLb2yb4Bw/GiG0TiUKVveiSm1PKMQ2KXgcJG
	HLSVPfaKC4HFKr2xuyTyo1rRx+hVM1J7suISdZsYRk1c3D/zZJKtLmx8Ez5N8SoVMU1O
	Pg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by mx08-00178001.pphosted.com with ESMTP id 2vt9s50sjx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT) for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Oct 2019 11:34:38 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 36A8C10002A
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Oct 2019 11:34:38 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 3128E21F169
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Oct 2019 11:34:38 +0200 (CEST)
Received: from SFHDAG6NODE2.st.com (10.75.127.17) by SFHDAG6NODE2.st.com
	(10.75.127.17) with Microsoft SMTP Server (TLS) id 15.0.1347.2;
	Thu, 24 Oct 2019 11:34:37 +0200
Received: from SFHDAG6NODE2.st.com ([fe80::a56f:c186:bab7:13d6]) by
	SFHDAG6NODE2.st.com ([fe80::a56f:c186:bab7:13d6%20]) with mapi id
	15.00.1347.000; Thu, 24 Oct 2019 11:34:37 +0200
From: Christophe PRIOUZEAU <christophe.priouzeau@st.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [meta-python][PATCH 05/10] Python: falsk mail: Clarify BSD
	license variant
Thread-Index: AQHVik5A5uDyERzSNUSv1KiMlusanQ==
Date: Thu, 24 Oct 2019 09:34:37 +0000
Message-ID: <20191024093428.4538-5-christophe.priouzeau@st.com>
References: <20191024093428.4538-1-christophe.priouzeau@st.com>
In-Reply-To: <20191024093428.4538-1-christophe.priouzeau@st.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.47]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
	definitions=2019-10-24_06:2019-10-23,2019-10-24 signatures=0
Cc: Christophe PRIOUZEAU <christophe.priouzeau@st.com>
Subject: [meta-python][PATCH 05/10] Python: falsk mail: Clarify BSD license variant
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
X-List-Received-Date: Thu, 24 Oct 2019 09:34:38 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

The License of python falsk mail is BSD-3-Clause.

Signed-off-by: Christophe Priouzeau <christophe.priouzeau@st.com>
---
 meta-python/recipes-devtools/python/python-flask-mail.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python-flask-mail.inc b/me=
ta-python/recipes-devtools/python/python-flask-mail.inc
index bb0870348..0df276d15 100644
--- a/meta-python/recipes-devtools/python/python-flask-mail.inc
+++ b/meta-python/recipes-devtools/python/python-flask-mail.inc
@@ -1,7 +1,7 @@
 SUMMARY =3D "Flask extension for sending email"
 DESCRIPTION =3D "A Flask extension for sending email"
 HOMEPAGE =3D " https://github.com/rduplain/flask-email"
-LICENSE =3D "BSD"
+LICENSE =3D "BSD-3-Clause"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D5b16dfa6d3f275ace5985bb92949f77=
0"
=20
 SRC_URI[md5sum] =3D "04b35a42a44ec7aa724ec8ce55e2e08e"
--=20
2.17.1

