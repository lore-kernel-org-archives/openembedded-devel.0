Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 3851261485
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Jun 2013 08:41:21 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 24 Jun 2013 01:41:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,927,1363158000"; d="scan'208";a="334497709"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.122.47])
	by orsmga001.jf.intel.com with ESMTP; 24 Jun 2013 01:41:21 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 24 Jun 2013 09:41:17 +0100
Message-Id: <cover.1372063251.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
Subject: [PATCH v2 0/2] Fixes for world build failures
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
X-List-Received-Date: Mon, 24 Jun 2013 08:41:21 -0000

A couple of fixes for the recent world build failures.


The following changes since commit f7278f7900b98497bb900b004d727efba06773c1:

  packagekit: Fix build with new glib-2.0, v2 (2013-06-20 12:44:53 +0200)

are available in the git repository at:

  git://git.openembedded.org/meta-openembedded-contrib paule/fixes
  http://cgit.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/?h=paule/fixes

Paul Eggleton (2):
  pinpoint: fix and update
  clutter-box2d: fix for recent clutter changes in OE-Core

 meta-gnome/recipes-apps/pinpoint/pinpoint_git.bb      | 6 +++---
 meta-oe/recipes-graphics/clutter/clutter-box2d_git.bb | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

-- 
1.8.1.2


