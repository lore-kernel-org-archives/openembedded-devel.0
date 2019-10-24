Return-Path: <christophe.priouzeau@st.com>
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
	[62.209.51.94])
	by mail.openembedded.org (Postfix) with ESMTP id C24357F978
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Oct 2019 09:20:35 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
	x9O9GS7s013923 for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Oct 2019 11:20:35 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
	h=from : to : cc : subject
	: date : message-id : content-type : content-transfer-encoding :
	mime-version; s=STMicroelectronics;
	bh=rnCqHJIiM/GjPDR1NJFs99aoCUbC0JpaFyO8wF4LLjw=;
	b=J15fP6/ndZZXgIFWK2duXAt3fUyA15C2F7JPW9WkfiG/9ItlShlUeGKqUseETOo9tjHD
	EgmUHPw5T6DTu/aGtScrn5sfvWFOp61MiiwLPbdIgsl/oqbfhc8Fgb//PIYcQ8zp43tk
	TAXBQTy5hc23OPk09qYuHKUf0QNn02P/mQRjy47CpP+HUVuY14LN2zZ0PHHuTMK0tYDv
	TZxRAAsx3ZBdRfxJLurKkSP6MvW7EyKNrVCMHr+x2Elm0YzWBYCGAuElfogPqJhHJi4Q
	9qp/s3xMkBgbqq+xPh2dxkmGhw0TYKmgiLfEcjWpFT6HnK+YYi+jJvqcoV2ca2lbqyho
	DQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by mx07-00178001.pphosted.com with ESMTP id 2vt9s48scb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT) for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Oct 2019 11:20:35 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 5CC6A10003B
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Oct 2019 11:20:35 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 51A6E21EAF1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Oct 2019 11:20:35 +0200 (CEST)
Received: from SFHDAG6NODE2.st.com (10.75.127.17) by SFHDAG6NODE2.st.com
	(10.75.127.17) with Microsoft SMTP Server (TLS) id 15.0.1347.2;
	Thu, 24 Oct 2019 11:20:35 +0200
Received: from SFHDAG6NODE2.st.com ([fe80::a56f:c186:bab7:13d6]) by
	SFHDAG6NODE2.st.com ([fe80::a56f:c186:bab7:13d6%20]) with mapi id
	15.00.1347.000; Thu, 24 Oct 2019 11:20:35 +0200
From: Christophe PRIOUZEAU <christophe.priouzeau@st.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [meta-python][PATCH 01/10] Python: flask-sqlalchemy: Clarify BSD
	license variant
Thread-Index: AQHVikxKRyzjqFY6u0WPE82VUr7eHA==
Date: Thu, 24 Oct 2019 09:20:34 +0000
Message-ID: <20191024092032.2430-1-christophe.priouzeau@st.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.45]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
	definitions=2019-10-24_06:2019-10-23,2019-10-24 signatures=0
Cc: Christophe PRIOUZEAU <christophe.priouzeau@st.com>
Subject: [meta-python][PATCH 01/10] Python: flask-sqlalchemy: Clarify BSD license variant
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
X-List-Received-Date: Thu, 24 Oct 2019 09:20:36 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

The License of python flask-sqlalchemy is BSD-3-Clause.

Signed-off-by: Christophe Priouzeau <christophe.priouzeau@st.com>
---
 meta-python/recipes-devtools/python/python-flask-sqlalchemy.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python-flask-sqlalchemy.in=
c b/meta-python/recipes-devtools/python/python-flask-sqlalchemy.inc
index e0efbc63a..957d07dbb 100644
--- a/meta-python/recipes-devtools/python/python-flask-sqlalchemy.inc
+++ b/meta-python/recipes-devtools/python/python-flask-sqlalchemy.inc
@@ -1,5 +1,5 @@
 DESCRIPTION =3D "Adds SQLAlchemy support to your Flask application."
-LICENSE =3D "BSD"
+LICENSE =3D "BSD-3-Clause"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D5ed1b8cc741515a835a7f6bf2f62ef4=
a"
=20
 SRC_URI[md5sum] =3D "373ce61dfd03b593ad2eaba68c9fee35"
--=20
2.17.1

