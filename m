Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1LkHs3-0000Ce-Fb
	for openembedded-devel@openembedded.org; Thu, 19 Mar 2009 14:01:27 +0100
Received: (qmail 18197 invoked by uid 813007); 19 Mar 2009 13:00:18 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO localhost.localdomain)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 19 Mar 2009 13:00:18 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 19 Mar 2009 14:00:16 +0100
Message-Id: <1237467616-4745-4-git-send-email-marcin@juszkiewicz.com.pl>
X-Mailer: git-send-email 1.6.2.1
In-Reply-To: <1237467616-4745-3-git-send-email-marcin@juszkiewicz.com.pl>
References: <1237467616-4745-1-git-send-email-marcin@juszkiewicz.com.pl>
	<1237467616-4745-2-git-send-email-marcin@juszkiewicz.com.pl>
	<1237467616-4745-3-git-send-email-marcin@juszkiewicz.com.pl>
X-SA-Exim-Connect-IP: 195.149.226.213
X-SA-Exim-Mail-From: marcin@juszkiewicz.com.pl
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=AWL, BAYES_50, NO_DNS_FOR_FROM,
	RDNS_NONE autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 3/3] mtd-utils-tests: update to 1.2.0+git
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
X-List-Received-Date: Thu, 19 Mar 2009 13:01:32 -0000

From: Marcin Juszkiewicz <hrw@openembedded.org>

---
 ...s_1.0.0+git.bb => mtd-utils-tests_1.2.0+git.bb} |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)
 rename recipes/mtd/{mtd-utils-tests_1.0.0+git.bb => mtd-utils-tests_1.2.0+git.bb} (97%)

diff --git a/recipes/mtd/mtd-utils-tests_1.0.0+git.bb b/recipes/mtd/mtd-utils-tests_1.2.0+git.bb
similarity index 97%
rename from recipes/mtd/mtd-utils-tests_1.0.0+git.bb
rename to recipes/mtd/mtd-utils-tests_1.2.0+git.bb
index b524000..7787c51 100644
--- a/recipes/mtd/mtd-utils-tests_1.0.0+git.bb
+++ b/recipes/mtd/mtd-utils-tests_1.2.0+git.bb
@@ -1,4 +1,4 @@
-require mtd-utils_1.0.0+git.bb
+require mtd-utils_1.2.0+git.bb
 
 # this can probably be integrated into the main mtd-utils package
 # but I did not want to risk breakage -- but would be glad to 
-- 
1.6.2.1





