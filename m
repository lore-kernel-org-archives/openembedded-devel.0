Return-Path: <christophe.priouzeau@st.com>
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
	[91.207.212.93])
	by mail.openembedded.org (Postfix) with ESMTP id 31F907F72A
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Oct 2019 14:19:12 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
	x9ME6AXc001416 for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Oct 2019 16:19:13 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
	h=from : to : cc : subject
	: date : message-id : references : in-reply-to : content-type :
	content-transfer-encoding : mime-version; s=STMicroelectronics;
	bh=YUxSayDFc07K+++9vKqVEXwFMEDaIZuLRX7srUf64QE=;
	b=HpS8gDFMKms9KHq1mxKGudx/0InNmQPRnzwXsn798Ur47Gdyxh6z1rSGOf+q+IwdRI2E
	GkrAqdq9GDxVocxWu7AsZbpd0CgNbQNsU+bGbXJP67/c5ojNntDk5PgGfXOjRHM9A89/
	R011OFShPdyI/LPprqGqU+MJMFFy2b3HUWpyhMQSLdy2lw//3R490pgJFRC6MriSAyH9
	tv1OOcLVU2V413rx1efw8SIFkEZv4LITk2tmc68DERZvjevMKutRxZWeHCSA6Oq8Rrv/
	t7hq6hDc/kccOwE+ty2+gWBaZ1wl2Igj1puIwwUWOcTRqYvrQYO+LAPY/0PeC+A4LmBg
	Kg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by mx08-00178001.pphosted.com with ESMTP id 2vqwxy6vb0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT) for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Oct 2019 16:19:12 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 840B310002A
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Oct 2019 16:19:12 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7E0642AEF90
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Oct 2019 16:19:12 +0200 (CEST)
Received: from SFHDAG6NODE2.st.com (10.75.127.17) by SFHDAG6NODE2.st.com
	(10.75.127.17) with Microsoft SMTP Server (TLS) id 15.0.1347.2;
	Tue, 22 Oct 2019 16:19:12 +0200
Received: from SFHDAG6NODE2.st.com ([fe80::a56f:c186:bab7:13d6]) by
	SFHDAG6NODE2.st.com ([fe80::a56f:c186:bab7:13d6%20]) with mapi id
	15.00.1347.000; Tue, 22 Oct 2019 16:19:12 +0200
From: Christophe PRIOUZEAU <christophe.priouzeau@st.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [meta-networking][PATCH 07/16] netkit-ftp: Clarify BSD license
	variant
Thread-Index: AQHViOOtGjW1E779sEiTxOPufSUyFg==
Date: Tue, 22 Oct 2019 14:19:11 +0000
Message-ID: <20191022141907.4412-7-christophe.priouzeau@st.com>
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
Subject: [meta-networking][PATCH 07/16] netkit-ftp: Clarify BSD license variant
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
X-List-Received-Date: Tue, 22 Oct 2019 14:19:12 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

The License of netkit-ftp is BSD-4-Clause.

Signed-off-by: Christophe Priouzeau <christophe.priouzeau@st.com>
---
 meta-networking/recipes-netkit/netkit-ftp/netkit-ftp_0.17.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-netkit/netkit-ftp/netkit-ftp_0.17.bb b=
/meta-networking/recipes-netkit/netkit-ftp/netkit-ftp_0.17.bb
index 394a69e62..65c20c072 100644
--- a/meta-networking/recipes-netkit/netkit-ftp/netkit-ftp_0.17.bb
+++ b/meta-networking/recipes-netkit/netkit-ftp/netkit-ftp_0.17.bb
@@ -1,7 +1,7 @@
 DESCRIPTION =3D "netkit-ft includes the ftp client."
 SECTION =3D "net"
 HOMEPAGE=3D"ftp://ftp.uk.linux.org/pub/linux/Networking/netkit"
-LICENSE =3D "BSD"
+LICENSE =3D "BSD-4-Clause"
=20
 LIC_FILES_CHKSUM =3D "file://ftp/ftp.c;beginline=3D2;endline=3D3;md5=3D2d4=
0a75a50d83b8f6317b3f53db72bfa"
=20
--=20
2.17.1

