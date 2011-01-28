Received: from hsvwanfw1-nat.mentorg.com ([139.181.24.34] helo=alm.mentorg.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom_rini@mentor.com>) id 1Pitrb-0004A5-1A
	for openembedded-devel@lists.openembedded.org;
	Fri, 28 Jan 2011 20:20:07 +0100
Received: from localhost.localdomain ([134.86.97.17])
	by alm.mentorg.com (8.12.10/8.12.10) with ESMTP id p0SIqb1q024465
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Jan 2011 12:52:38 -0600
From: Tom Rini <tom_rini@mentor.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 28 Jan 2011 11:52:33 -0700
Message-Id: <1296240753-10120-6-git-send-email-tom_rini@mentor.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1296240753-10120-1-git-send-email-tom_rini@mentor.com>
References: <1296240753-10120-1-git-send-email-tom_rini@mentor.com>
Subject: [PATCH 5/5] bitbake.conf: Drop unused perl-native-runtime ASSUME_PROVIDED
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
X-List-Received-Date: Fri, 28 Jan 2011 19:20:07 -0000

Signed-off-by: Tom Rini <tom_rini@mentor.com>
---
 conf/bitbake.conf |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/conf/bitbake.conf b/conf/bitbake.conf
index 1baecc1..21ffcb1 100644
--- a/conf/bitbake.conf
+++ b/conf/bitbake.conf
@@ -170,7 +170,6 @@ ASSUME_PROVIDED = "\
     cvs-native \
     diffstat-native \
     patch-native \
-    perl-native-runtime \
     python-native-runtime \
     svn-native \
     texinfo-native \
-- 
1.7.0.4



