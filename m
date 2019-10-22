Return-Path: <christophe.priouzeau@st.com>
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
	[91.207.212.93])
	by mail.openembedded.org (Postfix) with ESMTP id 9E1A97F736
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Oct 2019 14:19:13 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
	by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
	x9ME0rs0011267 for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Oct 2019 16:19:14 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
	h=from : to : cc : subject
	: date : message-id : references : in-reply-to : content-type :
	content-transfer-encoding : mime-version; s=STMicroelectronics;
	bh=VIlbmr3J+ydMWilrsRCQh7xA85q4tb1FZJAsvY+qT+A=;
	b=RVS5pQEWQ4go/ljDxTqFOMZAo2qFeaDP39+VZheKCA8s5j3AYlwrtafwyFOA5PXpFJLY
	IMgfIlSAGsTo96fenLy1KhwSl1t25XMsNaaVJbNtNgE85pfRrwUQySfh9JcL7RDTd0Gb
	/Nm7dAobtYDC/WXdcDnZy2ocNku92rh3S396jp3q2ivp1VoFOb44LpBTddiAljToYkFo
	N5rwB0W1ZrvqIs3aQ7SVUczIGFlfCQXiRqviUXnRMgwI00KdPrew1wayjaJivW4smLfD
	DSFnxW1KmoVVvrG+4/4tdtG7TOf+htgD4wI5fN+hYN4uPX04ttzcNVOgsw2y1VY+F6z9
	qQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by mx08-00178001.pphosted.com with ESMTP id 2vqwva6wbr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT) for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Oct 2019 16:19:14 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id D903C100034
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Oct 2019 16:19:13 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D15BF2AEF90
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Oct 2019 16:19:13 +0200 (CEST)
Received: from SFHDAG6NODE2.st.com (10.75.127.17) by SFHDAG6NODE3.st.com
	(10.75.127.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3;
	Tue, 22 Oct 2019 16:19:13 +0200
Received: from SFHDAG6NODE2.st.com ([fe80::a56f:c186:bab7:13d6]) by
	SFHDAG6NODE2.st.com ([fe80::a56f:c186:bab7:13d6%20]) with mapi id
	15.00.1347.000; Tue, 22 Oct 2019 16:19:13 +0200
From: Christophe PRIOUZEAU <christophe.priouzeau@st.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [meta-networking][PATCH 10/16] netkit-telnet: Clarify BSD
	license variant
Thread-Index: AQHViOOths3Y0JK9XUWMl3kKZYWqHw==
Date: Tue, 22 Oct 2019 14:19:13 +0000
Message-ID: <20191022141907.4412-10-christophe.priouzeau@st.com>
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
Subject: [meta-networking][PATCH 10/16] netkit-telnet: Clarify BSD license variant
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
X-List-Received-Date: Tue, 22 Oct 2019 14:19:14 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

The License of netkit-telnet is BSD-4-Clause.

Signed-off-by: Christophe Priouzeau <christophe.priouzeau@st.com>
---
 .../recipes-netkit/netkit-telnet/netkit-telnet_0.17.bb          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-netkit/netkit-telnet/netkit-telnet_0.1=
7.bb b/meta-networking/recipes-netkit/netkit-telnet/netkit-telnet_0.17.bb
index a8d98c940..cf9934138 100644
--- a/meta-networking/recipes-netkit/netkit-telnet/netkit-telnet_0.17.bb
+++ b/meta-networking/recipes-netkit/netkit-telnet/netkit-telnet_0.17.bb
@@ -2,7 +2,7 @@ DESCRIPTION =3D "netkit-telnet includes the telnet daemon a=
nd client."
 HOMEPAGE =3D "http://www.hcs.harvard.edu/~dholland/computers/netkit.html"
 SECTION =3D "net"
 DEPENDS =3D "ncurses"
-LICENSE =3D "BSD"
+LICENSE =3D "BSD-4-Clause"
 LIC_FILES_CHKSUM =3D "file://telnet/telnet.cc;beginline=3D2;endline=3D3;md=
5=3D780868e7b566313e70cb701560ca95ef"
=20
 SRC_URI =3D "http://ftp.linux.org.uk/pub/linux/Networking/netkit/${BP}.tar=
.gz \
--=20
2.17.1

