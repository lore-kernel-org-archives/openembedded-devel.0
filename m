Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A641CCD1BF
	for <webhook@archiver.kernel.org>; Tue, 28 Oct 2025 20:04:51 +0000 (UTC)
Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by mx.groups.io with SMTP id smtpd.web11.19123.1761681884642161614
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Oct 2025 13:04:44 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.81, mailfrom: f_l_k@t-online.de)
Received: from fwd83.aul.t-online.de (fwd83.aul.t-online.de [10.223.144.109])
	by mailout03.t-online.de (Postfix) with SMTP id 9F45BF575
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 Oct 2025 21:04:42 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.163.37.69]) by fwd83.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1vDpvr-1hsvc90; Tue, 28 Oct 2025 21:04:39 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-multimedia][PATCH] nv-codec-headers: update 12.1.14.0 -> 13.0.19.0
Date: Tue, 28 Oct 2025 21:04:34 +0100
Message-ID: <20251028200434.928319-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1761681879-70FF6925-1637DB0F/0/0 CLEAN NORMAL
X-TOI-MSGID: bdc1d49a-d5a2-4030-a861-281cebe362c0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 Oct 2025 20:04:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121098

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...codec-headers_12.1.14.0.bb =3D> nv-codec-headers_13.0.19.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-multimedia/recipes-multimedia/nv-codec-headers/{nv-codec-hea=
ders_12.1.14.0.bb =3D> nv-codec-headers_13.0.19.0.bb} (90%)

diff --git a/meta-multimedia/recipes-multimedia/nv-codec-headers/nv-codec=
-headers_12.1.14.0.bb b/meta-multimedia/recipes-multimedia/nv-codec-heade=
rs/nv-codec-headers_13.0.19.0.bb
similarity index 90%
rename from meta-multimedia/recipes-multimedia/nv-codec-headers/nv-codec-=
headers_12.1.14.0.bb
rename to meta-multimedia/recipes-multimedia/nv-codec-headers/nv-codec-he=
aders_13.0.19.0.bb
index 6ac74748be..ef9490a7c3 100644
--- a/meta-multimedia/recipes-multimedia/nv-codec-headers/nv-codec-header=
s_12.1.14.0.bb
+++ b/meta-multimedia/recipes-multimedia/nv-codec-headers/nv-codec-header=
s_13.0.19.0.bb
@@ -7,7 +7,7 @@ SRC_URI =3D " \
     git://git.videolan.org/git/ffmpeg/nv-codec-headers.git;branch=3Dmast=
er;protocol=3Dhttps \
     file://0001-Makefile-add-clean-target.patch \
 "
-SRCREV =3D "1889e62e2d35ff7aa9baca2bceb14f053785e6f1"
+SRCREV =3D "e844e5b26f46bb77479f063029595293aa8f812d"
=20
 EXTRA_OEMAKE =3D "PREFIX=3D${prefix} DESTDIR=3D${D} LIBDIR=3D${baselib}"
=20
--=20
2.51.0


