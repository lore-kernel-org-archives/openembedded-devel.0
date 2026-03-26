Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA20C10AB81B
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 19:51:29 +0000 (UTC)
Received: from mailout09.t-online.de (mailout09.t-online.de [194.25.134.84])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.56831.1774554686898312299
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Mar 2026 12:51:27 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=XVPcaVvB;
 spf=pass (domain: t-online.de, ip: 194.25.134.84, mailfrom: f_l_k@t-online.de)
Received: from fwd76.aul.t-online.de (fwd76.aul.t-online.de [10.223.144.102])
	by mailout09.t-online.de (Postfix) with SMTP id A1C7F3A330
	for <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 20:51:24 +0100 (CET)
Received: from fedora.fritz.box ([79.219.228.172]) by fwd76.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1w5qjj-3uJ6xN0; Thu, 26 Mar 2026 20:51:23 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] luajit: update license checksum
Date: Thu, 26 Mar 2026 20:51:19 +0100
Message-ID: <20260326195119.2018455-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1774554683-15FF88AA-67309F6E/0/0 CLEAN NORMAL
X-TOI-MSGID: faff4f7f-ff30-4190-82c7-b269c3731cbe
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1774554684; i=f_l_k@t-online.de;
	bh=r/bmm3g9Yz88V9flxXgBDpQvLF1RiTkK3oAMpI6uOF4=;
	h=From:To:Subject:Date;
	b=XVPcaVvBuG6hz8df2BDulYv+eh4qwk2Dj+vTbpZ7GoIuRYgtDOSZOYsaXUoH5ds2G
	 vpqid1UtWcXBiGE6i1AV8POjlomOmuBXAYICJ9CFgX3KpYkz2eLoj65V42BD1qu90Y
	 2cObjyUnNvwiClRL8xpdp0D/oDsx3RzvLeBbe11NCbheGVn+MeFh5Vxapi2Om76Jf7
	 yhHiDgJOIgf0CFvZea6jewc5F4RtqsBZE98mTb47/kJNEfK8pEJ4gnpUmEqlsWPhVB
	 48M7x5ahp5Rr3pYrpqId6ig2MMui3ikQUoh2pbRDJuzELwyS5MkzLUXwBiPQCHc0j0
	 rS0gEiX5g8jgw==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 19:51:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125771

- copyright year has been changed

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-oe/recipes-devtools/luajit/luajit_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/luajit/luajit_git.bb b/meta-oe/reci=
pes-devtools/luajit/luajit_git.bb
index 9cd97ad381..9873ed6f05 100644
--- a/meta-oe/recipes-devtools/luajit/luajit_git.bb
+++ b/meta-oe/recipes-devtools/luajit/luajit_git.bb
@@ -1,6 +1,6 @@
 SUMMARY =3D "Just-In-Time Compiler for Lua"
 LICENSE =3D "MIT"
-LIC_FILES_CHKSUM =3D "file://COPYRIGHT;md5=3Dd421a5e2a24207f5e260537399a=
9a38b"
+LIC_FILES_CHKSUM =3D "file://COPYRIGHT;md5=3Da2c43bf4a9ea63755af2131b0ae=
59ff3"
 HOMEPAGE =3D "http://luajit.org"
=20
 SRC_URI =3D "git://luajit.org/git/luajit-2.0.git;protocol=3Dhttp;branch=3D=
v2.1 \
--=20
2.53.0


