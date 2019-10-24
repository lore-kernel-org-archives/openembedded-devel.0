Return-Path: <christophe.priouzeau@st.com>
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
	[91.207.212.93])
	by mail.openembedded.org (Postfix) with ESMTP id A106D7F9C8
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Oct 2019 14:56:09 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
	by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
	x9OEu4ex020652 for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Oct 2019 16:56:10 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
	h=from : to : cc : subject
	: date : message-id : references : in-reply-to : content-type :
	content-transfer-encoding : mime-version; s=STMicroelectronics;
	bh=SO3PIliselEaxvrBa9Zy5V35XFxJq4RSYgS4cJ9XDvk=;
	b=UqLRSswOcJSi4LAGj5cO80stezJf8tCgSWCENPAWm2warEqsWziz5y1ptyL/X2Fak3Fb
	6chHxXDZ6XOacEmvExrOmFUQX02jsUs54OQkdysRsNMWnaj+rUvxJM2M/jWTpke+pUq2
	cNmF+6mxHTvq4ALbdQ/vaIteFJo1h5OoeqxfwgZc+t0SePz/dSXTUB8vygWE7p8+vJpP
	g96u/53Fdg6GXWpdlGfhjeaRRaabn133wljFT+t65qh3P2Ohh6QZ8UdsLM27+kNde4Tf
	YmehFSSYMoRAwimP9UAdhggVZYN+smcJTTebnSMW2XYyixzABUNckXycZ319ggOygeCP
	iQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by mx08-00178001.pphosted.com with ESMTP id 2vt9s7acq9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT) for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Oct 2019 16:56:10 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 8C09F10002A
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Oct 2019 16:56:08 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 869612C38B7
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Oct 2019 16:56:08 +0200 (CEST)
Received: from SFHDAG6NODE2.st.com (10.75.127.17) by SFHDAG6NODE2.st.com
	(10.75.127.17) with Microsoft SMTP Server (TLS) id 15.0.1347.2;
	Thu, 24 Oct 2019 16:56:07 +0200
Received: from SFHDAG6NODE2.st.com ([fe80::a56f:c186:bab7:13d6]) by
	SFHDAG6NODE2.st.com ([fe80::a56f:c186:bab7:13d6%20]) with mapi id
	15.00.1347.000; Thu, 24 Oct 2019 16:56:07 +0200
From: Christophe PRIOUZEAU <christophe.priouzeau@st.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [meta-python][PATCH 7/9] Python: wtforms: Clarify BSD license
	variant
Thread-Index: AQHVinsq02lQvstiskuE0l8dQthw1Q==
Date: Thu, 24 Oct 2019 14:56:07 +0000
Message-ID: <20191024145603.21854-7-christophe.priouzeau@st.com>
References: <20191024145603.21854-1-christophe.priouzeau@st.com>
In-Reply-To: <20191024145603.21854-1-christophe.priouzeau@st.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.47]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
	definitions=2019-10-24_09:2019-10-23,2019-10-24 signatures=0
Cc: Christophe PRIOUZEAU <christophe.priouzeau@st.com>
Subject: [meta-python][PATCH 7/9] Python: wtforms: Clarify BSD license variant
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
X-List-Received-Date: Thu, 24 Oct 2019 14:56:10 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

The License of python wtforms is BSD-3-Clause.

Signed-off-by: Christophe Priouzeau <christophe.priouzeau@st.com>
---
 meta-python/recipes-devtools/python/python-wtforms.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python-wtforms.inc b/meta-=
python/recipes-devtools/python/python-wtforms.inc
index 868686bfe..93c5bc4e9 100644
--- a/meta-python/recipes-devtools/python/python-wtforms.inc
+++ b/meta-python/recipes-devtools/python/python-wtforms.inc
@@ -1,7 +1,7 @@
 DESCRIPTION =3D "A flexible forms validation and rendering library for pyt=
hon web development."
 HOMEPAGE =3D "https://pypi.python.org/pypi/WTForms"
 SECTION =3D "devel/python"
-LICENSE =3D "BSD"
+LICENSE =3D "BSD-3-Clause"
 LIC_FILES_CHKSUM =3D "file://PKG-INFO;md5=3Dc4660c132770d5d0a5757541f6b794=
93"
=20
 SRC_URI[md5sum] =3D "41c0008dbe7bd98892c58f7457a46a4a"
--=20
2.17.1

