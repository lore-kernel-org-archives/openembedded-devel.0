Return-Path: <christophe.priouzeau@st.com>
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
	[91.207.212.93])
	by mail.openembedded.org (Postfix) with ESMTP id 9B75C7F730
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Oct 2019 14:19:10 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
	by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
	x9ME0sNj011276 for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Oct 2019 16:19:11 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
	h=from : to : cc : subject
	: date : message-id : references : in-reply-to : content-type :
	content-transfer-encoding : mime-version; s=STMicroelectronics;
	bh=a9LBGgkpmPZ/gr3ArcLoEcORf/StT5GoNd8ezb3p/iE=;
	b=piZoYdN7pkSL6hiszCZaVe98u3Xs/nRz665NUqHwS5R3GxECMTOfzib+nrXRIYCLMa9P
	YKmv7hm8Mb0t5XDf9BBQxeeZu6Rf3C9Zp+8wFBPKKpMOEc0q9EvPyzF0s2vGEmGuotdS
	9mosP8CVoKNQvaNqiSaM5Q0qSsnKhzZNtH6Mxn+OZHEEOTNW7kQu0UiII+DY1SZlKb77
	71cvRYOyoyz2XoBIsMNrEKuE8K5TtnhTJ8Ph1mLFjOIHer03X9lThhaI3TNqPZydti+Z
	qiC1R+LhTuSGte5cEKzk98I6VubERUytnZ8O0mMKpgQGxLpU6QRr1c220hKNUr/9HXfV
	gA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by mx08-00178001.pphosted.com with ESMTP id 2vqwva6wbb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT) for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Oct 2019 16:19:11 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id DB496100038
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Oct 2019 16:19:10 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D5BF52B28E0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Oct 2019 16:19:10 +0200 (CEST)
Received: from SFHDAG6NODE2.st.com (10.75.127.17) by SFHDAG6NODE2.st.com
	(10.75.127.17) with Microsoft SMTP Server (TLS) id 15.0.1347.2;
	Tue, 22 Oct 2019 16:19:10 +0200
Received: from SFHDAG6NODE2.st.com ([fe80::a56f:c186:bab7:13d6]) by
	SFHDAG6NODE2.st.com ([fe80::a56f:c186:bab7:13d6%20]) with mapi id
	15.00.1347.000; Tue, 22 Oct 2019 16:19:10 +0200
From: Christophe PRIOUZEAU <christophe.priouzeau@st.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [meta-networking][PATCH 03/16] openhpi: Clarify BSD license
	variant
Thread-Index: AQHViOOst10yxxHygUyyBYfXVocBVw==
Date: Tue, 22 Oct 2019 14:19:10 +0000
Message-ID: <20191022141907.4412-3-christophe.priouzeau@st.com>
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
Subject: [meta-networking][PATCH 03/16] openhpi: Clarify BSD license variant
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

The License of openhpi is BSD-3-Clause.

Signed-off-by: Christophe Priouzeau <christophe.priouzeau@st.com>
---
 meta-networking/recipes-daemons/openhpi/openhpi_3.8.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-daemons/openhpi/openhpi_3.8.0.bb b/met=
a-networking/recipes-daemons/openhpi/openhpi_3.8.0.bb
index b47d59e2d..e8d19a2c0 100644
--- a/meta-networking/recipes-daemons/openhpi/openhpi_3.8.0.bb
+++ b/meta-networking/recipes-daemons/openhpi/openhpi_3.8.0.bb
@@ -17,7 +17,7 @@ servers, Blade Center, and machines which export data via=
 sysfs. \
=20
 HOMEPAGE =3D "http://openhpi.sourceforge.net/Home"
 SECTION =3D "net"
-LICENSE =3D "BSD"
+LICENSE =3D "BSD-3-Clause"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3De3c772a32386888ccb5ae1c0ba95f1a=
4"
=20
 DEPENDS =3D "net-snmp libxml2 ncurses openssl glib-2.0 popt e2fsprogs \
--=20
2.17.1

