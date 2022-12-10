Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D30EEC4332F
	for <webhook@archiver.kernel.org>; Sat, 10 Dec 2022 10:05:41 +0000 (UTC)
Received: from mailout12.t-online.de (mailout12.t-online.de [194.25.134.22])
 by mx.groups.io with SMTP id smtpd.web11.11910.1670666740423457227
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 10 Dec 2022 02:05:40 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.22, mailfrom: f_l_k@t-online.de)
Received: from fwd86.dcpf.telekom.de (fwd86.aul.t-online.de [10.223.144.112])
	by mailout12.t-online.de (Postfix) with SMTP id 756F37968
	for <openembedded-devel@lists.openembedded.org>; Sat, 10 Dec 2022 11:05:38 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([79.219.225.165]) by fwd86.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1p3wje-1e6dwf0; Sat, 10 Dec 2022 11:05:34 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-gnome][PATCH 1/2] tracker-miners: update 3.4.1 -> 3.4.2
Date: Sat, 10 Dec 2022 11:05:20 +0100
Message-Id: <20221210100521.3720-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1670666734-DA24F9D3-E6F66152/0/0 CLEAN NORMAL
X-TOI-MSGID: d2eae5f7-ffa0-40c6-9af0-e19615b347d4
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 10 Dec 2022 10:05:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100027

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../{tracker-miners_3.4.1.bb =3D> tracker-miners_3.4.2.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/tracker/{tracker-miners_3.4.1.bb =3D> tr=
acker-miners_3.4.2.bb} (96%)

diff --git a/meta-gnome/recipes-gnome/tracker/tracker-miners_3.4.1.bb b/m=
eta-gnome/recipes-gnome/tracker/tracker-miners_3.4.2.bb
similarity index 96%
rename from meta-gnome/recipes-gnome/tracker/tracker-miners_3.4.1.bb
rename to meta-gnome/recipes-gnome/tracker/tracker-miners_3.4.2.bb
index 273110e8e..cbd1d0ddb 100644
--- a/meta-gnome/recipes-gnome/tracker/tracker-miners_3.4.1.bb
+++ b/meta-gnome/recipes-gnome/tracker/tracker-miners_3.4.2.bb
@@ -19,7 +19,7 @@ SRC_URI +=3D "file://0001-meson.build-Just-warn-if-we-b=
uild-without-libseccomp.pat
             file://0001-Set-header-file-to-a-fixed-path-instead-of-a-hos=
t-pa.patch \
            "
=20
-SRC_URI[archive.sha256sum] =3D "2fce0ec85fb7617c8b2887c22797740d5dec84ec=
036db74d6c208bbab5c58c24"
+SRC_URI[archive.sha256sum] =3D "101e3608f1c28bfed8ae25522f7a720b559f889a=
76e280afbe50a4d8b064f92c"
=20
 # gobject-introspection is mandatory and cannot be configured
 REQUIRED_DISTRO_FEATURES =3D "gobject-introspection-data"
--=20
2.34.1


