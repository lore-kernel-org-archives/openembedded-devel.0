Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f194.google.com (mail-qt0-f194.google.com
	[209.85.216.194])
	by mail.openembedded.org (Postfix) with ESMTP id 73A23784BC
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Jun 2017 16:53:57 +0000 (UTC)
Received: by mail-qt0-f194.google.com with SMTP id w1so11500256qtg.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Jun 2017 09:53:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=VwL+oP8z+1enyR7wXmO9UceHt6YWY2bCcmpICOo6R9I=;
	b=dmAGrd8fPConRxMRnf2mbMSh1zPVJJO8i8lANZR3pr+6FpZwVJwUYSB/Wq0rKMSL5B
	C4kJXzfdcsN/qPcryTkoajyA0c6lr7+p1QuIa+QrMLzAiUomOcn9frDSxZkswtfFBKwK
	dM8CwCPfTH6YncvDEqRtd4n5AL1GPqIiGfIH4ip6ZV6IC1LyCjZzNt95gcNTy1HwptDD
	cQ9jKRi01VmmtotrwMabfd3FJGuAopbrjEcWvGD7rlsqi6aku1ArdPzeoLCDrBhFb4PM
	8THWkcfXeKTEFZr4RmU2SdoGVsRzQshg9MMy+c/ezEoGuxd0qre5Zb+ViIz6SHj5t0yH
	JvRw==
X-Gm-Message-State: AKS2vOx3rLb1xyPBhEkstfjR7uQPhwirYIGBEN7UOtaTjtd9xedXFWZj
	09ZPsQw1oMS13+V6bGw=
X-Received: by 10.55.187.196 with SMTP id l187mr14160160qkf.185.1497632039124; 
	Fri, 16 Jun 2017 09:53:59 -0700 (PDT)
Received: from sparta.ny.asterius.io (ool-43556204.dyn.optonline.net.
	[67.85.98.4]) by smtp.gmail.com with ESMTPSA id
	m51sm1932302qtb.62.2017.06.16.09.53.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 16 Jun 2017 09:53:58 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 16 Jun 2017 12:53:51 -0400
Message-Id: <1497632031-30352-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-wrapt: update to version 1.10.10
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
X-List-Received-Date: Fri, 16 Jun 2017 16:54:00 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/{python-wrapt_1.10.8.bb => python-wrapt_1.10.10.bb}        | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-wrapt_1.10.8.bb => python-wrapt_1.10.10.bb} (71%)

diff --git a/meta-python/recipes-devtools/python/python-wrapt_1.10.8.bb b/meta-python/recipes-devtools/python/python-wrapt_1.10.10.bb
similarity index 71%
rename from meta-python/recipes-devtools/python/python-wrapt_1.10.8.bb
rename to meta-python/recipes-devtools/python/python-wrapt_1.10.10.bb
index 58aa1bd..ee50842 100644
--- a/meta-python/recipes-devtools/python/python-wrapt_1.10.8.bb
+++ b/meta-python/recipes-devtools/python/python-wrapt_1.10.10.bb
@@ -4,8 +4,8 @@ LICENSE = "BSD"
 SECTION = "devel/python"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=82704725592991ea88b042d150a66303"
 
-SRC_URI[md5sum] = "7c2a7e6262acc396ef6528b3d66bd047"
-SRC_URI[sha256sum] = "4ea17e814e39883c6cf1bb9b0835d316b2f69f0f0882ffe7dad1ede66ba82c73"
+SRC_URI[md5sum] = "97365e906afa8b431f266866ec4e2e18"
+SRC_URI[sha256sum] = "42160c91b77f1bc64a955890038e02f2f72986c01d462d53cb6cb039b995cdd9"
 
 inherit setuptools pypi
 
-- 
2.7.4


