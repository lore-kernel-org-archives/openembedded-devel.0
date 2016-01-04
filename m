Return-Path: <lixin.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id B2E56731BE
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Jan 2016 02:09:58 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.20,346,1444665600"; 
   d="scan'208";a="2172027"
Received: from bogon (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 04 Jan 2016 10:09:59 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id 2A90B41890EE
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Jan 2016 10:09:40 +0800 (CST)
Received: from localhost.localdomain (10.167.226.51) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Mon, 4 Jan 2016 10:09:40 +0800
From: Li Xin <lixin.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Sun, 3 Jan 2016 18:09:38 -0800
Message-ID: <1451873378-5097-1-git-send-email-lixin.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.167.226.51]
X-yoursite-MailScanner-ID: 2A90B41890EE.AE51A
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: lixin.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe][PATCH] python-simplejson: 2.2.1 -> 3.8.1
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
X-List-Received-Date: Mon, 04 Jan 2016 02:09:59 -0000
Content-Type: text/plain

Upgrade python-simplejson from 2.2.1 to 3.8.1.

Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
---
 .../{python-simplejson_2.2.1.bb => python-simplejson_3.8.1.bb}      | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-devtools/python/{python-simplejson_2.2.1.bb => python-simplejson_3.8.1.bb} (68%)

diff --git a/meta-oe/recipes-devtools/python/python-simplejson_2.2.1.bb b/meta-oe/recipes-devtools/python/python-simplejson_3.8.1.bb
similarity index 68%
rename from meta-oe/recipes-devtools/python/python-simplejson_2.2.1.bb
rename to meta-oe/recipes-devtools/python/python-simplejson_3.8.1.bb
index 7e42a7c..96c0aef 100644
--- a/meta-oe/recipes-devtools/python/python-simplejson_2.2.1.bb
+++ b/meta-oe/recipes-devtools/python/python-simplejson_3.8.1.bb
@@ -3,14 +3,14 @@ HOMEPAGE = "http://cheeseshop.python.org/pypi/simplejson"
 SECTION = "devel/python"
 
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=8a9f8dcfcd28c34daa443e5b1d29813b"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=c6338d7abd321c0b50a2a547e441c52e"
 PR = "r1"
 
 SRCNAME = "simplejson"
 
 SRC_URI = "http://cheeseshop.python.org/packages/source/s/simplejson/${SRCNAME}-${PV}.tar.gz"
-SRC_URI[md5sum] = "070c6467462bd63306f1756b01df6d70"
-SRC_URI[sha256sum] = "e85c5ae24dd9827113893c1dd2c799528195057388096f0fc45ad4b32b378c26"
+SRC_URI[md5sum] = "b8441f1053edd9dc335ded8c7f98a974"
+SRC_URI[sha256sum] = "428ac8f3219c78fb04ce05895d5dff9bd813c05a9a7922c53dc879cd32a12493"
 
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
-- 
1.9.1




