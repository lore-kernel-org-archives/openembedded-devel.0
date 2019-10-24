Return-Path: <christophe.priouzeau@st.com>
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
	[62.209.51.94])
	by mail.openembedded.org (Postfix) with ESMTP id 8B6007F967
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Oct 2019 14:56:06 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
	x9OEtm5d013715 for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Oct 2019 16:56:07 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
	h=from : to : cc : subject
	: date : message-id : references : in-reply-to : content-type :
	content-transfer-encoding : mime-version; s=STMicroelectronics;
	bh=XeQuW1FOgjYW8g1xbXJ2vT2SeJuJ8+FQkF5jKwXsBhI=;
	b=reWC+Z0rzhT9imlYjwrzWRH2on/QJvXK5oYEIwpF6V2085i73QxUgVFvfTOlblB6YrGP
	FXODty+HnLDUXgJJKJcvU3ZNotHoSd54zGdMsOuNeXTzkWkBOimjcbD76CYEG6+DVd3X
	NzYWDixgbKm8592eubaRVzArgR8zrKaz9EsO7NuMnVOozc9qi3ULsD+CWbHWv/kOidox
	R2/B82ymKTKlBKavohTRK5bTk9kqJvDN9CWlZhrOQoJIsi4RVnIqWX6fFb1vcTjwOgnw
	/joVtl4do4RUS2rwiFEyRalS5zWf70HSD+ZA2+H4f8CJGx0jPJgkdZM8gL609YUiV01x
	Og== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by mx07-00178001.pphosted.com with ESMTP id 2vt9s1tfhp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT) for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Oct 2019 16:56:07 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id CF94610002A
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Oct 2019 16:56:06 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C9CB82C38B7
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Oct 2019 16:56:06 +0200 (CEST)
Received: from SFHDAG6NODE2.st.com (10.75.127.17) by SFHDAG6NODE3.st.com
	(10.75.127.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3;
	Thu, 24 Oct 2019 16:56:06 +0200
Received: from SFHDAG6NODE2.st.com ([fe80::a56f:c186:bab7:13d6]) by
	SFHDAG6NODE2.st.com ([fe80::a56f:c186:bab7:13d6%20]) with mapi id
	15.00.1347.000; Thu, 24 Oct 2019 16:56:06 +0200
From: Christophe PRIOUZEAU <christophe.priouzeau@st.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [meta-python][PATCH 3/9] Python: pretend: Clarify BSD license
	variant
Thread-Index: AQHVinspv9QO1AZ4nkGQQTwWfnwCOA==
Date: Thu, 24 Oct 2019 14:56:06 +0000
Message-ID: <20191024145603.21854-3-christophe.priouzeau@st.com>
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
Subject: [meta-python][PATCH 3/9] Python: pretend: Clarify BSD license variant
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
X-List-Received-Date: Thu, 24 Oct 2019 14:56:06 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

The License of python pretend is BSD-3-Clause.

Signed-off-by: Christophe Priouzeau <christophe.priouzeau@st.com>
---
 meta-python/recipes-devtools/python/python-pretend.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python-pretend.inc b/meta-=
python/recipes-devtools/python/python-pretend.inc
index b342aef52..58f196199 100644
--- a/meta-python/recipes-devtools/python/python-pretend.inc
+++ b/meta-python/recipes-devtools/python/python-pretend.inc
@@ -1,6 +1,6 @@
 SUMMARY =3D "A library for stubbing in Python"
 HOMEPAGE =3D "https://github.com/alex/pretend"
-LICENSE =3D "BSD"
+LICENSE =3D "BSD-3-Clause"
 LIC_FILES_CHKSUM =3D "file://LICENSE.rst;md5=3D411780c0b7fa756753e94affeee=
5bc99"
=20
 SRC_URI[md5sum] =3D "ad53883ede48aeac7ae584f0de0240e8"
--=20
2.17.1

