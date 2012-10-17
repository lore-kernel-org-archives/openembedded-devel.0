Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1TOPPg-0008OQ-Lk
	for openembedded-devel@lists.openembedded.org;
	Wed, 17 Oct 2012 10:55:40 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 17 Oct 2012 01:41:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,599,1344236400"; d="scan'208";a="207060452"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.122.85])
	by orsmga001.jf.intel.com with ESMTP; 17 Oct 2012 01:42:20 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 17 Oct 2012 09:42:14 +0100
Message-Id: <cover.1350463306.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [meta-oe][PATCH 0/4] Minor fixes
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
X-List-Received-Date: Wed, 17 Oct 2012 08:55:40 -0000

The following changes since commit 7eb2c6f8459fdcad5eb0f0dc2d8ca17a327dc0f6:

  xbmc: Fix serveral build errors and install missing dependencies (2012-10-16 09:59:08 +0200)

are available in the git repository at:

  git://git.openembedded.org/meta-openembedded-contrib paule/fixes1
  http://cgit.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/?h=paule/fixes1

Paul Eggleton (4):
  libc-client: correct LICENSE
  rrdtool: add pango to DEPENDS
  libnice: tidy up meta variables
  iso-codes: set SUMMARY

 .../libc-client/libc-client_2007e.bb               |    4 +++-
 meta-oe/recipes-extended/rrdtool/rrdtool_1.4.7.bb  |    4 +++-
 meta-oe/recipes-support/farsight/libnice_0.0.13.bb |    7 ++++---
 meta-oe/recipes-support/iso-codes/iso-codes_1.4.bb |    3 ++-
 4 files changed, 12 insertions(+), 6 deletions(-)

-- 
1.7.9.5



