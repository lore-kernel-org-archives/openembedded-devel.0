Return-Path: <prvs=659569f5e=Richard.Leitner@skidata.com>
Received: from mail1.skidata.com (mail1.skidata.com [91.230.2.99])
	by mail.openembedded.org (Postfix) with ESMTP id 6048D60167
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Aug 2015 15:05:01 +0000 (UTC)
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: ApoEAIZfy1WsEApK/2dsb2JhbABdhFgGxVwCghMBAQEBAQGBC4QkAQEEeRAYOVcGDgWIM9BJAQEBAQEFAQEBAR6Pd2UHF4QVBZUTlWqRE4Qlb4EFQ4EEAQEB
X-IPAS-Result: ApoEAIZfy1WsEApK/2dsb2JhbABdhFgGxVwCghMBAQEBAQGBC4QkAQEEeRAYOVcGDgWIM9BJAQEBAQEFAQEBAR6Pd2UHF4QVBZUTlWqRE4Qlb4EFQ4EEAQEB
From: Richard Leitner <richard.leitner@skidata.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 12 Aug 2015 17:03:56 +0200
Message-ID: <1439391837-10238-5-git-send-email-richard.leitner@skidata.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1439391837-10238-1-git-send-email-richard.leitner@skidata.com>
References: <1439391837-10238-1-git-send-email-richard.leitner@skidata.com>
MIME-Version: 1.0
X-Originating-IP: [172.16.60.30]
Cc: otavio.salvador@ossystems.com.br
Subject: [PATCH 4/5] openjdk-7-common.inc: bump PR to 6
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 12 Aug 2015 15:05:01 -0000
Content-Type: text/plain

Increment the PR of openjdk-7-common.inc due to the previous changes.

Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
---
 recipes-core/openjdk/openjdk-7-common.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-core/openjdk/openjdk-7-common.inc b/recipes-core/openjdk/openjdk-7-common.inc
index dafc877..13f3460 100644
--- a/recipes-core/openjdk/openjdk-7-common.inc
+++ b/recipes-core/openjdk/openjdk-7-common.inc
@@ -1,7 +1,7 @@
 require openjdk-common.inc
 ICEDTEA = "icedtea-${ICEDTEA_VERSION}"
 
-INC_PR = "r5"
+INC_PR = "r6"
 
 SRC_URI = " \
   ${ICEDTEA_URI} \
-- 
2.1.4


