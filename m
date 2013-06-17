Return-Path: <laurentiu.palcu@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 8112E60667
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Jun 2013 12:25:54 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 17 Jun 2013 05:26:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,880,1363158000"; d="scan'208";a="354689981"
Received: from lpalcu-linux.rb.intel.com ([10.237.105.165])
	by fmsmga002.fm.intel.com with ESMTP; 17 Jun 2013 05:25:52 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 17 Jun 2013 15:25:41 +0300
Message-Id: <cover.1371471466.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [meta-oe][PATCH 0/1] xinput-calibrator: move it to oe-core
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
X-List-Received-Date: Mon, 17 Jun 2013 12:25:55 -0000

The following changes since commit ed84e64d22400595b68da4e75b48ab7ecc342aa9:

  openssh: Rename bbappend to match new version from oe-core (2013-06-12 16:23:27 +0200)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib lpalcu/xinput-calibrator_meta-oe
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=lpalcu/xinput-calibrator_meta-oe

Laurentiu Palcu (1):
  xinput-calibrator: move it to oe-core

 .../pointercal-xinput/pointercal.xinput            |    1 -
 .../xinput-calibrator/pointercal-xinput_0.0.bb     |   19 ---------
 .../xinput-calibrator/xinput-calibrator.service    |   11 -----
 .../xinput-calibrator/xinput-calibrator_git.bb     |   42 --------------------
 4 files changed, 73 deletions(-)
 delete mode 100644 meta-oe/recipes-graphics/xinput-calibrator/pointercal-xinput/pointercal.xinput
 delete mode 100644 meta-oe/recipes-graphics/xinput-calibrator/pointercal-xinput_0.0.bb
 delete mode 100644 meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator/xinput-calibrator.service
 delete mode 100644 meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb

-- 
1.7.9.5


