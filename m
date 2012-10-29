Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1TSnOy-0003xl-5Q
	for openembedded-devel@lists.openembedded.org;
	Mon, 29 Oct 2012 12:21:09 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 29 Oct 2012 04:07:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,670,1344236400"; d="scan'208";a="241425417"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.122.120])
	by fmsmga002.fm.intel.com with ESMTP; 29 Oct 2012 02:36:43 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 29 Oct 2012 09:36:38 +0000
Message-Id: <cover.1351503373.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [meta-oe][PATCH 0/2] Add a couple of recipes
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 29 Oct 2012 11:21:11 -0000

The following changes since commit 1571c2c566c51799eceea2aabe13d1c3116f36b3:

  samba: update documentation2.patch to apply (2012-10-26 13:00:24 +0200)

are available in the git repository at:

  git://git.openembedded.org/meta-openembedded-contrib paule/add1
  http://cgit.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/?h=paule/add1

Paul Eggleton (2):
  ddrescue: add from OE-Classic, update and tidy up
  iotop: add from OE-Classic, update and tidy up

 meta-oe/recipes-extended/ddrescue/ddrescue_1.16.bb |   18 +++++++++++++++
 meta-oe/recipes-extended/iotop/iotop_0.4.4.bb      |   24 ++++++++++++++++++++
 2 files changed, 42 insertions(+)
 create mode 100644 meta-oe/recipes-extended/ddrescue/ddrescue_1.16.bb
 create mode 100644 meta-oe/recipes-extended/iotop/iotop_0.4.4.bb

-- 
1.7.9.5



