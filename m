Return-Path: <christophe.priouzeau@st.com>
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
	[91.207.212.93])
	by mail.openembedded.org (Postfix) with ESMTP id C00217F813
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Oct 2019 15:15:56 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
	by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
	x9NFETjt025713 for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Oct 2019 17:15:57 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
	h=from : to : cc : subject
	: date : message-id : references : in-reply-to : content-type :
	content-transfer-encoding : mime-version; s=STMicroelectronics;
	bh=LT+DWH2yTiQ3EUvl089mTW0r8MeUo0nnpplf/DHomx4=;
	b=YcF4csmNO0hGl1aY4/4+xsBnwDDjTjwID6+TWOeHeYsCK9fA9Pu+2o4c3ar/llBoESaz
	MfxuRWHiQryIG5nJQ5lIy46hb3Pobg9nlHWvaiEcOX01KpZzF2QlLveWC+QPB5cAKd2Z
	9/b/qMIAMc16P/k5+HelmgS54kfSr8Lv42R9s+ASOd5dh/cd00kjS/w+td8bPwcOXZ4D
	/IYQA7qIeAMvAYB5eCnlvh0TDpdJNA/HcUzmdMaIyAt8PKEtouwupGrUtoucrHMN6P+7
	KdRvk1YjJmrgjzx67hv3thTEQ8FW7q1UNP+ojucyEYV7EYeIa9lGPO4iBRREMDXgTZKI
	SA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by mx08-00178001.pphosted.com with ESMTP id 2vt9s74dr5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT) for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Oct 2019 17:15:57 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 18428100034
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Oct 2019 17:15:57 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1268C2B28CA
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Oct 2019 17:15:57 +0200 (CEST)
Received: from SFHDAG6NODE2.st.com (10.75.127.17) by SFHDAG6NODE3.st.com
	(10.75.127.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3;
	Wed, 23 Oct 2019 17:15:56 +0200
Received: from SFHDAG6NODE2.st.com ([fe80::a56f:c186:bab7:13d6]) by
	SFHDAG6NODE2.st.com ([fe80::a56f:c186:bab7:13d6%20]) with mapi id
	15.00.1347.000; Wed, 23 Oct 2019 17:15:56 +0200
From: Christophe PRIOUZEAU <christophe.priouzeau@st.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [meta-oe][PATCH 10/10] liblogging: Clarify BSD license variant
Thread-Index: AQHVibTEtGj7sbLK8EquplsEJcwXsA==
Date: Wed, 23 Oct 2019 15:15:56 +0000
Message-ID: <20191023151549.22648-10-christophe.priouzeau@st.com>
References: <20191023151549.22648-1-christophe.priouzeau@st.com>
In-Reply-To: <20191023151549.22648-1-christophe.priouzeau@st.com>
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
Subject: [meta-oe][PATCH 10/10] liblogging: Clarify BSD license variant
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
X-List-Received-Date: Wed, 23 Oct 2019 15:15:57 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

The License of liblogging is BSD-2-Clause.

Signed-off-by: Christophe Priouzeau <christophe.priouzeau@st.com>
---
 meta-oe/recipes-extended/liblogging/liblogging_1.0.6.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/liblogging/liblogging_1.0.6.bb b/meta=
-oe/recipes-extended/liblogging/liblogging_1.0.6.bb
index bb5984519..5c1c15159 100644
--- a/meta-oe/recipes-extended/liblogging/liblogging_1.0.6.bb
+++ b/meta-oe/recipes-extended/liblogging/liblogging_1.0.6.bb
@@ -8,7 +8,7 @@ sophisticated "behind the scenes" with better support for m=
ultiple threads \
 and flexibility for different log destinations (e.g. syslog and systemd \
 journal)."
 SECTION =3D "libs"
-LICENSE =3D "BSD"
+LICENSE =3D "BSD-2-Clause"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D63fe03535d83726f5655072502bef1b=
c"
 SRC_URI =3D "http://download.rsyslog.com/${BPN}/${BPN}-${PV}.tar.gz"
=20
--=20
2.17.1

