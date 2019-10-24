Return-Path: <christophe.priouzeau@st.com>
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
	[62.209.51.94])
	by mail.openembedded.org (Postfix) with ESMTP id F06F67F97B
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Oct 2019 09:20:39 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
	x9O9GPOQ016303 for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Oct 2019 11:20:37 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
	h=from : to : cc : subject
	: date : message-id : references : in-reply-to : content-type :
	content-transfer-encoding : mime-version; s=STMicroelectronics;
	bh=Kz2qvM8TURh/i5+WMDez07ZdR+vAhWjd45R+sIpaAA8=;
	b=LODMqy2nqkZVxodUdj75wD5dTb5K7owt7l1E99zxH2/D5TZKJlIka2PQbW/l5t/Nt3sr
	YOh9FKaoRywGH64Qj2hziPAN0fowy1vcNHBrCAU5Z7JNa/BsCRP48GbQxRT1yqmzEetR
	PHAp8Ko//E7m4yVQK0lpY5KfLE5LjULXiGkvyrSGs60kQypQCtYfixeAWD+eP7W7v2G7
	37sitw17RODCRePElpNVigckNciPBtoaqRP35TJWSuYbaT7iytL8vyisEF6ULoWr6x10
	3uoc8EiNIkdEN9k1ssDeRrBmS0w1bqLbz6uf6tfQ/zJzMC76u5VP9reX848JfJ8UMHLe
	ew== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by mx07-00178001.pphosted.com with ESMTP id 2vt9s1rs96-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT) for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Oct 2019 11:20:37 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id AC0FE10002A
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Oct 2019 11:20:36 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A5DBE21EAF1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Oct 2019 11:20:36 +0200 (CEST)
Received: from SFHDAG6NODE2.st.com (10.75.127.17) by SFHDAG6NODE2.st.com
	(10.75.127.17) with Microsoft SMTP Server (TLS) id 15.0.1347.2;
	Thu, 24 Oct 2019 11:20:36 +0200
Received: from SFHDAG6NODE2.st.com ([fe80::a56f:c186:bab7:13d6]) by
	SFHDAG6NODE2.st.com ([fe80::a56f:c186:bab7:13d6%20]) with mapi id
	15.00.1347.000; Thu, 24 Oct 2019 11:20:36 +0200
From: Christophe PRIOUZEAU <christophe.priouzeau@st.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [meta-python][PATCH 04/10] Python: pocket sphinx: Clarify BSD
	license variant
Thread-Index: AQHVikxL+wrWZRDZtkydhf+6aIg6uw==
Date: Thu, 24 Oct 2019 09:20:36 +0000
Message-ID: <20191024092032.2430-4-christophe.priouzeau@st.com>
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
Subject: [meta-python][PATCH 04/10] Python: pocket sphinx: Clarify BSD license variant
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
X-List-Received-Date: Thu, 24 Oct 2019 09:20:40 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

The License of python pocket sphinx is BSD-2-Clause.

Signed-off-by: Christophe Priouzeau <christophe.priouzeau@st.com>
---
 meta-python/recipes-devtools/python/python-pocketsphinx.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python-pocketsphinx.inc b/=
meta-python/recipes-devtools/python/python-pocketsphinx.inc
index 4c848b6dd..1f8f66a18 100644
--- a/meta-python/recipes-devtools/python/python-pocketsphinx.inc
+++ b/meta-python/recipes-devtools/python/python-pocketsphinx.inc
@@ -1,6 +1,6 @@
 SUMMARY =3D "This package provides a python interface to CMU Sphinxbase an=
d Pocketsphinx libraries created with SWIG and Setuptools."
 SECTION =3D "devel/python"
-LICENSE =3D "BSD"
+LICENSE =3D "BSD-2-Clause"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D826ebda787eb48e78aec2624f9faba7=
2"
=20
 SRC_URI[md5sum] =3D "c0f2bfd54bc4c438c3bb64825f57d575"
--=20
2.17.1

