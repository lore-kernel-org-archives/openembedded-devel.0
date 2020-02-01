Return-Path: <Trevor.Gamblin@windriver.com>
X-Greylist: delayed 13200 seconds by postgrey-1.34 at layers.openembedded.org;
	Sun, 02 Feb 2020 00:00:03 UTC
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 918BF60BE1
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  2 Feb 2020 00:00:03 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 011KK3NP007302
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 1 Feb 2020 12:20:03 -0800 (PST)
Received: from yow-lpggp3.wrs.com (128.224.137.13) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.468.0;
	Sat, 1 Feb 2020 12:20:02 -0800
From: Trevor Gamblin <Trevor.Gamblin@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Sat, 1 Feb 2020 15:20:02 -0500
Message-ID: <20200201202002.14728-1-Trevor.Gamblin@windriver.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Subject: [meta-python][PATCH] python3-pexpect: upgrade 4.7.0 -> 4.8.0
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
X-List-Received-Date: Sun, 02 Feb 2020 00:00:03 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Trevor Gamblin <trevor.gamblin@windriver.com>

Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
---
 meta-python/recipes-devtools/python/python-pexpect.inc        | 4 ++--
 .../{python3-pexpect_4.7.0.bb => python3-pexpect_4.8.0.bb}    | 0
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pexpect_4.7.0.bb => python3-pexpect_4.8.0.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-pexpect.inc b/meta-python/recipes-devtools/python/python-pexpect.inc
index 6d78eb94d..f02aa994e 100644
--- a/meta-python/recipes-devtools/python/python-pexpect.inc
+++ b/meta-python/recipes-devtools/python/python-pexpect.inc
@@ -4,8 +4,8 @@ SECTION = "devel/python"
 LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1c7a725251880af8c6a148181665385b"
 
-SRC_URI[md5sum] = "ed003242cbf308aee1b1eaecdef59e43"
-SRC_URI[sha256sum] = "9e2c1fd0e6ee3a49b28f95d4b33bc389c89b20af6a1255906e90ff1262ce62eb"
+SRC_URI[md5sum] = "153eb25184249d6a85fde9acf4804085"
+SRC_URI[sha256sum] = "fc65a43959d153d0114afe13997d439c22823a27cefceb5ff35c2178c6784c0c"
 
 UPSTREAM_CHECK_URI = "https://pypi.python.org/pypi/pexpect"
 
diff --git a/meta-python/recipes-devtools/python/python3-pexpect_4.7.0.bb b/meta-python/recipes-devtools/python/python3-pexpect_4.8.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-pexpect_4.7.0.bb
rename to meta-python/recipes-devtools/python/python3-pexpect_4.8.0.bb
-- 
2.24.1


