Return-Path: <christophe.priouzeau@st.com>
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
	[91.207.212.93])
	by mail.openembedded.org (Postfix) with ESMTP id 6E8407F725
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Oct 2019 14:19:10 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
	by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
	x9ME0rjP011264 for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Oct 2019 16:19:11 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
	h=from : to : cc : subject
	: date : message-id : references : in-reply-to : content-type :
	content-transfer-encoding : mime-version; s=STMicroelectronics;
	bh=lmeHzlw+A7qUCYSQWknK01BiYqd4JPUr22mhCBNx8qc=;
	b=RFaijGaoAsgxtIzgt6hzEWATNLbavB2EJxWWOVdQATScogQUpLbM83A6cWJEdK9ysBiS
	MIW75Lcw3MYOoTdThXSSyNLneU589ea8MWtb07JxuTlRaaW2i1AXjcmqUA8yc82zZdrH
	Y/tkExU/vVZz+s3evm4ax647WNu/108oMXQa6zAYGIZgVsGIX9DmfjNjY3ZELHSAJiJG
	bSDbL762ndaMlPK3LUv9WxpIzhk0rClZW/wfNGv0CReOLbuwclPr1GSX5+SnoAC8yOUe
	gBlPcA3M0c1Ht0CEydP2nFbINFZpuVKuudNHwyk5vWSrRKMbimKCZOGzLEFC8cV4iQyh
	iQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by mx08-00178001.pphosted.com with ESMTP id 2vqwva6wba-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT) for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Oct 2019 16:19:10 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7054710002A
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Oct 2019 16:19:10 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 6AC082B28E0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Oct 2019 16:19:10 +0200 (CEST)
Received: from SFHDAG6NODE2.st.com (10.75.127.17) by SFHDAG6NODE1.st.com
	(10.75.127.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3;
	Tue, 22 Oct 2019 16:19:09 +0200
Received: from SFHDAG6NODE2.st.com ([fe80::a56f:c186:bab7:13d6]) by
	SFHDAG6NODE2.st.com ([fe80::a56f:c186:bab7:13d6%20]) with mapi id
	15.00.1347.000; Tue, 22 Oct 2019 16:19:09 +0200
From: Christophe PRIOUZEAU <christophe.priouzeau@st.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [meta-networking][PATCH 02/16] cyrus-sasl: Clarify BSD license
	variant
Thread-Index: AQHViOOr1MziL8yrw0GCazkA4FUNuw==
Date: Tue, 22 Oct 2019 14:19:09 +0000
Message-ID: <20191022141907.4412-2-christophe.priouzeau@st.com>
References: <20191022141907.4412-1-christophe.priouzeau@st.com>
In-Reply-To: <20191022141907.4412-1-christophe.priouzeau@st.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.49]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
	definitions=2019-10-22_03:2019-10-22,2019-10-22 signatures=0
Cc: Christophe PRIOUZEAU <christophe.priouzeau@st.com>
Subject: [meta-networking][PATCH 02/16] cyrus-sasl: Clarify BSD license variant
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
X-List-Received-Date: Tue, 22 Oct 2019 14:19:11 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

The License of cyrus-sasl is BSD-4-Clause.
---
 meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.27.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.27.b=
b b/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.27.bb
index 594e55da1..be7131d7d 100644
--- a/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.27.bb
+++ b/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.27.bb
@@ -2,7 +2,7 @@ SUMMARY =3D "Generic client/server library for SASL authent=
ication"
 SECTION =3D "libs"
 HOMEPAGE =3D "http://asg.web.cmu.edu/sasl/"
 DEPENDS =3D "openssl db groff-native"
-LICENSE =3D "BSD"
+LICENSE =3D "BSD-4-Clause"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D3f55e0974e3d6db00ca6f57f2d20639=
6"
=20
 SRCREV =3D "e41cfb986c1b1935770de554872247453fdbb079"
--=20
2.17.1

