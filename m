Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f196.google.com (mail-qt0-f196.google.com
	[209.85.216.196])
	by mail.openembedded.org (Postfix) with ESMTP id 9EFE7784F2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Jun 2017 16:32:21 +0000 (UTC)
Received: by mail-qt0-f196.google.com with SMTP id s33so11418067qtg.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Jun 2017 09:32:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=e6y/YfTFx7VyV36hL/Tw4yeBWlCby5r/tGlqiCJE2lM=;
	b=aA7GpUXfcbMoxB+Tw79c04MCZG7bdTmar1QnsZJweXUDTb4rQgsMnsv/Pkjrf3M+pR
	wAnF/pJemFZcgW9SIr2OrDi2LvyrZGUmNAEfKHdJ5BWbE8BtWf/z8fqH2MCavMwiRSGP
	j9RJCoaYKzuz+sG1SIq2+HAaiPQVhN3+lPkbhieUnHXtPcpXQx0VOhRApJzuxa9yX2sj
	xXiD+oW1KtQWWtENrP1VD+3YT3eCIQUDbOQzRG9Ih7TqL1lBAeluFGuNRV14TKi89INn
	IFIDtvnstUdSblQ1f4CxuiZ2/y2WkB/91DiS/xtCaK1KSqjD8mTAegOiGu0O9sVvTUKp
	cU/A==
X-Gm-Message-State: AKS2vOwEUP2bF6YGPD0j9wY0an2XODz04tU+O+wfcmzIqQIoDu4vXMHV
	jkGzXNkI05GkwY2daS8=
X-Received: by 10.55.214.84 with SMTP id t81mr13263623qki.38.1497630741995;
	Fri, 16 Jun 2017 09:32:21 -0700 (PDT)
Received: from sparta.ny.asterius.io (ool-43556204.dyn.optonline.net.
	[67.85.98.4]) by smtp.gmail.com with ESMTPSA id
	x78sm1747902qkb.44.2017.06.16.09.32.21
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 16 Jun 2017 09:32:21 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 16 Jun 2017 12:32:03 -0400
Message-Id: <1497630723-7551-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-astroid: update to version 1.5.3
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
X-List-Received-Date: Fri, 16 Jun 2017 16:32:22 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/{python-astroid_1.4.9.bb => python-astroid_1.5.3.bb}       | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-astroid_1.4.9.bb => python-astroid_1.5.3.bb} (74%)

diff --git a/meta-python/recipes-devtools/python/python-astroid_1.4.9.bb b/meta-python/recipes-devtools/python/python-astroid_1.5.3.bb
similarity index 74%
rename from meta-python/recipes-devtools/python/python-astroid_1.4.9.bb
rename to meta-python/recipes-devtools/python/python-astroid_1.5.3.bb
index cee1291..9731e0b 100644
--- a/meta-python/recipes-devtools/python/python-astroid_1.4.9.bb
+++ b/meta-python/recipes-devtools/python/python-astroid_1.5.3.bb
@@ -4,8 +4,8 @@ SECTION = "devel/python"
 LICENSE = "LGPL"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 
-SRC_URI[md5sum] = "a57438971de05eb801b82eae59c05217"
-SRC_URI[sha256sum] = "a483e7891ce3a06dadfc6cb9095b0938aca58940d43576d72e4502b480c085d7"
+SRC_URI[md5sum] = "6f65e4ea8290ec032320460905afb828"
+SRC_URI[sha256sum] = "492c2a2044adbf6a84a671b7522e9295ad2f6a7c781b899014308db25312dd35"
 
 inherit setuptools pypi
 
-- 
2.7.4


