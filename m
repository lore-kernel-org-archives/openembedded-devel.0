Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 145F1C4345F
	for <webhook@archiver.kernel.org>; Thu, 18 Apr 2024 15:04:59 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.704.1713452691191624510
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Apr 2024 08:04:51 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 41A10339;
	Thu, 18 Apr 2024 08:05:18 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E8D743F738;
	Thu, 18 Apr 2024 08:04:49 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH] yajl: set correct homepage
Date: Thu, 18 Apr 2024 15:04:47 +0000
Message-Id: <20240418150447.3861626-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 18 Apr 2024 15:04:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110054

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-oe/recipes-devtools/yajl/yajl_2.1.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/yajl/yajl_2.1.0.bb b/meta-oe/recipe=
s-devtools/yajl/yajl_2.1.0.bb
index 2a34210f3c..c5b5e60027 100644
--- a/meta-oe/recipes-devtools/yajl/yajl_2.1.0.bb
+++ b/meta-oe/recipes-devtools/yajl/yajl_2.1.0.bb
@@ -3,7 +3,7 @@ SUMMARY =3D "Yet Another JSON Library."
 DESCRIPTION =3D "YAJL is a small event-driven (SAX-style) JSON parser \
 written in ANSI C, and a small validating JSON generator."
=20
-HOMEPAGE =3D "http://lloyd.github.com/yajl/"
+HOMEPAGE =3D "https://lloyd.github.io/yajl/"
=20
 LICENSE =3D "ISC"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D39af6eb42999852bdd3ea00ad120a=
36d"
--=20
2.34.1


