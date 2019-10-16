Return-Path: <christophe.priouzeau@st.com>
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
	[91.207.212.93])
	by mail.openembedded.org (Postfix) with ESMTP id C22417F453
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Oct 2019 09:56:49 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
	x9G96gDM004815 for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Oct 2019 11:20:16 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
	h=from : to : cc : subject
	: date : message-id : content-type : content-transfer-encoding :
	mime-version; s=STMicroelectronics;
	bh=PdyjFD6KiVoeaeYEyxFmz8Heo9J2vvHFjrvt3KqKlPs=;
	b=XPtxRCn7yroryYxxzPTftygFrCIb7Z8T6zfUwWJAj98Zy5MGJNfYjU7nscm61LcBaOkq
	QK8XHpQb3YgSX2WrnRVrbf4Wp7rcebxO7mPzl8mSiAeHGe1faZTv0acx1w5/Cyb+eV1i
	ILcEHnrdeQD8BK2T8sKJZIGtiG09YfO31PYzXmM8+gtJhNXRjSegVT97q60mFM+vEIwl
	I4N1RSihXDGHLKnofMaS767xaUCREoXSJZAoW3AisGQo4OjBuLftOZQmsSAxpOuUVxhr
	GxUOmdG1f45P19EnGoh7gIEViAuDlwqxLhDjXGRFbMdsEm00A4JPn/Zas3MvGex7c1Wy
	SA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by mx08-00178001.pphosted.com with ESMTP id 2vk3y9wnth-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT) for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Oct 2019 11:20:16 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B8237100038
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Oct 2019 11:20:15 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A6F3C2BCE25
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Oct 2019 11:20:15 +0200 (CEST)
Received: from SFHDAG6NODE2.st.com (10.75.127.17) by SFHDAG6NODE1.st.com
	(10.75.127.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3;
	Wed, 16 Oct 2019 11:20:15 +0200
Received: from SFHDAG6NODE2.st.com ([fe80::a56f:c186:bab7:13d6]) by
	SFHDAG6NODE2.st.com ([fe80::a56f:c186:bab7:13d6%20]) with mapi id
	15.00.1347.000; Wed, 16 Oct 2019 11:20:14 +0200
From: Christophe PRIOUZEAU <christophe.priouzeau@st.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [meta-xfce][PATCH 1/3] xfce4-mpc-plugin: Clarify BSD license
	variant
Thread-Index: AQHVhALripn2gCdeWUKSVX5TGB8JTw==
Date: Wed, 16 Oct 2019 09:20:14 +0000
Message-ID: <20191016092013.6460-1-christophe.priouzeau@st.com>
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
Subject: [meta-xfce][PATCH 1/3] xfce4-mpc-plugin: Clarify BSD license variant
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
X-List-Received-Date: Wed, 16 Oct 2019 09:56:50 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

The License of xfce4 mpc plugin is BSD-0-Clause.

Signed-off-by: Christophe Priouzeau <christophe.priouzeau@st.com>
---
 .../xfce4-mpc-plugin/xfce4-mpc-plugin_0.5.2.bb                  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-xfce/recipes-multimedia/xfce4-mpc-plugin/xfce4-mpc-plugin=
_0.5.2.bb b/meta-xfce/recipes-multimedia/xfce4-mpc-plugin/xfce4-mpc-plugin_=
0.5.2.bb
index ff954acb8..9d031dd59 100644
--- a/meta-xfce/recipes-multimedia/xfce4-mpc-plugin/xfce4-mpc-plugin_0.5.2.=
bb
+++ b/meta-xfce/recipes-multimedia/xfce4-mpc-plugin/xfce4-mpc-plugin_0.5.2.=
bb
@@ -1,7 +1,7 @@
 SUMMARY =3D "Simple client plugin for Music Player Daemon"
 HOMEPAGE =3D "https://goodies.xfce.org/projects/panel-plugins/xfce4-mpc-pl=
ugin"
 SECTION =3D "x11/application"
-LICENSE =3D "BSD"
+LICENSE =3D "BSD-0-Clause"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D3604d987e6dfdfc672c754d08953b0e=
0"
=20
 inherit xfce-panel-plugin
--=20
2.17.1

