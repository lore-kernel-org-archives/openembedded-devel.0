Return-Path: <Mingli.Yu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6508874700
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Jun 2018 09:49:50 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w5R9npi7005156
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Jun 2018 02:49:51 -0700 (PDT)
Received: from ala-lpggp2.wrs.com (147.11.105.123) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.399.0;
	Wed, 27 Jun 2018 02:49:50 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 27 Jun 2018 02:49:14 -0700
Message-ID: <20180627094922.109996-4-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180627094922.109996-1-mingli.yu@windriver.com>
References: <20180627094922.109996-1-mingli.yu@windriver.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 04/13] iceauth: Upgrade to 1.0.8
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
X-List-Received-Date: Wed, 27 Jun 2018 09:49:50 -0000
Content-Type: text/plain

From: Mingli Yu <mingli.yu@windriver.com>

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 .../xorg-app/{iceauth_1.0.7.bb => iceauth_1.0.8.bb}           | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-graphics/xorg-app/{iceauth_1.0.7.bb => iceauth_1.0.8.bb} (70%)

diff --git a/meta-oe/recipes-graphics/xorg-app/iceauth_1.0.7.bb b/meta-oe/recipes-graphics/xorg-app/iceauth_1.0.8.bb
similarity index 70%
rename from meta-oe/recipes-graphics/xorg-app/iceauth_1.0.7.bb
rename to meta-oe/recipes-graphics/xorg-app/iceauth_1.0.8.bb
index f40dec884..62296b5be 100644
--- a/meta-oe/recipes-graphics/xorg-app/iceauth_1.0.7.bb
+++ b/meta-oe/recipes-graphics/xorg-app/iceauth_1.0.8.bb
@@ -11,6 +11,6 @@ BBCLASSEXTEND = "native"
 
 DEPENDS += "libice"
 
-SRC_URI[md5sum] = "25dab02f8e40d5b71ce29a07dc901b8c"
-SRC_URI[sha256sum] = "1216af2dee99b318fcf8bf9a259915273bcb37a7f1e7859af4f15d0ebf6f3f0a"
+SRC_URI[md5sum] = "3b9b79fa0f9928161f4bad94273de7ae"
+SRC_URI[sha256sum] = "e6ee213a217265cc76050e4293ea70b98c32dce6505c6421227efbda62ab60c6"
 
-- 
2.17.1


