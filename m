Received: from pd95cbf07.dip0.t-ipconnect.de ([217.92.191.7] helo=localhost)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sledz@localhost.localdomain>) id 1S0xV1-0003ze-Ny
	for openembedded-devel@lists.openembedded.org;
	Fri, 24 Feb 2012 16:55:59 +0100
Received: by localhost (Postfix, from userid 1000)
	id 873E1C2CBB; Fri, 24 Feb 2012 16:47:36 +0100 (CET)
From: Steffen Sledz <sledz@dresearch-fe.de>
To: Tom Rini <tom.rini@gmail.com>,
	openembedded-devel@lists.openembedded.org
Date: Fri, 24 Feb 2012 16:47:22 +0100
Message-Id: <ea4db3192f7365d31a7378e992f0e6a30d1f2ef9.1330097955.git.sledz@dresearch-fe.de>
X-Mailer: git-send-email 1.7.7
In-Reply-To: <c0d07af8a377e188decbae614de96fcf1e78af91.1330097955.git.sledz@dresearch-fe.de>
References: <c0d07af8a377e188decbae614de96fcf1e78af91.1330097955.git.sledz@dresearch-fe.de>
In-Reply-To: <cover.1330097955.git.sledz@dresearch-fe.de>
References: <cover.1330097955.git.sledz@dresearch-fe.de>
Subject: [2011.03-maintenance 5/7] jakarta-libs: fixed SRC_URI for avalon-framework-api-4.3
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
X-List-Received-Date: Fri, 24 Feb 2012 15:55:59 -0000

Signed-off-by: Steffen Sledz <sledz@dresearch-fe.de>
---
 recipes/jakarta-libs/avalon-framework-api_4.3.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes/jakarta-libs/avalon-framework-api_4.3.bb b/recipes/jakarta-libs/avalon-framework-api_4.3.bb
index 06fde62..3340f5b 100644
--- a/recipes/jakarta-libs/avalon-framework-api_4.3.bb
+++ b/recipes/jakarta-libs/avalon-framework-api_4.3.bb
@@ -3,7 +3,7 @@ LICENSE = "AL2.0"
 AUTHOR = "Apache Software Foundation"
 
 SRC_URI = "\
-	http://www.apache.org/dist/excalibur/avalon-framework/source/${BP}-src.tar.gz;name=archive \
+	http://archive.apache.org/dist/excalibur/framework/source/${BP}-src.tar.gz;name=archive \
 	http://www.apache.org/dist/avalon/logkit/source/logkit-1.2.2-src.tar.gz;name=logkit \
 	"
 
-- 
1.7.7



