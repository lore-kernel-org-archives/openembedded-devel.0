Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 7DAC26E68C
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Feb 2015 17:45:45 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga103.jf.intel.com with ESMTP; 04 Feb 2015 09:41:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.09,519,1418112000"; d="scan'208";a="647332270"
Received: from bdrobeso-mobl3.amr.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.17.70])
	by orsmga001.jf.intel.com with ESMTP; 04 Feb 2015 09:45:46 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  4 Feb 2015 17:45:34 +0000
Message-Id: <cover.1423071889.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.3
Subject: [meta-python][PATCH 0/3] New python recipes / upgrades
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
X-List-Received-Date: Wed, 04 Feb 2015 17:45:49 -0000

The following changes since commit 9c926ef2d463e643fb0dc87f6535a12e35d039ab:

  msr-tools: add recipe (2015-01-28 09:54:41 +0100)

are available in the git repository at:

  git://git.openembedded.org/meta-openembedded-contrib paule/python-django
  http://cgit.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/?h=paule/python-django

Paul Eggleton (1):
  python-django: add version 1.6.10

Saul Wold (2):
  python-pip: update to 1.5.6
  python-django-south: add version 1.0.2

 .../python/python-django-south_1.0.2.bb               | 18 ++++++++++++++++++
 .../recipes-devtools/python/python-django_1.6.10.bb   | 19 +++++++++++++++++++
 .../{python-pip_1.3.1.bb => python-pip_1.5.6.bb}      |  9 +++++----
 3 files changed, 42 insertions(+), 4 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python/python-django-south_1.0.2.bb
 create mode 100644 meta-python/recipes-devtools/python/python-django_1.6.10.bb
 rename meta-python/recipes-devtools/python/{python-pip_1.3.1.bb => python-pip_1.5.6.bb} (57%)

-- 
1.9.3


