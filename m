Return-Path: <cristian.iorga@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 640E865D3B
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Oct 2014 16:40:54 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga103.jf.intel.com with ESMTP; 23 Oct 2014 09:39:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.04,776,1406617200"; d="scan'208";a="624095759"
Received: from sentry.rb.intel.com ([10.237.105.37])
	by orsmga002.jf.intel.com with ESMTP; 23 Oct 2014 09:40:54 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 23 Oct 2014 19:40:28 +0300
Message-Id: <1414082432-14111-1-git-send-email-cristian.iorga@intel.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH 0/3] Multimedia packages upgrades
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
X-List-Received-Date: Thu, 23 Oct 2014 16:40:58 -0000

mpd and mg123 upgrades and fixes.

mpd add some new dependencies, as signaled by buildhistory.

Cristian Iorga (3):
  mpd: fix fetch failure for 0.18.x
  mpg123: upgrade to 1.21.0
  mpd: upgrade to 0.19.1

 .../mpg123/{mpg123_1.19.0.bb => mpg123_1.21.0.bb}                | 4 ++--
 .../recipes-multimedia/musicpd/{mpd_0.18.9.bb => mpd_0.19.1.bb}  | 9 ++++-----
 2 files changed, 6 insertions(+), 7 deletions(-)
 rename meta-multimedia/recipes-multimedia/mpg123/{mpg123_1.19.0.bb => mpg123_1.21.0.bb} (94%)
 rename meta-multimedia/recipes-multimedia/musicpd/{mpd_0.18.9.bb => mpd_0.19.1.bb} (89%)

-- 
1.9.1


