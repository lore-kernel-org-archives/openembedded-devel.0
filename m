Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 0687D77794
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 Oct 2017 01:58:32 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga104.jf.intel.com with ESMTP; 02 Oct 2017 18:58:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.42,472,1500966000"; d="scan'208";a="906072765"
Received: from imakwana-mobl.amr.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.142.79])
	by FMSMGA003.fm.intel.com with ESMTP; 02 Oct 2017 18:58:31 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  3 Oct 2017 14:58:02 +1300
Message-Id: <cover.1506995850.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.9.5
Subject: [meta-oe][PATCH 0/1] dnsmasq: upgrade to 2.78
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
X-List-Received-Date: Tue, 03 Oct 2017 01:58:33 -0000

Upgrade dnsmasq mostly in order to fix some security vulnerabilities.


The following changes since commit 06e8aa6bda49b4c103dcb41b059e3dba168ee37a:

  mongodb: Fix build on aarch64 (2017-10-02 12:35:39 +0000)

are available in the git repository at:

  git://git.openembedded.org/meta-openembedded-contrib paule/dnsmasq
  http://cgit.openembedded.org/meta-openembedded-contrib/log/?h=paule/dnsmasq

Paul Eggleton (1):
  dnsmasq: upgrade to 2.78

 .../recipes-support/dnsmasq/dnsmasq/lua.patch         | 19 ++++++++++---------
 .../recipes-support/dnsmasq/dnsmasq_2.76.bb           |  8 --------
 .../recipes-support/dnsmasq/dnsmasq_2.78.bb           |  8 ++++++++
 3 files changed, 18 insertions(+), 17 deletions(-)
 delete mode 100644 meta-networking/recipes-support/dnsmasq/dnsmasq_2.76.bb
 create mode 100644 meta-networking/recipes-support/dnsmasq/dnsmasq_2.78.bb

-- 
2.9.5


