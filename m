Return-Path: <prvs=6640da761=Richard.Leitner@skidata.com>
Received: from mail1.skidata.com (mail1.skidata.com [91.230.2.99])
	by mail.openembedded.org (Postfix) with ESMTP id B9499767B4
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Aug 2015 07:33:26 +0000 (UTC)
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: ApoEAEyN0VWsEApK/2dsb2JhbABdhFgGxVkCgXQBAQEBAQGBC4QkAQEEeRAYOVcGDgWIM88MAQEBBwEBAQEej3ZlBxeEFQWVHY42hzmFXYMaiC2CZYFAb4EFQ4EEAQEB
X-IPAS-Result: ApoEAEyN0VWsEApK/2dsb2JhbABdhFgGxVkCgXQBAQEBAQGBC4QkAQEEeRAYOVcGDgWIM88MAQEBBwEBAQEej3ZlBxeEFQWVHY42hzmFXYMaiC2CZYFAb4EFQ4EEAQEB
From: Richard Leitner <richard.leitner@skidata.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 17 Aug 2015 09:32:23 +0200
Message-ID: <1439796744-6382-2-git-send-email-richard.leitner@skidata.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1439796744-6382-1-git-send-email-richard.leitner@skidata.com>
References: <1439796744-6382-1-git-send-email-richard.leitner@skidata.com>
MIME-Version: 1.0
X-Originating-IP: [172.16.60.30]
Cc: otavio.salvador@ossystems.com.br
Subject: [meta-java][PATCH 1/2] README: Update PREFERRED_VERSION to new openjdk-7 85b01-2.6.1
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
X-List-Received-Date: Mon, 17 Aug 2015 07:33:27 -0000
Content-Type: text/plain

Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
---
 README | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/README b/README
index 83cb52d..7a48f14 100644
--- a/README
+++ b/README
@@ -68,7 +68,7 @@ PREFERRED_VERSION_openjdk-6-jre = "6b32-1.13.4"
 PREFERRED_VERSION_icedtea6-native = "1.8.11"
 
 #For openjdk7:
-PREFERRED_VERSION_openjdk-7-jre = "75b13-2.5.4"
+PREFERRED_VERSION_openjdk-7-jre = "85b01-2.6.1"
 PREFERRED_VERSION_icedtea7-native = "2.1.3"
 
 #Sometimes the following is needed:
-- 
2.1.4


