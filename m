Return-Path: <christophe.priouzeau@st.com>
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
	[91.207.212.93])
	by mail.openembedded.org (Postfix) with ESMTP id 31D307F74D
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Oct 2019 14:19:13 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
	x9ME6AXd001416 for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Oct 2019 16:19:14 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
	h=from : to : cc : subject
	: date : message-id : references : in-reply-to : content-type :
	content-transfer-encoding : mime-version; s=STMicroelectronics;
	bh=Bjc3ZXpcDI+uG3IM59tqZYc7FF3WQuntis4HuK/ssuQ=;
	b=aNKkDDU1wrYGy3wY11aEYP6n813cmF3oMJLg0F+GVy5XsCDQwe445ZGH6ZKmvj9BAeAA
	yLch8xcobKx6XQYX0pVQjtywNyfRhfszEmvcqn9kD/tkWDiC8pLjT1Ns+ZZ64RHXG72X
	TZti5z5XQUnp/lFlAzXpOmKoFOZeT4TF66KJEtPOGeznCI6TR42AwHo18DRNcr5ujzs1
	zgPCVVA5VRaxG+UNzdS5NLk5T7Fer+obHvIETuS47v4UuBzDyc2NHv5+tOvabFfAADPn
	xXyuc5kymLJhnDwEBRD4UIaI9VJSTFb0rJHtlbFWRRwr4RidHbVEb9Zx46Ov8nujP7MW
	UQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by mx08-00178001.pphosted.com with ESMTP id 2vqwxy6vb4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT) for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Oct 2019 16:19:13 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 81C97100039
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Oct 2019 16:19:13 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7B9D42AEF90
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Oct 2019 16:19:13 +0200 (CEST)
Received: from SFHDAG6NODE2.st.com (10.75.127.17) by SFHDAG6NODE1.st.com
	(10.75.127.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3;
	Tue, 22 Oct 2019 16:19:12 +0200
Received: from SFHDAG6NODE2.st.com ([fe80::a56f:c186:bab7:13d6]) by
	SFHDAG6NODE2.st.com ([fe80::a56f:c186:bab7:13d6%20]) with mapi id
	15.00.1347.000; Tue, 22 Oct 2019 16:19:13 +0200
From: Christophe PRIOUZEAU <christophe.priouzeau@st.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [meta-networking][PATCH 09/16] netkit-rwho: Clarify BSD license
	variant
Thread-Index: AQHViOOtLP2tm714nki3fP2hFhi5eg==
Date: Tue, 22 Oct 2019 14:19:12 +0000
Message-ID: <20191022141907.4412-9-christophe.priouzeau@st.com>
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
Subject: [meta-networking][PATCH 09/16] netkit-rwho: Clarify BSD license variant
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

The License of netkit-rwho is BSD-4-Clause.

Signed-off-by: Christophe Priouzeau <christophe.priouzeau@st.com>
---
 meta-networking/recipes-netkit/netkit-rwho/netkit-rwho_0.17.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-netkit/netkit-rwho/netkit-rwho_0.17.bb=
 b/meta-networking/recipes-netkit/netkit-rwho/netkit-rwho_0.17.bb
index 5685f03d6..60a8d95b0 100644
--- a/meta-networking/recipes-netkit/netkit-rwho/netkit-rwho_0.17.bb
+++ b/meta-networking/recipes-netkit/netkit-rwho/netkit-rwho_0.17.bb
@@ -1,7 +1,7 @@
 DESCRIPTION =3D "netkit-rwho includes, ruptime rwho and rwhod (Daemon to m=
aintain data for rwho/ruptime)"
 HOMEPAGE =3D "ftp://ftp.uk.linux.org/pub/linux/Networking/netkit"
 SECTION =3D "net"
-LICENSE =3D "BSD"
+LICENSE =3D "BSD-4-Clause"
 LIC_FILES_CHKSUM =3D "file://rwho/rwho.c;beginline=3D2;endline=3D3;md5=3D5=
a85f13c0142d72fc378e00f15da5b9e"
=20
 SRC_URI =3D "${DEBIAN_MIRROR}/main/n/netkit-rwho/netkit-rwho_${PV}.orig.ta=
r.gz;name=3Darchive \
--=20
2.17.1

