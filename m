Return-Path: <christophe.priouzeau@st.com>
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
	[91.207.212.93])
	by mail.openembedded.org (Postfix) with ESMTP id D441D7F978
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Oct 2019 09:20:36 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
	by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
	x9O9GRa9030500 for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Oct 2019 11:20:37 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
	h=from : to : cc : subject
	: date : message-id : references : in-reply-to : content-type :
	content-transfer-encoding : mime-version; s=STMicroelectronics;
	bh=Xx3LVcUOekNwzMbCMP+nS+7QHpBjFje63gCdRoBSPC4=;
	b=rRoMM5KJjcqQSASsvpBBmo+P7EZaJ8NcsiNwPHOJEDzOiZXtzhjcUjJHFyjJr5pWiwop
	92owUlS2trdKdxA8/X3Soci+ICRXe2suUoQv6YWrE0PD/wu82PzekDYpyPJmIKLdcBfk
	njlJDiZmsLn3Hlb33j0q6duzLLg0pCpgNpIhvdXzkzDdcdJhKuhWYpZIuEgyF9l5Swtt
	oy/1+XeIrEZcyiI1RQ60PKKcdO9z8iyg06Fpj0qDJEr8dBK7pvVKXXV2Y0AyvL28um8t
	dfWINGZhyyjUDhLolCaFxrB83FALC6+8e3ohihS3YuIn7p3X7Zz61RMkyPwbf1dwgC7y
	+Q== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by mx08-00178001.pphosted.com with ESMTP id 2vt9s78q2b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT) for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Oct 2019 11:20:37 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 1FEF5100039
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Oct 2019 11:20:37 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 184B721EAF4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Oct 2019 11:20:37 +0200 (CEST)
Received: from SFHDAG6NODE2.st.com (10.75.127.17) by SFHDAG6NODE2.st.com
	(10.75.127.17) with Microsoft SMTP Server (TLS) id 15.0.1347.2;
	Thu, 24 Oct 2019 11:20:36 +0200
Received: from SFHDAG6NODE2.st.com ([fe80::a56f:c186:bab7:13d6]) by
	SFHDAG6NODE2.st.com ([fe80::a56f:c186:bab7:13d6%20]) with mapi id
	15.00.1347.000; Thu, 24 Oct 2019 11:20:36 +0200
From: Christophe PRIOUZEAU <christophe.priouzeau@st.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [meta-python][PATCH 05/10] Python: prompt toolkit: Clarify BSD
	license variant
Thread-Index: AQHVikxLcGLzkEXPl0qOCAWhzfr17Q==
Date: Thu, 24 Oct 2019 09:20:36 +0000
Message-ID: <20191024092032.2430-5-christophe.priouzeau@st.com>
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
Subject: [meta-python][PATCH 05/10] Python: prompt toolkit: Clarify BSD license variant
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
X-List-Received-Date: Thu, 24 Oct 2019 09:20:37 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

The License of python prompt toolkit is BSD-3-Clause.

Signed-off-by: Christophe Priouzeau <christophe.priouzeau@st.com>
---
 meta-python/recipes-devtools/python/python-prompt-toolkit.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python-prompt-toolkit.inc =
b/meta-python/recipes-devtools/python/python-prompt-toolkit.inc
index 1a4bd35c3..ef1b05639 100644
--- a/meta-python/recipes-devtools/python/python-prompt-toolkit.inc
+++ b/meta-python/recipes-devtools/python/python-prompt-toolkit.inc
@@ -1,5 +1,5 @@
 SUMMARY =3D "Library for building powerful interactive command lines in Py=
thon"
-LICENSE =3D "BSD"
+LICENSE =3D "BSD-3-Clause"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Db2cde7da89f0c1f3e49bf968d00d554=
f"
=20
 SRC_URI[md5sum] =3D "8db8b8e40e91bc6dce133d8d5727a717"
--=20
2.17.1

