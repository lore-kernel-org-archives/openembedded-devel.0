Return-Path: <Changqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id E50FD78493
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Jul 2018 07:31:45 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w6I7Vl8u009842
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Jul 2018 00:31:47 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.399.0; Wed, 18 Jul 2018 00:31:46 -0700
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 18 Jul 2018 15:31:27 +0800
Message-ID: <1531899089-395618-8-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1531899089-395618-1-git-send-email-changqing.li@windriver.com>
References: <1531899089-395618-1-git-send-email-changqing.li@windriver.com>
MIME-Version: 1.0
Subject: [PATCH][meta-oe] tclap: upgrade 1.2.1 -> 1.2.2
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
X-List-Received-Date: Wed, 18 Jul 2018 07:31:46 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

License-Update: copyright year and owner update 

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta-oe/recipes-devtools/tclap/{tclap_1.2.1.bb => tclap_1.2.2.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-devtools/tclap/{tclap_1.2.1.bb => tclap_1.2.2.bb} (70%)

diff --git a/meta-oe/recipes-devtools/tclap/tclap_1.2.1.bb b/meta-oe/recipes-devtools/tclap/tclap_1.2.2.bb
similarity index 70%
rename from meta-oe/recipes-devtools/tclap/tclap_1.2.1.bb
rename to meta-oe/recipes-devtools/tclap/tclap_1.2.2.bb
index 3eadbe4..46a9408 100644
--- a/meta-oe/recipes-devtools/tclap/tclap_1.2.1.bb
+++ b/meta-oe/recipes-devtools/tclap/tclap_1.2.2.bb
@@ -1,9 +1,9 @@
 SUMMARY = "Templatized C++ Command Line Parser"
 HOMEPAGE = "http://tclap.sourceforge.net/"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://COPYING;md5=c8ab0ff134bcc584d0e6b5b9f8732453"
+LIC_FILES_CHKSUM = "file://COPYING;md5=0ca8b9c5c5445cfa7af7e78fd27e60ed"
 
-SRCREV = "3627d9402e529770df9b0edf2aa8c0e0d6c6bb41"
+SRCREV = "75f440bcac1276c847f5351e14216f6e91def44d"
 SRC_URI = "git://git.code.sf.net/p/tclap/code \
     file://Makefile.am-disable-docs.patch \
 "
-- 
2.7.4


