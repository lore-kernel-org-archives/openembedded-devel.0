Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 93AFF7C860
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 May 2019 05:51:53 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,464,1549900800"; d="scan'208";a="62703139"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 13 May 2019 13:51:54 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 067404CDB315
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 May 2019 13:51:55 +0800 (CST)
Received: from localhost.local (10.167.225.84) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Mon, 13 May 2019 13:51:56 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 13 May 2019 13:52:52 +0800
Message-ID: <20190513055252.6781-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.84]
X-yoursite-MailScanner-ID: 067404CDB315.AAD61
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python] [PATCH] python-rfc3987: upgrade 1.3.7 -> 1.3.8
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
X-List-Received-Date: Mon, 13 May 2019 05:51:54 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

-Upgrade from python-rfc3987_1.3.7.bb to python-rfc3987_1.3.8.bb.

-Upgrade from python3-rfc3987_1.3.7.bb to python3-rfc3987_1.3.8.bb.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 meta-python/recipes-devtools/python/python-rfc3987.inc        | 4 ++--
 .../{python-rfc3987_1.3.7.bb => python-rfc3987_1.3.8.bb}      | 0
 .../{python3-rfc3987_1.3.7.bb => python3-rfc3987_1.3.8.bb}    | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-rfc3987_1.3.7.bb => python-rfc3987_1.3.8.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-rfc3987_1.3.7.bb => python3-rfc3987_1.3.8.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-rfc3987.inc b/meta-python/recipes-devtools/python/python-rfc3987.inc
index 461590411..9cfa07da5 100644
--- a/meta-python/recipes-devtools/python/python-rfc3987.inc
+++ b/meta-python/recipes-devtools/python/python-rfc3987.inc
@@ -2,7 +2,7 @@ SUMMARY = "Parsing and validation of URIs (RFC 3986) and IRIs (RFC 3987)"
 LICENSE = "GPLv3+"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=9;md5=2b723edf67b2f3088bc5e339b1ceda2d"
 
-SRC_URI[md5sum] = "aa108c7590902fe609c036864ecb7f84"
-SRC_URI[sha256sum] = "91a7826b0a26c246a5a91bef09c2c0809c713a689be689b9571e78a13f6557a4"
+SRC_URI[md5sum] = "b6c4028acdc788a9ba697e1c1d6b896c"
+SRC_URI[sha256sum] = "d3c4d257a560d544e9826b38bc81db676890c79ab9d7ac92b39c7a253d5ca733"
 
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python-rfc3987_1.3.7.bb b/meta-python/recipes-devtools/python/python-rfc3987_1.3.8.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-rfc3987_1.3.7.bb
rename to meta-python/recipes-devtools/python/python-rfc3987_1.3.8.bb
diff --git a/meta-python/recipes-devtools/python/python3-rfc3987_1.3.7.bb b/meta-python/recipes-devtools/python/python3-rfc3987_1.3.8.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-rfc3987_1.3.7.bb
rename to meta-python/recipes-devtools/python/python3-rfc3987_1.3.8.bb
-- 
2.20.1




