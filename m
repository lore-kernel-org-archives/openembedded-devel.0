Return-Path: <christophe.priouzeau@st.com>
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
	[62.209.51.94])
	by mail.openembedded.org (Postfix) with ESMTP id 728FB7F83E
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Oct 2019 15:16:37 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
	x9NFCgqQ002275 for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Oct 2019 17:16:37 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
	h=from : to : cc : subject
	: date : message-id : references : in-reply-to : content-type :
	content-transfer-encoding : mime-version; s=STMicroelectronics;
	bh=z2cva6JEiZAUXCrZZIPZlWzLUqpVhgZpxC7R0p3cn6M=;
	b=i969IODccfC3dHf7QRa5b9yi2e6N5d+70pHm9+E+0w4l3N2tmos7NlJDrmSjqUP7az7f
	MV81aEmIwF59cnGkZL/buMZJY7lZNRcEMuAKD9P5iKo549Ix1K36ye3Jkkrljq5MsYAm
	S1Kq/hdCFQy/aQffzHaX3i/Il+NCe9M9nA3kSAaOzSuqDa5aZfRb0bCoTE0K1JWunTAy
	QpUzz/BU+Vn1lmw62A8ODZFALgRt2w8AbRbOT2nl4sIMvip0FVqq+I9wBVERDiHcPkJj
	IWml5wXeYRyjAGg01Am+KeXwE6OAQwEJZ6zp4D4T6pqWteXiCZ4aKlzf25iskV4g+HXY
	GQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by mx07-00178001.pphosted.com with ESMTP id 2vt9s44dem-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT) for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Oct 2019 17:16:37 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7A52610002A
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Oct 2019 17:16:37 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 74B632BF6AD
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Oct 2019 17:16:37 +0200 (CEST)
Received: from SFHDAG6NODE2.st.com (10.75.127.17) by SFHDAG6NODE1.st.com
	(10.75.127.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3;
	Wed, 23 Oct 2019 17:16:37 +0200
Received: from SFHDAG6NODE2.st.com ([fe80::a56f:c186:bab7:13d6]) by
	SFHDAG6NODE2.st.com ([fe80::a56f:c186:bab7:13d6%20]) with mapi id
	15.00.1347.000; Wed, 23 Oct 2019 17:16:37 +0200
From: Christophe PRIOUZEAU <christophe.priouzeau@st.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [meta-oe][PATCH 03/10] redis: Clarify BSD license variant
Thread-Index: AQHVibTcB/+Va0Aark62bBcCYL9dHg==
Date: Wed, 23 Oct 2019 15:16:37 +0000
Message-ID: <20191023151634.32423-3-christophe.priouzeau@st.com>
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
Subject: [meta-oe][PATCH 03/10] redis: Clarify BSD license variant
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

The License of redis is BSD-3-Clause.

Signed-off-by: Christophe Priouzeau <christophe.priouzeau@st.com>
---
 meta-oe/recipes-extended/redis/redis_4.0.14.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/redis/redis_4.0.14.bb b/meta-oe/recip=
es-extended/redis/redis_4.0.14.bb
index 45ea29b70..7dc6f9711 100644
--- a/meta-oe/recipes-extended/redis/redis_4.0.14.bb
+++ b/meta-oe/recipes-extended/redis/redis_4.0.14.bb
@@ -2,7 +2,7 @@ SUMMARY =3D "Redis key-value store"
 DESCRIPTION =3D "Redis is an open source, advanced key-value store."
 HOMEPAGE =3D "http://redis.io"
 SECTION =3D "libs"
-LICENSE =3D "BSD"
+LICENSE =3D "BSD-3-Clause"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D3c01b49fed4df1a79843688fa3f7b9d=
6"
 DEPENDS =3D "readline lua ncurses"
=20
--=20
2.17.1

