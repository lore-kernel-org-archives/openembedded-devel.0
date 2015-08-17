Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 021D3737F4
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Aug 2015 09:54:59 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t7H9sxo7011375
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Aug 2015 02:55:00 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.235.1; Mon, 17 Aug 2015 02:54:59 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 17 Aug 2015 17:51:16 +0800
Message-ID: <1439805078-23359-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 1/3][meta-oe] libestr: upgrade to 0.1.10
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 17 Aug 2015 09:55:00 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

rsyslog 7.6.1 needs the new version libestr

Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 .../recipes-support/libestr/{libestr_0.1.6.bb => libestr_0.1.10.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/libestr/{libestr_0.1.6.bb => libestr_0.1.10.bb} (67%)

diff --git a/meta-oe/recipes-support/libestr/libestr_0.1.6.bb b/meta-oe/recipes-support/libestr/libestr_0.1.10.bb
similarity index 67%
rename from meta-oe/recipes-support/libestr/libestr_0.1.6.bb
rename to meta-oe/recipes-support/libestr/libestr_0.1.10.bb
index e3f675a..9bff4f3 100644
--- a/meta-oe/recipes-support/libestr/libestr_0.1.6.bb
+++ b/meta-oe/recipes-support/libestr/libestr_0.1.10.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=9d6c993486c18262afba4ca5bcb894d0"
 
 SRC_URI = "http://libestr.adiscon.com/files/download/${BP}.tar.gz"
 
-SRC_URI[md5sum] = "f48a7098080eebfe7842673c23dcd064"
-SRC_URI[sha256sum] = "b9c819d30397845fdf85bb1f37c52e81de23aa3b061ec6cc4386f1b942960153"
+SRC_URI[md5sum] = "f4c9165a23587e77f7efe65d676d5e8e"
+SRC_URI[sha256sum] = "bd655e126e750edd18544b88eb1568d200a424a0c23f665eb14bbece07ac703c"
 
 inherit autotools
-- 
1.9.1


