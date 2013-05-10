Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1Uas3Q-0006R6-UB
	for openembedded-devel@lists.openembedded.org;
	Fri, 10 May 2013 20:28:30 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by azsmga102.ch.intel.com with ESMTP; 10 May 2013 11:10:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,650,1363158000"; d="scan'208";a="332101409"
Received: from unknown (HELO helios.amr.corp.intel.com) ([10.255.12.234])
	by fmsmga001.fm.intel.com with ESMTP; 10 May 2013 11:09:46 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 10 May 2013 19:09:29 +0100
Message-Id: <9aaa1f812f86aaeb0ddad4fc84013f44bdbcce2b.1368209301.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1368209301.git.paul.eggleton@linux.intel.com>
References: <cover.1368209301.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1368209301.git.paul.eggleton@linux.intel.com>
References: <cover.1368209301.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 3/7] modphp: update to 5.4.15
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
X-List-Received-Date: Fri, 10 May 2013 18:28:51 -0000

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta-webserver/recipes-php/modphp/modphp_5.4.14.bb | 4 ----
 meta-webserver/recipes-php/modphp/modphp_5.4.15.bb | 4 ++++
 2 files changed, 4 insertions(+), 4 deletions(-)
 delete mode 100644 meta-webserver/recipes-php/modphp/modphp_5.4.14.bb
 create mode 100644 meta-webserver/recipes-php/modphp/modphp_5.4.15.bb

diff --git a/meta-webserver/recipes-php/modphp/modphp_5.4.14.bb b/meta-webserver/recipes-php/modphp/modphp_5.4.14.bb
deleted file mode 100644
index 5fea8fb..0000000
--- a/meta-webserver/recipes-php/modphp/modphp_5.4.14.bb
+++ /dev/null
@@ -1,4 +0,0 @@
-include modphp5.inc
-
-SRC_URI[md5sum] = "cfdc044be2c582991a1fe0967898fa38"
-SRC_URI[sha256sum] = "5450f3843bc651eb3fb00601f0cce1930aaaf65c7c966c02fe4a46f9c81be20a"
diff --git a/meta-webserver/recipes-php/modphp/modphp_5.4.15.bb b/meta-webserver/recipes-php/modphp/modphp_5.4.15.bb
new file mode 100644
index 0000000..7d90dc8
--- /dev/null
+++ b/meta-webserver/recipes-php/modphp/modphp_5.4.15.bb
@@ -0,0 +1,4 @@
+include modphp5.inc
+
+SRC_URI[md5sum] = "145ea5e845e910443ff1eddb3dbcf56a"
+SRC_URI[sha256sum] = "2d2285da48ccd2db311b2608fdfafd18b363a9f7e3796d53dd53e5b6752a0136"
-- 
1.8.1.2



