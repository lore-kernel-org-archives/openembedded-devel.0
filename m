Received: from pd95cb174.dip0.t-ipconnect.de ([217.92.177.116] helo=localhost)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sledz@localhost.localdomain>) id 1SBKTm-0007fM-Jf
	for openembedded-devel@lists.openembedded.org;
	Sat, 24 Mar 2012 07:29:34 +0100
Received: by localhost (Postfix, from userid 1000)
	id E63204439DF; Sat, 24 Mar 2012 07:20:37 +0100 (CET)
From: Steffen Sledz <sledz@dresearch-fe.de>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 24 Mar 2012 07:20:36 +0100
Message-Id: <ec639a6b04449ef8e064e7bf35660ab31c3e2eee.1332569901.git.sledz@dresearch-fe.de>
X-Mailer: git-send-email 1.7.7
In-Reply-To: <cover.1332569901.git.sledz@dresearch-fe.de>
References: <cover.1332569901.git.sledz@dresearch-fe.de>
Subject: [2011.03-maintenance 1/1] libmatthew-0.7.1: SRC_URI updated
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
X-List-Received-Date: Sat, 24 Mar 2012 06:29:34 -0000

libmatthew-java-0.7.1.tar.gz is no longer available at the original
location.

Signed-off-by: Steffen Sledz <sledz@dresearch-fe.de>
Acked-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
Acked-by: Tom Rini <tom.rini@gmail.com>
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



