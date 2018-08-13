Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 5D1C478F7D
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Aug 2018 17:50:49 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	13 Aug 2018 10:50:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.53,234,1531810800"; d="scan'208";a="83030464"
Received: from kkurdej-mobl.ger.corp.intel.com (HELO localhost.localdomain)
	([10.252.36.13])
	by orsmga002.jf.intel.com with ESMTP; 13 Aug 2018 10:50:36 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 13 Aug 2018 19:50:29 +0200
Message-Id: <bfdf3b7fab388394660c7887856a037aa68c88e3.1534182463.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1534182463.git.paul.eggleton@linux.intel.com>
References: <cover.1534182463.git.paul.eggleton@linux.intel.com>
Subject: [meta-oe][PATCH 3/4] faad2: set more accurate SUMMARY and add HOMEPAGE
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
X-List-Received-Date: Mon, 13 Aug 2018 17:50:49 -0000

Make it clear what this library is for and provide a link for more
information.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta-oe/recipes-multimedia/faad2/faad2_2.7.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-multimedia/faad2/faad2_2.7.bb b/meta-oe/recipes-multimedia/faad2/faad2_2.7.bb
index 63e590c9e..b777831ad 100644
--- a/meta-oe/recipes-multimedia/faad2/faad2_2.7.bb
+++ b/meta-oe/recipes-multimedia/faad2/faad2_2.7.bb
@@ -1,4 +1,5 @@
-SUMMARY = "Library for reading some sort of media format"
+SUMMARY = "An open source MPEG-4 and MPEG-2 AAC decoding library"
+HOMEPAGE = "http://www.audiocoding.com/faad2.html"
 SECTION = "libs"
 LICENSE = "GPLv2"
 
-- 
2.17.1


