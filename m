Return-Path: <timothy.t.orling@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 020BD78304
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Oct 2017 14:42:48 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga105.jf.intel.com with ESMTP; 27 Oct 2017 07:42:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,304,1505804400"; d="scan'208";a="1210890710"
Received: from wrath.jf.intel.com ([10.54.70.9])
	by fmsmga001.fm.intel.com with ESMTP; 27 Oct 2017 07:42:49 -0700
From: Tim Orling <timothy.t.orling@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 27 Oct 2017 07:42:47 -0700
Message-Id: <20171027144247.17837-1-timothy.t.orling@linux.intel.com>
X-Mailer: git-send-email 2.13.5
Subject: [meta-perl][PATCH] README: add self as maintainer
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
X-List-Received-Date: Fri, 27 Oct 2017 14:42:49 -0000

I have been, in practice, maintinaing meta-perl for several
years now. Given discussion at OEDEM, make it official.

Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
---
 meta-perl/README | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-perl/README b/meta-perl/README
index 68160a628..67f291079 100644
--- a/meta-perl/README
+++ b/meta-perl/README
@@ -80,7 +80,9 @@ Send patches / pull requests to openembedded-devel@lists.openembedded.org with
 When sending single patches, please using something like:
 'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-perl][PATCH'
 
-Layer maintainer: Hongxu Jia <hongxu.jia@windriver.com>
+Layer maintainers:
+    Hongxu Jia <hongxu.jia@windriver.com>
+    Tim "moto-timo" Orling <ticotimo@gmail.com>
 
 License
 -------
-- 
2.13.5


