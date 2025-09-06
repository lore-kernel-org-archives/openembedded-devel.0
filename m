Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24563CA1002
	for <webhook@archiver.kernel.org>; Sat,  6 Sep 2025 06:47:37 +0000 (UTC)
Received: from mailout05.t-online.de (mailout05.t-online.de [194.25.134.82])
 by mx.groups.io with SMTP id smtpd.web11.2375.1757141250615050745
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 05 Sep 2025 23:47:31 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.82, mailfrom: f_l_k@t-online.de)
Received: from fwd72.aul.t-online.de (fwd72.aul.t-online.de [10.223.144.98])
	by mailout05.t-online.de (Postfix) with SMTP id 8EA5010DF
	for <openembedded-devel@lists.openembedded.org>; Sat,  6 Sep 2025 08:47:28 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([79.219.234.138]) by fwd72.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1uumhm-1tFz0t0; Sat, 6 Sep 2025 08:47:22 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 3/3] malcontent: update 0.13.0 -> 0.13.1
Date: Sat,  6 Sep 2025 08:47:11 +0200
Message-ID: <20250906064711.1430212-3-f_l_k@t-online.de>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250906064711.1430212-1-f_l_k@t-online.de>
References: <20250906064711.1430212-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1757141242-D27FB9FF-4321CCD8/0/0 CLEAN NORMAL
X-TOI-MSGID: 4fed308c-1c89-4378-a3b3-7c92d7f912d9
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 06 Sep 2025 06:47:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119320

Bugs fixed:
(or any click on carousel's icons) (Philip Withnall)

!244 malcontent-control: Fix callback argument list
---
 meta-oe/recipes-gnome/malcontent/malcontent.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-gnome/malcontent/malcontent.inc b/meta-oe/re=
cipes-gnome/malcontent/malcontent.inc
index 10597f3308..7cb052d69c 100644
--- a/meta-oe/recipes-gnome/malcontent/malcontent.inc
+++ b/meta-oe/recipes-gnome/malcontent/malcontent.inc
@@ -1,3 +1,3 @@
-SRC_URI =3D "git://gitlab.freedesktop.org/pwithnall/malcontent.git;proto=
col=3Dhttps;branch=3Dmain"
-SRCREV =3D "21f3ef7b6f984710a23b607d2298fe16e554f0c3"
-PV =3D "0.13.0"
+SRC_URI =3D "git://gitlab.freedesktop.org/pwithnall/malcontent.git;proto=
col=3Dhttps;branch=3Dmalcontent-0.13"
+SRCREV =3D "090042fec5181621e2fd8cfef9fc446ed86db98b"
+PV =3D "0.13.1"
--=20
2.50.1


