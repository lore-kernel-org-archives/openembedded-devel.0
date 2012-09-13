Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Song.Li@windriver.com>) id 1TC6To-0000vZ-Kl
	for openembedded-devel@lists.openembedded.org;
	Thu, 13 Sep 2012 12:17:04 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q8DA4KhV007452
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Sep 2012 03:04:20 -0700 (PDT)
Received: from localhost.localdomain (128.224.163.66) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.309.2; Thu, 13 Sep 2012 03:04:20 -0700
From: <Song.Li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 13 Sep 2012 18:03:27 +0800
Message-ID: <1347530607-20519-1-git-send-email-Song.Li@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH] guile:fix the Upstream-Status tag typo
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
X-List-Received-Date: Thu, 13 Sep 2012 10:17:05 -0000
Content-Type: text/plain

From: "Song.Li" <Song.Li@windriver.com>

patch need to have corrected Upstream-Status: tag.
change the wrong word "Upstream Status:"
to "Upstream-Status:".

Signed-off-by: Song.Li <Song.Li@windriver.com>
---
 ...all-data-hook-to-install-exec-hook-in-gui.patch |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/guile/files/change-install-data-hook-to-install-exec-hook-in-gui.patch b/meta/recipes-devtools/guile/files/change-install-data-hook-to-install-exec-hook-in-gui.patch
index b9d1ca5..df61e5d 100644
--- a/meta/recipes-devtools/guile/files/change-install-data-hook-to-install-exec-hook-in-gui.patch
+++ b/meta/recipes-devtools/guile/files/change-install-data-hook-to-install-exec-hook-in-gui.patch
@@ -12,7 +12,7 @@ that will cause error sometimes.
 
 [YOCTO #2796]
 
-Upstream Status:Submitted
+Upstream-Status:Submitted
 Upstream Bugid :12015 email:12015@debbugs.gnu.org
 guile bug maillist: bug-guile@gnu.org
 
-- 
1.7.9.5



