Return-Path: <net147@gmail.com>
Received: from mail-it0-f54.google.com (mail-it0-f54.google.com
	[209.85.214.54])
	by mail.openembedded.org (Postfix) with ESMTP id DE00F71E30
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Apr 2017 05:41:07 +0000 (UTC)
Received: by mail-it0-f54.google.com with SMTP id e132so40632328ite.1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 Apr 2017 22:41:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=C14LrQqyovIgrF8XPqaPsMQJzxkAoawcP7DQKvIdevE=;
	b=urCJJzvZ6lpto0CZadQoZQJN/Gf0xIAcn6aDFq53fdZMGL/RimmilS43mEWMmB4jgK
	WjmbFkuSre7bKFZeXzi4eXd4NfV2Tihq9CZnDZ8h1xhg+avhykHbR/1ytrwPr9ev1ZmK
	fjkoZQo6aQ8EuKr4MrUBBTCvJ4XOteCcRxRemp6yuNhXVqRA4T3YFk74/dKkuogaFnyL
	bTHrBl2fsPS2vGJYDZ2C955xdHMFb8jzm+WwagjfnepQVUmBO/K4IHhkmQrYoe80VDUQ
	70kxqedS//rz9mNeDKlZ4Wa/hw4OVv/lp5WLlBRwrZ/gTue/CKDYxduf+M6tVEHez2gi
	Ttlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=C14LrQqyovIgrF8XPqaPsMQJzxkAoawcP7DQKvIdevE=;
	b=nqgIE11vbvE/UqUuz5P5mgWpVCKHQLwB0GxZnOF8zS4tmINGYLDXzTJFGh4cC3nL4Q
	zWQOLoC01QWtxswJ0IfEMYBjddIZestLCmRKOWm+PvjlTrQbZ071xx8M5etERH3SL/8o
	Uz0N5DNX/MSkznlDk6Iau2pK6Zl+48ArsYqb5K3OI7Qj6/mhDqImPSl/7GXHdZR/fY11
	GdMlLJ+RwSAf/30Zicahgl/J7l1euSkRyfAr/sdGsMCI2DWFTws4rsyE7KpiBmiYthqu
	VgHXdZLeVHVIEVdpdNE6iezWQ3TnLFI8Vg/NDhFHMv8M5R2K6a0BGw3g5SR8Rf5Cw/As
	wDbQ==
X-Gm-Message-State: AN3rC/4Dj/7bVzT4NFc2AaeewhfPs9YXKAdgI+se8J4veb/x19yv6E7o
	j3WJmgh4Bam24Q==
X-Received: by 10.98.215.94 with SMTP id v30mr22717813pfl.121.1493012468735;
	Sun, 23 Apr 2017 22:41:08 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by smtp.gmail.com with ESMTPSA id
	c64sm28100770pfa.110.2017.04.23.22.41.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 23 Apr 2017 22:41:07 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 24 Apr 2017 15:41:14 +1000
Message-Id: <20170424054114.11487-1-net147@gmail.com>
X-Mailer: git-send-email 2.12.2
Subject: [meta-oe][morty][PATCH] devmem2: Update SRC_URI
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
X-List-Received-Date: Mon, 24 Apr 2017 05:41:08 -0000

The original URL no longer exists.

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 meta-oe/recipes-support/devmem2/devmem2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/devmem2/devmem2.bb b/meta-oe/recipes-support/devmem2/devmem2.bb
index e48cc9210..5e244f74b 100644
--- a/meta-oe/recipes-support/devmem2/devmem2.bb
+++ b/meta-oe/recipes-support/devmem2/devmem2.bb
@@ -3,7 +3,7 @@ LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://devmem2.c;endline=28;md5=dd68f2b0a5184b3db3dc25c99e0bd0cd"
 PR = "r7"
 
-SRC_URI = "http://www.lartmaker.nl/lartware/port/devmem2.c \
+SRC_URI = "http://free-electrons.com/pub/mirror/devmem2.c \
            file://devmem2-fixups-2.patch;apply=yes;striplevel=0"
 S = "${WORKDIR}"
 
-- 
2.12.2


