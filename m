Return-Path: <timothy.t.orling@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 4A9BA786F5
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 21 Jan 2018 06:18:34 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
	by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	20 Jan 2018 22:18:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,390,1511856000"; d="scan'208";a="11787675"
Received: from wrath.jf.intel.com ([10.54.70.11])
	by orsmga008.jf.intel.com with ESMTP; 20 Jan 2018 22:18:32 -0800
From: Tim Orling <timothy.t.orling@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 20 Jan 2018 22:18:12 -0800
Message-Id: <cover.1516515289.git.timothy.t.orling@linux.intel.com>
X-Mailer: git-send-email 2.13.6
MIME-Version: 1.0
Subject: [meta-oe][PATCH 0/2] Upgrades for perl recipes
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
X-List-Received-Date: Sun, 21 Jan 2018 06:18:34 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Upgrades using upgradehelper.py from auto-upgrade-helper

[1] http://git.yoctoproject.org/cgit/cgit.cgi/auto-upgrade-helper/

The following changes since commit 8cef6b38e62e6c79ec857510df454cefc868b0df:

  meson: remove recipe and class (2018-01-16 21:41:26 -0800)

are available in the git repository at:

  git://push.openembedded.org/meta-openembedded-contrib timo/meta-oe-perl-upgrades

Tim Orling (2):
  libdbd-mysql-perl: upgrade 4.036 -> 4.043
  libdbi-perl: upgrade 1.636 -> 1.639

 .../perl/{libdbd-mysql-perl_4.036.bb => libdbd-mysql-perl_4.043.bb} | 4 ++--
 .../perl/{libdbi-perl_1.636.bb => libdbi-perl_1.639.bb}             | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)
 rename meta-oe/recipes-devtools/perl/{libdbd-mysql-perl_4.036.bb => libdbd-mysql-perl_4.043.bb} (85%)
 rename meta-oe/recipes-devtools/perl/{libdbi-perl_1.636.bb => libdbi-perl_1.639.bb} (75%)

-- 
2.13.6


