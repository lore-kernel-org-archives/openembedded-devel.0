Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D1C4C64ED9
	for <webhook@archiver.kernel.org>; Mon, 20 Feb 2023 15:46:21 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.16494.1676907977599365123
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Feb 2023 07:46:17 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 12EADFEC;
	Mon, 20 Feb 2023 07:47:00 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id ABBC63F703;
	Mon, 20 Feb 2023 07:46:16 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 2/8] python3-simpleeval: update patch status
Date: Mon, 20 Feb 2023 15:46:08 +0000
Message-Id: <20230220154614.42832-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230220154614.42832-1-ross.burton@arm.com>
References: <20230220154614.42832-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Feb 2023 15:46:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101169

---
 .../recipes-devtools/python/python3-simpleeval/no-build.patch   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-simpleeval/no-bu=
ild.patch b/meta-python/recipes-devtools/python/python3-simpleeval/no-bui=
ld.patch
index b090755f8a..8302c3b298 100644
--- a/meta-python/recipes-devtools/python/python3-simpleeval/no-build.pat=
ch
+++ b/meta-python/recipes-devtools/python/python3-simpleeval/no-build.pat=
ch
@@ -1,4 +1,4 @@
-Upstream-Status: Submitted [https://github.com/danthedeckie/simpleeval/p=
ull/119]
+Upstream-Status: Backport [https://github.com/danthedeckie/simpleeval/pu=
ll/119]
 Signed-off-by: Ross Burton <ross.burton@arm.com>
=20
 From 08bc99211aec32882d5f1c83896eb5d72b9fb125 Mon Sep 17 00:00:00 2001
--=20
2.34.1


