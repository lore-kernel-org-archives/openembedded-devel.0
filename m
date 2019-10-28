Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id BC6AC7FA83
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Oct 2019 22:16:28 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	28 Oct 2019 15:16:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,241,1569308400"; d="scan'208";a="229842326"
Received: from mng-mobl.gar.corp.intel.com (HELO shodan.fritz.box)
	([10.249.76.230])
	by fmsmga002.fm.intel.com with ESMTP; 28 Oct 2019 15:16:27 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 29 Oct 2019 11:16:20 +1300
Message-Id: <cover.1572300962.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [meta-python][PATCH 0/1] python3-pillow: update to 6.2.1
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
X-List-Received-Date: Mon, 28 Oct 2019 22:16:28 -0000
Content-Transfer-Encoding: 8bit

Includes a CVE fix.

The following changes since commit 18506b797bcfe162999223b79919e7c730875bb4:

  pavucontrol: polish the recipe (2019-10-26 23:10:06 -0700)

are available in the Git repository at:

  git://git.openembedded.org/meta-openembedded-contrib paule/pillow
  http://cgit.openembedded.org/meta-openembedded-contrib/log/?h=paule/pillow

Paul Eggleton (1):
  python3-pillow: update to 6.2.1

 .../0001-explicitly-set-compile-options.patch    | 16 +++++++---------
 ...on3-pillow_6.1.bb => python3-pillow_6.2.1.bb} |  4 ++--
 2 files changed, 9 insertions(+), 11 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pillow_6.1.bb => python3-pillow_6.2.1.bb} (86%)

-- 
2.20.1


