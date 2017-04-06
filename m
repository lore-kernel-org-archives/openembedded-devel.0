Return-Path: <jonathan.yong@intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 39B7F7760E
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  6 Apr 2017 08:13:37 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by fmsmga105.fm.intel.com with ESMTP; 06 Apr 2017 01:13:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.37,283,1488873600"; d="scan'208";a="85487603"
Received: from vanguard-01.png.intel.com ([10.221.118.162])
	by fmsmga006.fm.intel.com with ESMTP; 06 Apr 2017 01:13:37 -0700
From: "Yong, Jonathan" <jonathan.yong@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  6 Apr 2017 08:13:35 +0000
Message-Id: <20170406081336.20321-1-jonathan.yong@intel.com>
X-Mailer: git-send-email 2.10.2
Subject: [PATCH] f2f2-tools 1.4.0 -> 1.8.0
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
X-List-Received-Date: Thu, 06 Apr 2017 08:13:38 -0000

Upgrade f2fs-tools, now supports encryption.

Yong, Jonathan (1):
  f2fs-tools: Update to Version 1.8.0

 .../0002-Fix-mkfs-out-of-tree-builds.patch         | 28 ++++++++++++++++++++++
 .../{f2fs-tools_1.4.0.bb => f2fs-tools_1.8.0.bb}   |  5 ++--
 2 files changed, 31 insertions(+), 2 deletions(-)
 create mode 100644 meta-filesystems/recipes-utils/f2fs-tools/f2fs-tools/0002-Fix-mkfs-out-of-tree-builds.patch
 rename meta-filesystems/recipes-utils/f2fs-tools/{f2fs-tools_1.4.0.bb => f2fs-tools_1.8.0.bb} (81%)

-- 
2.10.2


