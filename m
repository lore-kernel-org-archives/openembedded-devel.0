Return-Path: <cristian.iorga@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id D2347717E3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 Oct 2014 12:01:12 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 10 Oct 2014 05:01:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.04,691,1406617200"; d="scan'208";a="616397723"
Received: from sentry.rb.intel.com ([10.237.105.37])
	by orsmga002.jf.intel.com with ESMTP; 10 Oct 2014 05:00:37 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 10 Oct 2014 15:00:27 +0300
Message-Id: <1412942429-14728-1-git-send-email-cristian.iorga@intel.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH 0/2] meta-java fixes
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
X-List-Received-Date: Fri, 10 Oct 2014 12:01:18 -0000

meta-java build time fixes with the pre 1.7 Yocto Project release.

Cristian Iorga (2):
  openjdk: add pkgconfig support
  ecj: fix unpackpost task

 recipes-core/ecj/libecj-bootstrap.inc   | 2 +-
 recipes-core/openjdk/openjdk-common.inc | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

-- 
1.9.1


