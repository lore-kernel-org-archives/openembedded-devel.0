Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39B09C433F5
	for <webhook@archiver.kernel.org>; Thu, 18 Nov 2021 16:11:48 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.3702.1637251904514145144
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Nov 2021 08:11:48 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5FE0B1042
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Nov 2021 08:11:47 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 097813F766
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Nov 2021 08:11:46 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 10/19] libkcapi: set precise BSD license
Date: Thu, 18 Nov 2021 16:11:29 +0000
Message-Id: <20211118161138.663375-10-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211118161138.663375-1-ross.burton@arm.com>
References: <20211118161138.663375-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 18 Nov 2021 16:11:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94035

"BSD" is ambiguous, use the precise license BSD-3-Clause.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-oe/recipes-crypto/libkcapi/libkcapi_1.2.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-crypto/libkcapi/libkcapi_1.2.1.bb b/meta-oe/=
recipes-crypto/libkcapi/libkcapi_1.2.1.bb
index 2d15e9ac0f..cc71903a82 100644
--- a/meta-oe/recipes-crypto/libkcapi/libkcapi_1.2.1.bb
+++ b/meta-oe/recipes-crypto/libkcapi/libkcapi_1.2.1.bb
@@ -1,6 +1,6 @@
 SUMMARY =3D "Linux Kernel Crypto API User Space Interface Library"
 HOMEPAGE =3D "http://www.chronox.de/libkcapi.html"
-LICENSE =3D "BSD | GPL-2.0"
+LICENSE =3D "BSD-3-Clause | GPL-2.0"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dc78be93ed8d1637f2a3f4a83ff9d5=
f54"
=20
 S =3D "${WORKDIR}/git"
--=20
2.25.1


