Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8134C4167B
	for <webhook@archiver.kernel.org>; Tue,  1 Feb 2022 16:35:14 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.50671.1643733312855691688
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 01 Feb 2022 08:35:14 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EFB4B113E
	for <openembedded-devel@lists.openembedded.org>;
 Tue,  1 Feb 2022 08:35:13 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9B8763F40C
	for <openembedded-devel@lists.openembedded.org>;
 Tue,  1 Feb 2022 08:35:13 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 09/14] minidlna: use precise BSD license
Date: Tue,  1 Feb 2022 16:35:02 +0000
Message-Id: <20220201163507.1320861-9-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220201163507.1320861-1-ross.burton@arm.com>
References: <20220201163507.1320861-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 01 Feb 2022 16:35:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95194

This package is BSD-3-Clause.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-multimedia/recipes-multimedia/minidlna/minidlna.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-multimedia/recipes-multimedia/minidlna/minidlna.inc b/m=
eta-multimedia/recipes-multimedia/minidlna/minidlna.inc
index 7f916b2be5..b913a83931 100644
--- a/meta-multimedia/recipes-multimedia/minidlna/minidlna.inc
+++ b/meta-multimedia/recipes-multimedia/minidlna/minidlna.inc
@@ -1,6 +1,6 @@
 DESCRIPTION =3D "MiniDLNA (aka ReadyDLNA) is server software with the ai=
m of \
 being fully compliant with DLNA/UPnP-AV clients."
-LICENSE =3D "GPL-2.0|BSD"
+LICENSE =3D "GPL-2.0|BSD-3-Clause"
 DEPENDS =3D "ffmpeg flac libav jpeg sqlite3 libexif libogg libid3tag lib=
vorbis"
=20
 # because it depends on libav which has commercial flag
--=20
2.25.1


