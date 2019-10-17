Return-Path: <christophe.priouzeau@st.com>
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
	[62.209.51.94])
	by mail.openembedded.org (Postfix) with ESMTP id 3D6B47F6CE
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Oct 2019 14:47:03 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
	x9HEk6pn021053 for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Oct 2019 16:47:03 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
	h=from : to : cc : subject
	: date : message-id : references : in-reply-to : content-type :
	content-transfer-encoding : mime-version; s=STMicroelectronics;
	bh=03OPQDbYZP/oGgYBC67nDTCdx/y25kLse+OItwja1Ws=;
	b=ixl89rqdsezRQYQK8Wj+ULEcihdEOaYGJd9dH7iu9jGzvc1j2YRT95m74pklgafX0DT6
	io2MvoX2ghTlWQBauNE0mpUPvTEtgpRaqkE4nJKseAWASU5dlWCq8jKeUijrrSmQepr3
	wpxauseXlDUmkGuX1sNbohV4Z8Otkw2Pmq1SJGa0A8/tjUvmvXk1aWkcs30GQ4sP1NOQ
	PxjE3hIPEuUrVlXyCFBC5xuwy6Xlim2kVD4fGprB3lpfJkXKGoSBiKG4S7aCzSNJQLtp
	vtvyoqTP6f8sW6jjI0BgimSZJg7AY84C9H+ri7LV/u20KgGAtTkan1DXpAbJCfZ6mmy0
	UQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by mx07-00178001.pphosted.com with ESMTP id 2vk4a1mgw3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT) for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Oct 2019 16:47:03 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 8C348100034
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Oct 2019 16:47:03 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 8630E2B5D7A
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Oct 2019 16:47:03 +0200 (CEST)
Received: from SFHDAG6NODE2.st.com (10.75.127.17) by SFHDAG6NODE1.st.com
	(10.75.127.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3;
	Thu, 17 Oct 2019 16:47:03 +0200
Received: from SFHDAG6NODE2.st.com ([fe80::a56f:c186:bab7:13d6]) by
	SFHDAG6NODE2.st.com ([fe80::a56f:c186:bab7:13d6%20]) with mapi id
	15.00.1347.000; Thu, 17 Oct 2019 16:47:03 +0200
From: Christophe PRIOUZEAU <christophe.priouzeau@st.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [meta-oe][PATCH 5/7] libinih: Clarify BSD license variant
Thread-Index: AQHVhPm9U/j9R4qSdECHRtkUzDwang==
Date: Thu, 17 Oct 2019 14:47:03 +0000
Message-ID: <20191017144659.24850-5-christophe.priouzeau@st.com>
References: <20191017144659.24850-1-christophe.priouzeau@st.com>
In-Reply-To: <20191017144659.24850-1-christophe.priouzeau@st.com>
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
Subject: [meta-oe][PATCH 5/7] libinih: Clarify BSD license variant
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
X-List-Received-Date: Thu, 17 Oct 2019 14:47:03 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

The License of libinih is BSD-3-Clause.

Signed-off-by: Christophe Priouzeau <christophe.priouzeau@st.com>
---
 meta-oe/recipes-support/inih/libinih_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/inih/libinih_git.bb b/meta-oe/recipes-=
support/inih/libinih_git.bb
index 5030c78a3..48271f721 100644
--- a/meta-oe/recipes-support/inih/libinih_git.bb
+++ b/meta-oe/recipes-support/inih/libinih_git.bb
@@ -2,7 +2,7 @@ SUMMARY =3D "C and C++ INI Library"
 HOMEPAGE =3D "http://code.google.com/p/inih/"
 PV =3D "0.0+gitr${SRCPV}"
 PKGV =3D "${GITPKGVTAG}"
-LICENSE =3D "BSD"
+LICENSE =3D "BSD-3-Clause"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Ddae28cbf28207425e0d0b3eb835f4bd=
e"
=20
 PR =3D "r3"
--=20
2.17.1

