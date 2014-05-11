Return-Path: <martin.jansa@gmail.com>
Received: from mail-lb0-f179.google.com (unknown [209.85.217.179])
	by mail.openembedded.org (Postfix) with ESMTP id F3C666059B
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 11 May 2014 14:54:52 +0000 (UTC)
Received: by mail-lb0-f179.google.com with SMTP id c11so6831908lbj.10
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 11 May 2014 07:54:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=Mm00iVHReoyJJwZv3b4Dug50d6bSudV39yA0SbZidgw=;
	b=zh7tfdApbuDPmOu99uYgi/4V7iubROIdr11vMFTq5sdlDYeIvtXMMshYhfeb/327Ha
	ktzVYabu8cLebd3LFsYqWilmDmTJoiAcsaTBy1KcSgvZ04m+sM7sbzqSvHnEj5gzoBfz
	x7U0KGD03IDs2MLzQRyZPppaORvQmvf/S9U0JEP6vmti3YxL+YlFMyV0BrhAu3Hts8Gt
	b4h55FYfBY50JZUmdL27ToZNRZDvW6vRfe23t3CfSfPxR9qpKpSTj37lG2lF9hrdEz9J
	cuLAqs5pxPAt0alggABO9b5DdAbzix0M5mq2dD59iO3595ABMmthXaGipzrg4LHXezOw
	3yXw==
X-Received: by 10.112.27.133 with SMTP id t5mr20226653lbg.21.1399820092645;
	Sun, 11 May 2014 07:54:52 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id k1sm9169728lbb.9.2014.05.11.07.54.51
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 11 May 2014 07:54:51 -0700 (PDT)
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 11 May 2014 16:55:16 +0200
Message-Id: <1399820116-3174-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.9.2
Subject: [meta-oe][WIP][PATCH] mongodb: update LICENSE AGPLv3 -> AGPL-3.0
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
X-List-Received-Date: Sun, 11 May 2014 14:55:04 -0000

* to fix:
  WARNING: mongodb: No generic license file exists for: AGPLv3 in any provider

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/mongodb/mongodb_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/mongodb/mongodb_git.bb b/meta-oe/recipes-support/mongodb/mongodb_git.bb
index 149f582..2701c4c 100644
--- a/meta-oe/recipes-support/mongodb/mongodb_git.bb
+++ b/meta-oe/recipes-support/mongodb/mongodb_git.bb
@@ -1,5 +1,5 @@
 SUMMARY = "mongodb"
-LICENSE = "AGPLv3 & Apache-2.0"
+LICENSE = "AGPL-3.0 & Apache-2.0"
 LIC_FILES_CHKSUM = "file://GNU-AGPL-3.0.txt;md5=73f1eb20517c55bf9493b7dd6e480788 \
                     file://APACHE-2.0.txt;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-- 
1.9.2


