Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f195.google.com (mail-qt0-f195.google.com
	[209.85.216.195])
	by mail.openembedded.org (Postfix) with ESMTP id 5B5E078479
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Jun 2017 17:30:57 +0000 (UTC)
Received: by mail-qt0-f195.google.com with SMTP id w1so11738125qtg.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Jun 2017 10:30:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=j5wc63Aen5xHbYox3vNUJEGl1pFnejc3gJdOxQLXn1Q=;
	b=ov2B9309/NpbgtEZEJMXDKNqFfT1ggQR0FyUe7hw79hrtcEqJWMPkK/+p7+GN7J3O6
	p88pYgiFzGOe5j889EokjHlqMCGuZn+WQ9rTgaa38gZkMHEqfVhJLFBxMtutRZD2wFdo
	nxTwdZ3V0BUWbIi4MShBc2ifJL1IL4tWfZ2fC65vjJKnoDO4eyiXskp5SlNCYPnEsmOp
	twTpHtnAXAQv2l11NQhDDJ6vyhakpBfQc8ZOzlYl8auKvENlzgyDpB83PN/7sIP27ZXF
	i3Xny9jlg89xh+ucLPm3trztwRlzEyKpBh0h3HtLEgjSpWFwUjt9ave9N+36PlnEx4br
	y/Qw==
X-Gm-Message-State: AKS2vOzxkg9Y+jWpxMavRPHr6kuBBK//f+9vJHc4+uY0VbVtlRpzP89z
	X/slryN9Al4eKVIk26U=
X-Received: by 10.55.15.9 with SMTP id z9mr13702105qkg.195.1497634258761;
	Fri, 16 Jun 2017 10:30:58 -0700 (PDT)
Received: from sparta.ny.asterius.io (ool-43556204.dyn.optonline.net.
	[67.85.98.4]) by smtp.gmail.com with ESMTPSA id
	f128sm1835805qkc.13.2017.06.16.10.30.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 16 Jun 2017 10:30:57 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 16 Jun 2017 13:30:51 -0400
Message-Id: <1497634251-4474-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-isort: update to version 4.2.15
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
X-List-Received-Date: Fri, 16 Jun 2017 17:31:05 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/{python-isort_4.2.5.bb => python-isort_4.2.15.bb}          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-isort_4.2.5.bb => python-isort_4.2.15.bb} (66%)

diff --git a/meta-python/recipes-devtools/python/python-isort_4.2.5.bb b/meta-python/recipes-devtools/python/python-isort_4.2.15.bb
similarity index 66%
rename from meta-python/recipes-devtools/python/python-isort_4.2.5.bb
rename to meta-python/recipes-devtools/python/python-isort_4.2.15.bb
index e365dc6..b310fda 100644
--- a/meta-python/recipes-devtools/python/python-isort_4.2.5.bb
+++ b/meta-python/recipes-devtools/python/python-isort_4.2.15.bb
@@ -4,8 +4,8 @@ LICENSE = "MIT"
 SECTION = "devel/python"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=8227180126797a0148f94f483f3e1489"
 
-SRC_URI[md5sum] = "71489ebd936429d5bda2af7ae662ed78"
-SRC_URI[sha256sum] = "56b20044f43cf6e6783fe95d054e754acca52dd43fbe9277c1bdff835537ea5c"
+SRC_URI[md5sum] = "34915a2ce60e6fe3dbcbf5982deef9b4"
+SRC_URI[sha256sum] = "79f46172d3a4e2e53e7016e663cc7a8b538bec525c36675fcfd2767df30b3983"
 
 inherit setuptools pypi
 
-- 
2.7.4


