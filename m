Return-Path: <christophe.priouzeau@st.com>
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
	[62.209.51.94])
	by mail.openembedded.org (Postfix) with ESMTP id 8B30C7F841
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Oct 2019 15:16:37 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
	x9NFBWxo014762 for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Oct 2019 17:16:38 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
	h=from : to : cc : subject
	: date : message-id : references : in-reply-to : content-type :
	content-transfer-encoding : mime-version; s=STMicroelectronics;
	bh=RfBOh+38U65v9rvxL6azhN1Z4FJSTSUZ61I7PKf6T90=;
	b=UNg3opaoMoEpVtNFDHPsztk6ddz851iWyNV/CUkUlPxA1awhPAWhKRuGuR7UpDEGdBEQ
	OXGGq1sMt9fruCLF/Xb37BFBD3DU2YNAyWvAhLTj9SuSr/xDU6EdU+5GVCcCoxR/5Osu
	MI1QEKQUz7DUT9DmJdjKup20jisQxn62v3ofJDhWRYnCLzb1Cy9yPQVtZhl9u1M5F3nY
	5qFyv1m5gOWmj095jVR2svODWakSY3gfj600bhMQL5NcCl1rwSpwIxX796RxC8HgsgzS
	uJraerQAup3yb9f5sBNc5enByqYipARFDBDAPiSV1sLVWnVPJVGXm/Lsgc37v8zicxue
	5w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by mx07-00178001.pphosted.com with ESMTP id 2vt9s1mdke-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT) for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Oct 2019 17:16:38 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id DB426100034
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Oct 2019 17:16:37 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D3D532BF6AD
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Oct 2019 17:16:37 +0200 (CEST)
Received: from SFHDAG6NODE2.st.com (10.75.127.17) by SFHDAG6NODE2.st.com
	(10.75.127.17) with Microsoft SMTP Server (TLS) id 15.0.1347.2;
	Wed, 23 Oct 2019 17:16:37 +0200
Received: from SFHDAG6NODE2.st.com ([fe80::a56f:c186:bab7:13d6]) by
	SFHDAG6NODE2.st.com ([fe80::a56f:c186:bab7:13d6%20]) with mapi id
	15.00.1347.000; Wed, 23 Oct 2019 17:16:37 +0200
From: Christophe PRIOUZEAU <christophe.priouzeau@st.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [meta-oe][PATCH 04/10] scsirastools: Clarify BSD license variant
Thread-Index: AQHVibTdltOkwo6lZkKtuevYLGAEaQ==
Date: Wed, 23 Oct 2019 15:16:37 +0000
Message-ID: <20191023151634.32423-4-christophe.priouzeau@st.com>
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
Subject: [meta-oe][PATCH 04/10] scsirastools: Clarify BSD license variant
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
X-List-Received-Date: Wed, 23 Oct 2019 15:16:38 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

The License of scsirastools is BSD-3-Clause.

Signed-off-by: Christophe Priouzeau <christophe.priouzeau@st.com>
---
 meta-oe/recipes-extended/scsirastools/scsirastools_1.6.6.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/scsirastools/scsirastools_1.6.6.bb b/=
meta-oe/recipes-extended/scsirastools/scsirastools_1.6.6.bb
index b922bb1f1..2b7571e23 100644
--- a/meta-oe/recipes-extended/scsirastools/scsirastools_1.6.6.bb
+++ b/meta-oe/recipes-extended/scsirastools/scsirastools_1.6.6.bb
@@ -5,7 +5,7 @@ DESCRIPTION =3D "scsirastools were designed to add to the S=
erviceability of \
                maintenance or service functions. It handles SCSI, \
                Linux SW RAID, SAS, SATA, and USB devices via SCSI emulatio=
n."
 HOMEPAGE =3D "http://scsirastools.sourceforge.net/"
-LICENSE =3D "BSD"
+LICENSE =3D "BSD-3-Clause"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D687ea108478d26152ae46eb29d9d154=
5"
=20
 DEPENDS +=3D "groff-native"
--=20
2.17.1

