Return-Path: <christophe.priouzeau@st.com>
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
	[91.207.212.93])
	by mail.openembedded.org (Postfix) with ESMTP id 9D8517F7E5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Oct 2019 15:15:53 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
	by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
	x9NFETjr025713 for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Oct 2019 17:15:54 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
	h=from : to : cc : subject
	: date : message-id : references : in-reply-to : content-type :
	content-transfer-encoding : mime-version; s=STMicroelectronics;
	bh=4pa5ENMLFTlEm4cbeRvhwoKO1U/C7IVknvk6ff+8G+I=;
	b=zvFC/hPzKfiNACUbcVee8sItsyE27xr/zOb0TDIuhqb5EpszMYzaM4n2lA+yskqr+QpC
	er5VL13ctDDaonBXUdVUY8MKyF0H4duA7IvyzzBhbjMngR/MBdF2rEf+7w1c9yqiKoxk
	PBpvhKFqMeacDb9bqEDWvMRuZ+V5rCrdKiK96GFRjmf6dJ6tbyrwhY3YUE59dLrgbdGW
	bth7HMGVDQMPq4zLJH7eTs170byWkhA2yLMUOKDgjtsmqUMQFSxODuo9tl0+R/ttNO4y
	95dcPdz2VgtJS/+GVj0ng5REmDdzik7joCTekF24o+p15HZ8iZHusD8eGhck+WvKE/+w
	3w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by mx08-00178001.pphosted.com with ESMTP id 2vt9s74dqp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT) for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Oct 2019 17:15:54 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id D022C100038
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Oct 2019 17:15:53 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C665B2B1D56
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Oct 2019 17:15:53 +0200 (CEST)
Received: from SFHDAG6NODE2.st.com (10.75.127.17) by SFHDAG6NODE2.st.com
	(10.75.127.17) with Microsoft SMTP Server (TLS) id 15.0.1347.2;
	Wed, 23 Oct 2019 17:15:53 +0200
Received: from SFHDAG6NODE2.st.com ([fe80::a56f:c186:bab7:13d6]) by
	SFHDAG6NODE2.st.com ([fe80::a56f:c186:bab7:13d6%20]) with mapi id
	15.00.1347.000; Wed, 23 Oct 2019 17:15:53 +0200
From: Christophe PRIOUZEAU <christophe.priouzeau@st.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [meta-oe][PATCH 04/10] postgresql: Clarify BSD license variant
Thread-Index: AQHVibTCBLxGkcGKEUGgdtT/7Zi8Pw==
Date: Wed, 23 Oct 2019 15:15:53 +0000
Message-ID: <20191023151549.22648-4-christophe.priouzeau@st.com>
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
Subject: [meta-oe][PATCH 04/10] postgresql: Clarify BSD license variant
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
X-List-Received-Date: Wed, 23 Oct 2019 15:15:54 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

The License of postgresql is BSD-0-Clause.

Signed-off-by: Christophe Priouzeau <christophe.priouzeau@st.com>
---
 meta-oe/recipes-dbs/postgresql/postgresql.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-dbs/postgresql/postgresql.inc b/meta-oe/recipe=
s-dbs/postgresql/postgresql.inc
index 0fe5d58e1..91d0275b3 100644
--- a/meta-oe/recipes-dbs/postgresql/postgresql.inc
+++ b/meta-oe/recipes-dbs/postgresql/postgresql.inc
@@ -18,7 +18,7 @@ DESCRIPTION =3D "\
     this package if you're installing the postgresql-server package. \
 "
 HOMEPAGE =3D "http://www.postgresql.com"
-LICENSE =3D "BSD"
+LICENSE =3D "BSD-0-Clause"
 DEPENDS =3D "libnsl2 zlib readline tzcode-native"
=20
 ARM_INSTRUCTION_SET =3D "arm"
--=20
2.17.1

