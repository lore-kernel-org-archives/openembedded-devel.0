Return-Path: <mike.looijmans@topic.nl>
Received: from smtp05.mail.online.nl (smtp05.mail.online.nl [194.134.25.75])
	by mail.openembedded.org (Postfix) with ESMTP id CEC9173175
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Mar 2016 19:19:42 +0000 (UTC)
Received: from localhost.localdomain (s55969068.adsl.online.nl
	[85.150.144.104])
	by smtp05.mail.online.nl (Postfix) with ESMTP id 10E8D200047;
	Sat, 26 Mar 2016 20:12:43 +0100 (CET)
From: Mike Looijmans <mike.looijmans@topic.nl>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 26 Mar 2016 20:12:37 +0100
Message-Id: <1459019557-30973-1-git-send-email-mike.looijmans@topic.nl>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] waf-cross-answers/README: Fix typo "bbaclss"
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 26 Mar 2016 19:19:45 -0000

Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>
---
 meta-oe/files/waf-cross-answers/README | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/files/waf-cross-answers/README b/meta-oe/files/waf-cross-answers/README
index 0c23344..dda45c5 100644
--- a/meta-oe/files/waf-cross-answers/README
+++ b/meta-oe/files/waf-cross-answers/README
@@ -1,3 +1,3 @@
 The files in this directory are cross answers files
-used by waf-samba.bbaclss, please see waf-samba.bbaclss
+used by waf-samba.bbclass, please see waf-samba.bbclass
 for details about how they are used.
-- 
2.1.4


