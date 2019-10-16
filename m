Return-Path: <christophe.priouzeau@st.com>
X-Greylist: delayed 3751 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 16 Oct 2019 10:27:49 UTC
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
	[62.209.51.94])
	by mail.openembedded.org (Postfix) with ESMTP id AF5F87F395
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Oct 2019 10:27:49 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
	x9G9LVeW016169 for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Oct 2019 11:25:18 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
	h=from : to : cc : subject
	: date : message-id : content-type : content-transfer-encoding :
	mime-version; s=STMicroelectronics;
	bh=SQ6OBIlkdkLIsOr89oSelUXCDKmHdghIoBdFQDS75S4=;
	b=vkEKQJn/UoX1N9w/w1lwUx+lgBTgwGJyX2JlkqKYd+iUspnIZapi4GSbrDZUlxZz7vcF
	rETlsP920hMYeR2B8YIYRpluz4UgqyI4BwJbzMZ2BLpUoUq+0ybKgJR4rts95FrKKwlk
	nmRolQdcq+LfJ21VTFucksAUrKwAdZNqYMLSH/wrlDxbLz18CN+gPzWBe+6NR0iLo+Ja
	eGeGlubGpRaQFoCKhn0oy07bX5Zwkyg+VFAFsPvC45sphWcEGSjb1QypU3HBh2ss1oGG
	5UsTHeIXYNaCqoPn/WRz7VWldUbvsn6bi7GxdB+t0yVQ+btMIqoCcaPDbaytICiZe7kk
	+g== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by mx07-00178001.pphosted.com with ESMTP id 2vk4a1d8u1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT) for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Oct 2019 11:25:18 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 04BCE10002A
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Oct 2019 11:25:18 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id EE2332BCE3E
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Oct 2019 11:25:17 +0200 (CEST)
Received: from SFHDAG6NODE2.st.com (10.75.127.17) by SFHDAG6NODE2.st.com
	(10.75.127.17) with Microsoft SMTP Server (TLS) id 15.0.1347.2;
	Wed, 16 Oct 2019 11:25:17 +0200
Received: from SFHDAG6NODE2.st.com ([fe80::a56f:c186:bab7:13d6]) by
	SFHDAG6NODE2.st.com ([fe80::a56f:c186:bab7:13d6%20]) with mapi id
	15.00.1347.000; Wed, 16 Oct 2019 11:25:16 +0200
From: Christophe PRIOUZEAU <christophe.priouzeau@st.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [meta-multimedia][PATCH 1/2] libmpdclient: Clarify BSD license
	variant
Thread-Index: AQHVhAOfz6SJje9I00WSC7MIjKoTGw==
Date: Wed, 16 Oct 2019 09:25:16 +0000
Message-ID: <20191016092515.6991-1-christophe.priouzeau@st.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.50]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
	definitions=2019-10-16_03:2019-10-15,2019-10-16 signatures=0
Cc: Christophe PRIOUZEAU <christophe.priouzeau@st.com>
Subject: [meta-multimedia][PATCH 1/2] libmpdclient: Clarify BSD license variant
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
X-List-Received-Date: Wed, 16 Oct 2019 10:27:50 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

The License of libmpdclient is BSD-3-Clause.

Signed-off-by: Christophe Priouzeau <christophe.priouzeau@st.com>
---
 meta-multimedia/recipes-multimedia/musicpd/libmpdclient_2.16.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-multimedia/recipes-multimedia/musicpd/libmpdclient_2.16.b=
b b/meta-multimedia/recipes-multimedia/musicpd/libmpdclient_2.16.bb
index 455e76fcb..235e63e48 100644
--- a/meta-multimedia/recipes-multimedia/musicpd/libmpdclient_2.16.bb
+++ b/meta-multimedia/recipes-multimedia/musicpd/libmpdclient_2.16.bb
@@ -1,5 +1,5 @@
 SUMMARY =3D "C client library for the Music Player Daemon"
-LICENSE =3D "BSD"
+LICENSE =3D "BSD-3-Clause"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D06b9dfd2f197dc514d8ef06549684b7=
7"
 HOMEPAGE =3D "https://www.musicpd.org/libs/libmpdclient/"
=20
--=20
2.17.1

