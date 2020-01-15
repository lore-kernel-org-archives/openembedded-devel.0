Return-Path: <wangmy@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id E1B897F9BB
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Jan 2020 09:29:17 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.70,322,1574092800"; d="scan'208";a="81889280"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 15 Jan 2020 17:29:18 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id 571B84CE1CB3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Jan 2020 17:20:10 +0800 (CST)
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.80) by
	G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Wed, 15 Jan 2020 17:29:15 +0800
Received: from localhost.localdomain.localdomain (10.167.225.33) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Wed, 15 Jan 2020 17:29:25 +0800
From: Wang Mingyu <wangmy@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 15 Jan 2020 05:12:24 -0800
Message-ID: <1579093951-77460-9-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1579093951-77460-1-git-send-email-wangmy@cn.fujitsu.com>
References: <1579093951-77460-1-git-send-email-wangmy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-yoursite-MailScanner-ID: 571B84CE1CB3.A1B3A
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python] [PATCH] python3-pulsectl: upgrade 18.12.5 -> 20.1.2
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
X-List-Received-Date: Wed, 15 Jan 2020 09:29:18 -0000
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 ...python3-pulsectl_18.12.5.bb => python3-pulsectl_20.1.2.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pulsectl_18.12.5.bb => python3-pulsectl_20.1.2.bb} (76%)

diff --git a/meta-python/recipes-devtools/python/python3-pulsectl_18.12.5.bb b/meta-python/recipes-devtools/python/python3-pulsectl_20.1.2.bb
similarity index 76%
rename from meta-python/recipes-devtools/python/python3-pulsectl_18.12.5.bb
rename to meta-python/recipes-devtools/python/python3-pulsectl_20.1.2.bb
index 9882ea6a8..7ac3aaf50 100644
--- a/meta-python/recipes-devtools/python/python3-pulsectl_18.12.5.bb
+++ b/meta-python/recipes-devtools/python/python3-pulsectl_20.1.2.bb
@@ -3,8 +3,8 @@ HOMEPAGE = "https://github.com/mk-fg/python-pulse-control"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=f1d10048469ff90123263eb5e214061d"
 
-SRC_URI[md5sum] = "8e79ef002856c1858058ca0b08bf1a01"
-SRC_URI[sha256sum] = "41db4dd19e7cd28e2609baf2b551f34991f1890024be119b6075a286abfb65d3"
+SRC_URI[md5sum] = "90d02204d65f684af2fd77a77d50ec01"
+SRC_URI[sha256sum] = "4a97a4f7fcd8dbe56380980e8c9519ff4e26552604776cbc7555e6a14ff0202f"
 
 RDEPENDS_${PN} += "pulseaudio"
 
-- 
2.17.1




