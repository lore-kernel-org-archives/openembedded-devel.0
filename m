Return-Path: <christophe.priouzeau@st.com>
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
	[91.207.212.93])
	by mail.openembedded.org (Postfix) with ESMTP id 08E357F731
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Oct 2019 14:19:10 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
	by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
	x9ME0sDM011279 for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Oct 2019 16:19:11 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
	h=from : to : cc : subject
	: date : message-id : references : in-reply-to : content-type :
	content-transfer-encoding : mime-version; s=STMicroelectronics;
	bh=gh8kQ+5yJu/ic8B6UA1+jY7lp1L+3/mqwTkzy4i0dH4=;
	b=mZkx55zsLbunZ+R5rtKVEUWc83qFRKGNUJxJY0hgjckm3T161BlRtPPVqeQ+fBmymNd7
	XRTp9w3mNIagr87HzZaKfeycAcAh9hLyxghVK3ZLcTTaN/mHJTrnOA33QYNOtByrAsWy
	XS+r4h2UyQ9hajLVewF01vlzWH7D+EsgqAwUexPjbSIrRQ0IM3zUFwhDK3u4i6trJoy2
	302RSafmGou31ZW1aEmEiHWUWUniTM39JDM5N38KGlpxOl4etDIOfJ9zZ+MbooDuAqw2
	l+xiYKs3gAN37n1BpEdwJddbLhq9LWk9bfxxbOJRXcqBVliXmdOv9kDhu+AzENa+akLS
	rA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by mx08-00178001.pphosted.com with ESMTP id 2vqwva6wbc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT) for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Oct 2019 16:19:11 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 528BB10002A
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Oct 2019 16:19:11 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 4CC252B28E0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Oct 2019 16:19:11 +0200 (CEST)
Received: from SFHDAG6NODE2.st.com (10.75.127.17) by SFHDAG6NODE3.st.com
	(10.75.127.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3;
	Tue, 22 Oct 2019 16:19:10 +0200
Received: from SFHDAG6NODE2.st.com ([fe80::a56f:c186:bab7:13d6]) by
	SFHDAG6NODE2.st.com ([fe80::a56f:c186:bab7:13d6%20]) with mapi id
	15.00.1347.000; Tue, 22 Oct 2019 16:19:10 +0200
From: Christophe PRIOUZEAU <christophe.priouzeau@st.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [meta-networking][PATCH 04/16] ptpd: Clarify BSD license variant
Thread-Index: AQHViOOsDnJcOyXYeEKWCuP7DwOr2g==
Date: Tue, 22 Oct 2019 14:19:10 +0000
Message-ID: <20191022141907.4412-4-christophe.priouzeau@st.com>
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
Subject: [meta-networking][PATCH 04/16] ptpd: Clarify BSD license variant
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

The License of ptpd is BSD-2-Clause.

Signed-off-by: Christophe Priouzeau <christophe.priouzeau@st.com>
---
 meta-networking/recipes-daemons/ptpd/ptpd_2.3.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-daemons/ptpd/ptpd_2.3.1.bb b/meta-netw=
orking/recipes-daemons/ptpd/ptpd_2.3.1.bb
index 58625c809..2bd642706 100644
--- a/meta-networking/recipes-daemons/ptpd/ptpd_2.3.1.bb
+++ b/meta-networking/recipes-daemons/ptpd/ptpd_2.3.1.bb
@@ -5,7 +5,7 @@ and PTP Version 2 implements IEEE-1588-2008. PTP was develo=
ped to provide very p
 time coordination of LAN connected computers."
 HOMEPAGE =3D "http://sourceforge.net/projects/ptpd"
 SECTION =3D "net"
-LICENSE =3D "BSD"
+LICENSE =3D "BSD-2-Clause"
 LIC_FILES_CHKSUM =3D "file://README;md5=3D0733e1b3788ab2ebbc63bf33a020da1d=
"
=20
 DEPENDS =3D "libpcap"
--=20
2.17.1

