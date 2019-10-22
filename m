Return-Path: <christophe.priouzeau@st.com>
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
	[91.207.212.93])
	by mail.openembedded.org (Postfix) with ESMTP id C94217F763
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Oct 2019 14:19:15 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
	by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
	x9ME0sNm011276 for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Oct 2019 16:19:16 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
	h=from : to : cc : subject
	: date : message-id : references : in-reply-to : content-type :
	content-transfer-encoding : mime-version; s=STMicroelectronics;
	bh=Nsx0UQPnZZL7WKEyk+qFVI82a1nIP4IzapZU0lm+tx4=;
	b=SUgnwJUseIfzCNB7udLIzn3W4kIl2QLvyK3L/Bzklqwp9wNRZS4CtH4S7raPu4rwjeuH
	PeUJE6i0N4O7j0eAYJjzETBWp681DMUrdCicIOH0g1HU3PW+0Rcj53nnrEPj9gnFVxGQ
	Lg7d29+eGGB9i9PPdzmkr1hA5Vy/7cZv6eFalALEjWH52dQf+NxopttGotp64Oa5B5FI
	cfXefWKNBgg9scG/d6iEig1NvI85nFu5DdHHwbTGWDhop+8Fc9pJXTcs1Ck/nz8tug0B
	Crwoq1RpbqkYxTjRwFYl0nwcZCh2kKL8KyQRo5lXObFIBjDx00fML6dlt+Qhy127ixuu
	Dw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by mx08-00178001.pphosted.com with ESMTP id 2vqwva6wc2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT) for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Oct 2019 16:19:16 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 2634E100034
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Oct 2019 16:19:16 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 210102AEF90
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Oct 2019 16:19:16 +0200 (CEST)
Received: from SFHDAG6NODE2.st.com (10.75.127.17) by SFHDAG6NODE1.st.com
	(10.75.127.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3;
	Tue, 22 Oct 2019 16:19:15 +0200
Received: from SFHDAG6NODE2.st.com ([fe80::a56f:c186:bab7:13d6]) by
	SFHDAG6NODE2.st.com ([fe80::a56f:c186:bab7:13d6%20]) with mapi id
	15.00.1347.000; Tue, 22 Oct 2019 16:19:15 +0200
From: Christophe PRIOUZEAU <christophe.priouzeau@st.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [meta-networking][PATCH 15/16] spice-protocol: Clarify BSD
	license variant
Thread-Index: AQHViOOvR6y7T5Ue7E6qif7uO1RJJg==
Date: Tue, 22 Oct 2019 14:19:15 +0000
Message-ID: <20191022141907.4412-15-christophe.priouzeau@st.com>
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
Subject: [meta-networking][PATCH 15/16] spice-protocol: Clarify BSD license variant
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
X-List-Received-Date: Tue, 22 Oct 2019 14:19:16 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

The License of spice-protocol is BSD-3-Clause.

Signed-off-by: Christophe Priouzeau <christophe.priouzeau@st.com>
---
 meta-networking/recipes-support/spice/spice-protocol_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/spice/spice-protocol_git.bb b/=
meta-networking/recipes-support/spice/spice-protocol_git.bb
index be9dba32f..966ca41c9 100644
--- a/meta-networking/recipes-support/spice/spice-protocol_git.bb
+++ b/meta-networking/recipes-support/spice/spice-protocol_git.bb
@@ -10,7 +10,7 @@ environment - not only on its computer-server machine, bu=
t also from \
 anywhere on the Internet and using a wide variety of machine \
 architectures."
=20
-LICENSE =3D "BSD"
+LICENSE =3D "BSD-3-Clause"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db37311cb5604f3e5cc2fb0fd23527e9=
5"
=20
 PV =3D "0.14.0+git${SRCPV}"
--=20
2.17.1

