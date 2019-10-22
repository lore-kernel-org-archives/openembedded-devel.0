Return-Path: <christophe.priouzeau@st.com>
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
	[91.207.212.93])
	by mail.openembedded.org (Postfix) with ESMTP id 4AE487F71B
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Oct 2019 13:57:13 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
	by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
	x9MDuFaG007759 for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Oct 2019 15:57:14 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
	h=from : to : cc : subject
	: date : message-id : content-type : content-transfer-encoding :
	mime-version; s=STMicroelectronics;
	bh=tpkSvppyv6GEnflZQ6DbsZmlhLFVCFdGG8dn8hYHJdg=;
	b=u7QX4OZbj6Se7jEN2DWK5qpkUgMhOIdAqbIimyx2jPKTfqII6ChlKbH5vDvRInjr/mJ+
	SgyLbkGGIWRql40zqV4CAcaVBM9WYM3o96KUVi2QVuS/yJ5bDaJLqoGSGmQq55vzhZk/
	QeOKp1Ta4q6lU6m1yoVOakDqRRrUEmlixFOEH2aFrUR+hSNXuA/suwr1tgTYfTgudHyi
	QAjlqcl66H89MSero/b9Zv1ljbWN59HjOwdD6ULkNkEwAD9yTI20BXPjftmpaGtANCXk
	RnY8o3TZb9A6Ae9LeYy+u2kRZ1SzX5H4m4CHUgn6g2MUnHb2QSA7IPYisYlTm95tt3vh
	Qg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by mx08-00178001.pphosted.com with ESMTP id 2vqwva6t4y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT) for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Oct 2019 15:57:14 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id DD2CF100034
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Oct 2019 15:57:13 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id CD1132BB31F
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Oct 2019 15:57:13 +0200 (CEST)
Received: from SFHDAG6NODE2.st.com (10.75.127.17) by SFHDAG6NODE2.st.com
	(10.75.127.17) with Microsoft SMTP Server (TLS) id 15.0.1347.2;
	Tue, 22 Oct 2019 15:57:13 +0200
Received: from SFHDAG6NODE2.st.com ([fe80::a56f:c186:bab7:13d6]) by
	SFHDAG6NODE2.st.com ([fe80::a56f:c186:bab7:13d6%20]) with mapi id
	15.00.1347.000; Tue, 22 Oct 2019 15:57:13 +0200
From: Christophe PRIOUZEAU <christophe.priouzeau@st.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [meta-webserver][PATCH 1/2] spawn-fcgi: Clarify BSD license
	variant
Thread-Index: AQHViOCb8QMy+EZ4XkaO0hcOSg3bQA==
Date: Tue, 22 Oct 2019 13:57:13 +0000
Message-ID: <20191022135710.1724-1-christophe.priouzeau@st.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.47]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
	definitions=2019-10-22_03:2019-10-22,2019-10-22 signatures=0
Cc: Christophe PRIOUZEAU <christophe.priouzeau@st.com>
Subject: [meta-webserver][PATCH 1/2] spawn-fcgi: Clarify BSD license variant
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
X-List-Received-Date: Tue, 22 Oct 2019 13:57:14 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

The License of spawn-fcgi is BSD-3-Clause.

Signed-off-by: Christophe Priouzeau <christophe.priouzeau@st.com>
---
 meta-webserver/recipes-support/spawn-fcgi/spawn-fcgi_1.6.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-webserver/recipes-support/spawn-fcgi/spawn-fcgi_1.6.4.bb =
b/meta-webserver/recipes-support/spawn-fcgi/spawn-fcgi_1.6.4.bb
index 8b2ff44c0..1d66d1301 100644
--- a/meta-webserver/recipes-support/spawn-fcgi/spawn-fcgi_1.6.4.bb
+++ b/meta-webserver/recipes-support/spawn-fcgi/spawn-fcgi_1.6.4.bb
@@ -1,7 +1,7 @@
 SUMMARRY =3D "spawn-fcgi is used to spawn FastCGI applications"
 HOMEPAGE =3D "http://redmine.lighttpd.net/projects/spawn-fcgi"
=20
-LICENSE =3D "BSD"
+LICENSE =3D "BSD-3-Clause"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3De4dac5c6ab169aa212feb5028853a57=
9"
=20
 SRC_URI =3D "http://download.lighttpd.net/spawn-fcgi/releases-1.6.x/spawn-=
fcgi-${PV}.tar.gz \
--=20
2.17.1

