Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f195.google.com (mail-qt0-f195.google.com
	[209.85.216.195])
	by mail.openembedded.org (Postfix) with ESMTP id EBB9B78965
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Mar 2018 12:06:53 +0000 (UTC)
Received: by mail-qt0-f195.google.com with SMTP id s48so17599246qtb.10
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Mar 2018 05:06:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=bb8NWpIRpgtezAnSRIpS/I8lQyIgOSk4jWqfORwIR54=;
	b=BjuwxdUoWZHqcK23J32o9ngJkGaCmLu1sYm3DiBj3Mm1LmrrVzoDbKgd0Yuc+7MC1/
	zJvF7mkYq6FQtgyknFMU3u4oW/LbFoWbcx/9KlPtT5khtIHrt9QSo2d2mjuAcJabikbN
	lLiV5exwfbT68cOJ+axUALaoIpBJ59SSdlN1HfWRtSci5nwPnduyclstKiD72XkS2uzn
	ZygYxiAhcM+iYhFqACmUB3JLwTjXKHHhpHOCeikGjCScnZPiLBT3/NoHWh+e1BfRSsxE
	HQbgP7JVPrXaEJKzySCkQKrQMKNikRmFKuEI1Vd8l8PFrkkiZ0/HvBF5L8hIDducrze4
	ABhQ==
X-Gm-Message-State: AElRT7GnxSGCJ9LBfXYMV/m2UY6AQNSyeBs6rOULMx27GWNdrCNE39VF
	GBx+68P143xtsDRN/C9mCMljBJvs
X-Google-Smtp-Source: AG47ELswAASQh5U9Su9ven1Ytv2mEc6cogT8YWEfXm2VZC4N/MDxUcl3Y225okiTJRpxoOV3raO8vA==
X-Received: by 10.200.34.59 with SMTP id o56mr17697486qto.103.1521461214517;
	Mon, 19 Mar 2018 05:06:54 -0700 (PDT)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id
	t28sm9556489qkj.61.2018.03.19.05.06.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 19 Mar 2018 05:06:53 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 19 Mar 2018 08:06:47 -0400
Message-Id: <1521461207-31938-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-cmd2: update to version 0.8.1
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
X-List-Received-Date: Mon, 19 Mar 2018 12:06:54 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/{python-cmd2_0.8.0.bb => python-cmd2_0.8.1.bb}           | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python-cmd2_0.8.0.bb => python-cmd2_0.8.1.bb} (69%)

diff --git a/meta-python/recipes-devtools/python/python-cmd2_0.8.0.bb b/meta-python/recipes-devtools/python/python-cmd2_0.8.1.bb
similarity index 69%
rename from meta-python/recipes-devtools/python/python-cmd2_0.8.0.bb
rename to meta-python/recipes-devtools/python/python-cmd2_0.8.1.bb
index c4bdceb..145ab98 100644
--- a/meta-python/recipes-devtools/python/python-cmd2_0.8.0.bb
+++ b/meta-python/recipes-devtools/python/python-cmd2_0.8.1.bb
@@ -1,10 +1,10 @@
 SUMMARY = "Extra features for standard library's cmd module"
 HOMEPAGE = "http://packages.python.org/cmd2/"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://setup.py;beginline=50;endline=50;md5=0f13c9cfc75288223cf7edd2f3b985a2"
+LIC_FILES_CHKSUM = "file://setup.py;beginline=51;endline=51;md5=0f13c9cfc75288223cf7edd2f3b985a2"
 
-SRC_URI[md5sum] = "0988674436fde36bbfc5cd650f4808ac"
-SRC_URI[sha256sum] = "4b3a9d9f305039ca94deb93e0a54ba896f12d1aae7206c6283fe02c6dbb0b7ba"
+SRC_URI[md5sum] = "701b916ffac99137bea413205106f993"
+SRC_URI[sha256sum] = "d09976f9ad2327883c2d07b5acb42e66ad52b17e352873c22041ed124bfe8aba"
 
 inherit pypi setuptools
 
-- 
2.7.4


