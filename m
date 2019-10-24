Return-Path: <christophe.priouzeau@st.com>
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
	[91.207.212.93])
	by mail.openembedded.org (Postfix) with ESMTP id B24C17F967
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Oct 2019 14:56:08 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
	x9OEtrFG023526 for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Oct 2019 16:56:09 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
	h=from : to : cc : subject
	: date : message-id : references : in-reply-to : content-type :
	content-transfer-encoding : mime-version; s=STMicroelectronics;
	bh=6aXoD2lL0y08cwxF12f9tIdZz0sME0RHCHlfq+cwYi4=;
	b=pqPm69XRqaDjg/j2w1o3MaeJ+uZYvQd4SjrAQPtiM1tL/0oXykT5vPTV+C4ZnrOV4XC5
	NzvxjVfE0JP4eB0aSIZqVTtEIE+gYsPLpoyhaPAdKikYuV4hKtZXllFHo3PMThrKJmlw
	wfQUpRvXvzTi1Y5B7pY1PZHftKotvMC4UDIrbHDmR9FIjHcQx/IVYcEpVxdUuooxBM8p
	PiFT/FhqwUSaLrq5Q+0Rs0Evb57YM25qzEGIwJ1HyRD8iIdQZImUOWY22eIuww9DvzYe
	sSbsF5ouktzXyb9AMMrH/htpMplJnMbrJJkdOlqvHAbkWk1XcFIEXbnq/oJ82u8tOMIN
	Zg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by mx08-00178001.pphosted.com with ESMTP id 2vt9s52d51-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT) for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Oct 2019 16:56:09 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 0E0B2100039
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Oct 2019 16:56:09 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 074282C38B7
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Oct 2019 16:56:09 +0200 (CEST)
Received: from SFHDAG6NODE2.st.com (10.75.127.17) by SFHDAG6NODE1.st.com
	(10.75.127.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3;
	Thu, 24 Oct 2019 16:56:08 +0200
Received: from SFHDAG6NODE2.st.com ([fe80::a56f:c186:bab7:13d6]) by
	SFHDAG6NODE2.st.com ([fe80::a56f:c186:bab7:13d6%20]) with mapi id
	15.00.1347.000; Thu, 24 Oct 2019 16:56:08 +0200
From: Christophe PRIOUZEAU <christophe.priouzeau@st.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [meta-python][PATCH 8/9] Python: supervisor: Clarify BSD license
	variant
Thread-Index: AQHVinsqrPXKEoUsN0ibxKcEboK8JQ==
Date: Thu, 24 Oct 2019 14:56:08 +0000
Message-ID: <20191024145603.21854-8-christophe.priouzeau@st.com>
References: <20191024145603.21854-1-christophe.priouzeau@st.com>
In-Reply-To: <20191024145603.21854-1-christophe.priouzeau@st.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.47]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
	definitions=2019-10-24_09:2019-10-23,2019-10-24 signatures=0
Cc: Christophe PRIOUZEAU <christophe.priouzeau@st.com>
Subject: [meta-python][PATCH 8/9] Python: supervisor: Clarify BSD license variant
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
X-List-Received-Date: Thu, 24 Oct 2019 14:56:09 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

The License of python supervisor is BSD-4-Clause.

Signed-off-by: Christophe Priouzeau <christophe.priouzeau@st.com>
---
 meta-python/recipes-devtools/python/python-supervisor.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python-supervisor.inc b/me=
ta-python/recipes-devtools/python/python-supervisor.inc
index beab49739..158cd52e1 100644
--- a/meta-python/recipes-devtools/python/python-supervisor.inc
+++ b/meta-python/recipes-devtools/python/python-supervisor.inc
@@ -4,7 +4,7 @@ Supervisor is a client/server system that allows its users =
\
 to monitorand control a number of processes on UNIX-like \
 operating systems."
 HOMEPAGE =3D "https://github.com/Supervisor/supervisor"
-LICENSE =3D "BSD"
+LICENSE =3D "BSD-4-Clause"
 LIC_FILES_CHKSUM =3D "file://LICENSES.txt;md5=3D5b4e3a2172bba4c47cded5885e=
7e507e"
=20
 SRC_URI[md5sum] =3D "ac70dadd051dcaf1d03c467d51a3aac1"
--=20
2.17.1

