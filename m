Return-Path: <anujx.mittal@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 7CB3C6FF23
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Apr 2016 08:00:38 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga103.jf.intel.com with ESMTP; 01 Apr 2016 01:00:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,426,1455004800"; d="scan'208";a="949440090"
Received: from amitta2x-ilbpg1.png.intel.com ([10.88.227.34])
	by fmsmga002.fm.intel.com with ESMTP; 01 Apr 2016 01:00:37 -0700
From: Anuj Mittal <anujx.mittal@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  1 Apr 2016 16:00:31 +0800
Message-Id: <1459497633-32109-1-git-send-email-anujx.mittal@intel.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-filesystems][PATCH 0/2] Update fuse-exfat and utils
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
X-List-Received-Date: Fri, 01 Apr 2016 08:00:41 -0000

These patches update fuse-exfat and exfat-utils to version 1.2.3.

Please merge if these look okay.

Thanks.

Anuj Mittal (2):
  fuse-exfat: update to version 1.2.3
  exfat-utils: update to version 1.2.3

 .../{fuse-exfat_1.1.0.bb => fuse-exfat_1.2.3.bb}         | 14 ++++----------
 .../{exfat-utils_1.0.1.bb => exfat-utils_1.2.3.bb}       | 16 ++++------------
 2 files changed, 8 insertions(+), 22 deletions(-)
 rename meta-filesystems/recipes-filesystems/fuse-exfat/{fuse-exfat_1.1.0.bb => fuse-exfat_1.2.3.bb} (65%)
 rename meta-filesystems/recipes-utils/exfat-utils/{exfat-utils_1.0.1.bb => exfat-utils_1.2.3.bb} (65%)

-- 
1.9.1


