Received: from pd95cb174.dip0.t-ipconnect.de ([217.92.177.116] helo=localhost)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sledz@localhost.localdomain>) id 1SAJ3r-0008Tq-JG
	for openembedded-devel@lists.openembedded.org;
	Wed, 21 Mar 2012 11:46:35 +0100
Received: by localhost (Postfix, from userid 1000)
	id 8AE94443AF3; Wed, 21 Mar 2012 11:37:41 +0100 (CET)
From: Steffen Sledz <sledz@dresearch-fe.de>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 21 Mar 2012 11:37:32 +0100
Message-Id: <1332326252-7381-1-git-send-email-sledz@dresearch-fe.de>
X-Mailer: git-send-email 1.7.7
In-Reply-To: <4F69AF4A.8050809@dresearch-fe.de>
References: <4F69AF4A.8050809@dresearch-fe.de>
Subject: [PATCH] libmatthew-0.7.1: SRC_URI updated
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
X-List-Received-Date: Wed, 21 Mar 2012 10:46:35 -0000

libmatthew-java-0.7.1.tar.gz is no longer available at the original
location.

Signed-off-by: Steffen Sledz <sledz@dresearch-fe.de>
---
 recipes/libmatthew/libmatthew_0.7.1.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes/libmatthew/libmatthew_0.7.1.bb b/recipes/libmatthew/libmatthew_0.7.1.bb
index 266a0d4..6916e56 100644
--- a/recipes/libmatthew/libmatthew_0.7.1.bb
+++ b/recipes/libmatthew/libmatthew_0.7.1.bb
@@ -2,7 +2,7 @@ require libmatthew.inc
 
 PR = "r0"
 
-SRC_URI = "http://www.matthew.ath.cx/projects/java/libmatthew-java-${PV}.tar.gz \
+SRC_URI = "http://pkgs.fedoraproject.org/repo/pkgs/libmatthew-java/libmatthew-java-0.7.1.tar.gz/6a4db221129f230c64a0f937d00bb703/libmatthew-java-${PV}.tar.gz \
            file://Makefile-0.7.patch"
 
 
-- 
1.7.7



