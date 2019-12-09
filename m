Return-Path: <wangmy@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 1EF5B7FC39
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  9 Dec 2019 08:56:14 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.69,294,1571673600"; d="scan'208";a="79868671"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 09 Dec 2019 16:56:16 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id E44CA4CE1A05
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  9 Dec 2019 16:47:39 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Mon, 9 Dec 2019 16:56:15 +0800
From: Wang Mingyu <wangmy@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 9 Dec 2019 06:58:03 -0800
Message-ID: <1575903483-113548-3-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1575903483-113548-1-git-send-email-wangmy@cn.fujitsu.com>
References: <1575903483-113548-1-git-send-email-wangmy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-yoursite-MailScanner-ID: E44CA4CE1A05.A8DFE
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python][PATCH] python3-xxhash: upgrade 1.4.2 -> 1.4.3
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
X-List-Received-Date: Mon, 09 Dec 2019 08:56:15 -0000
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 meta-python/recipes-devtools/python/python-xxhash.inc                 | 4 ++--
 .../python/{python3-xxhash_1.4.2.bb => python3-xxhash_1.4.3.bb}       | 0
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-xxhash_1.4.2.bb => python3-xxhash_1.4.3.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-xxhash.inc b/meta-python/recipes-devtools/python/python-xxhash.inc
index 1ec3937..80f5e9c 100644
--- a/meta-python/recipes-devtools/python/python-xxhash.inc
+++ b/meta-python/recipes-devtools/python/python-xxhash.inc
@@ -3,5 +3,5 @@ SECTION = "devel/python"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5a8d76283514a1b7e6a414aba38629b5"
 
-SRC_URI[md5sum] = "80461eff10ac62214fa788a6045aab43"
-SRC_URI[sha256sum] = "82cdc67b41da904aa2921107e9877814079d9b067a99f19852b5d85e8a40555d"
+SRC_URI[md5sum] = "ce9cbbcc89620fd47a2468badd08dcf0"
+SRC_URI[sha256sum] = "8b6b1afe7731d7d9cbb0398b4a811ebb5e6be5c174f72c68abf81f919a435de9"
diff --git a/meta-python/recipes-devtools/python/python3-xxhash_1.4.2.bb b/meta-python/recipes-devtools/python/python3-xxhash_1.4.3.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-xxhash_1.4.2.bb
rename to meta-python/recipes-devtools/python/python3-xxhash_1.4.3.bb
-- 
2.7.4




