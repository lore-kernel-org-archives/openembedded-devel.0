Return-Path: <christophe.priouzeau@st.com>
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
	[91.207.212.93])
	by mail.openembedded.org (Postfix) with ESMTP id 7091B7F72A
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Oct 2019 14:19:11 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
	x9ME6AXb001416 for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Oct 2019 16:19:12 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
	h=from : to : cc : subject
	: date : message-id : references : in-reply-to : content-type :
	content-transfer-encoding : mime-version; s=STMicroelectronics;
	bh=gsyhHN9pg5gsmGYPg2SO8CRutwWQMr7dIz6mjw5Y9ig=;
	b=zJ6KtrmWPETNZHjzKPIOYquP9wSXlR2A5DA2j36ufAHoIZpvm1lP8vjRoNvM3Rqotk7B
	5HztdzrDWylEsF729ledd9jS6FquOh5Ess6+vT/Z8yhz3EwaSA80Q79jUaRHzEgCV94W
	EE+3FXYoUW9hGumAcs/RpgXsc93JT02LlfLyQ6FUjD5/2UyRUHdr5ZymOjspJZgK4uGl
	XEEhCRc8JjNCNRkpCf38Yc0V+zII1azIJs4nDz5R2xtbl7nBQEltuM0AlePwFqNYOtgg
	vdrK9onZn2ZQz0wR5y+OmeSTgmxAIbU123lv/KUzX84ZK5uHWo9GM7wfGyOcAoxbe2ry
	oQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by mx08-00178001.pphosted.com with ESMTP id 2vqwxy6vav-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT) for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Oct 2019 16:19:12 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C10DA100034
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Oct 2019 16:19:11 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id BB7152B28E0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Oct 2019 16:19:11 +0200 (CEST)
Received: from SFHDAG6NODE2.st.com (10.75.127.17) by SFHDAG6NODE1.st.com
	(10.75.127.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3;
	Tue, 22 Oct 2019 16:19:11 +0200
Received: from SFHDAG6NODE2.st.com ([fe80::a56f:c186:bab7:13d6]) by
	SFHDAG6NODE2.st.com ([fe80::a56f:c186:bab7:13d6%20]) with mapi id
	15.00.1347.000; Tue, 22 Oct 2019 16:19:11 +0200
From: Christophe PRIOUZEAU <christophe.priouzeau@st.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [meta-networking][PATCH 05/16] pure-ftpd: Clarify BSD license
	variant
Thread-Index: AQHViOOsGce53pfkDUCU4grA92jn4g==
Date: Tue, 22 Oct 2019 14:19:11 +0000
Message-ID: <20191022141907.4412-5-christophe.priouzeau@st.com>
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
Subject: [meta-networking][PATCH 05/16] pure-ftpd: Clarify BSD license variant
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

The License of pure-ftpd is BSD-0-Clause.
---
 meta-networking/recipes-daemons/pure-ftpd/pure-ftpd_1.0.47.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-daemons/pure-ftpd/pure-ftpd_1.0.47.bb =
b/meta-networking/recipes-daemons/pure-ftpd/pure-ftpd_1.0.47.bb
index 43be44ea3..e7c530be3 100644
--- a/meta-networking/recipes-daemons/pure-ftpd/pure-ftpd_1.0.47.bb
+++ b/meta-networking/recipes-daemons/pure-ftpd/pure-ftpd_1.0.47.bb
@@ -2,7 +2,7 @@ SUMMARY =3D "FTP Server with a strong focus on software sec=
urity"
 DESCRIPTION =3D "Pure-FTPd is a free (BSD license), secure, production-qua=
lity and standard-conformant FTP server."
 HOMEPAGE =3D "http://www.pureftpd.org/project/pure-ftpd"
 SECTION =3D "net"
-LICENSE =3D "BSD"
+LICENSE =3D "BSD-0-Clause"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D0595b4261a04bc2d27f30b9c90796c1=
f"
=20
 DEPENDS =3D "libcap virtual/crypt"
--=20
2.17.1

