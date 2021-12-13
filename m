Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DFD0C433FE
	for <webhook@archiver.kernel.org>; Mon, 13 Dec 2021 11:05:19 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.9736.1639393518175508861
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Dec 2021 03:05:18 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2F6896D
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Dec 2021 03:05:17 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CE4503F793
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Dec 2021 03:05:16 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 01/12] net-snmp: use precise BSD license
Date: Mon, 13 Dec 2021 11:05:00 +0000
Message-Id: <20211213110511.3274555-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 13 Dec 2021 11:05:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94315

"BSD" is vague, this license is BSD 3-clause BSD.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.1.bb=
 b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.1.bb
index e5a28de40d..b0c5bbdac0 100644
--- a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.1.bb
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.1.bb
@@ -1,7 +1,7 @@
 SUMMARY =3D "Various tools relating to the Simple Network Management Pro=
tocol"
 HOMEPAGE =3D "http://www.net-snmp.org/"
 SECTION =3D "net"
-LICENSE =3D "BSD & MIT"
+LICENSE =3D "BSD-3-Clause & MIT"
=20
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D9d100a395a38584f2ec18a8275261=
687"
=20
--=20
2.25.1


