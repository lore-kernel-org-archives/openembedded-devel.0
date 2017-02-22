Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f195.google.com (mail-qt0-f195.google.com
	[209.85.216.195])
	by mail.openembedded.org (Postfix) with ESMTP id 16C1F73151
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Feb 2017 17:34:22 +0000 (UTC)
Received: by mail-qt0-f195.google.com with SMTP id n37so1263407qtb.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Feb 2017 09:34:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=njTQUylFhElItRYdr8JpXcGnHl61Nq+Jd1aStL9kyUg=;
	b=e8R2mJqXMybycQwtJu8t1Nx1bRWWmcbZioo1i2EIRc8JeqMS9Im1AdDtZBnykzDBYa
	m/Dp141nqy70eBETUEfxQdWn45Dblq74TzZp3LFPEtG3enBd2rkFwkwyesJ3XmhJ98Sh
	pzRUshrPMmHFeXRzRTinJiD5wIuTgOLrQZCnaFjOeDvs0xBF34Z9gm5Pppgltv7vE9fA
	ApZW63C9893sNUI8YgTMB0h3bKqsFrwYB58JNKRjQLhhAOS0mEk9igr7RDvhbW4Y66fM
	anXNO+5ltHpu+m0BByA8bG0lfJEKVUFJCKeBkxV2sS/0jfGLQAXO3xgSteto9+sDBMDu
	YTZQ==
X-Gm-Message-State: AMke39lv2o/kpqtg2ON4OvYb3Ggzt8oKwGbsDWsRId5sdT11cjVLGUc4T124WbliWgM9PQ==
X-Received: by 10.200.35.124 with SMTP id b57mr33518435qtb.147.1487784863815; 
	Wed, 22 Feb 2017 09:34:23 -0800 (PST)
Received: from sparta.ny.asterius.io (ool-435561e0.dyn.optonline.net.
	[67.85.97.224]) by smtp.gmail.com with ESMTPSA id
	j11sm1079259qta.39.2017.02.22.09.34.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 22 Feb 2017 09:34:23 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 22 Feb 2017 12:34:13 -0500
Message-Id: <1487784853-6521-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-pylint: update to version 1.6.5
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
X-List-Received-Date: Wed, 22 Feb 2017 17:34:23 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/{python-pylint_1.6.4.bb => python-pylint_1.6.5.bb}         | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-pylint_1.6.4.bb => python-pylint_1.6.5.bb} (90%)

diff --git a/meta-python/recipes-devtools/python/python-pylint_1.6.4.bb b/meta-python/recipes-devtools/python/python-pylint_1.6.5.bb
similarity index 90%
rename from meta-python/recipes-devtools/python/python-pylint_1.6.4.bb
rename to meta-python/recipes-devtools/python/python-pylint_1.6.5.bb
index 2e34451..f5b4ad0 100644
--- a/meta-python/recipes-devtools/python/python-pylint_1.6.4.bb
+++ b/meta-python/recipes-devtools/python/python-pylint_1.6.5.bb
@@ -3,8 +3,8 @@ HOMEPAGE= "http://www.pylint.org/"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4325afd396febcb659c36b49533135d4"
 
-SRC_URI[md5sum] = "66ba9c27e067568bdabcdd7c21303903"
-SRC_URI[sha256sum] = "ef901a34b62ed7a734370ba5b162d890231ba8822abe88c6dda1268e2575f5f1"
+SRC_URI[md5sum] = "31da2185bf59142479e4fa16d8a9e347"
+SRC_URI[sha256sum] = "a673984a8dd78e4a8b8cfdee5359a1309d833cf38405008f4a249994a8456719"
 
 RDEPENDS_${PN} += "python-codecs \
                    python-contextlib \
-- 
2.7.4


