Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 173F27F3B9
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Jan 2020 09:06:00 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.70,329,1574092800"; d="scan'208";a="82117765"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 17 Jan 2020 17:06:00 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id 761B34CE26E4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Jan 2020 16:56:48 +0800 (CST)
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.83) by
	G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Fri, 17 Jan 2020 17:05:54 +0800
Received: from localhost.local (10.167.225.81) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Fri, 17 Jan 2020 17:05:54 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 17 Jan 2020 17:07:22 +0800
Message-ID: <20200117090722.9114-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: 761B34CE26E4.A8F4E
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python] [PATCH] python-supervisor: upgrade 4.0.2 -> 4.1.0
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
X-List-Received-Date: Fri, 17 Jan 2020 09:06:01 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 meta-python/recipes-devtools/python/python-supervisor.inc     | 4 ++--
 ...ython3-supervisor_4.0.2.bb => python3-supervisor_4.1.0.bb} | 0
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-supervisor_4.0.2.bb => python3-supervisor_4.1.0.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-supervisor.inc b/meta-python/recipes-devtools/python/python-supervisor.inc
index 158cd52e1..1ac18bbe6 100644
--- a/meta-python/recipes-devtools/python/python-supervisor.inc
+++ b/meta-python/recipes-devtools/python/python-supervisor.inc
@@ -7,8 +7,8 @@ HOMEPAGE = "https://github.com/Supervisor/supervisor"
 LICENSE = "BSD-4-Clause"
 LIC_FILES_CHKSUM = "file://LICENSES.txt;md5=5b4e3a2172bba4c47cded5885e7e507e"
 
-SRC_URI[md5sum] = "ac70dadd051dcaf1d03c467d51a3aac1"
-SRC_URI[sha256sum] = "5604457da4fb89d850e78c128205fe4938c9277f87301885b33c94c60361e575"
+SRC_URI[md5sum] = "ecea94eedc70ba5127fdeb0665bcca0d"
+SRC_URI[sha256sum] = "2dc86fe0476e945e61483d614ceb2cf4f93b95282eb243bdf792621994360383"
 
 PYPI_PACKAGE = "supervisor"
 inherit pypi systemd
diff --git a/meta-python/recipes-devtools/python/python3-supervisor_4.0.2.bb b/meta-python/recipes-devtools/python/python3-supervisor_4.1.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-supervisor_4.0.2.bb
rename to meta-python/recipes-devtools/python/python3-supervisor_4.1.0.bb
-- 
2.20.1




