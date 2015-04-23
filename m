Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id EB5516AC24
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Apr 2015 15:00:10 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga102.jf.intel.com with ESMTP; 23 Apr 2015 08:00:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,631,1422950400"; d="scan'208";a="699817403"
Received: from kreynold-mobl.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.25.159])
	by fmsmga001.fm.intel.com with ESMTP; 23 Apr 2015 08:00:10 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 23 Apr 2015 15:59:32 +0100
Message-Id: <1429801172-30602-2-git-send-email-paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1429801172-30602-1-git-send-email-paul.eggleton@linux.intel.com>
References: <1429801172-30602-1-git-send-email-paul.eggleton@linux.intel.com>
Subject: [oe-classic][PATCH 1/1] README: update for current status of OE-Classic
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
X-List-Received-Date: Thu, 23 Apr 2015 15:00:11 -0000

OE-Classic is no longer maintained, so update README and MAINTAINERS
accordingly, and just in case someone might miss reading those, add a
file clearly spelling it out.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 MAINTAINERS               | 16 +++-------------
 README                    | 19 +++++++++++++++++--
 THIS_REPO_IS_OBSOLETE.txt |  1 +
 3 files changed, 21 insertions(+), 15 deletions(-)
 create mode 100644 THIS_REPO_IS_OBSOLETE.txt

diff --git a/MAINTAINERS b/MAINTAINERS
index 2f12832..e88d14b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1,18 +1,8 @@
 OpenEmbedded Maintainers List
 
-Please put you full name and email-address here for the areas of OE you want to support.
-
-Note: For the hard of thinking, this list is meant to remain in alphabetical
-order. If you could add yourselves to it in alphabetical order that would be
-so much easier (sort by firstname). Thank you!
-
-Person:     Real name
-Mail:       Mail patches to
-Website:    Web-page
-Interests:  Areas of interest (e.g. subsystems)
-Distros:    Maintained distros
-Machines:   Maintained machines
-Recipes:    Maintained recipes (should match package names, can include wildcards)
+WARNING: this repository has been superseded and is no longer maintained -
+please see README for details. The maintainers list below remains for
+historical purposes only.
 
 -----------------------------------------------------------------------------
 
diff --git a/README b/README
index 1264ca6..778efd9 100644
--- a/README
+++ b/README
@@ -1,3 +1,18 @@
-This is the OpenEmbedded packages metadata repository.
+This is the OpenEmbedded Classic (OE-Classic) metadata repository.
+
+WARNING: This version of OpenEmbedded is no longer supported or actively
+developed - it has been replaced by a new model based upon
+OpenEmbedded-Core (OE-Core). Users are strongly encouraged to migrate
+to OE-Core as there will be no further updates to OE-Classic as part of
+the OpenEmbedded project.
+
+The OE-Core repository is available at:
+
+  http://cgit.openembedded.org/openembedded-core/
+  git://git.openembedded.org/openembedded-core
+
+For further details on the differences between OE-Classic and OE-Core,
+please see:
+
+  http://openembedded.org/wiki/OpenEmbedded-Core
 
-See http://openembedded.org
diff --git a/THIS_REPO_IS_OBSOLETE.txt b/THIS_REPO_IS_OBSOLETE.txt
new file mode 100644
index 0000000..a283c1b
--- /dev/null
+++ b/THIS_REPO_IS_OBSOLETE.txt
@@ -0,0 +1 @@
+Superseded by openembedded-core - please see the README file for details.
-- 
2.1.0


