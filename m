Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E72A4C43219
	for <webhook@archiver.kernel.org>; Tue,  1 Feb 2022 16:35:13 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.51299.1643733312140614542
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 01 Feb 2022 08:35:13 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D712A113E
	for <openembedded-devel@lists.openembedded.org>;
 Tue,  1 Feb 2022 08:35:12 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8310C3F40C
	for <openembedded-devel@lists.openembedded.org>;
 Tue,  1 Feb 2022 08:35:12 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 07/14] poppler-data: set precise BSD license
Date: Tue,  1 Feb 2022 16:35:00 +0000
Message-Id: <20220201163507.1320861-7-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220201163507.1320861-1-ross.burton@arm.com>
References: <20220201163507.1320861-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 01 Feb 2022 16:35:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95192

The cMap data is under a BSD-3-Clause license.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-oe/recipes-support/poppler/poppler-data_0.4.11.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/poppler/poppler-data_0.4.11.bb b/met=
a-oe/recipes-support/poppler/poppler-data_0.4.11.bb
index 3b65083d0f..1360617985 100644
--- a/meta-oe/recipes-support/poppler/poppler-data_0.4.11.bb
+++ b/meta-oe/recipes-support/poppler/poppler-data_0.4.11.bb
@@ -2,7 +2,7 @@ SUMMARY =3D "Encoding files for Poppler"
 DESCRIPTION =3D "Encoding files for use with poppler that enable poppler=
 to \
                correctly render CJK and Cyrrilic."
 HOMEPAGE =3D "https://poppler.freedesktop.org/"
-LICENSE =3D "BSD & GPLv2 & GPLv3+"
+LICENSE =3D "BSD-3-Clause & GPLv2 & GPLv3+"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D96287d49ec274d9c3222b5f966c13=
2fd \
                     file://COPYING.adobe;md5=3Da790726a74164c30b5de1ef93=
fd69e99 \
                     file://COPYING.gpl2;md5=3D751419260aa954499f7abaabaa=
882bbe \
--=20
2.25.1


