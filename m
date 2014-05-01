Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 5CC0860C22
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  1 May 2014 10:38:26 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 01 May 2014 03:38:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,964,1389772800"; d="scan'208";a="426307829"
Received: from abamaras-mobl1.gar.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.121.26])
	by azsmga001.ch.intel.com with ESMTP; 01 May 2014 03:38:25 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  1 May 2014 11:38:16 +0100
Message-Id: <cover.1398940635.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.0
Subject: [meta-webserver][PATCH 0/2] meta-webserver S != B fixes
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
X-List-Received-Date: Thu, 01 May 2014 10:38:30 -0000

The following changes since commit ee6f88f28566acaada77a74ce02f66fee0219ab4:

  radvd.init: fix path to radvd.conf sample (2014-04-24 21:07:47 -0400)

are available in the git repository at:

  git://git.openembedded.org/meta-openembedded-contrib paule/webserver-s-b-fixes
  http://cgit.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/?h=paule/webserver-s-b-fixes

Paul Eggleton (2):
  modphp: fix for S != B
  xdebug: fix for S != B

 meta-webserver/recipes-php/modphp/modphp5.inc     | 6 +++---
 meta-webserver/recipes-php/xdebug/xdebug_2.2.3.bb | 2 ++
 2 files changed, 5 insertions(+), 3 deletions(-)

-- 
1.9.0


