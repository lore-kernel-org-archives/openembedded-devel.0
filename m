Return-Path: <christophe.priouzeau@st.com>
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
	[91.207.212.93])
	by mail.openembedded.org (Postfix) with ESMTP id C00E97F734
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Oct 2019 14:19:11 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
	x9ME6CpR001425 for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Oct 2019 16:19:12 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
	h=from : to : cc : subject
	: date : message-id : references : in-reply-to : content-type :
	content-transfer-encoding : mime-version; s=STMicroelectronics;
	bh=CBx4blfQwXpb9RN/I3itwAhX5ZL9WDJRSFZImnAPVsI=;
	b=uqsbcuqKL+9LaqlTCgN/G2yUlRCXGysy5ehRRlovdRBpNLjf7J4Koq9FAsACtj6/AGzm
	ci9r7ZQW8YVtJvptYRBk4ii5azAx/oEO2FqFUblpI0zGo4nkXdJpjOWi7NQ0biKsyWRq
	Uuq4eEUIssVLRt1vZWb88YSBm92lDq1vlV1KkkptI/0RDaxkMGBxTHqH6NvjWIxPpDrO
	7KSoB2dpVgTb5dSVrEplEQUeMpkeso8NQ/cEw7fpi6k/NYQNuGJZ8Sy8U8P7RuM+5v5D
	K8jgOCZcZsfKK3y2gX8LxEwMoxhczRa+SUQqWAKwlGnAiDsOm2Uhrctjc5rpcqOQ86Qu
	Ug== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by mx08-00178001.pphosted.com with ESMTP id 2vqwxy6vax-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT) for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Oct 2019 16:19:12 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 178C2100039
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Oct 2019 16:19:12 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 10B832AEF90
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Oct 2019 16:19:12 +0200 (CEST)
Received: from SFHDAG6NODE2.st.com (10.75.127.17) by SFHDAG6NODE2.st.com
	(10.75.127.17) with Microsoft SMTP Server (TLS) id 15.0.1347.2;
	Tue, 22 Oct 2019 16:19:11 +0200
Received: from SFHDAG6NODE2.st.com ([fe80::a56f:c186:bab7:13d6]) by
	SFHDAG6NODE2.st.com ([fe80::a56f:c186:bab7:13d6%20]) with mapi id
	15.00.1347.000; Tue, 22 Oct 2019 16:19:11 +0200
From: Christophe PRIOUZEAU <christophe.priouzeau@st.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [meta-networking][PATCH 06/16] corosync: Clarify BSD license
	variant
Thread-Index: AQHViOOs864xiJf0iEe4GdwkokQjoQ==
Date: Tue, 22 Oct 2019 14:19:11 +0000
Message-ID: <20191022141907.4412-6-christophe.priouzeau@st.com>
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
Subject: [meta-networking][PATCH 06/16] corosync: Clarify BSD license variant
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

The License of corosync is BSD-3-Clause.

Signed-off-by: Christophe Priouzeau <christophe.priouzeau@st.com>
---
 meta-networking/recipes-extended/corosync/corosync_2.4.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-extended/corosync/corosync_2.4.4.bb b/=
meta-networking/recipes-extended/corosync/corosync_2.4.4.bb
index e2ab25b10..e5fa16a13 100644
--- a/meta-networking/recipes-extended/corosync/corosync_2.4.4.bb
+++ b/meta-networking/recipes-extended/corosync/corosync_2.4.4.bb
@@ -16,7 +16,7 @@ SRC_URI[sha256sum] =3D "9bd4707bb271df16f8d543ec782eb4c35=
ec0330b7be696b797da4bd8f0
=20
 UPSTREAM_CHECK_REGEX =3D "(?P<pver>\d+\.(?!99)\d+(\.\d+)+)"
=20
-LICENSE =3D "BSD"
+LICENSE =3D "BSD-3-Clause"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Da85eb4ce24033adb6088dd1d6ffc5e5=
d"
=20
 DEPENDS =3D "groff-native nss libqb"
--=20
2.17.1

