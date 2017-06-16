Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f194.google.com (mail-qt0-f194.google.com
	[209.85.216.194])
	by mail.openembedded.org (Postfix) with ESMTP id 63D50784CE
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Jun 2017 17:01:44 +0000 (UTC)
Received: by mail-qt0-f194.google.com with SMTP id x58so11596470qtc.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Jun 2017 10:01:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=opOBMp55kNPqoEqqwN0udNrJ631K81CNJuvbDU7bCdY=;
	b=HUJCx+n4ILeYq2Ts84p9hjsR8fRE5YolPjh2KN8PeA2X5b3MefqzJ2sthyE0In6Iuz
	8g1E0oLNa0y2yGaPzjnSiwziN4pa/tO8GcgIys/0WIaE95K+Re2IZAfyQ8HyFC/VGBqi
	sXsuayYmEjAI6VWblJGIYjjd7qiUy3LaPj82cfNG/4rqx1/EXn9mzGX3853skPTEuH1w
	ZQT1jRfKO9t3i5gxQXgCSj7ob5Wj09wl9Qy6v0qiU2DfYc0Uxt+GpzK+Ry0pHU+XsQ8T
	LC536pfeh1kSd1dHrLq/rpdenNeOagDSoiGEGKgOPb+C0iko3FZp9gHRO2wGUhb04eCC
	TlSg==
X-Gm-Message-State: AKS2vOxTS0TS61eu9Quc1M+kGFfxUJyKFMTZttOgqfnPUy6zwKmGdfQS
	p7BnaQK1ytkeh9YVtlw=
X-Received: by 10.55.203.208 with SMTP id u77mr13172206qkl.95.1497632505751;
	Fri, 16 Jun 2017 10:01:45 -0700 (PDT)
Received: from sparta.ny.asterius.io (ool-43556204.dyn.optonline.net.
	[67.85.98.4])
	by smtp.gmail.com with ESMTPSA id b6sm1720521qkc.68.2017.06.16.10.01.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 16 Jun 2017 10:01:44 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 16 Jun 2017 13:01:33 -0400
Message-Id: <1497632493-8367-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-monotonic: update to version 1.3
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
X-List-Received-Date: Fri, 16 Jun 2017 17:01:46 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/{python-monotonic_1.2.bb => python-monotonic_1.3.bb}       | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-monotonic_1.2.bb => python-monotonic_1.3.bb} (67%)

diff --git a/meta-python/recipes-devtools/python/python-monotonic_1.2.bb b/meta-python/recipes-devtools/python/python-monotonic_1.3.bb
similarity index 67%
rename from meta-python/recipes-devtools/python/python-monotonic_1.2.bb
rename to meta-python/recipes-devtools/python/python-monotonic_1.3.bb
index e5c88b1..ee91d18 100644
--- a/meta-python/recipes-devtools/python/python-monotonic_1.2.bb
+++ b/meta-python/recipes-devtools/python/python-monotonic_1.3.bb
@@ -2,8 +2,8 @@ SUMMARY = "An implementation of time.monotonic() for Python 2.0 through 3.2"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d2794c0df5b907fdace235a619d80314"
 
-SRC_URI[md5sum] = "d14c93aabc3d6af25ef086b032b123cf"
-SRC_URI[sha256sum] = "c0e1ceca563ca6bb30b0fb047ee1002503ae6ad3585fc9c6af37a8f77ec274ba"
+SRC_URI[md5sum] = "34351251d1a67667a25cd7673d2e44bf"
+SRC_URI[sha256sum] = "2b469e2d7dd403f7f7f79227fe5ad551ee1e76f8bb300ae935209884b93c7c1b"
 
 inherit pypi setuptools
 
-- 
2.7.4


