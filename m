Return-Path: <christophe.priouzeau@st.com>
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
	[91.207.212.93])
	by mail.openembedded.org (Postfix) with ESMTP id 7FB567F990
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Oct 2019 09:34:37 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
	x9O9V2VE011932 for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Oct 2019 11:34:38 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
	h=from : to : cc : subject
	: date : message-id : references : in-reply-to : content-type :
	content-transfer-encoding : mime-version; s=STMicroelectronics;
	bh=uqy6P0UgjKG+Jhobd/fioAsvPfyUkreFF4jn1rvW7Ro=;
	b=PUocz0ovqrwrWRHZoBbkGs3UECFlWsBalDit3ndlUOizF5iBOsuuGZEi5MRXCRnvM+nb
	+v14R00rD7csncaw0TzjboxRcBNXf5FV7DtR66UopnbDOqXPfsIP6mAWdTxtg7ftPFTj
	QD+9KKflpQMN507T3+dba8wJLZxVudGc/kchcE5fZgcVGQAHLNR+epGWfo8MpcAP4zj8
	BNRP67aI51jVOcFykhXPPjOUFNc+BCC9GEJ8u3P9rK2PJ9ZMddYClVI1eOHz/5OCLwY4
	aobCBcyIWWqlzM/C34S14UUdOrY3MsbfxON4dxZFbnyuXUR6oquYlY9SEa5GG2So7tEe
	JA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by mx08-00178001.pphosted.com with ESMTP id 2vt9s50sjv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT) for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Oct 2019 11:34:38 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id BD5BB100039
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Oct 2019 11:34:37 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B69A321F169
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Oct 2019 11:34:37 +0200 (CEST)
Received: from SFHDAG6NODE2.st.com (10.75.127.17) by SFHDAG6NODE2.st.com
	(10.75.127.17) with Microsoft SMTP Server (TLS) id 15.0.1347.2;
	Thu, 24 Oct 2019 11:34:37 +0200
Received: from SFHDAG6NODE2.st.com ([fe80::a56f:c186:bab7:13d6]) by
	SFHDAG6NODE2.st.com ([fe80::a56f:c186:bab7:13d6%20]) with mapi id
	15.00.1347.000; Thu, 24 Oct 2019 11:34:37 +0200
From: Christophe PRIOUZEAU <christophe.priouzeau@st.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [meta-python][PATCH 04/10] Python: flask babel: Clarify BSD
	license variant
Thread-Index: AQHVik5Ayf0GpXRwkEuuznvB48Ay7g==
Date: Thu, 24 Oct 2019 09:34:37 +0000
Message-ID: <20191024093428.4538-4-christophe.priouzeau@st.com>
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
Subject: [meta-python][PATCH 04/10] Python: flask babel: Clarify BSD license variant
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
X-List-Received-Date: Thu, 24 Oct 2019 09:34:37 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

The License of python falsk babel is BSD-3-Clause.

Signed-off-by: Christophe Priouzeau <christophe.priouzeau@st.com>
---
 meta-python/recipes-devtools/python/python-flask-babel.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python-flask-babel.inc b/m=
eta-python/recipes-devtools/python/python-flask-babel.inc
index b60ee17d1..f560f3ed5 100644
--- a/meta-python/recipes-devtools/python/python-flask-babel.inc
+++ b/meta-python/recipes-devtools/python/python-flask-babel.inc
@@ -1,5 +1,5 @@
 DESCRIPTION =3D "i18n and l10n support for Flask based on babel and pytz"
-LICENSE =3D "BSD"
+LICENSE =3D "BSD-3-Clause"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D51917f3e8e858f5ae295a7d0e2eb3cc=
9"
=20
 SRC_URI[md5sum] =3D "07803453743f139309021572a799c6b3"
--=20
2.17.1

