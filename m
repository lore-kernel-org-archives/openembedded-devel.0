Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5448D746F7
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Jun 2018 05:58:28 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w5Q5wT9T002782
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Jun 2018 22:58:29 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.218) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.399.0; Mon, 25 Jun 2018 22:58:28 -0700
From: <Qi.Chen@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 26 Jun 2018 14:00:47 +0800
Message-ID: <1529992863-24711-4-git-send-email-Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1529992863-24711-1-git-send-email-Qi.Chen@windriver.com>
References: <1529992863-24711-1-git-send-email-Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [meta-python][PATCH 04/20] python(3)-pytest-runner: upgrade 3.0 -> 4.2
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
X-List-Received-Date: Tue, 26 Jun 2018 05:58:28 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta-python/recipes-devtools/python/python-pytest-runner.inc          | 4 ++--
 .../{python-pytest-runner_3.0.bb => python-pytest-runner_4.2.bb}      | 0
 .../{python3-pytest-runner_3.0.bb => python3-pytest-runner_4.2.bb}    | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-pytest-runner_3.0.bb => python-pytest-runner_4.2.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-pytest-runner_3.0.bb => python3-pytest-runner_4.2.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-pytest-runner.inc b/meta-python/recipes-devtools/python/python-pytest-runner.inc
index 7546743fb..3b057b0ca 100644
--- a/meta-python/recipes-devtools/python/python-pytest-runner.inc
+++ b/meta-python/recipes-devtools/python/python-pytest-runner.inc
@@ -2,8 +2,8 @@ SUMMARY = "Invoke py.test as distutils command with dependency resolution"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a33f38bbf47d48c70fe0d40e5f77498e"
 
-SRC_URI[md5sum] = "8f8363a52bbabc4cedd5e239beb2ba11"
-SRC_URI[sha256sum] = "0f7c3a3cf5aead13f54baaa01ceb49e5ae92aba5d3ff1928e81e189c40bc6703"
+SRC_URI[md5sum] = "4b696b0f35767f0694f183d0a1855300"
+SRC_URI[sha256sum] = "d23f117be39919f00dd91bffeb4f15e031ec797501b717a245e377aee0f577be"
 
 inherit pypi
 
diff --git a/meta-python/recipes-devtools/python/python-pytest-runner_3.0.bb b/meta-python/recipes-devtools/python/python-pytest-runner_4.2.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-pytest-runner_3.0.bb
rename to meta-python/recipes-devtools/python/python-pytest-runner_4.2.bb
diff --git a/meta-python/recipes-devtools/python/python3-pytest-runner_3.0.bb b/meta-python/recipes-devtools/python/python3-pytest-runner_4.2.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-pytest-runner_3.0.bb
rename to meta-python/recipes-devtools/python/python3-pytest-runner_4.2.bb
-- 
2.11.0


