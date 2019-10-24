Return-Path: <christophe.priouzeau@st.com>
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
	[62.209.51.94])
	by mail.openembedded.org (Postfix) with ESMTP id 1AC677F967
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Oct 2019 14:56:05 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
	x9OEtmKN013706 for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Oct 2019 16:56:06 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
	h=from : to : cc : subject
	: date : message-id : content-type : content-transfer-encoding :
	mime-version; s=STMicroelectronics;
	bh=2acY/PMW0GRoVIUrW45efpNY1S4ueMrxLiHozMRZBCg=;
	b=I8AejyX1ThrVoErBTMa03PAQqQ5pPQltwx4ZrDesQ/Uc6lj+NLEtr4UYbf2IC3lsigDI
	gUOo7GBV7liNxP5mrNJBj5mdYwlFrkxI/V8mTaD1gEiz+/uWaWJwT6cDGjQiCzCbUPaT
	2Aa1R/ecUPw2AVK3lw7T1hMAo7p8BbfG+6eIueV+f+tenJ46703rQuS9cTpKaxwUTSEQ
	v7Sfn2Lb3rX429WfUsqibXwubI0LRkob6mz6yAwqf0Dep/wWHbIn1khe7bXDjKhPgHxT
	NMw6Gmxy0ebv4xEhA92v1UOUocDM88d3Pqo8RsnOtoOT/8iMPTX/U0i/Wfi5vtTdEdNN
	eA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by mx07-00178001.pphosted.com with ESMTP id 2vt9s1tfhk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT) for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Oct 2019 16:56:06 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 01EEE10002A
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Oct 2019 16:56:05 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E9E702C38B7
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Oct 2019 16:56:05 +0200 (CEST)
Received: from SFHDAG6NODE2.st.com (10.75.127.17) by SFHDAG6NODE3.st.com
	(10.75.127.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3;
	Thu, 24 Oct 2019 16:56:05 +0200
Received: from SFHDAG6NODE2.st.com ([fe80::a56f:c186:bab7:13d6]) by
	SFHDAG6NODE2.st.com ([fe80::a56f:c186:bab7:13d6%20]) with mapi id
	15.00.1347.000; Thu, 24 Oct 2019 16:56:05 +0200
From: Christophe PRIOUZEAU <christophe.priouzeau@st.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [meta-python][PATCH 1/9] Python: evdev: Clarify BSD license
	variant
Thread-Index: AQHVinsocFyOBij+Uk29oPaHrSyE/A==
Date: Thu, 24 Oct 2019 14:56:05 +0000
Message-ID: <20191024145603.21854-1-christophe.priouzeau@st.com>
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
Subject: [meta-python][PATCH 1/9] Python: evdev: Clarify BSD license variant
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

The License of python evdev is BSD-3-Clause.

Signed-off-by: Christophe Priouzeau <christophe.priouzeau@st.com>
---
 meta-python/recipes-devtools/python/python-evdev.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python-evdev.inc b/meta-py=
thon/recipes-devtools/python/python-evdev.inc
index 5a3884a6f..989d1e5f6 100644
--- a/meta-python/recipes-devtools/python/python-evdev.inc
+++ b/meta-python/recipes-devtools/python/python-evdev.inc
@@ -1,6 +1,6 @@
 SUMMARY =3D "Python evdev lib"
 HOMEPAGE =3D "https://github.com/gvalkov/python-evdev"
-LICENSE =3D "BSD"
+LICENSE =3D "BSD-3-Clause"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D18debddbb3f52c661a129724a883a8e=
2"
=20
 SRC_URI[md5sum] =3D "c7e855ae9f97f869a59e75b29f05ce74"
--=20
2.17.1

