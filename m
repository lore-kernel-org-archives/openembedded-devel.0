Return-Path: <christophe.priouzeau@st.com>
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
	[91.207.212.93])
	by mail.openembedded.org (Postfix) with ESMTP id 186AD7F829
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Oct 2019 15:15:55 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
	by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
	x9NFESIt025695 for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Oct 2019 17:15:56 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
	h=from : to : cc : subject
	: date : message-id : references : in-reply-to : content-type :
	content-transfer-encoding : mime-version; s=STMicroelectronics;
	bh=2ccSlUUQQrwwoK0q6oXEP5FLZnZL+DGcFUAMdcqjrrI=;
	b=vBRi5YA7Faq3LGBVKuIFc3RSlWKaIERzTpDAc+TlfZKP5wc7weFc69iCrhDEe7BdVVuM
	Cr1wy+8Jo+QZyQWz7XoZEVSc3hHverfXHWVvJdQoSqzfK+tS8Wxx9NWM103PLx34BYgw
	rWYlgQYvZAZDJZYw52+YmBbLQE1n/gd8lNaslYkV2r95SznCFlL9G993RrHCaxK7uloH
	fkO6qzvaAginBaoCSeqylBBTO9jfc9W4TiyWmLyqFbPMqR6hIVwxwq1zxvWBpIXcUCla
	CPP6QYJDpv1U+g780CXkFuq6k6RXvndjIXM5Vxq4iJnAsbqq4Yq4PXmphvIln8R11CqC
	gg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by mx08-00178001.pphosted.com with ESMTP id 2vt9s74dr0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT) for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Oct 2019 17:15:56 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 514AA10002A
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Oct 2019 17:15:56 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 4B4322B28CA
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Oct 2019 17:15:56 +0200 (CEST)
Received: from SFHDAG6NODE2.st.com (10.75.127.17) by SFHDAG6NODE2.st.com
	(10.75.127.17) with Microsoft SMTP Server (TLS) id 15.0.1347.2;
	Wed, 23 Oct 2019 17:15:55 +0200
Received: from SFHDAG6NODE2.st.com ([fe80::a56f:c186:bab7:13d6]) by
	SFHDAG6NODE2.st.com ([fe80::a56f:c186:bab7:13d6%20]) with mapi id
	15.00.1347.000; Wed, 23 Oct 2019 17:15:55 +0200
From: Christophe PRIOUZEAU <christophe.priouzeau@st.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [meta-oe][PATCH 09/10] hwloc: Clarify BSD license variant
Thread-Index: AQHVibTEzFQLBEV2r0iocXHZvfVZGA==
Date: Wed, 23 Oct 2019 15:15:55 +0000
Message-ID: <20191023151549.22648-9-christophe.priouzeau@st.com>
References: <20191023151549.22648-1-christophe.priouzeau@st.com>
In-Reply-To: <20191023151549.22648-1-christophe.priouzeau@st.com>
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
Subject: [meta-oe][PATCH 09/10] hwloc: Clarify BSD license variant
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
X-List-Received-Date: Wed, 23 Oct 2019 15:15:56 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

The License of hwloc is BSD-3-Clause.

Signed-off-by: Christophe Priouzeau <christophe.priouzeau@st.com>
---
 meta-oe/recipes-extended/hwloc/hwloc_1.11.13.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/hwloc/hwloc_1.11.13.bb b/meta-oe/reci=
pes-extended/hwloc/hwloc_1.11.13.bb
index 7231484fe..2b0dfe4ea 100644
--- a/meta-oe/recipes-extended/hwloc/hwloc_1.11.13.bb
+++ b/meta-oe/recipes-extended/hwloc/hwloc_1.11.13.bb
@@ -4,7 +4,7 @@ DESCRIPTION =3D "The Portable Hardware Locality (hwloc) sof=
tware package \
  architectures."
 HOMEPAGE =3D "https://www.open-mpi.org/software/hwloc/"
 SECTION =3D "base"
-LICENSE =3D "BSD"
+LICENSE =3D "BSD-3-Clause"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D3282e20dc3cec311deda3c6d4b1f990=
b"
=20
 SRC_URI =3D "https://www.open-mpi.org/software/${BPN}/v1.11/downloads/${BP=
}.tar.bz2"
--=20
2.17.1

