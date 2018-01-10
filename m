Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f179.google.com (mail-qk0-f179.google.com
	[209.85.220.179])
	by mail.openembedded.org (Postfix) with ESMTP id DC5287827F
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Jan 2018 21:26:30 +0000 (UTC)
Received: by mail-qk0-f179.google.com with SMTP id l64so1054413qke.13
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Jan 2018 13:26:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=EQb+SCzbvMqq30DJR4fX9cvhmAYPpUOVE9eE86sxRFk=;
	b=N2Plze5cIGxp3e9bmQ9sGkX2FmD8udti2c++qAMF0KHXKvXlQbf0fcJmlosFWNVuhY
	pbb0mXoOLSf/3EeooCFjBeIbYcY+qI/QPyRyTz0BuTPWyEEyLdVLAG8cX9WQMqw+0hxV
	T7v7zVrkllOmgrXViRxhqcTeOnhjlJtZUsUuYgNZv4C3EnQE8PrUuVvoyWe1FeDCU7ab
	ctSzuwYHicfmj4L6yBg9SI8Aza6IH8BzequRPJiY4wwD2d3sS6fp7gy9u1gLnmcBYJQ/
	mVevV9Qm9GkYjmkzxERlWQ2xI02AVk2cS/qGwWrFdQ51QxuNGrPYKTcSq/2Yk3+Na+SR
	n0Dg==
X-Gm-Message-State: AKwxytey3T4gXy9fugMRyciYfZl6C2hrYd49f6ZSY1tTgPxSyQiDc7Sb
	vCsnwRLTt/iPRz/G1UkNE6cv1KXP
X-Google-Smtp-Source: ACJfBouzhXY4Mb530x/5CQeMRq439DagmeuAwrTHOAS9sWF4btMeGIq8MZUjedJ3XgdvkKS9anbuvA==
X-Received: by 10.237.42.198 with SMTP id t64mr27597494qtd.132.1515619591516; 
	Wed, 10 Jan 2018 13:26:31 -0800 (PST)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id
	n73sm11268151qka.79.2018.01.10.13.26.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 10 Jan 2018 13:26:30 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 10 Jan 2018 16:26:25 -0500
Message-Id: <1515619585-9434-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-cmd2: update to version 0.7.9
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
X-List-Received-Date: Wed, 10 Jan 2018 21:26:31 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/{python-cmd2_0.7.8.bb => python-cmd2_0.7.9.bb}           | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python-cmd2_0.7.8.bb => python-cmd2_0.7.9.bb} (69%)

diff --git a/meta-python/recipes-devtools/python/python-cmd2_0.7.8.bb b/meta-python/recipes-devtools/python/python-cmd2_0.7.9.bb
similarity index 69%
rename from meta-python/recipes-devtools/python/python-cmd2_0.7.8.bb
rename to meta-python/recipes-devtools/python/python-cmd2_0.7.9.bb
index 96a1b39..e740099 100644
--- a/meta-python/recipes-devtools/python/python-cmd2_0.7.8.bb
+++ b/meta-python/recipes-devtools/python/python-cmd2_0.7.9.bb
@@ -1,10 +1,10 @@
 SUMMARY = "Extra features for standard library's cmd module"
 HOMEPAGE = "http://packages.python.org/cmd2/"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://setup.py;beginline=49;endline=49;md5=0f13c9cfc75288223cf7edd2f3b985a2"
+LIC_FILES_CHKSUM = "file://setup.py;beginline=50;endline=50;md5=0f13c9cfc75288223cf7edd2f3b985a2"
 
-SRC_URI[md5sum] = "afa5c55fd94bb4a38a01232a511585eb"
-SRC_URI[sha256sum] = "e132db7d1f5a2faf2310606ee4b2e49c7b4e1e5ed533f1e4ca9474c51475eb0f"
+SRC_URI[md5sum] = "eeb80d5c29715b4ac39ecc032842a25f"
+SRC_URI[sha256sum] = "f518d30c641483c8d6c246afae6e4447f816f8300befc6a11c476eeb62a496e6"
 
 inherit pypi setuptools
 
-- 
2.7.4


