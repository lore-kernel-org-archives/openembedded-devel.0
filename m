Return-Path: <dv@pseudoterminal.org>
Received: from ptmx.org (ptmx.org [178.63.28.110])
	by mail.openembedded.org (Postfix) with ESMTP id 438116D094
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Oct 2013 19:05:54 +0000 (UTC)
Received: from localhost.localdomain (chello080108009040.14.11.vie.surfer.at
	[80.108.9.40]) by ptmx.org (Postfix) with ESMTPSA id D3FE72679A
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Oct 2013 21:05:52 +0200 (CEST)
From: Carlos Rafael Giani <dv@pseudoterminal.org>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 14 Oct 2013 21:06:45 +0200
Message-Id: <1381777605-6312-1-git-send-email-dv@pseudoterminal.org>
X-Mailer: git-send-email 1.8.4
Subject: [meta-oe][PATCH] orc: update to version 0.4.18
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 14 Oct 2013 19:05:56 -0000

This is the minimum required version for the Orc support in GStreamer 1.2

Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>
---
 meta-oe/recipes-devtools/orc/orc_0.4.16.bb | 6 ------
 meta-oe/recipes-devtools/orc/orc_0.4.18.bb | 6 ++++++
 2 files changed, 6 insertions(+), 6 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/orc/orc_0.4.16.bb
 create mode 100644 meta-oe/recipes-devtools/orc/orc_0.4.18.bb

diff --git a/meta-oe/recipes-devtools/orc/orc_0.4.16.bb b/meta-oe/recipes-devtools/orc/orc_0.4.16.bb
deleted file mode 100644
index bb193ab..0000000
--- a/meta-oe/recipes-devtools/orc/orc_0.4.16.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require orc.inc
-
-PR = "${INC_PR}.0"
-
-SRC_URI[orc.md5sum] = "e482932e544c847761449b106ecbc483"
-SRC_URI[orc.sha256sum] = "700e4edba20a0ed42164b645da26ce515b883d4c4633b222302f1e541f2a58ab"
diff --git a/meta-oe/recipes-devtools/orc/orc_0.4.18.bb b/meta-oe/recipes-devtools/orc/orc_0.4.18.bb
new file mode 100644
index 0000000..2375d8c
--- /dev/null
+++ b/meta-oe/recipes-devtools/orc/orc_0.4.18.bb
@@ -0,0 +1,6 @@
+require orc.inc
+
+PR = "${INC_PR}.0"
+
+SRC_URI[orc.md5sum] = "1a2552e8d127526c48d644fe6437b377"
+SRC_URI[orc.sha256sum] = "34d3c8a7259f42bed4dcfbc106c5e3d0cc8e17eeaa73128d1c5eaf92883a6a24"
-- 
1.8.4


