Received: from [151.189.21.41] (helo=mail-in-01.arcor-online.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <no2spam@nospam.arcornews.de>) id 1M7VFT-0003HK-2f
	for openembedded-devel@lists.openembedded.org;
	Fri, 22 May 2009 15:57:23 +0200
Received: from mail-in-13-z2.arcor-online.net (mail-in-13-z2.arcor-online.net
	[151.189.8.30]) by mx.arcor.de (Postfix) with ESMTP id E6F49332AAA;
	Fri, 22 May 2009 15:49:39 +0200 (CEST)
Received: from mail-in-09.arcor-online.net (mail-in-09.arcor-online.net
	[151.189.21.49])
	by mail-in-13-z2.arcor-online.net (Postfix) with ESMTP id D5AA11B8E00; 
	Fri, 22 May 2009 15:49:39 +0200 (CEST)
Received: from localhost.localdomain (p5B3B25B5.dip.t-dialin.net
	[91.59.37.181]) (Authenticated sender: leggewie@arcor.de)
	by mail-in-09.arcor-online.net (Postfix) with ESMTPSA id 356A81AF6C5;
	Fri, 22 May 2009 15:49:39 +0200 (CEST)
X-DKIM: Sendmail DKIM Filter v2.8.2 mail-in-09.arcor-online.net 356A81AF6C5
From: Rolf Leggewie <no2spam@nospam.arcornews.de>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 22 May 2009 15:49:36 +0200
Message-Id: <1243000176-32603-1-git-send-email-no2spam@nospam.arcornews.de>
X-Mailer: git-send-email 1.6.0.4
Cc: Rolf Leggewie <oe-devel@rolf.leggewie.biz>
Subject: [PATCH] bluez: document that hciattach-ti-bts.patch has landed upstream
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 22 May 2009 13:57:23 -0000

From: Rolf Leggewie <oe-devel@rolf.leggewie.biz>

---
 .../bluez/bluez-utils-3.33/hciattach-ti-bts.patch  |    3 +++
 .../bluez/bluez-utils-3.x/hciattach-ti-bts.patch   |    3 +++
 2 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/recipes/bluez/bluez-utils-3.33/hciattach-ti-bts.patch b/recipes/bluez/bluez-utils-3.33/hciattach-ti-bts.patch
index 1b208f7..3d84a4c 100644
--- a/recipes/bluez/bluez-utils-3.33/hciattach-ti-bts.patch
+++ b/recipes/bluez/bluez-utils-3.33/hciattach-ti-bts.patch
@@ -1,3 +1,6 @@
+upstream: accepted, this patch has landed upstream albeit in a different form
+sometime between 3.35 and 3.36. see the commit message in "git log e1d12d8bb5b40a6313cce52974f174fd76cbf32c"
+
 --- bluez-utils-3.1/tools/hciattach.c.orig	2006-07-23 14:02:14.000000000 +0200
 +++ bluez-utils-3.1/tools/hciattach.c	2006-07-23 14:06:29.000000000 +0200
 @@ -60,6 +60,8 @@
diff --git a/recipes/bluez/bluez-utils-3.x/hciattach-ti-bts.patch b/recipes/bluez/bluez-utils-3.x/hciattach-ti-bts.patch
index 8fe37de..f3a417d 100644
--- a/recipes/bluez/bluez-utils-3.x/hciattach-ti-bts.patch
+++ b/recipes/bluez/bluez-utils-3.x/hciattach-ti-bts.patch
@@ -1,3 +1,6 @@
+upstream: accepted, this patch has landed upstream albeit in a different form
+sometime between 3.35 and 3.36. see the commit message in "git log e1d12d8bb5b40a6313cce52974f174fd76cbf32c"
+
 --- bluez-utils-2.24/tools/hciattach.c.orig	2005-12-10 15:14:36.000000000 +0100
 +++ bluez-utils-2.24/tools/hciattach.c	2006-01-22 13:56:13.000000000 +0100
 @@ -57,6 +57,8 @@
-- 
1.6.0.4



