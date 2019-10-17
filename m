Return-Path: <christophe.priouzeau@st.com>
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
	[62.209.51.94])
	by mail.openembedded.org (Postfix) with ESMTP id 17DC17F6BA
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Oct 2019 14:47:01 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
	x9HEk0Ks023511 for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Oct 2019 16:47:02 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
	h=from : to : cc : subject
	: date : message-id : content-type : content-transfer-encoding :
	mime-version; s=STMicroelectronics;
	bh=LEP/nABO9GdUkpmp39lRH4pk3t7IE8io462h31yQuJQ=;
	b=fY/yphOo4FG9L5HyC+lcfprLXhAYR8aSnzZ4Toae2iy7W7fPvyH8qiHxERnWAdtU6gah
	hGdNl2pTJVMM93+Lx2dsZKEtajoY4uVBx8wng1//laq0eOhyDq+PpCn5c6N3ur7+l9As
	2rnm/WHrDHjOWRpOXRiRO5hwrbv94SruaiH7mLVD/h+xvPBKN9sxvxWMoOkyNZIrF1Bg
	MXo9NpSwt7tFP76xHQSG8NYbCtrLgiXzOc/+eZ9aHJFthXcxFFCCVTUm2b9Iibk3w7Bd
	aUcmk63SZfWnaw9JCd8lBr8aAmRkhrc3WmuxMaaNKE9rCDRTPCtDYgEkf19MYhcBEJpx
	Iw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by mx07-00178001.pphosted.com with ESMTP id 2vk4kxcfb5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT) for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Oct 2019 16:47:02 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B3DCA10002A
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Oct 2019 16:47:00 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id AD6B12C606A
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Oct 2019 16:47:00 +0200 (CEST)
Received: from SFHDAG6NODE2.st.com (10.75.127.17) by SFHDAG6NODE2.st.com
	(10.75.127.17) with Microsoft SMTP Server (TLS) id 15.0.1347.2;
	Thu, 17 Oct 2019 16:47:00 +0200
Received: from SFHDAG6NODE2.st.com ([fe80::a56f:c186:bab7:13d6]) by
	SFHDAG6NODE2.st.com ([fe80::a56f:c186:bab7:13d6%20]) with mapi id
	15.00.1347.000; Thu, 17 Oct 2019 16:47:00 +0200
From: Christophe PRIOUZEAU <christophe.priouzeau@st.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [meta-oe][PATCH 1/7] sdparm: Clarify BSD license variant
Thread-Index: AQHVhPm74qjOnRRnC0GrkwyR1/hyhA==
Date: Thu, 17 Oct 2019 14:47:00 +0000
Message-ID: <20191017144659.24850-1-christophe.priouzeau@st.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.46]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
	definitions=2019-10-17_05:2019-10-17,2019-10-17 signatures=0
Cc: Christophe PRIOUZEAU <christophe.priouzeau@st.com>
Subject: [meta-oe][PATCH 1/7] sdparm: Clarify BSD license variant
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
X-List-Received-Date: Thu, 17 Oct 2019 14:47:02 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

The License of sdparm is BSD-3-Clause.

Signed-off-by: Christophe Priouzeau <christophe.priouzeau@st.com>
---
 meta-oe/recipes-support/sdparm/sdparm_1.10.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/sdparm/sdparm_1.10.bb b/meta-oe/recipe=
s-support/sdparm/sdparm_1.10.bb
index 35e22d3ea..c09b495be 100644
--- a/meta-oe/recipes-support/sdparm/sdparm_1.10.bb
+++ b/meta-oe/recipes-support/sdparm/sdparm_1.10.bb
@@ -3,7 +3,7 @@ DESCRIPTION =3D "The sdparm utility accesses and optionally=
 modifies \
 SCSI devices' mode page and inquiry data."
 HOMEPAGE =3D "http://sg.danny.cz/sg/sdparm.html"
 SECTION =3D "console/utils"
-LICENSE =3D "BSD"
+LICENSE =3D "BSD-3-Clause"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Decab6c36b7ba82c675581dd0afde36f=
7 \
                     file://lib/BSD_LICENSE;md5=3D1d52f4a66f1e0ed96776bf354=
ab7a2ed"
 DEPENDS=3D"sg3-utils"
--=20
2.17.1

