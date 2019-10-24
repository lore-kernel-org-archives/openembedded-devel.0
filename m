Return-Path: <christophe.priouzeau@st.com>
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
	[91.207.212.93])
	by mail.openembedded.org (Postfix) with ESMTP id 1EA0F7F98C
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Oct 2019 09:34:36 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
	x9O9V0BX011913 for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Oct 2019 11:34:37 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
	h=from : to : cc : subject
	: date : message-id : references : in-reply-to : content-type :
	content-transfer-encoding : mime-version; s=STMicroelectronics;
	bh=lA3BnMvphJ216zlEXfb2KiGbUbV2H6hxhwynsOnlvfE=;
	b=zhoB4+/nDHyMauju806+wgvdAo2zHazePXKCTLvucJTY2S2o+Qo2ELukM87ocLCGWBdi
	QNP3EQunhlfw7T7eRPOdITmnSLbNq0/VCB6s2MyG4NHmUqcahXwP6nZon6rzxmWeS51b
	qYoAnYEfVvGoiBS/em7ZGCffXpURb1nU+kMMeBLdkGyolWkYZh5miAK+mbyxWGvjX8bt
	MjwzuWHIc1XA7qG+hM1oepdleknSz/BT3YpsWJnt5NvZbfuppP9LOWp7HYnMIGiZu8pX
	qXh5A47X2grXV/geIFFR5Vm3C3aP0WxtLx//yPjB3xsGoNRzzLisd7AipHHDodLpRFvF
	pw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by mx08-00178001.pphosted.com with ESMTP id 2vt9s50sjt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT) for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Oct 2019 11:34:37 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 53E1A10002A
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Oct 2019 11:34:37 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 4E65D21F169
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Oct 2019 11:34:37 +0200 (CEST)
Received: from SFHDAG6NODE2.st.com (10.75.127.17) by SFHDAG6NODE3.st.com
	(10.75.127.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3;
	Thu, 24 Oct 2019 11:34:36 +0200
Received: from SFHDAG6NODE2.st.com ([fe80::a56f:c186:bab7:13d6]) by
	SFHDAG6NODE2.st.com ([fe80::a56f:c186:bab7:13d6%20]) with mapi id
	15.00.1347.000; Thu, 24 Oct 2019 11:34:37 +0200
From: Christophe PRIOUZEAU <christophe.priouzeau@st.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [meta-python][PATCH 03/10] Python: feed formatter: Clarify BSD
	license variant
Thread-Index: AQHVik5AAVgvrbOFtkGF64y2efCaBw==
Date: Thu, 24 Oct 2019 09:34:36 +0000
Message-ID: <20191024093428.4538-3-christophe.priouzeau@st.com>
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
Subject: [meta-python][PATCH 03/10] Python: feed formatter: Clarify BSD license variant
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

The License of python feed formatter is BSD-3-Clause.

Signed-off-by: Christophe Priouzeau <christophe.priouzeau@st.com>
---
 meta-python/recipes-devtools/python/python-feedformatter.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python-feedformatter.inc b=
/meta-python/recipes-devtools/python/python-feedformatter.inc
index a333ef4ee..6ddcaa98e 100644
--- a/meta-python/recipes-devtools/python/python-feedformatter.inc
+++ b/meta-python/recipes-devtools/python/python-feedformatter.inc
@@ -1,7 +1,7 @@
 DESCRIPTION =3D "A Python library for generating news feeds in RSS and Ato=
m formats"
 HOMEPAGE =3D "http://code.google.com/p/feedformatter/"
 SECTION =3D "devel/python"
-LICENSE =3D "BSD"
+LICENSE =3D "BSD-3-Clause"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D258e3f39e2383fbd011035d04311008=
d"
 SRCREV =3D "7391193c83e10420b5a2d8ef846d23fc368c6d85"
=20
--=20
2.17.1

