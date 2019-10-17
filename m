Return-Path: <christophe.priouzeau@st.com>
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
	[91.207.212.93])
	by mail.openembedded.org (Postfix) with ESMTP id 34B367F6D7
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Oct 2019 14:47:03 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
	by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
	x9HEkvqU020526 for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Oct 2019 16:47:04 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
	h=from : to : cc : subject
	: date : message-id : references : in-reply-to : content-type :
	content-transfer-encoding : mime-version; s=STMicroelectronics;
	bh=O2X7UnnXeMFYa0Mz16IjwlFbHrqhwU+Y7iVlxbH4PZ0=;
	b=X/KcjWqzJL3EXBnEY0Dcs+cbV7cbYdRty/vNuRWD6HQvObbLrzULuFf7ET92WZubetNP
	HaX52ZpP9uvvBHI2HX99R3ZvpConA0v6f2eKTNC1j+wJZ1NV8vCMB6E4DLWdvwYQSjMU
	3+W1RLY2qENOT6ZaxxgIWQVFatO8Ca8GT/iQU59uPa2YJlmUTY9RCj4sK9i5YETSEy5n
	c7YE8EJVnW5+E7Bn4+72FFc/0rywFnJGYf+mJOoH0G+Pz2dCH58ZORicxONuTwk3q5AG
	0ZZyntUD8O/TER9w9pJBxYz8AmRUeR4qMPnNhEqYKVGD1gQHfEol51ehZN1LjKm+p8PS
	/A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by mx08-00178001.pphosted.com with ESMTP id 2vk5qjmnhq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT) for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Oct 2019 16:47:04 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 53BBA100034
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Oct 2019 16:47:04 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 4D68F2B5D7A
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Oct 2019 16:47:04 +0200 (CEST)
Received: from SFHDAG6NODE2.st.com (10.75.127.17) by SFHDAG6NODE2.st.com
	(10.75.127.17) with Microsoft SMTP Server (TLS) id 15.0.1347.2;
	Thu, 17 Oct 2019 16:47:03 +0200
Received: from SFHDAG6NODE2.st.com ([fe80::a56f:c186:bab7:13d6]) by
	SFHDAG6NODE2.st.com ([fe80::a56f:c186:bab7:13d6%20]) with mapi id
	15.00.1347.000; Thu, 17 Oct 2019 16:47:03 +0200
From: Christophe PRIOUZEAU <christophe.priouzeau@st.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [meta-oe][PATCH 7/7] daemonize: Clarify BSD license variant
Thread-Index: AQHVhPm96zYuKlIqGkqQHL5gG+K6aA==
Date: Thu, 17 Oct 2019 14:47:03 +0000
Message-ID: <20191017144659.24850-7-christophe.priouzeau@st.com>
References: <20191017144659.24850-1-christophe.priouzeau@st.com>
In-Reply-To: <20191017144659.24850-1-christophe.priouzeau@st.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.46]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
	definitions=2019-10-17_05:2019-10-17,2019-10-17 signatures=0
Cc: Christophe PRIOUZEAU <christophe.priouzeau@st.com>
Subject: [meta-oe][PATCH 7/7] daemonize: Clarify BSD license variant
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
X-List-Received-Date: Thu, 17 Oct 2019 14:47:04 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

The License of daemonize is BSD-3-Clause.

Signed-off-by: Christophe Priouzeau <christophe.priouzeau@st.com>
---
 meta-oe/recipes-support/daemonize/daemonize_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/daemonize/daemonize_git.bb b/meta-oe/r=
ecipes-support/daemonize/daemonize_git.bb
index 1e49eefcc..c76632781 100644
--- a/meta-oe/recipes-support/daemonize/daemonize_git.bb
+++ b/meta-oe/recipes-support/daemonize/daemonize_git.bb
@@ -1,6 +1,6 @@
 SUMMARY =3D "A tool to run a command as a daemon"
 HOMEPAGE =3D "http://software.clapper.org/daemonize/"
-LICENSE =3D "BSD"
+LICENSE =3D "BSD-3-Clause"
 LIC_FILES_CHKSUM =3D "file://LICENSE.md;md5=3D3cf9084faa88bc8554a9139d8d7d=
d35f"
 PV =3D "1.7.8"
=20
--=20
2.17.1

