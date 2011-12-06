Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elizabeth.flanagan@intel.com>) id 1RY40K-0006S3-Mg
	for openembedded-devel@lists.openembedded.org;
	Wed, 07 Dec 2011 00:00:52 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 06 Dec 2011 14:53:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="84211319"
Received: from unknown (HELO cenodoxus.amr.corp.intel.com) ([10.255.12.24])
	by orsmga002.jf.intel.com with ESMTP; 06 Dec 2011 14:53:00 -0800
From: Beth Flanagan <elizabeth.flanagan@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  6 Dec 2011 14:52:53 -0800
Message-Id: <2a00651a5fbbd59355fcccd716ca7f2a98605f94.1323211648.git.elizabeth.flanagan@intel.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1323211648.git.elizabeth.flanagan@intel.com>
References: <cover.1323211648.git.elizabeth.flanagan@intel.com>
Subject: [PATCH 1/6] oe.test_types: move into an oe.tests package
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
X-List-Received-Date: Tue, 06 Dec 2011 23:00:52 -0000

From: Christopher Larson <kergoth@gmail.com>

Signed-off-by: Christopher Larson <kergoth@gmail.com>
---
 meta/lib/oe/{ => tests}/test_types.py |    0
 1 files changed, 0 insertions(+), 0 deletions(-)
 create mode 100644 meta/lib/oe/tests/__init__.py
 rename meta/lib/oe/{ => tests}/test_types.py (100%)

diff --git a/meta/lib/oe/tests/__init__.py b/meta/lib/oe/tests/__init__.py
new file mode 100644
index 0000000..e69de29
diff --git a/meta/lib/oe/test_types.py b/meta/lib/oe/tests/test_types.py
similarity index 100%
rename from meta/lib/oe/test_types.py
rename to meta/lib/oe/tests/test_types.py
-- 
1.7.1



