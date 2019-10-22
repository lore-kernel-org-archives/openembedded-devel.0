Return-Path: <christophe.priouzeau@st.com>
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
	[91.207.212.93])
	by mail.openembedded.org (Postfix) with ESMTP id 49EF27F707
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Oct 2019 13:57:13 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
	x9MDuVqY009843 for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Oct 2019 15:57:14 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
	h=from : to : cc : subject
	: date : message-id : references : in-reply-to : content-type :
	content-transfer-encoding : mime-version; s=STMicroelectronics;
	bh=iWa+QJY7Ggdl/hPUmdNfXpbtZQTZSkkZok4YrFkp3Vo=;
	b=MqgQyaRm95edVoIzZs7cjIL0p1U26JIvyBEXjoEljbIlZTs7c66eB0SLwgUCHTVN82hL
	PLrrU5e+WqsiRUd1ld2ETtgnHiwYo2NlKuzaPTkhWstVZwjQ62C+LNWb+QVWsN6IzeeZ
	79bTs2nf4FE2dRRjyup8n9nhGYJUbhxprbo9vbaltx94mrX+tA/dJgQz/7X4fSUl0JQF
	nqZagq8DxIZRY+h8p3el/IxScEXQN1wuYcQ8H7XNzxv7L9tc1px6WjuLmQdCpRe56yZf
	prDnM9iVhYut1zJqQubIiUqJr7JpFMhTorNdFPNMS0/jl6gUSVm51kGwp42qLrIHqS+R
	Rg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by mx08-00178001.pphosted.com with ESMTP id 2vqwxy6s2v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT) for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Oct 2019 15:57:14 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 664F810002A
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Oct 2019 15:57:14 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 609AE2BB31F
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Oct 2019 15:57:14 +0200 (CEST)
Received: from SFHDAG6NODE2.st.com (10.75.127.17) by SFHDAG6NODE1.st.com
	(10.75.127.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3;
	Tue, 22 Oct 2019 15:57:13 +0200
Received: from SFHDAG6NODE2.st.com ([fe80::a56f:c186:bab7:13d6]) by
	SFHDAG6NODE2.st.com ([fe80::a56f:c186:bab7:13d6%20]) with mapi id
	15.00.1347.000; Tue, 22 Oct 2019 15:57:13 +0200
From: Christophe PRIOUZEAU <christophe.priouzeau@st.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [meta-webserver][PATCH 2/2] webmin: Clarify BSD license variant
Thread-Index: AQHViOCbaDJKiXIhu0K5l96FQhXylw==
Date: Tue, 22 Oct 2019 13:57:13 +0000
Message-ID: <20191022135710.1724-2-christophe.priouzeau@st.com>
References: <20191022135710.1724-1-christophe.priouzeau@st.com>
In-Reply-To: <20191022135710.1724-1-christophe.priouzeau@st.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.47]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
	definitions=2019-10-22_03:2019-10-22,2019-10-22 signatures=0
Cc: Christophe PRIOUZEAU <christophe.priouzeau@st.com>
Subject: [meta-webserver][PATCH 2/2] webmin: Clarify BSD license variant
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
X-List-Received-Date: Tue, 22 Oct 2019 13:57:14 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

The License of webmin is BSD-3-Clause.

Signed-off-by: Christophe Priouzeau <christophe.priouzeau@st.com>
---
 meta-webserver/recipes-webadmin/webmin/webmin_1.850.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-webserver/recipes-webadmin/webmin/webmin_1.850.bb b/meta-=
webserver/recipes-webadmin/webmin/webmin_1.850.bb
index d54d6223c..112365d4b 100644
--- a/meta-webserver/recipes-webadmin/webmin/webmin_1.850.bb
+++ b/meta-webserver/recipes-webadmin/webmin/webmin_1.850.bb
@@ -1,6 +1,6 @@
 SUMMARY =3D "Web-based administration interface"
 HOMEPAGE =3D "http://www.webmin.com"
-LICENSE =3D "BSD"
+LICENSE =3D "BSD-3-Clause"
 LIC_FILES_CHKSUM =3D "file://LICENCE;md5=3D0373ac9f611e542ddebe1ec6394afc3=
c"
=20
 SRC_URI =3D "${SOURCEFORGE_MIRROR}/webadmin/webmin-${PV}.tar.gz \
--=20
2.17.1

