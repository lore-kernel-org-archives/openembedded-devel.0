Received: from vms173021pub.verizon.net ([206.46.173.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <denis@denix.org>) id 1SKaU7-0003jc-74
	for openembedded-devel@lists.openembedded.org;
	Wed, 18 Apr 2012 21:24:11 +0200
Received: from gandalf.denix.org ([unknown] [71.178.225.66])
	by vms173021.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0M2O00CZYW4I7HL1@vms173021.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Wed,
	18 Apr 2012 14:14:43 -0500 (CDT)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 6050F20099; Wed,
	18 Apr 2012 15:14:42 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 18 Apr 2012 15:14:34 -0400
Message-id: <1334776474-20923-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.7.8.5
In-reply-to: <1334774470-20325-1-git-send-email-autifk@gmail.com>
References: <1334774470-20325-1-git-send-email-autifk@gmail.com>
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [meta-oe] README: fix meta-efl, meta-gpe and meta-xfce to point to openembedded.org
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
X-List-Received-Date: Wed, 18 Apr 2012 19:24:11 -0000

From: Denys Dmytriyenko <denys@ti.com>

Fix README files for meta-efl, meta-gpe and meta-xfce to point to the correct
openembedded.org address instead of the outdated openembedded.net in git URIs.
Reported by Autif Khan for one of the layers.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-efl/README  |    3 +--
 meta-gpe/README  |    3 +--
 meta-xfce/README |    2 +-
 3 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/meta-efl/README b/meta-efl/README
index 25be47e..41effe6 100644
--- a/meta-efl/README
+++ b/meta-efl/README
@@ -4,7 +4,7 @@ URI: git://git.openembedded.org/openembedded-core
 branch: master
 revision: HEAD
 
-URI: git://git.openembedded.net/meta-openembedded
+URI: git://git.openembedded.org/meta-openembedded
 branch: master
 revision: HEAD
 
@@ -13,4 +13,3 @@ Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-efl]
 When sending single patches, please using something like 'git send-email -1 --to openembedded-devel@lists.openembedded.org --subject-prefix meta-efl'
 
 Interim layer maintainer: Koen Kooi <koen@dominion.thruhere.net>
-
diff --git a/meta-gpe/README b/meta-gpe/README
index ebe0cea..d967dc1 100644
--- a/meta-gpe/README
+++ b/meta-gpe/README
@@ -4,11 +4,10 @@ URI: git://git.openembedded.org/openembedded-core
 branch: master
 revision: HEAD
 
-URI: git://git.openembedded.net/meta-openembedded
+URI: git://git.openembedded.org/meta-openembedded
 branch: master
 revision: HEAD
 
 Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-gpe]' in the subject'
 
 Interim layer maintainer: Koen Kooi <koen@dominion.thruhere.net>
-
diff --git a/meta-xfce/README b/meta-xfce/README
index 6e021e1..1a503c9 100644
--- a/meta-xfce/README
+++ b/meta-xfce/README
@@ -4,7 +4,7 @@ URI: git://git.openembedded.org/openembedded-core
 branch: master
 revision: HEAD
 
-URI: git://git.openembedded.net/meta-openembedded
+URI: git://git.openembedded.org/meta-openembedded
 branch: master
 revision: HEAD
 
-- 
1.7.8.5



