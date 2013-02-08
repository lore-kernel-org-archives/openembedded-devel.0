Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1U3kNp-0001nX-8u
	for openembedded-devel@lists.openembedded.org;
	Fri, 08 Feb 2013 10:36:38 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 08 Feb 2013 01:20:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,628,1355126400"; d="scan'208";a="282551365"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.120.51])
	by orsmga002.jf.intel.com with ESMTP; 08 Feb 2013 01:20:42 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  8 Feb 2013 09:20:38 +0000
Message-Id: <cover.1360315212.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [meta-oe][PATCH 0/2] PyYAML / libYAML improvements
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 08 Feb 2013 09:36:38 -0000

The following changes since commit 61911b23099c2658186179504ded318c987b5276:

  ttf: introduce update-fonts bbclass and change all ttf recipes to use it (2013-02-06 15:16:01 +0100)

are available in the git repository at:

  git://git.openembedded.org/meta-openembedded-contrib paule/yaml
  http://cgit.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/?h=paule/yaml

Paul Eggleton (2):
  python-pyyaml: update to version 3.10 and tweak
  libyaml: update to 0.1.4 and tweak

 .../{python-pyyaml_svn.bb => python-pyyaml_3.10.bb}  |   18 +++++++++---------
 .../libyaml/{libyaml_0.1.3.bb => libyaml_0.1.4.bb}   |    7 +++----
 2 files changed, 12 insertions(+), 13 deletions(-)
 rename meta-oe/recipes-devtools/python/{python-pyyaml_svn.bb => python-pyyaml_3.10.bb} (50%)
 rename meta-oe/recipes-support/libyaml/{libyaml_0.1.3.bb => libyaml_0.1.4.bb} (54%)

-- 
1.7.10.4



