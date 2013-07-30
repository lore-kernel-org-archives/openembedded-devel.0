Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id D0BF96A9C4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Jul 2013 12:49:02 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 30 Jul 2013 05:49:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,778,1367996400"; d="scan'208";a="275273303"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.122.217])
	by AZSMGA002.ch.intel.com with ESMTP; 30 Jul 2013 05:49:01 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 30 Jul 2013 13:48:53 +0100
Message-Id: <cover.1375188498.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
Subject: [meta-oe][PATCH 0/2] Remove recipes that are now in OE-Core
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
X-List-Received-Date: Tue, 30 Jul 2013 12:49:03 -0000

The following changes since commit 47fc1cce49936e0a1c9f083172a7fd45c7434aac:

  connman: Rename bbappend to match new version from oe-core (2013-07-30 11:35:03 +0200)

are available in the git repository at:

  git://git.openembedded.org/meta-openembedded-contrib paule/xinput-calibrator
  http://cgit.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/?h=paule/xinput-calibrator

Paul Eggleton (2):
  xinput-calibrator: remove
  pointercal-xinput: remove

 .../pointercal-xinput/pointercal.xinput            |  1 -
 .../xinput-calibrator/pointercal-xinput_0.0.bb     | 19 ----------
 .../xinput-calibrator/xinput-calibrator.service    | 11 ------
 .../xinput-calibrator/xinput-calibrator_git.bb     | 42 ----------------------
 4 files changed, 73 deletions(-)
 delete mode 100644 meta-oe/recipes-graphics/xinput-calibrator/pointercal-xinput/pointercal.xinput
 delete mode 100644 meta-oe/recipes-graphics/xinput-calibrator/pointercal-xinput_0.0.bb
 delete mode 100644 meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator/xinput-calibrator.service
 delete mode 100644 meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb

-- 
1.8.1.2


