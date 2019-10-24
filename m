Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 207DB7D185
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Oct 2019 05:42:18 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.68,223,1569254400"; d="scan'208";a="77395825"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 24 Oct 2019 13:42:18 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 21C684CE1509
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Oct 2019 13:34:21 +0800 (CST)
Received: from localhost.local (10.167.225.81) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Thu, 24 Oct 2019 13:42:15 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 24 Oct 2019 13:42:29 +0800
Message-ID: <20191024054229.1795-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: 21C684CE1509.A711E
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python] [PATCH] python-aws-iot-device-sdk-python: upgrade 1.4.0 -> 1.4.7
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
X-List-Received-Date: Thu, 24 Oct 2019 05:42:19 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../recipes-devtools/python/python-aws-iot-device-sdk-python.inc      | 4 ++--
 ...-sdk-python_1.4.0.bb => python-aws-iot-device-sdk-python_1.4.7.bb} | 0
 ...sdk-python_1.4.0.bb => python3-aws-iot-device-sdk-python_1.4.7.bb} | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-aws-iot-device-sdk-python_1.4.0.bb => python-aws-iot-device-sdk-python_1.4.7.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-aws-iot-device-sdk-python_1.4.0.bb => python3-aws-iot-device-sdk-python_1.4.7.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-aws-iot-device-sdk-python.inc b/meta-python/recipes-devtools/python/python-aws-iot-device-sdk-python.inc
index 7423fa7..60493e1 100644
--- a/meta-python/recipes-devtools/python/python-aws-iot-device-sdk-python.inc
+++ b/meta-python/recipes-devtools/python/python-aws-iot-device-sdk-python.inc
@@ -7,8 +7,8 @@ LIC_FILES_CHKSUM = "\
     file://AWSIoTPythonSDK/core/protocol/paho/client.py;endline=14;md5=5a3c8a1a4bb71bd934f450ecff972ad9 \
 "
 
-SRC_URI[md5sum] = "50a5c46410c2b44b5c09f1ea5eb15a3b"
-SRC_URI[sha256sum] = "b3c8af3ce24eab861447a194f3c382509dd70e90452c86a5426f1e7272460177"
+SRC_URI[md5sum] = "2b3df629827d8bc18ca4d927b4885a17"
+SRC_URI[sha256sum] = "7e67c8cfeee8a1c8fd251bcc418de9d4dca697753565c9a9e614525179d9555d"
 
 inherit pypi
 
diff --git a/meta-python/recipes-devtools/python/python-aws-iot-device-sdk-python_1.4.0.bb b/meta-python/recipes-devtools/python/python-aws-iot-device-sdk-python_1.4.7.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-aws-iot-device-sdk-python_1.4.0.bb
rename to meta-python/recipes-devtools/python/python-aws-iot-device-sdk-python_1.4.7.bb
diff --git a/meta-python/recipes-devtools/python/python3-aws-iot-device-sdk-python_1.4.0.bb b/meta-python/recipes-devtools/python/python3-aws-iot-device-sdk-python_1.4.7.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-aws-iot-device-sdk-python_1.4.0.bb
rename to meta-python/recipes-devtools/python/python3-aws-iot-device-sdk-python_1.4.7.bb
-- 
2.7.4




