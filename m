Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39284C4332F
	for <webhook@archiver.kernel.org>; Thu, 18 Nov 2021 16:11:52 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.3629.1637251903929438920
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Nov 2021 08:11:51 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3C67511D4
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Nov 2021 08:11:51 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DA3323F766
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Nov 2021 08:11:50 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 17/19] python3-posix-ipc: set precise BSD license
Date: Thu, 18 Nov 2021 16:11:36 +0000
Message-Id: <20211118161138.663375-17-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211118161138.663375-1-ross.burton@arm.com>
References: <20211118161138.663375-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 18 Nov 2021 16:11:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94042

"BSD" is ambiguous, use the precise license BSD-3-Clause.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-python/recipes-devtools/python/python3-posix-ipc_1.0.5.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-posix-ipc_1.0.5.=
bb b/meta-python/recipes-devtools/python/python3-posix-ipc_1.0.5.bb
index 2377bd5258..c46881cd47 100644
--- a/meta-python/recipes-devtools/python/python3-posix-ipc_1.0.5.bb
+++ b/meta-python/recipes-devtools/python/python3-posix-ipc_1.0.5.bb
@@ -1,7 +1,7 @@
 DESCRIPTION =3D "POSIX IPC primitives (semaphores, shared memory and mes=
sage queues) for Python"
 HOMEPAGE =3D "http://semanchuk.com/philip/posix_ipc/"
 SECTION =3D "devel/python"
-LICENSE =3D "BSD"
+LICENSE =3D "BSD-3-Clause"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Ddc089fb2f37e90799a54c19a20c98=
80f"
=20
 PYPI_PACKAGE =3D "posix_ipc"
--=20
2.25.1


