Return-Path: <christophe.priouzeau@st.com>
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
	[62.209.51.94])
	by mail.openembedded.org (Postfix) with ESMTP id D666C7F847
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Oct 2019 15:16:39 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
	x9NFChWZ002278 for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Oct 2019 17:16:40 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
	h=from : to : cc : subject
	: date : message-id : references : in-reply-to : content-type :
	content-transfer-encoding : mime-version; s=STMicroelectronics;
	bh=bSTlS87oJFljacr7RDEjcZopOJxpYTB5f056B52W+1s=;
	b=vHyxX7dZDobIcHOeEq6kpLkQ3BVD9nPwx4789uU906DX2mb54QCRrPqUuDTHywnOWKLt
	60uUTuX3ERvj0qM2H1yrXEY6VZQ8G7lSZLt6nKr8n/51lFtWRhFhTNRcJxczqIPczQXH
	SMSXrWIsxe7vK3Ub+fB/sHNGoqVgSNntYbP9LJXe5HO22VU+rxzjHKtOMQyeOpbxJaFA
	BNAVjMX3M0+WdT/Iiq9PHFW5b977niM9IvZHtuA0FQsIkRRuhTjY8uZC4ctfZNE7bZsb
	FhtJJMn6pjlGZS6xxlfeZ1Vn7yznld6UmgGERLku1Ox9G1Gv4eDYC9KrSBwJz5eObO/h
	zA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by mx07-00178001.pphosted.com with ESMTP id 2vt9s44dey-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT) for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Oct 2019 17:16:40 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 31F0D100038
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Oct 2019 17:16:40 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2B7542BF6AE
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Oct 2019 17:16:40 +0200 (CEST)
Received: from SFHDAG6NODE2.st.com (10.75.127.17) by SFHDAG6NODE3.st.com
	(10.75.127.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3;
	Wed, 23 Oct 2019 17:16:39 +0200
Received: from SFHDAG6NODE2.st.com ([fe80::a56f:c186:bab7:13d6]) by
	SFHDAG6NODE2.st.com ([fe80::a56f:c186:bab7:13d6%20]) with mapi id
	15.00.1347.000; Wed, 23 Oct 2019 17:16:39 +0200
From: Christophe PRIOUZEAU <christophe.priouzeau@st.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [meta-oe][PATCH 10/10] testfloat: Clarify BSD license variant
Thread-Index: AQHVibTeBv9aUbPmf0u94/UW4XS78A==
Date: Wed, 23 Oct 2019 15:16:39 +0000
Message-ID: <20191023151634.32423-10-christophe.priouzeau@st.com>
References: <20191023151634.32423-1-christophe.priouzeau@st.com>
In-Reply-To: <20191023151634.32423-1-christophe.priouzeau@st.com>
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
Subject: [meta-oe][PATCH 10/10] testfloat: Clarify BSD license variant
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
X-List-Received-Date: Wed, 23 Oct 2019 15:16:40 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

The License of testfloat is BSD-3-Clause.

Signed-off-by: Christophe Priouzeau <christophe.priouzeau@st.com>
---
 meta-oe/recipes-test/testfloat/testfloat_3a.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-test/testfloat/testfloat_3a.bb b/meta-oe/recip=
es-test/testfloat/testfloat_3a.bb
index 28e967762..ace376ef2 100644
--- a/meta-oe/recipes-test/testfloat/testfloat_3a.bb
+++ b/meta-oe/recipes-test/testfloat/testfloat_3a.bb
@@ -4,7 +4,7 @@ DESCRIPTION =3D "Berkeley TestFloat is a small collection o=
f programs for \
=20
 HOMEPAGE =3D "http://www.jhauser.us/arithmetic/TestFloat.html"
=20
-LICENSE =3D "BSD"
+LICENSE =3D "BSD-3-Clause"
 LIC_FILES_CHKSUM =3D "file://TestFloat-${PV}/COPYING.txt;md5=3De45c175a323=
b5727777fb6bd4b26eafc"
=20
 SRC_URI =3D "\
--=20
2.17.1

