Return-Path: <anselmo.melo@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 95DE671A50
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Oct 2017 17:42:12 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	19 Oct 2017 10:42:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.43,402,1503385200"; d="scan'208";a="140109616"
Received: from andreser-mobl.amr.corp.intel.com (HELO
	lacerdas-mobl.amr.corp.intel.com) ([10.254.85.27])
	by orsmga004.jf.intel.com with ESMTP; 19 Oct 2017 10:42:13 -0700
From: "Anselmo L. S. Melo" <anselmo.melo@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 19 Oct 2017 10:40:09 -0700
Message-Id: <20171019174010.4331-1-anselmo.melo@intel.com>
X-Mailer: git-send-email 2.14.2
Subject: [meta-oe][PATCH 0/1] pyro: Fix opencv build
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
X-List-Received-Date: Thu, 19 Oct 2017 17:42:12 -0000

git cherry-pick 0abf5af3ffd3d13c009a8ffcd5a6f045c36be837
from meta-oe master branch.

Ismo Puustinen (1):
  opencv: fix runtime dependencies.

 meta-oe/recipes-support/opencv/opencv_3.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
2.14.2


