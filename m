Return-Path: <christophe.priouzeau@st.com>
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
	[62.209.51.94])
	by mail.openembedded.org (Postfix) with ESMTP id 1F9187F83D
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Oct 2019 15:16:38 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
	x9NFCc9j002263 for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Oct 2019 17:16:39 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
	h=from : to : cc : subject
	: date : message-id : references : in-reply-to : content-type :
	content-transfer-encoding : mime-version; s=STMicroelectronics;
	bh=tg6NxKi+dB3ybaohEypMEC4b4bBNWUwhDXuzyglurCM=;
	b=Gx76stP606fv7B/f1Yq0MLrikvgRmbF3V0WrZd5wb/VjR/BHX+xolSwpMBlOzki9BP7r
	VTMqnlfj3vyEv3Ip5/+bT+cLP93jaBJN4bM+3MrhXxRKXcUx+AtoZz9bcl4jhHKnZEaB
	iGv0k4DwGBwBfsT8wQgH4H2iVTPCNqNHp7nYOaCGzMtLS/bZpGXU3iJJjWmweEJBVTFn
	3SWmuRXMKi3VFdogMWbJeswWi13gxgesxogoM/JtF2aS31C2gmWPe4QWiyE8s4i3ql/u
	T6rbOd465Ct/9zM1zZdW5nfM95mfvn5akFgWTSvXqbXm5nqMoayK/ZnO92yIVysYHTL4
	xA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by mx07-00178001.pphosted.com with ESMTP id 2vt9s44dew-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT) for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Oct 2019 17:16:39 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 8A875100034
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Oct 2019 17:16:39 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 84AA12B1D56
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Oct 2019 17:16:39 +0200 (CEST)
Received: from SFHDAG6NODE2.st.com (10.75.127.17) by SFHDAG6NODE3.st.com
	(10.75.127.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3;
	Wed, 23 Oct 2019 17:16:39 +0200
Received: from SFHDAG6NODE2.st.com ([fe80::a56f:c186:bab7:13d6]) by
	SFHDAG6NODE2.st.com ([fe80::a56f:c186:bab7:13d6%20]) with mapi id
	15.00.1347.000; Wed, 23 Oct 2019 17:16:39 +0200
From: Christophe PRIOUZEAU <christophe.priouzeau@st.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [meta-oe][PATCH 08/10] libvpx: Clarify BSD license variant
Thread-Index: AQHVibTeK76FNTOvIUen+HvF5i6T9Q==
Date: Wed, 23 Oct 2019 15:16:39 +0000
Message-ID: <20191023151634.32423-8-christophe.priouzeau@st.com>
References: <20191023151634.32423-1-christophe.priouzeau@st.com>
In-Reply-To: <20191023151634.32423-1-christophe.priouzeau@st.com>
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
Subject: [meta-oe][PATCH 08/10] libvpx: Clarify BSD license variant
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
X-List-Received-Date: Wed, 23 Oct 2019 15:16:39 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

The License of libvpx is BSD-3-Clause.

Signed-off-by: Christophe Priouzeau <christophe.priouzeau@st.com>
---
 meta-oe/recipes-multimedia/webm/libvpx_1.8.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-multimedia/webm/libvpx_1.8.1.bb b/meta-oe/reci=
pes-multimedia/webm/libvpx_1.8.1.bb
index 70278ecca..006e73af4 100644
--- a/meta-oe/recipes-multimedia/webm/libvpx_1.8.1.bb
+++ b/meta-oe/recipes-multimedia/webm/libvpx_1.8.1.bb
@@ -3,7 +3,7 @@ DESCRIPTION =3D "The BSD-licensed libvpx reference implemen=
tation provides en- and
 HOMEPAGE =3D "http://www.webmproject.org/code/"
 BUGTRACKER =3D "http://code.google.com/p/webm/issues/list"
 SECTION =3D "libs/multimedia"
-LICENSE =3D "BSD"
+LICENSE =3D "BSD-3-Clause"
=20
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dd5b04755015be901744a78cc30d390d=
4"
=20
--=20
2.17.1

