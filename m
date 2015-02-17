Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id B3AFE73556
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Feb 2015 09:55:36 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga103.fm.intel.com with ESMTP; 17 Feb 2015 01:48:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.09,593,1418112000"; d="scan'208";a="653157391"
Received: from choran1-mobl.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.18.31])
	by orsmga001.jf.intel.com with ESMTP; 17 Feb 2015 01:55:36 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 17 Feb 2015 09:55:22 +0000
Message-Id: <cover.1424166886.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.3
Subject: [meta-python][PATCH 0/2] Extend django recipes to nativesdk
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
X-List-Received-Date: Tue, 17 Feb 2015 09:55:41 -0000

I forgot to do this in the original versions.


The following changes since commit 9b15b3269062dbc48445be9bdc8beccee0cd7054:

  opensc: add new recipe (2015-02-12 19:37:20 +0100)

are available in the git repository at:

  git://git.openembedded.org/meta-openembedded-contrib paule/python-django-nativesdk
  http://cgit.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/?h=paule/python-django-nativesdk

Paul Eggleton (2):
  python-django: extend to nativesdk
  python-django-south: extend to nativesdk

 meta-python/recipes-devtools/python/python-django-south_1.0.2.bb | 1 +
 meta-python/recipes-devtools/python/python-django_1.6.10.bb      | 1 +
 2 files changed, 2 insertions(+)

-- 
1.9.3


