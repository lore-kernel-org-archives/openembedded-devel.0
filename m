Return-Path: <christophe.priouzeau@st.com>
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
	[91.207.212.93])
	by mail.openembedded.org (Postfix) with ESMTP id 3468B7F97B
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Oct 2019 09:20:35 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
	by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
	x9O9GRse030495 for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Oct 2019 11:20:36 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
	h=from : to : cc : subject
	: date : message-id : references : in-reply-to : content-type :
	content-transfer-encoding : mime-version; s=STMicroelectronics;
	bh=ern3aTjnsgS2NjpfT8oaRghDMM+2A5nPM/6KNGX5Zps=;
	b=NE1qaMQpxw/+A2JCpkmafkOVT+BAZo98ycPhbRV6b25tx+AcrBM/z/WH6X5iTjmEb89C
	53onyJvKrdxD8OBOgeGy3uT5V78i0qkjwpXao7MBaZ3h5Y4O468fH0GaWwtC2eu6jhuc
	pAjZWIYpB1JUIGVNpaDKfRc/k+I7nr8Lqd1frJD4CComIbwz1QhYsqls3kQrjQmFFneu
	CTLapZd2MHuzNl9HlQwsl0zpjIaUQVfgHPgtvCNLDFK5BiTqXRGH5pGFw/vO9I2n5EBf
	QKvS0uQ9mIb4lBmVx5IFitm9j14QeqLTXzI9M7VzMcMB8qots5tqIIpfb/OelGDbVbCG
	ow== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by mx08-00178001.pphosted.com with ESMTP id 2vt9s78q29-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT) for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Oct 2019 11:20:36 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 4FC5B100038
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Oct 2019 11:20:36 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 48BD221EAF1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Oct 2019 11:20:36 +0200 (CEST)
Received: from SFHDAG6NODE2.st.com (10.75.127.17) by SFHDAG6NODE2.st.com
	(10.75.127.17) with Microsoft SMTP Server (TLS) id 15.0.1347.2;
	Thu, 24 Oct 2019 11:20:36 +0200
Received: from SFHDAG6NODE2.st.com ([fe80::a56f:c186:bab7:13d6]) by
	SFHDAG6NODE2.st.com ([fe80::a56f:c186:bab7:13d6%20]) with mapi id
	15.00.1347.000; Thu, 24 Oct 2019 11:20:35 +0200
From: Christophe PRIOUZEAU <christophe.priouzeau@st.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [meta-python][PATCH 03/10] Python: ply: Clarify BSD license
	variant
Thread-Index: AQHVikxLS7O02USW/ESHSiiP+lH5UQ==
Date: Thu, 24 Oct 2019 09:20:35 +0000
Message-ID: <20191024092032.2430-3-christophe.priouzeau@st.com>
References: <20191024092032.2430-1-christophe.priouzeau@st.com>
In-Reply-To: <20191024092032.2430-1-christophe.priouzeau@st.com>
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
Subject: [meta-python][PATCH 03/10] Python: ply: Clarify BSD license variant
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

The License of python ply is BSD-3-Clause.

Signed-off-by: Christophe Priouzeau <christophe.priouzeau@st.com>
---
 meta-python/recipes-devtools/python/python-ply.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python-ply.inc b/meta-pyth=
on/recipes-devtools/python/python-ply.inc
index a744950b6..149fe058f 100644
--- a/meta-python/recipes-devtools/python/python-ply.inc
+++ b/meta-python/recipes-devtools/python/python-ply.inc
@@ -2,7 +2,7 @@ SUMMARY =3D "Python Lex and Yacc"
 DESCRIPTION =3D "Python ply: PLY is yet another implementation of lex and =
yacc for Python"
 HOMEPAGE =3D "https://pypi.python.org/pypi/ply"
 SECTION =3D "devel/python"
-LICENSE =3D "BSD"
+LICENSE =3D "BSD-3-Clause"
 LIC_FILES_CHKSUM =3D "file://README.md;beginline=3D5;endline=3D32;md5=3Df5=
ee5c355c0e6719c787a71b8f0fa96c"
=20
 SRC_URI[md5sum] =3D "6465f602e656455affcd7c5734c638f8"
--=20
2.17.1

