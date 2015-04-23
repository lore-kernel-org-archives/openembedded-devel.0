Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id EC35D6E268
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Apr 2015 15:00:08 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga102.jf.intel.com with ESMTP; 23 Apr 2015 08:00:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,631,1422950400"; d="scan'208";a="699817390"
Received: from kreynold-mobl.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.25.159])
	by fmsmga001.fm.intel.com with ESMTP; 23 Apr 2015 08:00:08 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 23 Apr 2015 15:59:31 +0100
Message-Id: <1429801172-30602-1-git-send-email-paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.1.0
Subject: [oe-classic][PATCH 0/1] Add a notice to OE-Classic pointing to OE-Core
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

Hi folks,

As discussed at OEDAM, it's about time we added something to the
OE-Classic repo pointing people over to OE-Core, as OE-Classic really is
dead by now.

If some folks who contributed to OE-Classic could reply with their
Signed-off-by so we can add them to the commit message (or request
changes to the notices if you would like any) then that would be great.

Thanks,
Paul


Paul Eggleton (1):
  README: update for current status of OE-Classic

 MAINTAINERS               | 16 +++-------------
 README                    | 19 +++++++++++++++++--
 THIS_REPO_IS_OBSOLETE.txt |  1 +
 3 files changed, 21 insertions(+), 15 deletions(-)
 create mode 100644 THIS_REPO_IS_OBSOLETE.txt

-- 
2.1.0


