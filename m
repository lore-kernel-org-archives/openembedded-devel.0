Return-Path: <christophe.priouzeau@st.com>
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
	[91.207.212.93])
	by mail.openembedded.org (Postfix) with ESMTP id A8A9A7F745
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Oct 2019 14:19:12 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
	by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
	x9ME0rjQ011264 for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Oct 2019 16:19:13 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
	h=from : to : cc : subject
	: date : message-id : references : in-reply-to : content-type :
	content-transfer-encoding : mime-version; s=STMicroelectronics;
	bh=V78QjYee5MXuuHEKpnprYopiigZkQreq5fyLqXCxj+A=;
	b=rrbUFNRn4zHFRqX00E70+lXJZQkmzD1MpE4si+RxxOqeN3MfHyCfISTAOZ4sqa/U5QjZ
	zGavbKu3/100h5HLah1EmqAY+DQOYGCo9DNe3j7Pt97kJn3cFsFm1CwCr7VM4FRg9tAC
	ugZtGE2QC890c17kjewAmCjdglp2H7PILT+AmCFwsSUwvFt+BYgAn+uBr/q9ZXrhMix4
	WStn0I3UZ9jhyHl9cpedkGx2l6vo4ZcuUBYk8Ln446K2q1KdKeAfYFjLmm6SruZkOGJO
	Ei17rrOeW/onR9/AOyJ1BuRnaG5+vIIx6FdxEtGcX8saZZ+2vMwmoIwaPfeZEuMRlzuW
	TQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by mx08-00178001.pphosted.com with ESMTP id 2vqwva6wbn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT) for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Oct 2019 16:19:13 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 01504100038
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Oct 2019 16:19:13 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id EECF92AEF90
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Oct 2019 16:19:12 +0200 (CEST)
Received: from SFHDAG6NODE2.st.com (10.75.127.17) by SFHDAG6NODE3.st.com
	(10.75.127.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3;
	Tue, 22 Oct 2019 16:19:12 +0200
Received: from SFHDAG6NODE2.st.com ([fe80::a56f:c186:bab7:13d6]) by
	SFHDAG6NODE2.st.com ([fe80::a56f:c186:bab7:13d6%20]) with mapi id
	15.00.1347.000; Tue, 22 Oct 2019 16:19:12 +0200
From: Christophe PRIOUZEAU <christophe.priouzeau@st.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [meta-networking][PATCH 08/16] netkit-rusers: Clarify BSD
	license variant
Thread-Index: AQHViOOt+1BtSRzHPUKHvxLP9FLRgw==
Date: Tue, 22 Oct 2019 14:19:12 +0000
Message-ID: <20191022141907.4412-8-christophe.priouzeau@st.com>
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
Subject: [meta-networking][PATCH 08/16] netkit-rusers: Clarify BSD license variant
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
X-List-Received-Date: Tue, 22 Oct 2019 14:19:13 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

The License of netkit-rusers is BSD-3-Clause.

Signed-off-by: Christophe Priouzeau <christophe.priouzeau@st.com>
---
 .../recipes-netkit/netkit-rusers/netkit-rusers_0.17.bb          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-netkit/netkit-rusers/netkit-rusers_0.1=
7.bb b/meta-networking/recipes-netkit/netkit-rusers/netkit-rusers_0.17.bb
index ba1ad3f7f..c39faef8d 100644
--- a/meta-networking/recipes-netkit/netkit-rusers/netkit-rusers_0.17.bb
+++ b/meta-networking/recipes-netkit/netkit-rusers/netkit-rusers_0.17.bb
@@ -2,7 +2,7 @@ DESCRIPTION =3D "netkit-rusers includes rusers - Displays w=
ho is logged in to mach
     rusersd - Logged in users server"
 HOMEPAGE =3D "ftp://ftp.uk.linux.org/pub/linux/Networking/netkit"
 SECTION =3D "net"
-LICENSE =3D "BSD"
+LICENSE =3D "BSD-3-Clause"
 LIC_FILES_CHKSUM =3D "file://rusers/rusers.c;beginline=3D2;endline=3D3;md5=
=3Df4fc634a4ce8c569911196b72b10770e"
 DEPENDS =3D " tcp-wrappers libtirpc rpcbind rpcsvc-proto rpcsvc-proto-nati=
ve"
=20
--=20
2.17.1

