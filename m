Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f196.google.com (mail-wr0-f196.google.com
	[209.85.128.196])
	by mail.openembedded.org (Postfix) with ESMTP id 27F5C77DB3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Mar 2017 15:18:43 +0000 (UTC)
Received: by mail-wr0-f196.google.com with SMTP id u18so21367181wrc.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Mar 2017 08:18:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=aqRPIV5FyuXwZOdG6lvR30n5ORa6Yco7ka0iRSuc+vs=;
	b=ip3ssz6QmP+D/DnsB7lIHrIWGt2fCm9CINB8+QAOzY5pgXsW6583gacPyqrNerowst
	AV8a/5GKPuBWk0S3GQUL2RE7JW2B6LtfbP0XwEREX8cI69pkBKWVH43L9tExW8iqtg/S
	7b5So7JKken1fZhtZMXqb/JHadkVkLIIOknhwoz+zLj/zrM5N+BTWVrEIDlLes2V7qFK
	k5CU9if12SFYzUTlRjvEKA8PsG4CfFGYjTaeoc1yCDBouRn3elpBVceo5R73+iCtbt9C
	fzr2ygwpdxiJqFBrp1h7H7viKrdtFGsRoI1kD1lRObmiiXlzsAlTQ66Daiu7L6+nE7oA
	TLiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=aqRPIV5FyuXwZOdG6lvR30n5ORa6Yco7ka0iRSuc+vs=;
	b=RDc6xuxxoEzPpUyB4g35uKNEprR6wSRUD9EijgwQfV19f/BcKfs519GbrESsWy8uzq
	D/ZdsxyMT567qQYFAMcxNSsinrzKZ34ejTNFl04GciBvzqLpexuelukOQYlSOsU82hfB
	R4PWLluk7b+4PF/uuy8CaQe2nYTDQKc5NoRRP3UaaaKU6ZwWEuRuOAnBVQqjdmaYk4Lz
	wOLQnBT3GA6PpJIBtIyV9KdhRw03RDiDb+PWTYibndzflw515xAQoQOuwe1r3wJ4eGIS
	5UnvjfMROCMTRLv5Abd65A83tOsLsJBft/gJPVDvR1Elyh8937ZrMk0xSf/o1BKuKGHr
	0l5w==
X-Gm-Message-State: AFeK/H2yHVKFlCPQxLt4hOiWKz649tgo3RmgUE+k0ektxb3OIbK4b28S4DpJ241QGBP2Rg==
X-Received: by 10.223.160.168 with SMTP id m37mr3623072wrm.196.1490973525051; 
	Fri, 31 Mar 2017 08:18:45 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	y69sm3256427wmh.27.2017.03.31.08.18.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 31 Mar 2017 08:18:44 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 31 Mar 2017 17:18:28 +0200
Message-Id: <20170331151828.25907-7-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.12.2
In-Reply-To: <20170331151828.25907-1-Martin.Jansa@gmail.com>
References: <adec7310-ce23-cef8-0c06-ea4b5bf9036c@gmail.com>
	<20170331151828.25907-1-Martin.Jansa@gmail.com>
Subject: [meta-oe][morty][PATCHv2 7/7] alsa-equal: Update SRC_URI to something valid
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
X-List-Received-Date: Fri, 31 Mar 2017 15:18:44 -0000

From: Khem Raj <raj.khem@gmail.com>

www.thedigitalmachine.net has disappeared
* cherry picked from master:
  commit a02ec57e144b768c8d5e383622a83f87d86425b5
  Author: Khem Raj <raj.khem@gmail.com>
  Date:   Wed Mar 22 11:45:33 2017 -0700

    alsa-equal: Update SRC_URI to something valid

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-multimedia/recipes-multimedia/alsa-equal/alsa-equal_0.6.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-multimedia/recipes-multimedia/alsa-equal/alsa-equal_0.6.bb b/meta-multimedia/recipes-multimedia/alsa-equal/alsa-equal_0.6.bb
index 637d029ba..3bed70e1a 100644
--- a/meta-multimedia/recipes-multimedia/alsa-equal/alsa-equal_0.6.bb
+++ b/meta-multimedia/recipes-multimedia/alsa-equal/alsa-equal_0.6.bb
@@ -1,12 +1,12 @@
 DESCRIPTION = "A real-time adjustable equalizer plugin for ALSA"
-HOMEPAGE = "http://www.thedigitalmachine.net/alsaequal.html"
+HOMEPAGE = "https://web.archive.org/web/20161105202833/http://thedigitalmachine.net/alsaequal.html"
 LICENSE = "LGPL-2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=243b725d71bb5df4a1e5920b344b86ad"
 
 DEPENDS = "alsa-lib"
 
 SRC_URI = " \
-    http://www.thedigitalmachine.net/tools/alsaequal-${PV}.tar.bz2 \
+    https://launchpad.net/ubuntu/+archive/primary/+files/alsaequal_${PV}.orig.tar.bz2 \
     file://0001-Fix-asneeded.patch \
     file://0002-Fix-Eq-CAPS-plugin-name.patch \
     file://0003-Fix-mixer.patch \
-- 
2.12.2


