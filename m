Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f176.google.com (mail-qk0-f176.google.com
	[209.85.220.176])
	by mail.openembedded.org (Postfix) with ESMTP id BEDD1780F4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 May 2017 21:34:22 +0000 (UTC)
Received: by mail-qk0-f176.google.com with SMTP id k74so164904817qke.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 May 2017 14:34:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=L0Xjj/P4iQ6EXFWkpAbBIB8HhYaUb02gUX2b52a4Hv4=;
	b=oTmCqkhe61EmMrq2xCeCZVybkJ/HeXp0Hlu0MGx6s0EAhoPTuGeSTKhj6ZwfxYKNUg
	QjVLU0ACu0MDWphOg7T6Ihy1tGK7V+zvQd7LlTCvLWPlXtZf64FdcqjOyxB0DbYv9dDA
	T76tHk0p9rOnsQKGo0UtvjtmF95ACxAvcyN3P5tKRq4/Y1uK/QVwTGUcVCUIgH+saYfm
	xTX7BNFlCdC8nBmiLUYMY7EzfxVxVVVcbrlXbl4kefN0+jfG0HEG7C/ms8BYGPQ1BBFs
	zKEkfqRT39CHGn7+KNuhfu88MhHy/WfURQqoytheq2zf3OWZKKEhLBPIaM9hinslQfT7
	8Ggw==
X-Gm-Message-State: AODbwcAc7nX0fSTchQ64mB1GSuvHA8pF5Z9wo2SXkyTyrUmFwBFj2P8G
	pbE4ZGIYGle3Sg==
X-Received: by 10.233.216.194 with SMTP id u185mr35136373qkf.105.1495661663605;
	Wed, 24 May 2017 14:34:23 -0700 (PDT)
Received: from sparta.ny.asterius.io (ool-43556204.dyn.optonline.net.
	[67.85.98.4]) by smtp.gmail.com with ESMTPSA id
	y188sm3293073qkb.49.2017.05.24.14.34.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 24 May 2017 14:34:23 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 24 May 2017 17:34:15 -0400
Message-Id: <1495661655-17020-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-typing: update to version 3.6.1
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
X-List-Received-Date: Wed, 24 May 2017 21:34:23 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-typing.inc                 | 4 ++--
 .../python/{python-typing_3.5.3.0.bb => python-typing_3.6.1.bb}       | 0
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-typing_3.5.3.0.bb => python-typing_3.6.1.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-typing.inc b/meta-python/recipes-devtools/python/python-typing.inc
index 49da4fe..12b7d15 100644
--- a/meta-python/recipes-devtools/python/python-typing.inc
+++ b/meta-python/recipes-devtools/python/python-typing.inc
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/python/typing"
 LICENSE = "PSF"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=64fc2b30b67d0a8423c250e0386ed72f"
 
-SRC_URI[md5sum] = "3996a747158e5591abf689c1c5f8f9db"
-SRC_URI[sha256sum] = "ca2daac7e393e8ee86e9140cd0cf0172ff6bb50ebdf0b06281770f98f31bff21"
+SRC_URI[md5sum] = "3fec97415bae6f742fb3c3013dedeb89"
+SRC_URI[sha256sum] = "c36dec260238e7464213dcd50d4b5ef63a507972f5780652e835d0228d0edace"
 
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python-typing_3.5.3.0.bb b/meta-python/recipes-devtools/python/python-typing_3.6.1.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-typing_3.5.3.0.bb
rename to meta-python/recipes-devtools/python/python-typing_3.6.1.bb
-- 
2.7.4


