Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 82B0578F49
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Aug 2018 17:50:34 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	13 Aug 2018 10:50:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.53,234,1531810800"; d="scan'208";a="83030450"
Received: from kkurdej-mobl.ger.corp.intel.com (HELO localhost.localdomain)
	([10.252.36.13])
	by orsmga002.jf.intel.com with ESMTP; 13 Aug 2018 10:50:32 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 13 Aug 2018 19:50:26 +0200
Message-Id: <cover.1534182463.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.17.1
Subject: [meta-oe][PATCH 0/4] Minor faad2/faac fixes
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 13 Aug 2018 17:50:34 -0000

The following changes since commit 30bbde3d09ebdf1ad2eac7764abeae0990f4cea2:

  oprofile: upgrade 1.2.0 -> 1.3.0 (2018-08-11 20:16:53 -0700)

are available in the Git repository at:

  git://git.openembedded.org/meta-openembedded-contrib paule/faad-fixes
  http://cgit.openembedded.org/meta-openembedded-contrib/log/?h=paule/faad-fixes

Paul Eggleton (4):
  faac: set HOMEPAGE
  faac: set LICENSE_FLAGS
  faad2: set more accurate SUMMARY and add HOMEPAGE
  faad2: set LICENSE_FLAGS

 meta-multimedia/recipes-multimedia/faac/faac_1.29.bb | 3 +++
 meta-oe/recipes-multimedia/faad2/faad2_2.7.bb        | 5 ++++-
 2 files changed, 7 insertions(+), 1 deletion(-)

-- 
2.17.1


