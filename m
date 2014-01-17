Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 155386A467
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Jan 2014 17:36:10 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 17 Jan 2014 09:32:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,675,1384329600"; d="scan'208";a="440507804"
Received: from ssaevars-mobl.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.122.195])
	by orsmga001.jf.intel.com with ESMTP; 17 Jan 2014 09:36:08 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 17 Jan 2014 17:36:03 +0000
Message-Id: <cover.1389979930.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.4.2
Cc: Bruce Ashfield <bruce.ashfield@windriver.com>
Subject: [meta-filesystems][PATCH 0/1] Add aufs-util
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
X-List-Received-Date: Fri, 17 Jan 2014 17:36:11 -0000

The following change since commit 9402e8cc964a3d75456af616497d376ebcc8e299:

  dovecot: add 2.2.10 (2014-01-15 18:02:33 +0100)

is available in the git repository at:

  git://git.openembedded.org/meta-openembedded-contrib paule/aufs-util
  http://cgit.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/?h=paule/aufs-util

Paul Eggleton (1):
  aufs-util: add new recipe

 ...dd-tool-concept-to-Makefile-for-cross-com.patch |  27 +++
 .../aufs-util-don-t-strip-executables.patch        |  37 ++++
 .../aufs-util/aufs-util/include/linux/aufs_type.h  | 210 +++++++++++++++++++++
 .../recipes-utils/aufs-util/aufs-util_git.bb       |  48 +++++
 4 files changed, 322 insertions(+)
 create mode 100644 meta-filesystems/recipes-utils/aufs-util/aufs-util/aufs-util-add-tool-concept-to-Makefile-for-cross-com.patch
 create mode 100644 meta-filesystems/recipes-utils/aufs-util/aufs-util/aufs-util-don-t-strip-executables.patch
 create mode 100644 meta-filesystems/recipes-utils/aufs-util/aufs-util/include/linux/aufs_type.h
 create mode 100644 meta-filesystems/recipes-utils/aufs-util/aufs-util_git.bb

-- 
1.8.4.2


