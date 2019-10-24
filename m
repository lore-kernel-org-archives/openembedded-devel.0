Return-Path: <christophe.priouzeau@st.com>
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
	[62.209.51.94])
	by mail.openembedded.org (Postfix) with ESMTP id C13A67F875
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Oct 2019 09:20:35 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
	x9O9GS7t013923 for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Oct 2019 11:20:36 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
	h=from : to : cc : subject
	: date : message-id : references : in-reply-to : content-type :
	content-transfer-encoding : mime-version; s=STMicroelectronics;
	bh=BFcWZYM8A9+1VnH79v40uGILOhGK2DgHwJTP7Dx77VM=;
	b=S9lqFJT0drFa/aUi+hFMfpBJH/tRmnNsK3/6kcyfcjko/yLJRDJ6RmZrzhLWkpYwPpAL
	6drb8Nfwpl5h9BgYJu8cO8q1gz2OP48ZS7TC/BzVZaPBHg3ziwLQrDXpb1cMJNz6nPTr
	ouEZwQFq4clbxT00ZvzKHgKBXsjp4jYUPsR37/cTpF0Y/bg2qGtZi/hEOqxAdSgyCbOD
	jVajj32V56BCZBRp4yyRZ5g9Rt2jB3lq2wdQDD2vSveJqZRjPRUzBn9IT2qgoOXiydPi
	XsRQQ1a2tmU5ssx1jU+FFwCD9lpCLyqjWFa3qdRXNzKQbyUtmr3cM8UaEzI/HnexvjBL
	bw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by mx07-00178001.pphosted.com with ESMTP id 2vt9s48sce-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT) for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Oct 2019 11:20:36 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id D9A5210002A
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Oct 2019 11:20:35 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D3B0721EAF1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Oct 2019 11:20:35 +0200 (CEST)
Received: from SFHDAG6NODE2.st.com (10.75.127.17) by SFHDAG6NODE1.st.com
	(10.75.127.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3;
	Thu, 24 Oct 2019 11:20:35 +0200
Received: from SFHDAG6NODE2.st.com ([fe80::a56f:c186:bab7:13d6]) by
	SFHDAG6NODE2.st.com ([fe80::a56f:c186:bab7:13d6%20]) with mapi id
	15.00.1347.000; Thu, 24 Oct 2019 11:20:35 +0200
From: Christophe PRIOUZEAU <christophe.priouzeau@st.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [meta-python][PATCH 02/10] Python: meld3: Clarify BSD license
	variant
Thread-Index: AQHVikxKtyHykeifYUC8cqMoWEIqYg==
Date: Thu, 24 Oct 2019 09:20:35 +0000
Message-ID: <20191024092032.2430-2-christophe.priouzeau@st.com>
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
Subject: [meta-python][PATCH 02/10] Python: meld3: Clarify BSD license variant
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

The License of python meld3 is BSD-4-Clause.

Signed-off-by: Christophe Priouzeau <christophe.priouzeau@st.com>
---
 meta-python/recipes-devtools/python/python-meld3.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python-meld3.inc b/meta-py=
thon/recipes-devtools/python/python-meld3.inc
index d4e274e60..558e436c9 100644
--- a/meta-python/recipes-devtools/python/python-meld3.inc
+++ b/meta-python/recipes-devtools/python/python-meld3.inc
@@ -5,7 +5,7 @@ template markup and dynamic rendering logic separate from o=
ne \
 another.  See http://www.entrian.com/PyMeld for a treatise on the \
 benefits of this pattern."
 HOMEPAGE =3D "https://github.com/supervisor/meld3"
-LICENSE =3D "BSD"
+LICENSE =3D "BSD-4-Clause"
 LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D9e7581cef5645475fcefebdc15e=
d7abf"
=20
 SRC_URI[md5sum] =3D "3ccc78cd79cffd63a751ad7684c02c91"
--=20
2.17.1

