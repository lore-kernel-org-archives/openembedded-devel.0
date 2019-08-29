Return-Path: <christophe.priouzeau@st.com>
X-Greylist: delayed 2564 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 29 Aug 2019 15:17:55 UTC
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
	[91.207.212.93])
	by mail.openembedded.org (Postfix) with ESMTP id 9DD7D7F1BA
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Aug 2019 15:17:54 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
	by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
	x7TEQ9lJ027919 for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Aug 2019 16:35:12 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
	h=from : to : cc : subject
	: date : message-id : content-type : content-transfer-encoding :
	mime-version; s=STMicroelectronics;
	bh=ig+ygBjuCfVhATfii6+DlK5KpEST9BWKU1Nbd0lGalg=;
	b=0/v8r1aXDfAinOBdMWkzhtglWRhcFGYmTPRyQD3PlvhfjTBi3wwvRVNITF9aK1+QC9Z0
	1i6Wjd+QAafNVXQLkJqOqE+WFkcnEXANk96vtQ9oJ+1BpmoxHX2wYBa5xRFg6lrhsu++
	HHCom1GtBX8crTc3/P9+qPytiZAfwc8wcMBhVGT2eFlQjMdpH8uz4gN+xJ0skXBZePfM
	Ta7N4cPOCzcwLh9YRfWYKb+ZG9v47QTl8pv/QmoYkc2g2ybPp0nG1l1EYBLVpTerOR6b
	dakH7DkrofIzsZrHtupgU/+LwJ+wdxU4/nkH+4vHfCDKBgV46D8sUJUNh46lkyBdK9B3
	0g== 
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx08-00178001.pphosted.com with ESMTP id 2upeajrsu0-1
	(version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Aug 2019 16:35:12 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 4AE154B
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Aug 2019 14:35:09 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 8327C2CF6D3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Aug 2019 16:35:08 +0200 (CEST)
Received: from SFHDAG6NODE2.st.com (10.75.127.17) by SFHDAG6NODE3.st.com
	(10.75.127.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3;
	Thu, 29 Aug 2019 16:35:08 +0200
Received: from SFHDAG6NODE2.st.com ([fe80::a56f:c186:bab7:13d6]) by
	SFHDAG6NODE2.st.com ([fe80::a56f:c186:bab7:13d6%20]) with mapi id
	15.00.1347.000; Thu, 29 Aug 2019 16:35:08 +0200
From: Christophe PRIOUZEAU <christophe.priouzeau@st.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [PATCH] python-script: update license md5sum
Thread-Index: AQHVXnb09OjxGk2GxEOw78XQ4qNQyw==
Date: Thu, 29 Aug 2019 14:35:07 +0000
Message-ID: <20190829143506.19291-1-christophe.priouzeau@st.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.46]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.70,1.0.8
	definitions=2019-08-29_06:2019-08-29,2019-08-29 signatures=0
Cc: Christophe PRIOUZEAU <christophe.priouzeau@st.com>
Subject: [PATCH] python-script: update license md5sum
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
X-List-Received-Date: Thu, 29 Aug 2019 15:17:56 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Update md5sum of license file.

Signed-off-by: Christophe Priouzeau <christophe.priouzeau@st.com>
---
 meta-python/recipes-devtools/python/python-scrypt.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python-scrypt.inc b/meta-p=
ython/recipes-devtools/python/python-scrypt.inc
index 783d05b7e..fef6ec976 100644
--- a/meta-python/recipes-devtools/python/python-scrypt.inc
+++ b/meta-python/recipes-devtools/python/python-scrypt.inc
@@ -1,6 +1,6 @@
 DESCRIPTION =3D "Bindings for the scrypt key derivation function library"
 LICENSE =3D "BSD-2-Clause"
-LIC_FILES_CHKSUM =3D "file://${COMMON_LICENSE_DIR}/BSD-2-Clause;md5=3D8bef=
8e6712b1be5aa76af1ebde9d6378"
+LIC_FILES_CHKSUM =3D "file://${COMMON_LICENSE_DIR}/BSD-2-Clause;md5=3Dcb64=
1bc04cda31daea161b1bc15da69f"
 HOMEPAGE=3D"https://bitbucket.org/mhallin/py-scrypt/overview"
=20
 FILESEXTRAPATHS_prepend :=3D "${THISDIR}/python-scrypt:"
--=20
2.17.1

