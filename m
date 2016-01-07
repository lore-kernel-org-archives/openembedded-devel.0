Return-Path: <daicy.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id B94F6731D3
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  7 Jan 2016 05:41:30 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.20,346,1444665600"; 
   d="scan'208";a="2311897"
Received: from bogon (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 07 Jan 2016 13:41:32 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id 0ABC941887E8
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  7 Jan 2016 13:41:16 +0800 (CST)
Received: from localhost.localdomain (10.167.226.51) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Thu, 7 Jan 2016 13:41:15 +0800
From: Dai Caiyun <daicy.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 6 Jan 2016 21:41:03 -0800
Message-ID: <1452145263-9381-1-git-send-email-daicy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.167.226.51]
X-yoursite-MailScanner-ID: 0ABC941887E8.ACDBA
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: daicy.fnst@cn.fujitsu.com
X-Spam-Status: No
Cc: Dai Caiyun <daicy.fnst@cn.fujitsu.com>
Subject: [meta-python][PATCH] python-pip: 7.1.0 -> 7.1.2
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
X-List-Received-Date: Thu, 07 Jan 2016 05:41:33 -0000
Content-Type: text/plain

Upgrade python-pip from 7.1.0 to 7.1.2.

Signed-off-by: Dai Caiyun <daicy.fnst@cn.fujitsu.com>
---
 .../python/{python-pip_7.1.0.bb => python-pip_7.1.2.bb}               | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-pip_7.1.0.bb => python-pip_7.1.2.bb} (76%)

diff --git a/meta-python/recipes-devtools/python/python-pip_7.1.0.bb b/meta-python/recipes-devtools/python/python-pip_7.1.2.bb
similarity index 76%
rename from meta-python/recipes-devtools/python/python-pip_7.1.0.bb
rename to meta-python/recipes-devtools/python/python-pip_7.1.2.bb
index ae02e86..895cf6f 100644
--- a/meta-python/recipes-devtools/python/python-pip_7.1.0.bb
+++ b/meta-python/recipes-devtools/python/python-pip_7.1.2.bb
@@ -4,8 +4,8 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=45665b53032c02b35e29ddab8e61fa91"
 
 SRC_URI = "https://pypi.python.org/packages/source/p/pip/pip-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "d935ee9146074b1d3f26c5f0acfd120e"
-SRC_URI[sha256sum] = "d5275ba3221182a5dd1b6bcfbfc5ec277fb399dd23226d6fa018048f7e0f10f2"
+SRC_URI[md5sum] = "3823d2343d9f3aaab21cf9c917710196"
+SRC_URI[sha256sum] = "ca047986f0528cfa975a14fb9f7f106271d4e0c3fe1ddced6c1db2e7ae57a477"
 
 S = "${WORKDIR}/pip-${PV}"
 
-- 
1.9.1




