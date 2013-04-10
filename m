Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1UPxgC-0008CL-PT
	for openembedded-devel@lists.openembedded.org;
	Wed, 10 Apr 2013 18:15:25 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 10 Apr 2013 08:58:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,447,1363158000"; d="scan'208";a="320376212"
Received: from unknown (HELO helios.amr.corp.intel.com) ([10.255.14.51])
	by fmsmga002.fm.intel.com with ESMTP; 10 Apr 2013 08:58:00 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 10 Apr 2013 16:57:57 +0100
Message-Id: <cover.1365609345.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [meta-oe][PATCH v2 0/2] Clean up recipes
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
X-List-Received-Date: Wed, 10 Apr 2013 16:15:26 -0000

Drop some items that should no longer be in meta-oe.

v2 - Just the parts that havent yet been merged, with PR now preserved
as requested.


The following changes since commit 222b4eb3e469a84e929a968def6773405f369a3d:

  cloud9: add EnvironmentFile (2013-04-09 21:34:17 +0200)

are available in the git repository at:

  git://git.openembedded.org/meta-openembedded-contrib paule/cleanup6
  http://cgit.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/?h=paule/cleanup6

Paul Eggleton (2):
  packagegroup-qte-toolchain-target: remove bbappend content
  qt4: remove bbappend content

 .../packagegroups/packagegroup-qte-toolchain-target.bbappend      |    5 -----
 meta-oe/recipes-qt/qt4/qt4-embedded_4.8.4.bbappend                |    5 -----
 meta-oe/recipes-qt/qt4/qt4-x11-free_4.8.4.bbappend                |    5 -----
 3 files changed, 15 deletions(-)

-- 
1.7.10.4



