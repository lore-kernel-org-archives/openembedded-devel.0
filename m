Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F376BC43217
	for <webhook@archiver.kernel.org>; Tue,  1 Feb 2022 16:35:12 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.51045.1643733312139418497
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 01 Feb 2022 08:35:12 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3825D113E
	for <openembedded-devel@lists.openembedded.org>;
 Tue,  1 Feb 2022 08:35:11 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D81E53F40C
	for <openembedded-devel@lists.openembedded.org>;
 Tue,  1 Feb 2022 08:35:10 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 04/14] pkcs11-helper: update homepage
Date: Tue,  1 Feb 2022 16:34:57 +0000
Message-Id: <20220201163507.1320861-4-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220201163507.1320861-1-ross.burton@arm.com>
References: <20220201163507.1320861-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 01 Feb 2022 16:35:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95190

www.opensc-project.org expired, so point at the GitHub project page.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-oe/recipes-crypto/pkcs11-helper/pkcs11-helper_1.28.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-crypto/pkcs11-helper/pkcs11-helper_1.28.bb b=
/meta-oe/recipes-crypto/pkcs11-helper/pkcs11-helper_1.28.bb
index afad03c9a6..b8948c69bd 100644
--- a/meta-oe/recipes-crypto/pkcs11-helper/pkcs11-helper_1.28.bb
+++ b/meta-oe/recipes-crypto/pkcs11-helper/pkcs11-helper_1.28.bb
@@ -6,7 +6,7 @@ certificates, or selecting a certificate directly by seri=
alized id, handling \
 card removal and card insert events, handling card ie-insert to a differ=
ent \
 slot, supporting session expiration and much more all using a simple API=
."
=20
-HOMEPAGE =3D "http://www.opensc-project.org/pkcs11-helper/"
+HOMEPAGE =3D "https://github.com/OpenSC/pkcs11-helper"
 SECTION =3D "Development/Libraries"
=20
 LICENSE =3D "GPLv2 & BSD"
--=20
2.25.1


