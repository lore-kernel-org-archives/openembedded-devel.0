Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1TMj4v-0008G4-4y
	for openembedded-devel@lists.openembedded.org;
	Fri, 12 Oct 2012 19:31:17 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 12 Oct 2012 10:18:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,577,1344236400"; d="scan'208";a="226182307"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.122.39])
	by orsmga002.jf.intel.com with ESMTP; 12 Oct 2012 10:17:59 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 12 Oct 2012 18:17:54 +0100
Message-Id: <cover.1350062247.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [meta-webserver][PATCH 0/2] modphp fixes
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
X-List-Received-Date: Fri, 12 Oct 2012 17:31:17 -0000

The following changes since commit 9e701bb060325bc47509d4874bd695f039191ea8:

  libconfig: port from classic and update (2012-10-10 12:35:07 +0200)

are available in the git repository at:

  git://git.openembedded.org/meta-openembedded-contrib paule/modphp-fixes
  http://cgit.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/?h=paule/modphp-fixes

Paul Eggleton (2):
  modphp: fix rpath QA issue
  modphp: make LICENSE more accurate

 meta-webserver/recipes-php/modphp/modphp5.inc      |    6 +++++-
 meta-webserver/recipes-php/modphp/modphp_5.3.14.bb |    2 +-
 2 files changed, 6 insertions(+), 2 deletions(-)

-- 
1.7.9.5



