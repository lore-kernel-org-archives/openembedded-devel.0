Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D203C43217
	for <webhook@archiver.kernel.org>; Thu, 18 Nov 2021 16:11:47 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.3629.1637251903929438920
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Nov 2021 08:11:46 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B55D41042
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Nov 2021 08:11:45 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5ED1E3F766
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Nov 2021 08:11:45 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 07/19] sg3-utils: set precise BSD license
Date: Thu, 18 Nov 2021 16:11:26 +0000
Message-Id: <20211118161138.663375-7-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211118161138.663375-1-ross.burton@arm.com>
References: <20211118161138.663375-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 18 Nov 2021 16:11:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94032

"BSD" is ambiguous, use the precise license BSD-2-Clause.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-oe/recipes-support/sg3-utils/sg3-utils_1.45.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/sg3-utils/sg3-utils_1.45.bb b/meta-o=
e/recipes-support/sg3-utils/sg3-utils_1.45.bb
index 43ee19afb8..3d07c01f07 100644
--- a/meta-oe/recipes-support/sg3-utils/sg3-utils_1.45.bb
+++ b/meta-oe/recipes-support/sg3-utils/sg3-utils_1.45.bb
@@ -5,7 +5,7 @@ DESCRIPTION =3D "This package contains low level utilitie=
s for devices that use th
 HOMEPAGE =3D "http://sg.danny.cz/sg/sg3_utils.html"
 SECTION =3D "console/admin"
=20
-LICENSE =3D "GPLv2+ & BSD"
+LICENSE =3D "GPLv2+ & BSD-2-Clause"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Df90da7fc52172599dbf082d7620f1=
8ca"
=20
 SRC_URI =3D "http://sg.danny.cz/sg/p/sg3_utils-${PV}.tgz \
--=20
2.25.1


