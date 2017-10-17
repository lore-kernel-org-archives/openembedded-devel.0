Return-Path: <martink@posteo.de>
Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
	by mail.openembedded.org (Postfix) with ESMTP id DADC07828E
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Oct 2017 09:55:42 +0000 (UTC)
Received: from submission (posteo.de [89.146.220.130]) 
	by mout02.posteo.de (Postfix) with ESMTPS id CE45D20C01
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Oct 2017 11:55:43 +0200 (CEST)
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 3yGVtl3ZBszyxY;
	Tue, 17 Oct 2017 11:55:43 +0200 (CEST)
From: Martin Kepplinger <martink@posteo.de>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 17 Oct 2017 11:55:17 +0200
Message-Id: <20171017095517.5597-2-martink@posteo.de>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20171017095517.5597-1-martink@posteo.de>
References: <20171017095517.5597-1-martink@posteo.de>
Subject: [meta-oe][PATCH] tslib: update project homepage
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
X-List-Received-Date: Tue, 17 Oct 2017 09:55:43 -0000

The berlios project has been dead for a long time. tslib is hosted and
developed on github for years already.

Signed-off-by: Martin Kepplinger <martink@posteo.de>
---
 meta-oe/recipes-graphics/tslib/tslib_1.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/tslib/tslib_1.1.bb b/meta-oe/recipes-graphics/tslib/tslib_1.1.bb
index 502034a9c..e7c48ff6c 100644
--- a/meta-oe/recipes-graphics/tslib/tslib_1.1.bb
+++ b/meta-oe/recipes-graphics/tslib/tslib_1.1.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "Tslib is an abstraction layer for touchscreen panel \
 events, as well as a filter stack for the manipulation of those events. \
 Tslib is generally used on embedded devices to provide a common user \
 space interface to touchscreen functionality."
-HOMEPAGE = "http://tslib.berlios.de/"
+HOMEPAGE = "http://tslib.org/"
 
 AUTHOR = "Russell King w/ plugins by Chris Larson et. al."
 SECTION = "base"
-- 
2.11.0


