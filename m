Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id C4BA26065F
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Aug 2013 11:33:53 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 23 Aug 2013 04:33:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,941,1367996400"; d="scan'208";a="350624739"
Received: from timevans-mobl.ger.corp.intel.com (HELO
	helios.ger.corp.intel.com) ([10.252.122.235])
	by azsmga001.ch.intel.com with ESMTP; 23 Aug 2013 04:33:39 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 23 Aug 2013 12:33:36 +0100
Message-Id: <cover.1377257565.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
Subject: [meta-oe][PATCH 0/1] Remove busybox bbappend
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
X-List-Received-Date: Fri, 23 Aug 2013 11:33:54 -0000

Note: this patch needs to be applied right after the patch that does
the merge of the bbappend in OE-Core (just sent to the OE-Core list).


The following changes since commit d4571b3d94d999ad54d8965f0d049dcfd34da504:

  quagga: two fixes (2013-08-16 11:00:19 -0400)

are available in the git repository at:

  git://git.openembedded.org/meta-openembedded-contrib paule/busybox
  http://cgit.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/?h=paule/busybox

Paul Eggleton (1):
  busybox: remove bbappend

 meta-oe/recipes-core/busybox/busybox/busybox-syslog.default |  1 -
 meta-oe/recipes-core/busybox/busybox_1.21.1.bbappend        | 11 -----------
 2 files changed, 12 deletions(-)
 delete mode 100644 meta-oe/recipes-core/busybox/busybox/busybox-syslog.default
 delete mode 100644 meta-oe/recipes-core/busybox/busybox_1.21.1.bbappend

-- 
1.8.1.2


