Return-Path: <christophe.priouzeau@st.com>
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
	[91.207.212.93])
	by mail.openembedded.org (Postfix) with ESMTP id 630DE7F744
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Oct 2019 14:19:15 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
	by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
	x9ME0rs2011267 for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Oct 2019 16:19:16 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
	h=from : to : cc : subject
	: date : message-id : references : in-reply-to : content-type :
	content-transfer-encoding : mime-version; s=STMicroelectronics;
	bh=caRuKxk2nKcGjgefguslFWGTXtgyBPCOh78xs1qweK4=;
	b=l1dLgHKAfKXQj4RJJVivzX8ZREqmM1vlJ62E6zzmO8JdA2p0qyiM4zfs4AXdgh6NcSNK
	WdcmvQ2+gqyIhKbPQOrkmHnuJQTrHklsq2TxC6ZPGx2tCYwTWea4WUnFNnuIx1WL0gUt
	TyUZnoVBvhJRZm5sBq+1L9J1E5SlNXDK1YiXrHOQGmmp/UwSgqvApSy7MP3wYPcpT/K2
	9OUCZpoIuSdYap1MxhGg057gQREd1OZD6RZYzyL/W9kHhJEJ9lupTjTOGvN1v04SpcXA
	Zu3JB6sKLVHrAkWAKiLl9kxbiWeAZkY9Xpd+tC5ppPozdKiKI+dHLVYEPDyBBQRlcRPi
	wA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by mx08-00178001.pphosted.com with ESMTP id 2vqwva6wc0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT) for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Oct 2019 16:19:16 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id AB64710002A
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Oct 2019 16:19:15 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A59E32AEF90
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Oct 2019 16:19:15 +0200 (CEST)
Received: from SFHDAG6NODE2.st.com (10.75.127.17) by SFHDAG6NODE2.st.com
	(10.75.127.17) with Microsoft SMTP Server (TLS) id 15.0.1347.2;
	Tue, 22 Oct 2019 16:19:15 +0200
Received: from SFHDAG6NODE2.st.com ([fe80::a56f:c186:bab7:13d6]) by
	SFHDAG6NODE2.st.com ([fe80::a56f:c186:bab7:13d6%20]) with mapi id
	15.00.1347.000; Tue, 22 Oct 2019 16:19:15 +0200
From: Christophe PRIOUZEAU <christophe.priouzeau@st.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [meta-networking][PATCH 14/16] libmemcached: Clarify BSD license
	variant
Thread-Index: AQHViOOuZPXpesSX4kCv0jjGIR+6Fg==
Date: Tue, 22 Oct 2019 14:19:15 +0000
Message-ID: <20191022141907.4412-14-christophe.priouzeau@st.com>
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
Subject: [meta-networking][PATCH 14/16] libmemcached: Clarify BSD license variant
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
X-List-Received-Date: Tue, 22 Oct 2019 14:19:15 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

The License of libmemcached is BSD-3-Clause.

Signed-off-by: Christophe Priouzeau <christophe.priouzeau@st.com>
---
 meta-networking/recipes-support/libmemcached/libmemcached.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/libmemcached/libmemcached.inc =
b/meta-networking/recipes-support/libmemcached/libmemcached.inc
index e86f832f8..d9a821d10 100644
--- a/meta-networking/recipes-support/libmemcached/libmemcached.inc
+++ b/meta-networking/recipes-support/libmemcached/libmemcached.inc
@@ -1,7 +1,7 @@
 DESCRIPTION =3D "open source C/C++ client library and tools for the memcac=
hed server"
 DEPENDS =3D "libevent util-linux"
 SECTION =3D "libdevel"
-LICENSE =3D "BSD"
+LICENSE =3D "BSD-3-Clause"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D865490941c91ba790f0ea78dec93bd6=
0"
=20
 SRC_URI =3D "http://launchpad.net/libmemcached/1.0/${PV}/+download/libmemc=
ached-${PV}.tar.gz"
--=20
2.17.1

