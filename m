Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1TMELl-00050O-4s
	for openembedded-devel@lists.openembedded.org;
	Thu, 11 Oct 2012 10:42:38 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 11 Oct 2012 01:29:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,570,1344236400"; d="scan'208";a="233393132"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.122.70])
	by fmsmga002.fm.intel.com with ESMTP; 11 Oct 2012 01:29:25 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 11 Oct 2012 09:29:21 +0100
Message-Id: <cover.1349944125.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [meta-webserver][PATCH 0/2] apache2 fixes
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
X-List-Received-Date: Thu, 11 Oct 2012 08:42:38 -0000

The following changes since commit 9e701bb060325bc47509d4874bd695f039191ea8:

  libconfig: port from classic and update (2012-10-10 12:35:07 +0200)

are available in the git repository at:

  git://git.openembedded.org/meta-openembedded-contrib paule/apache2-config
  http://cgit.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/?h=paule/apache2-config

Paul Eggleton (2):
  apache2: work around bug in apr-1-config/apu-1-config scripts
  apache2: reorganise packaging definitions

 .../recipes-httpd/apache2/apache2_2.4.2.bb         |   23 ++++++++++++++------
 1 file changed, 16 insertions(+), 7 deletions(-)

-- 
1.7.9.5



