Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f196.google.com (mail-qk0-f196.google.com
	[209.85.220.196])
	by mail.openembedded.org (Postfix) with ESMTP id AA21971A82
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Oct 2017 13:51:08 +0000 (UTC)
Received: by mail-qk0-f196.google.com with SMTP id y23so44854qkb.10
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Oct 2017 06:51:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=XQO9wBPLWLB1fItGkuHatMoo2f4medO3xfwUOq13xgY=;
	b=iiSEX7kLIuQWMudwtZx7QY4D/tD44A3a2zbdTJft767FJeEmqZMl3pmETOQn3wBUy3
	4khLtt6rQjt+Sz85Ydmq3mwI4owHRgZzgGlueF4x6EnakqhvLLPa3ON8kl/q7JHOh57e
	QSfosvrO5ulOS/fYfvMgfymWBZ4eB00umoagNmpacePK5dB1NNoFcCLmnFOgG5x3F9dx
	Y8RnzGkjNtC2T4kzrNRS2nRX2RN/Y0cOWZYH5Xfr/cX5bq8o1FS2YcSeoyufxBINIy4y
	k4pcYwVlrZuB6b2zfc3l5CfRpRvQ3hjosgboh9P9XdVTd/rGh5rxxLdWhc4/FChgLui4
	T86Q==
X-Gm-Message-State: AMCzsaUlJGsWOTAT5PaM2cqvBAJj1pYdqlBtMR46I4mY7sCH4+kVOMkJ
	Y1fooAIEgYj8KNwS+lkj3S2Ij+3X
X-Google-Smtp-Source: ABhQp+RiyQ9ZlPoswvOkaYqExP5YD51AJ+aFKiGjHEwqs7ds5e4lH2+YjehDxTZzU3U6ow0W/Fkr8g==
X-Received: by 10.55.183.134 with SMTP id h128mr2997678qkf.96.1508939469435;
	Wed, 25 Oct 2017 06:51:09 -0700 (PDT)
Received: from sparta.ny.asterius.io
	(pool-108-30-199-218.nycmny.fios.verizon.net. [108.30.199.218])
	by smtp.gmail.com with ESMTPSA id
	x35sm1882269qte.26.2017.10.25.06.51.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 25 Oct 2017 06:51:08 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 25 Oct 2017 09:51:02 -0400
Message-Id: <1508939462-13875-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python3-multidict: update to version 3.3.0
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
X-List-Received-Date: Wed, 25 Oct 2017 13:51:08 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/{python3-multidict_3.2.0.bb => python3-multidict_3.3.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-multidict_3.2.0.bb => python3-multidict_3.3.0.bb} (64%)

diff --git a/meta-python/recipes-devtools/python/python3-multidict_3.2.0.bb b/meta-python/recipes-devtools/python/python3-multidict_3.3.0.bb
similarity index 64%
rename from meta-python/recipes-devtools/python/python3-multidict_3.2.0.bb
rename to meta-python/recipes-devtools/python/python3-multidict_3.3.0.bb
index c6556b3..1a3eb0a 100644
--- a/meta-python/recipes-devtools/python/python3-multidict_3.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-multidict_3.3.0.bb
@@ -5,5 +5,5 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=e74c98abe0de8f798ca609137f9cef4a"
 
 inherit pypi setuptools3
 
-SRC_URI[md5sum] = "a01da31ca1855557a1b2e053c933af2f"
-SRC_URI[sha256sum] = "e27a7a95317371c15ecda7206f6e8c144f10a337bb2c3e61b5176deafbb88cb2"
+SRC_URI[md5sum] = "7ecd7c2807fd76ba7ca83e4e0c7fdf5f"
+SRC_URI[sha256sum] = "e76909da2fad6966281d4e0e4ccfd3c3025699ebcc30806afa09fa1384c3532b"
-- 
2.7.4


