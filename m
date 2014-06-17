Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id A0EDE6B8D2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Jun 2014 17:35:09 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 17 Jun 2014 10:35:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,495,1400050800"; d="scan'208";a="446620643"
Received: from garethcl-mobl.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.121.19])
	by azsmga001.ch.intel.com with ESMTP; 17 Jun 2014 10:35:06 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 17 Jun 2014 18:34:56 +0100
Message-Id: <cover.1403026460.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.3
Subject: [meta-oe][PATCH 0/3] A couple of S!=B fixes
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
X-List-Received-Date: Tue, 17 Jun 2014 17:35:12 -0000

Plus one related metadata fix.


The following changes since commit c76b3b9b97fcdc5854c1d27247c4998c59c2fd2b:

  claanup: remove garbage file (2014-06-16 11:02:22 -0400)

are available in the git repository at:

  git://git.openembedded.org/meta-openembedded-contrib paule/sbfixes1
  http://cgit.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/?h=paule/sbfixes1

Paul Eggleton (3):
  lcdproc: fix do_install for S!=B
  pv: upgrade to 1.5.3
  pv: fix metadata fields

 meta-oe/recipes-extended/lcdproc/lcdproc5.inc     |  4 ++--
 meta-oe/recipes-extended/lcdproc/lcdproc_0.5.5.bb |  2 +-
 meta-oe/recipes-support/pv/pv_1.4.6.bb            | 17 -----------------
 meta-oe/recipes-support/pv/pv_1.5.3.bb            | 11 +++++++++++
 4 files changed, 14 insertions(+), 20 deletions(-)
 delete mode 100644 meta-oe/recipes-support/pv/pv_1.4.6.bb
 create mode 100644 meta-oe/recipes-support/pv/pv_1.5.3.bb

-- 
1.9.3


