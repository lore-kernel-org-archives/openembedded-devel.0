Return-Path: <christophe.priouzeau@st.com>
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
	[62.209.51.94])
	by mail.openembedded.org (Postfix) with ESMTP id A040C7F841
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Oct 2019 15:16:38 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
	x9NFCc9i002263 for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Oct 2019 17:16:39 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
	h=from : to : cc : subject
	: date : message-id : references : in-reply-to : content-type :
	content-transfer-encoding : mime-version; s=STMicroelectronics;
	bh=SkBc8kImcm3lmNr2Q0YICyEfIsOX+YdN2u90JqMQK1E=;
	b=g2hTsoNT/h/Fd/OOZU4leGJuPr6WRUfRMQ7l36+SKiEa1O0gQnayWbUI+o0QBLgKzEZK
	FuGq0hdLHC5cciE16B4OiL7Rf+5T6DaxyjrWVuP5LFWpFlLYrNBJLoGSh0qTPDIM/09v
	QDhJVDAvV5lNChc8kgjV5nqMQDncN+rTK0ZvgW7yiiQKRb0395G1CXvxvZwb47aqSswS
	sWEnYXO7ndBcNOqdV9HJc4WWtFBEdFt8w5uxFMPdP2/PlqpyRECokADQcb/58yURKNS7
	m4VL/TZo6z00Z++ahBIeDc9hWknJSo6XDK1qSJKJPFV0SZShfA3YiMc2jniA5MjUgerq
	7w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by mx07-00178001.pphosted.com with ESMTP id 2vt9s44det-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT) for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Oct 2019 17:16:39 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 0489310002A
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Oct 2019 17:16:39 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id F12D42B1D56
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Oct 2019 17:16:38 +0200 (CEST)
Received: from SFHDAG6NODE2.st.com (10.75.127.17) by SFHDAG6NODE1.st.com
	(10.75.127.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3;
	Wed, 23 Oct 2019 17:16:38 +0200
Received: from SFHDAG6NODE2.st.com ([fe80::a56f:c186:bab7:13d6]) by
	SFHDAG6NODE2.st.com ([fe80::a56f:c186:bab7:13d6%20]) with mapi id
	15.00.1347.000; Wed, 23 Oct 2019 17:16:38 +0200
From: Christophe PRIOUZEAU <christophe.priouzeau@st.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [meta-oe][PATCH 07/10] wavpack: Clarify BSD license variant
Thread-Index: AQHVibTdhwRN959IXk+4twTyy6Pw+g==
Date: Wed, 23 Oct 2019 15:16:38 +0000
Message-ID: <20191023151634.32423-7-christophe.priouzeau@st.com>
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
Subject: [meta-oe][PATCH 07/10] wavpack: Clarify BSD license variant
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
X-List-Received-Date: Wed, 23 Oct 2019 15:16:39 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

The License of wavpack is BSD-3-Clause.

Signed-off-by: Christophe Priouzeau <christophe.priouzeau@st.com>
---
 meta-oe/recipes-multimedia/wavpack/wavpack_4.60.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-multimedia/wavpack/wavpack_4.60.1.bb b/meta-oe=
/recipes-multimedia/wavpack/wavpack_4.60.1.bb
index cc5b84489..021496bd4 100644
--- a/meta-oe/recipes-multimedia/wavpack/wavpack_4.60.1.bb
+++ b/meta-oe/recipes-multimedia/wavpack/wavpack_4.60.1.bb
@@ -1,5 +1,5 @@
 DESCRIPTION =3D "WavPack is a completely open audio compression format pro=
viding lossless, high-quality lossy, and a unique hybrid compression mode."
-LICENSE =3D "BSD"
+LICENSE =3D "BSD-3-Clause"
 LIC_FILES_CHKSUM =3D "file://license.txt;md5=3Df596650807588c61fcab60bec82=
42df8"
=20
 SRC_URI =3D "http://wavpack.com/wavpack-${PV}.tar.bz2"
--=20
2.17.1

