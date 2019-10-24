Return-Path: <christophe.priouzeau@st.com>
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
	[91.207.212.93])
	by mail.openembedded.org (Postfix) with ESMTP id E993E7F99A
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Oct 2019 15:07:43 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
	x9OF27To028794 for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Oct 2019 17:07:44 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
	h=from : to : cc : subject
	: date : message-id : references : in-reply-to : content-type :
	content-transfer-encoding : mime-version; s=STMicroelectronics;
	bh=340X2FhbEsWrDy1JE8Em50LjyMoCxkESdKgSzmhdT4k=;
	b=Au2GAZoutJxmELTC54FahzSgk2a+Rv190WeFkHhN4wqC6nPADPDj89jutlaS5iSYm6Ok
	AmNL95QpFrq0DQoBD9mlzEpeOZ5E0k3J9pl3ZtMLB3YnEjMe6yxcPgOBNSIRLOJ7RZqS
	UoCmnTJ7fQ6qPeeFNB8n1xIwVAbG1ZGyzAjce74mDSct9wucG6EbDo6Svv3tf13NlSjD
	XGeWjTMlhjxgujYiukmdcV0CEB7+AiWpacKvLDbwTKX0lXqbD5trJFVQKkk0niZfKU5O
	r6w3pjfFyY8+h9E4gXtcvPIBSfScfWXPfFInEc8znR2eC17CXqlEQANe5ifqUgKrhS4w
	3A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by mx08-00178001.pphosted.com with ESMTP id 2vt9s52ex0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT) for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Oct 2019 17:07:44 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id BE19210002A
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Oct 2019 17:07:43 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B84102C38D8
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Oct 2019 17:07:43 +0200 (CEST)
Received: from SFHDAG6NODE2.st.com (10.75.127.17) by SFHDAG6NODE3.st.com
	(10.75.127.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3;
	Thu, 24 Oct 2019 17:07:43 +0200
Received: from SFHDAG6NODE2.st.com ([fe80::a56f:c186:bab7:13d6]) by
	SFHDAG6NODE2.st.com ([fe80::a56f:c186:bab7:13d6%20]) with mapi id
	15.00.1347.000; Thu, 24 Oct 2019 17:07:42 +0200
From: Christophe PRIOUZEAU <christophe.priouzeau@st.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [meta-python][PATCH 2/9] Python: flask xstatic: Clarify BSD
	license variant
Thread-Index: AQHVinzI9irdJ62xHkae4RSOrZJZmA==
Date: Thu, 24 Oct 2019 15:07:42 +0000
Message-ID: <20191024150740.22983-2-christophe.priouzeau@st.com>
References: <20191024150740.22983-1-christophe.priouzeau@st.com>
In-Reply-To: <20191024150740.22983-1-christophe.priouzeau@st.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.46]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
	definitions=2019-10-24_09:2019-10-23,2019-10-24 signatures=0
Cc: Christophe PRIOUZEAU <christophe.priouzeau@st.com>
Subject: [meta-python][PATCH 2/9] Python: flask xstatic: Clarify BSD license variant
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
X-List-Received-Date: Thu, 24 Oct 2019 15:07:44 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

The License of python flask xstatic is BSD-2-Clause.

Signed-off-by: Christophe Priouzeau <christophe.priouzeau@st.com>
---
 meta-python/recipes-devtools/python/python-flask-xstatic.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python-flask-xstatic.inc b=
/meta-python/recipes-devtools/python/python-flask-xstatic.inc
index a1fe14ed4..48ff7149c 100644
--- a/meta-python/recipes-devtools/python/python-flask-xstatic.inc
+++ b/meta-python/recipes-devtools/python/python-flask-xstatic.inc
@@ -1,5 +1,5 @@
 DESCRIPTION =3D "XStatic support for flask"
-LICENSE =3D "BSD"
+LICENSE =3D "BSD-2-Clause"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D659968f6ebd4b70b6c3190d20b4a924=
c"
=20
 SRC_URI[md5sum] =3D "2f56023e1444c8bd1fec41afe93de743"
--=20
2.17.1

