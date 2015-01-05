Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 09DD172743
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  5 Jan 2015 11:01:07 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 05 Jan 2015 03:01:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.07,698,1413270000"; d="scan'208";a="646381125"
Received: from kregan-mobl.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.17.116])
	by fmsmga001.fm.intel.com with ESMTP; 05 Jan 2015 03:01:06 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  5 Jan 2015 11:00:50 +0000
Message-Id: <82b594b205082fa88722805a2f04a4316bf0f922.1420455602.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <cover.1420455602.git.paul.eggleton@linux.intel.com>
References: <cover.1420455602.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1420455602.git.paul.eggleton@linux.intel.com>
References: <cover.1420455602.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 06/10] protobuf: update to 2.5.0
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
X-List-Received-Date: Mon, 05 Jan 2015 11:01:07 -0000

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 .../protobuf/{protobuf_2.4.1.bb => protobuf_2.5.0.bb}                 | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-devtools/protobuf/{protobuf_2.4.1.bb => protobuf_2.5.0.bb} (81%)

diff --git a/meta-oe/recipes-devtools/protobuf/protobuf_2.4.1.bb b/meta-oe/recipes-devtools/protobuf/protobuf_2.5.0.bb
similarity index 81%
rename from meta-oe/recipes-devtools/protobuf/protobuf_2.4.1.bb
rename to meta-oe/recipes-devtools/protobuf/protobuf_2.5.0.bb
index 8386206..a0db7bf 100644
--- a/meta-oe/recipes-devtools/protobuf/protobuf_2.4.1.bb
+++ b/meta-oe/recipes-devtools/protobuf/protobuf_2.5.0.bb
@@ -12,8 +12,8 @@ LIC_FILES_CHKSUM = "file://COPYING.txt;md5=af6809583bfde9a31595a58bb4a24514"
 
 SRC_URI = "http://protobuf.googlecode.com/files/protobuf-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "dc84e9912ea768baa1976cb7bbcea7b5"
-SRC_URI[sha256sum] = "eac6969b617f397247e805267da2b0db3ff9e5a9163b123503a192fbb5776567"
+SRC_URI[md5sum] = "b751f772bdeb2812a2a8e7202bf1dae8"
+SRC_URI[sha256sum] = "c55aa3dc538e6fd5eaf732f4eb6b98bdcb7cedb5b91d3b5bdcf29c98c293f58e"
 
 EXTRA_OECONF += " --with-protoc=echo"
 
-- 
1.9.3


