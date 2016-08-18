Return-Path: <Mingli.Yu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2EAD6731D2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Aug 2016 07:53:17 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u7I7rH9H027420
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Aug 2016 00:53:17 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Thu, 18 Aug 2016 00:53:16 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 18 Aug 2016 15:52:15 +0800
Message-ID: <1471506735-29247-1-git-send-email-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [meta-networking][PATCH] postfix: 3.0.3 -> 3.1.1
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
X-List-Received-Date: Thu, 18 Aug 2016 07:53:20 -0000
Content-Type: text/plain

From: Mingli Yu <Mingli.Yu@windriver.com>

* Upgrade postfix from 3.0.3 to 3.1.1

Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
---
 .../recipes-daemons/postfix/{postfix_3.0.3.bb => postfix_3.1.1.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-daemons/postfix/{postfix_3.0.3.bb => postfix_3.1.1.bb} (12%)

diff --git a/meta-networking/recipes-daemons/postfix/postfix_3.0.3.bb b/meta-networking/recipes-daemons/postfix/postfix_3.1.1.bb
similarity index 12%
rename from meta-networking/recipes-daemons/postfix/postfix_3.0.3.bb
rename to meta-networking/recipes-daemons/postfix/postfix_3.1.1.bb
index 7104a9d..dbbe24c 100644
--- a/meta-networking/recipes-daemons/postfix/postfix_3.0.3.bb
+++ b/meta-networking/recipes-daemons/postfix/postfix_3.1.1.bb
@@ -1,4 +1,4 @@
 require postfix.inc
 
-SRC_URI[md5sum] = "61caffae689c11d09b4c972a394ae3b1"
-SRC_URI[sha256sum] = "401e46ec3450569dcce60d1d8ca22a19ab1f7f817b0cc730cdf4875ba608ac02"
+SRC_URI[md5sum] = "40d72ea143af7ab0038c2cee1f483707"
+SRC_URI[sha256sum] = "3deda4c34631970490b1b5fbb559905f93531bf1c7eb00e38b0d0deb1dba9982"
-- 
2.8.1


