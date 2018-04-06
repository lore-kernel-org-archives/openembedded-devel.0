Return-Path: <mcfrisk@kapsi.fi>
Received: from mail.kapsi.fi (mail.kapsi.fi [91.232.154.25])
	by mail.openembedded.org (Postfix) with ESMTP id 0C95475418
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  6 Apr 2018 13:15:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
	s=20161220; 
	h=Subject:References:In-Reply-To:Message-Id:Date:Cc:To:From;
	bh=LVbHWO+ckJLV79w72cJWyU5Zuz1ouuizez7HIHzIqA0=; 
	b=m86CDQnxOzTiG08d6k7DD/QBnxrdMyUwifaMe+duzY7w7dtuOT0jXgsFpYJbPdDuB41aS7GmIL3kuPRlWMeaQ6Rci9YVO+odtF+PdZXN8kpmNj1WeDN8U80pJtdNK4lGhpWIBubt3UtJkY0ae4/0D6XkcPh2iFZIb/lH/YBIytxncskUdAE0svoO0TWU134U4FffEDVYvpXTkLoSDtrSG+fyyouAZvL0jxq1lVsWijsorjOtP8gepJpoi0jxQjx2i6ErBHEZj/yOlHMflxBUNgI3mXbEioBrM0Rv3ah6CmiB7lvRFc7wVZ7Xs1AqxcrS+ykTUG3S4K5A6C8nrgINow==;
Received: from [91.232.154.11] (helo=lakka.kapsi.fi)
	by mail.kapsi.fi with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.84_2) (envelope-from <mcfrisk@kapsi.fi>)
	id 1f4Qxn-0007Sr-OD; Fri, 06 Apr 2018 15:59:32 +0300
Received: from mcfrisk by lakka.kapsi.fi with local (Exim 4.84_2)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1f4Qxc-0005Nc-Bm; Fri, 06 Apr 2018 15:59:20 +0300
From: Mikko Rapeli <mikko.rapeli@bmw.de>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  6 Apr 2018 15:59:03 +0300
Message-Id: <1523019543-18710-2-git-send-email-mikko.rapeli@bmw.de>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1523019543-18710-1-git-send-email-mikko.rapeli@bmw.de>
References: <1523019543-18710-1-git-send-email-mikko.rapeli@bmw.de>
X-SA-Exim-Connect-IP: 91.232.154.11
X-SA-Exim-Mail-From: mcfrisk@kapsi.fi
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on mail
X-Spam-Level: **
X-Spam-Status: No, score=2.6 required=5.0 tests=BAYES_50,
	HEADER_FROM_DIFFERENT_DOMAINS,RDNS_NONE,SPF_NEUTRAL autolearn=no
	autolearn_force=no version=3.4.0
X-SA-Exim-Version: 4.2.1 (built Mon, 26 Dec 2011 16:24:06 +0000)
X-SA-Exim-Scanned: Yes (on mail.kapsi.fi)
Subject: [PATCH 2/2] lmbench: fix Upstream-Status metadata typos in patch
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
X-List-Received-Date: Fri, 06 Apr 2018 13:15:40 -0000

Signed-off-by: Mikko Rapeli <mikko.rapeli@bmw.de>
---
 .../lmbench-3.0-a9/use-base_libdir-instead-of-hardcoded-lib.patch       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-benchmark/lmbench/lmbench-3.0-a9/use-base_libdir-instead-of-hardcoded-lib.patch b/meta-oe/recipes-benchmark/lmbench/lmbench-3.0-a9/use-base_libdir-instead-of-hardcoded-lib.patch
index 3351ce8..fa3d64d 100644
--- a/meta-oe/recipes-benchmark/lmbench/lmbench-3.0-a9/use-base_libdir-instead-of-hardcoded-lib.patch
+++ b/meta-oe/recipes-benchmark/lmbench/lmbench-3.0-a9/use-base_libdir-instead-of-hardcoded-lib.patch
@@ -3,7 +3,7 @@ From: Ting Liu <b28495@freescale.com>
 Date: Fri, 22 Nov 2013 15:20:08 +0800
 Subject: [PATCH] use base_libdir instead of hardcoded /lib
 
-Upsteam Status: Inappropriate [configuration]
+Upstream-Status: Inappropriate [configuration]
 
 Signed-off-by: Ting Liu <b28495@freescale.com>
 ---
-- 
1.9.1


