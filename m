Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jefflance01@gmail.com>) id 1QciZp-0003fR-A7
	for openembedded-devel@lists.openembedded.org;
	Fri, 01 Jul 2011 20:36:29 +0200
Received: by yxi19 with SMTP id 19so125237yxi.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 01 Jul 2011 11:32:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=0E2GdmYeaS4cxzFMGs78hov6A+NrelYIknvT/iyunRA=;
	b=Ftg2+KHRBRBXD15FrCT3JYsNUHOTun6xkGmzcng1NPCNe8Ca9t64h7QLAn/1tERgFR
	yTEX1pzv4WeSyge5S9ZV7TCRxP6U1jEShNoMEGbLj4r4c3ohSKhSa0VHOgp+l3z0Qn3I
	obadjqdG2ml0njmDEhV5P0VXIUFm2hG/PjfvU=
Received: by 10.236.78.70 with SMTP id f46mr4485967yhe.301.1309545163885;
	Fri, 01 Jul 2011 11:32:43 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com [192.94.94.33])
	by mx.google.com with ESMTPS id u64sm2571494yhm.55.2011.07.01.11.32.42
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 01 Jul 2011 11:32:43 -0700 (PDT)
From: Jeff Lance <jefflance01@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  1 Jul 2011 13:30:26 -0500
Message-Id: <1309545026-29277-1-git-send-email-j-lance1@ti.com>
X-Mailer: git-send-email 1.7.0.4
Cc: Jeff Lance <j-lance1@ti.com>
Subject: [PATCH 1/1] matrix-gui: Update SRCREV to revision 292
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
X-List-Received-Date: Fri, 01 Jul 2011 18:36:29 -0000

* Fix Soft AP scipt
* Fix Multimedia descriptions

Signed-off-by: Jeff Lance <j-lance1@ti.com>
---
 recipes/ti/matrix-gui-common_1.4.bb |    4 ++--
 recipes/ti/matrix-gui-e_1.3.bb      |    4 ++--
 recipes/ti/matrix-gui_1.3.bb        |    4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/recipes/ti/matrix-gui-common_1.4.bb b/recipes/ti/matrix-gui-common_1.4.bb
index 8376e17..1f2db79 100644
--- a/recipes/ti/matrix-gui-common_1.4.bb
+++ b/recipes/ti/matrix-gui-common_1.4.bb
@@ -4,5 +4,5 @@ require matrix-gui-common.inc
 # prebuilt version in the repository.
 RRECOMMENDS_${PN} = "am-sysinfo"
 
-SRCREV = "290"
-PR = "${INC_PR}.14"
+SRCREV = "292"
+PR = "${INC_PR}.15"
diff --git a/recipes/ti/matrix-gui-e_1.3.bb b/recipes/ti/matrix-gui-e_1.3.bb
index dcad1a6..73e6d63 100644
--- a/recipes/ti/matrix-gui-e_1.3.bb
+++ b/recipes/ti/matrix-gui-e_1.3.bb
@@ -1,5 +1,5 @@
 require matrix-gui-e.inc
 
-SRCREV = "290"
-PR = "${INC_PR}.13"
+SRCREV = "292"
+PR = "${INC_PR}.14"
 
diff --git a/recipes/ti/matrix-gui_1.3.bb b/recipes/ti/matrix-gui_1.3.bb
index e67115c..d9b4895 100644
--- a/recipes/ti/matrix-gui_1.3.bb
+++ b/recipes/ti/matrix-gui_1.3.bb
@@ -1,4 +1,4 @@
 require matrix-gui.inc
 
-SRCREV = "290"
-PR = "${INC_PR}.9"
+SRCREV = "292"
+PR = "${INC_PR}.10"
-- 
1.7.0.4



