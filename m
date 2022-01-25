Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD931C433F5
	for <webhook@archiver.kernel.org>; Tue, 25 Jan 2022 17:08:39 +0000 (UTC)
Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by mx.groups.io with SMTP id smtpd.web12.116.1643130518280415801
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Jan 2022 09:08:38 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.81,
 mailfrom: f_l_k@t-online.de)
Received: from fwd76.dcpf.telekom.de (fwd76.aul.t-online.de [10.223.144.102])
	by mailout03.t-online.de (Postfix) with SMTP id 766623EAE
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Jan 2022 18:08:36 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([84.163.43.159]) by fwd76.t-online.de
	with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
	esmtp id 1nCPJ6-1IUecT0; Tue, 25 Jan 2022 18:08:36 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-gnome][PATCH] geary: use sha hash for SRCREV; fix identation
Date: Tue, 25 Jan 2022 18:08:27 +0100
Message-Id: <20220125170827.104487-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1643130516-0001619A-4F7E9077/0/0 CLEAN NORMAL
X-TOI-MSGID: 8af4aee4-010b-4fff-836b-f4be2540859d
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Jan 2022 17:08:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95075

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../recipes-connectivity/geary/geary_40.0.bb  | 46 +++++++++----------
 1 file changed, 23 insertions(+), 23 deletions(-)

diff --git a/meta-gnome/recipes-connectivity/geary/geary_40.0.bb b/meta-g=
nome/recipes-connectivity/geary/geary_40.0.bb
index e4d07ad29..b3b431132 100644
--- a/meta-gnome/recipes-connectivity/geary/geary_40.0.bb
+++ b/meta-gnome/recipes-connectivity/geary/geary_40.0.bb
@@ -4,28 +4,28 @@ LICENSE =3D "LGPL-2.1"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D2a2244d5a13871ad950c55877546a=
6a2"
=20
 DEPENDS =3D " \
-	appstream-glib \
-	cairo \
-	enchant2 \
-	evolution-data-server \
-	folks \
-	gcr \
-	gmime \
-	gnome-online-accounts \
-	gsound \
-	gspell \
-	gtk+3 \
-	icu \
-	iso-codes \
-	json-glib \
-	libhandy \
-	libical \
-	libpeas \
-	libsecret \
-	libstemmer \
-	libxml2 \
-	sqlite3 \
-	webkitgtk \
+    appstream-glib \
+    cairo \
+    enchant2 \
+    evolution-data-server \
+    folks \
+    gcr \
+    gmime \
+    gnome-online-accounts \
+    gsound \
+    gspell \
+    gtk+3 \
+    icu \
+    iso-codes \
+    json-glib \
+    libhandy \
+    libical \
+    libpeas \
+    libsecret \
+    libstemmer \
+    libxml2 \
+    sqlite3 \
+    webkitgtk \
 "
=20
 RDEPENDS:${PN} =3D "gnome-keyring"
@@ -37,7 +37,7 @@ SRC_URI =3D " \
 "
=20
 S =3D "${WORKDIR}/git"
-SRCREV =3D "gnome-${PV}"
+SRCREV =3D "e561775c1580a9f60a726355b2b897bfc9cb3382"
=20
 REQUIRED_DISTRO_FEATURES =3D "gobject-introspection-data"
=20
--=20
2.25.1


