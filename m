Return-Path: <timothy.t.orling@linux.intel.com>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	by mail.openembedded.org (Postfix) with ESMTP id B08D0753DE
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  6 Sep 2018 03:49:19 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	05 Sep 2018 20:49:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.53,334,1531810800"; d="scan'208";a="89374234"
Received: from chiron.jf.intel.com ([10.54.74.39])
	by orsmga002.jf.intel.com with ESMTP; 05 Sep 2018 20:48:55 -0700
From: Tim Orling <timothy.t.orling@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  5 Sep 2018 20:48:47 -0700
Message-Id: <20180906034847.53858-1-timothy.t.orling@linux.intel.com>
X-Mailer: git-send-email 2.14.4
Subject: [meta-oe][PATCH] cpuid: upgrade 20170122 -> 20180519
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
X-List-Received-Date: Thu, 06 Sep 2018 03:49:19 -0000

Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
---
 .../recipes-devtools/cpuid/{cpuid_20170122.bb => cpuid_20180519.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-devtools/cpuid/{cpuid_20170122.bb => cpuid_20180519.bb} (86%)

diff --git a/meta-oe/recipes-devtools/cpuid/cpuid_20170122.bb b/meta-oe/recipes-devtools/cpuid/cpuid_20180519.bb
similarity index 86%
rename from meta-oe/recipes-devtools/cpuid/cpuid_20170122.bb
rename to meta-oe/recipes-devtools/cpuid/cpuid_20180519.bb
index 5dd1bdd4ee..4b07e2193a 100644
--- a/meta-oe/recipes-devtools/cpuid/cpuid_20170122.bb
+++ b/meta-oe/recipes-devtools/cpuid/cpuid_20180519.bb
@@ -8,8 +8,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 SRC_URI = "http://www.etallen.com/${BPN}/${BP}.src.tar.gz \
            file://0001-Fix-Add-sys-sysmacros.h-to-fix-build-issue.patch"
-SRC_URI[md5sum] = "1c46a6662626c5a6eaca626f23a5a7d7"
-SRC_URI[sha256sum] = "667612aae6704341dd10844e97c84c5c5c8700817a5937a3c293b55013bc4865"
+SRC_URI[md5sum] = "b3b4e44ef49575043a91def0207dcc76"
+SRC_URI[sha256sum] = "967823be36f23cbc972eb0aa882d069c1d155a5978990ac3bcf425e6a2e7ff9a"
 
 COMPATIBLE_HOST = "(i.86|x86_64).*-linux"
 
-- 
2.14.4


