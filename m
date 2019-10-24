Return-Path: <christophe.priouzeau@st.com>
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
	[91.207.212.93])
	by mail.openembedded.org (Postfix) with ESMTP id 0FE107F9B9
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Oct 2019 14:56:06 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
	by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
	x9OEu4Sr020659 for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Oct 2019 16:56:07 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
	h=from : to : cc : subject
	: date : message-id : references : in-reply-to : content-type :
	content-transfer-encoding : mime-version; s=STMicroelectronics;
	bh=UgmgFTmf7TXp+nQFvTCOQpv++ksW17xi40mO41gkwbU=;
	b=sNGbaWUIvAUfg92Zq6p7Uv1vB1tFIb6lS8dxP+uJd2DETfKX/MuqWT1OP/A4Rap5jgt4
	XsGZLkFGbzdITMhwKKiOt/q+2A/4u1P+j86g/6OX8IP9wSp6g+ozqCxnP1Lb3jFMw2NY
	c9nKC0NhSyYEW+Y/x2d791qmwdHgBcbYI/HiVOV/El+XoqrHEbj1+u88s0VXZKvPSmpS
	tprebUwVU3uMZg1DVsOJKEir8656gR2iP3wfYz/cdeDrvGn0OvVeiaK6xyZ745ZTRD+Z
	0iuV9MeGILUw4aDR/0kOQF7ieO54odTbX6SQjTjxOPodNBXexrjUXTNfU/VrEugBHrtB
	1Q== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by mx08-00178001.pphosted.com with ESMTP id 2vt9s7acq6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT) for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Oct 2019 16:56:07 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 6FC4C100038
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Oct 2019 16:56:06 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 685F62C38B7
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Oct 2019 16:56:06 +0200 (CEST)
Received: from SFHDAG6NODE2.st.com (10.75.127.17) by SFHDAG6NODE1.st.com
	(10.75.127.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3;
	Thu, 24 Oct 2019 16:56:05 +0200
Received: from SFHDAG6NODE2.st.com ([fe80::a56f:c186:bab7:13d6]) by
	SFHDAG6NODE2.st.com ([fe80::a56f:c186:bab7:13d6%20]) with mapi id
	15.00.1347.000; Thu, 24 Oct 2019 16:56:05 +0200
From: Christophe PRIOUZEAU <christophe.priouzeau@st.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [meta-python][PATCH 2/9] Python: netaddr: Clarify BSD license
	variant
Thread-Index: AQHVinspHP8v25ZCW0CmF0dk8Ih/BA==
Date: Thu, 24 Oct 2019 14:56:05 +0000
Message-ID: <20191024145603.21854-2-christophe.priouzeau@st.com>
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
Subject: [meta-python][PATCH 2/9] Python: netaddr: Clarify BSD license variant
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
X-List-Received-Date: Thu, 24 Oct 2019 14:56:07 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

The License of python netaddr is BSD-3-Clause.

Signed-off-by: Christophe Priouzeau <christophe.priouzeau@st.com>
---
 meta-python/recipes-devtools/python/python-netaddr.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python-netaddr.inc b/meta-=
python/recipes-devtools/python/python-netaddr.inc
index 5b6d4dffa..bea9be674 100644
--- a/meta-python/recipes-devtools/python/python-netaddr.inc
+++ b/meta-python/recipes-devtools/python/python-netaddr.inc
@@ -1,5 +1,5 @@
 SUMMARY =3D "A network address manipulation library for Python."
-LICENSE =3D "BSD"
+LICENSE =3D "BSD-3-Clause"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3De6345d695ffe3776f68a56fe7962db4=
4"
=20
 SRC_URI[md5sum] =3D "51019ef59c93f3979bcb37d3b8527e07"
--=20
2.17.1

