Return-Path: <christophe.priouzeau@st.com>
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
	[62.209.51.94])
	by mail.openembedded.org (Postfix) with ESMTP id 3DD8E7F6C5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Oct 2019 14:47:02 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
	x9HEjx2l023508 for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Oct 2019 16:47:02 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
	h=from : to : cc : subject
	: date : message-id : references : in-reply-to : content-type :
	content-transfer-encoding : mime-version; s=STMicroelectronics;
	bh=tNgOQDKeQrnA17WgVeY4OQc/BnB0QWR2s8+Lg3gbTIQ=;
	b=HIvMZ6KG4bUwEXK8i+2O9++0RLkgOgbzfSmxvyOY+VCA1pkxvl3wD149RmUXeHKW6tde
	94GR2BPEWweEgLJJA+xh/m/1uBRNxfDbBgKyneIDTJ1Osd/UwQxNXZ1mBYKjo+IzZUYV
	6Rn0yVJw0bBhxsPMtFWO1yb2m89DdFibGM9+1eMKfUZ5JXXKMwB9+lDADrxzffmEDK/R
	lyEwu8svL4m5WpiDiWKCFw/MDxNlvp6B5K1L2fYSakT7a/O4w4YmO7H3rVqxezrGa6pV
	z/58tkpVTorM1HLpULs2A0139r6rLjKTWfruYj03kZcM3bWd8VAT6nqv8CsaPzXsdIj5
	hw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by mx07-00178001.pphosted.com with ESMTP id 2vk4kxcfbc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT) for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Oct 2019 16:47:02 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 79B15100038
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Oct 2019 16:47:02 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 71F652C6068
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Oct 2019 16:47:02 +0200 (CEST)
Received: from SFHDAG6NODE2.st.com (10.75.127.17) by SFHDAG6NODE3.st.com
	(10.75.127.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3;
	Thu, 17 Oct 2019 16:47:01 +0200
Received: from SFHDAG6NODE2.st.com ([fe80::a56f:c186:bab7:13d6]) by
	SFHDAG6NODE2.st.com ([fe80::a56f:c186:bab7:13d6%20]) with mapi id
	15.00.1347.000; Thu, 17 Oct 2019 16:47:02 +0200
From: Christophe PRIOUZEAU <christophe.priouzeau@st.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [meta-oe][PATCH 2/7] onig: Clarify BSD license variant
Thread-Index: AQHVhPm8C1LUYXy0pUy2vhXyHF57+g==
Date: Thu, 17 Oct 2019 14:47:01 +0000
Message-ID: <20191017144659.24850-2-christophe.priouzeau@st.com>
References: <20191017144659.24850-1-christophe.priouzeau@st.com>
In-Reply-To: <20191017144659.24850-1-christophe.priouzeau@st.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.46]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
	definitions=2019-10-17_05:2019-10-17,2019-10-17 signatures=0
Cc: Christophe PRIOUZEAU <christophe.priouzeau@st.com>
Subject: [meta-oe][PATCH 2/7] onig: Clarify BSD license variant
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
X-List-Received-Date: Thu, 17 Oct 2019 14:47:02 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

The License of onig is BSD-2-Clause.

Signed-off-by: Christophe Priouzeau <christophe.priouzeau@st.com>
---
 meta-oe/recipes-support/onig/onig_5.9.6.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/onig/onig_5.9.6.bb b/meta-oe/recipes-s=
upport/onig/onig_5.9.6.bb
index abbaf98c0..20a71c6c9 100644
--- a/meta-oe/recipes-support/onig/onig_5.9.6.bb
+++ b/meta-oe/recipes-support/onig/onig_5.9.6.bb
@@ -2,7 +2,7 @@ DESCRIPTION =3D "Regular expressions library. The character=
istics of this \
 library is that different character encoding for every regular expression =
\
 object can be specified."
 HOMEPAGE =3D "https://web.archive.org/web/20150807014439/http://www.geocit=
ies.jp/kosako3/oniguruma/"
-LICENSE =3D "BSD"
+LICENSE =3D "BSD-2-Clause"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D0d4861b5bc0c392a5aa90d9d76ebd86=
f"
=20
 SRC_URI =3D "https://web.archive.org/web/20150807014439/http://www.geociti=
es.jp/kosako3/oniguruma/archive/${BP}.tar.gz \
--=20
2.17.1

