Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 5C0957806E
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Aug 2017 03:46:59 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga105.jf.intel.com with ESMTP; 24 Aug 2017 20:47:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,423,1498546800"; d="scan'208";a="122432187"
Received: from beecheek-mobl2.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.144.140])
	by orsmga004.jf.intel.com with ESMTP; 24 Aug 2017 20:46:59 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 25 Aug 2017 15:46:25 +1200
Message-Id: <cover.1503632758.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.9.5
Subject: [meta-python][PATCH 0/2] A couple of python-paho-mqtt fixes
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
X-List-Received-Date: Fri, 25 Aug 2017 03:47:01 -0000

The following changes since commit ac2a6d2b5d69937577effcb8bb2149651bac0176:

  json-spirit: Add -latomic to LDFLAGS (2017-08-13 13:21:04 +0200)

are available in the git repository at:

  git://git.openembedded.org/meta-openembedded-contrib paule/python-paho-mqtt-fixes
  http://cgit.openembedded.org/meta-openembedded-contrib/log/?h=paule/python-paho-mqtt-fixes

Paul Eggleton (2):
  python-paho-mqtt: licensing improvements
  python-paho-mqtt: fix downloading during do_compile

 meta-python/recipes-devtools/python/python-paho-mqtt.inc | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

-- 
2.9.5


