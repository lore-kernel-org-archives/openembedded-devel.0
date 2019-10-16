Return-Path: <christophe.priouzeau@st.com>
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
	[91.207.212.93])
	by mail.openembedded.org (Postfix) with ESMTP id 11BAF7F440
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Oct 2019 10:11:19 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
	by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
	x9G97AML027650 for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Oct 2019 11:20:17 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
	h=from : to : cc : subject
	: date : message-id : references : in-reply-to : content-type :
	content-transfer-encoding : mime-version; s=STMicroelectronics;
	bh=YGE2CuTwx6vHkzBkru1Mekds7vnQCYezuwgnBG0UDR8=;
	b=ohyiiuWm+9TxjeoydyPk8TmhLPPrPqXQH8pwoGlOS0Qvs7ive8duG/eJZIdJKq1skEcu
	i0WEQZleA7sXIhqPBfHTJ4DV7qk8mxy+ZQO3mVJRTap6uiopLV7KeRJV1mIBj2KSFOOi
	Ew+JNll5Iq+uA7InFJJJNBHZYIgcTdkgcFq/9P6YPB1c0n7UxOk8YgYgXbB2RnxcgIvP
	BwsUDjOXJ87TbDZApa/sTqmf9jin1c9HcGBIN0yGX6eGxOeejPKhxMkmba/75SOXqonC
	QSqqxJmkbFYhEfm0XhRbrr0L433o4V3glxhFGiFJrSKTT/geGVwmvNi4NloNlMMyieXA
	aw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by mx08-00178001.pphosted.com with ESMTP id 2vk5qjda84-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT) for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Oct 2019 11:20:16 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 1E32F10003D
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Oct 2019 11:20:16 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 16B652BCE26
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Oct 2019 11:20:16 +0200 (CEST)
Received: from SFHDAG6NODE2.st.com (10.75.127.17) by SFHDAG6NODE2.st.com
	(10.75.127.17) with Microsoft SMTP Server (TLS) id 15.0.1347.2;
	Wed, 16 Oct 2019 11:20:15 +0200
Received: from SFHDAG6NODE2.st.com ([fe80::a56f:c186:bab7:13d6]) by
	SFHDAG6NODE2.st.com ([fe80::a56f:c186:bab7:13d6%20]) with mapi id
	15.00.1347.000; Wed, 16 Oct 2019 11:20:15 +0200
From: Christophe PRIOUZEAU <christophe.priouzeau@st.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [meta-xfce][PATCH 2/3] xfce4-wavelan-plugin: Clarify BSD license
	variant
Thread-Index: AQHVhALrKnzl61oX90OtgV/m0yrnjw==
Date: Wed, 16 Oct 2019 09:20:15 +0000
Message-ID: <20191016092013.6460-2-christophe.priouzeau@st.com>
References: <20191016092013.6460-1-christophe.priouzeau@st.com>
In-Reply-To: <20191016092013.6460-1-christophe.priouzeau@st.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.51]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
	definitions=2019-10-16_03:2019-10-15,2019-10-16 signatures=0
Cc: Christophe PRIOUZEAU <christophe.priouzeau@st.com>
Subject: [meta-xfce][PATCH 2/3] xfce4-wavelan-plugin: Clarify BSD license variant
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
X-List-Received-Date: Wed, 16 Oct 2019 10:11:20 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

The License of xfce4 wavelan plugin is BSD-2-Clause.

Signed-off-by: Christophe Priouzeau <christophe.priouzeau@st.com>
---
 .../recipes-panel-plugins/wavelan/xfce4-wavelan-plugin_0.6.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-xfce/recipes-panel-plugins/wavelan/xfce4-wavelan-plugin_0=
.6.1.bb b/meta-xfce/recipes-panel-plugins/wavelan/xfce4-wavelan-plugin_0.6.=
1.bb
index 6ffa35aad..95c1fe4d9 100644
--- a/meta-xfce/recipes-panel-plugins/wavelan/xfce4-wavelan-plugin_0.6.1.bb
+++ b/meta-xfce/recipes-panel-plugins/wavelan/xfce4-wavelan-plugin_0.6.1.bb
@@ -1,6 +1,6 @@
 SUMMARY =3D "Panel plugin displaying stats from a wireless lan interface"
 HOMEPAGE =3D "https://goodies.xfce.org/projects/panel-plugins/xfce4-wavela=
n-plugin"
-LICENSE =3D "BSD"
+LICENSE =3D "BSD-2-Clause"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3De1e5872df9c5cf1a23f16493d910492=
0"
=20
 inherit xfce-panel-plugin
--=20
2.17.1

