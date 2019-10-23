Return-Path: <christophe.priouzeau@st.com>
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
	[62.209.51.94])
	by mail.openembedded.org (Postfix) with ESMTP id 737F87F840
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Oct 2019 15:16:37 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
	x9NFChWX002278 for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Oct 2019 17:16:36 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
	h=from : to : cc : subject
	: date : message-id : content-type : content-transfer-encoding :
	mime-version; s=STMicroelectronics;
	bh=GcESgokjhzS3QH6g68S9carN1+jWSXrVJJLuBu+EP2Y=;
	b=Jwk/kTvg9ZUtOoB6jEFP0Hrd6GSKx+aGdwUE17Qj1DeSbeZkVyz9s0i+/TeIq5l4RGI+
	EHw+uFo6E1feZIlK2WEJm8fH8fdsobrbpJM0Kc1ZaOWzCiogb/IUSviuOZQscHdmTfJM
	TDlzObInPVecZoAqXXQjaLcD2DXJhGwFiIWssr3WZ2ck5LxwUw2V8AYF/csMnCTuUXW+
	7WV+/lYLUv05BZBXV0j4314o+/h2AbovJLOux6XiTKpI1u8N1DeNkKozrhKpYhnHS3Kh
	lW7L9Wk3VFhDNZkXcF8DeiRbYF13G6SzJemrmXpdBNvfz5WFNSj8CxYDpERQJUFX3qzC
	cA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by mx07-00178001.pphosted.com with ESMTP id 2vt9s44deg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT) for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Oct 2019 17:16:36 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 79C6610002A
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Oct 2019 17:16:36 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 729972BF6AD
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Oct 2019 17:16:36 +0200 (CEST)
Received: from SFHDAG6NODE2.st.com (10.75.127.17) by SFHDAG6NODE3.st.com
	(10.75.127.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3;
	Wed, 23 Oct 2019 17:16:36 +0200
Received: from SFHDAG6NODE2.st.com ([fe80::a56f:c186:bab7:13d6]) by
	SFHDAG6NODE2.st.com ([fe80::a56f:c186:bab7:13d6%20]) with mapi id
	15.00.1347.000; Wed, 23 Oct 2019 17:16:36 +0200
From: Christophe PRIOUZEAU <christophe.priouzeau@st.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [meta-oe][PATCH 01/10] openwsman: Clarify BSD license variant
Thread-Index: AQHVibTcEJQ4ZFbiEkykvWQRWuU8fQ==
Date: Wed, 23 Oct 2019 15:16:36 +0000
Message-ID: <20191023151634.32423-1-christophe.priouzeau@st.com>
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
Subject: [meta-oe][PATCH 01/10] openwsman: Clarify BSD license variant
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

The License of openwsman is BSD-3-Clause.

Signed-off-by: Christophe Priouzeau <christophe.priouzeau@st.com>
---
 meta-oe/recipes-extended/openwsman/openwsman_2.6.9.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/openwsman/openwsman_2.6.9.bb b/meta-o=
e/recipes-extended/openwsman/openwsman_2.6.9.bb
index e5bb0765f..f9292790c 100644
--- a/meta-oe/recipes-extended/openwsman/openwsman_2.6.9.bb
+++ b/meta-oe/recipes-extended/openwsman/openwsman_2.6.9.bb
@@ -26,7 +26,7 @@ SRC_URI =3D "git://github.com/Openwsman/openwsman.git \
=20
 S =3D "${WORKDIR}/git"
=20
-LICENSE =3D "BSD"
+LICENSE =3D "BSD-3-Clause"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd4f53d4c6cf73b9d43186ce3be6dd0b=
a"
=20
 inherit systemd cmake pkgconfig python3native perlnative
--=20
2.17.1

