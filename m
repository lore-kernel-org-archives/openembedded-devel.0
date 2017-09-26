Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 419CD6E688
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Sep 2017 11:14:28 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	26 Sep 2017 04:14:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.42,440,1500966000"; d="scan'208";a="156104815"
Received: from lmazlan-mobl1.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.249.67.104])
	by fmsmga006.fm.intel.com with ESMTP; 26 Sep 2017 04:14:27 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 27 Sep 2017 00:14:21 +1300
Message-Id: <cover.1506424421.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.9.5
Subject: [meta-python][PATCH 0/1] python-pyfirmata: move in from meta-intel-iot-middleware and upgrade
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
X-List-Received-Date: Tue, 26 Sep 2017 11:14:29 -0000

Move in python-pyfirmata from meta-intel-iot-middleware.


The following changes since commit f841648657069051dffa1012a42eb1524b894d50:

  openwsman: Fix build with musl (2017-09-22 22:56:13 +0000)

are available in the git repository at:

  git://git.openembedded.org/meta-openembedded-contrib paule/python-pyfirmata
  http://cgit.openembedded.org/meta-openembedded-contrib/log/?h=paule/python-pyfirmata

Paul Eggleton (1):
  python-pyfirmata: move in from meta-intel-iot-middleware and upgrade

 meta-python/recipes-devtools/python/python-pyfirmata.inc    | 13 +++++++++++++
 .../recipes-devtools/python/python-pyfirmata_1.0.3.bb       |  3 +++
 .../recipes-devtools/python/python3-pyfirmata_1.0.3.bb      |  3 +++
 3 files changed, 19 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-pyfirmata.inc
 create mode 100644 meta-python/recipes-devtools/python/python-pyfirmata_1.0.3.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-pyfirmata_1.0.3.bb

-- 
2.9.5


