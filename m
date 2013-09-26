Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 1795B60A88
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Sep 2013 23:58:59 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 26 Sep 2013 16:59:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.90,989,1371106800"; d="scan'208";a="401691788"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.120.66])
	by fmsmga001.fm.intel.com with ESMTP; 26 Sep 2013 16:58:59 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 27 Sep 2013 00:58:52 +0100
Message-Id: <cover.1380239858.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
Subject: [meta-multimedia][PATCH 0/2] Add some recipes from meta-baryon
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
X-List-Received-Date: Thu, 26 Sep 2013 23:58:59 -0000

These recipes are about to be removed from meta-baryon as they are no
longer needed there, so update them, clean them up and move them to
meta-multimedia.


The following changes since commit 0ffc5f7ae91d06fb8e1d71e0b7cd08b94cad9060:

  apache2: fix error messages when restart apache service (2013-09-26 09:35:56 +0100)

are available in the git repository at:

  git://git.openembedded.org/meta-openembedded-contrib paule/multimedia
  http://cgit.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/?h=paule/multimedia

Paul Eggleton (2):
  faac: add recipe
  schroedinger: add recipe

 .../recipes-multimedia/faac/faac_1.28.bb           |  21 ++
 .../recipes-multimedia/faac/files/build-fix.patch  | 332 +++++++++++++++++++++
 .../schroedinger/files/configure.ac.patch          |  20 ++
 .../schroedinger/schroedinger_1.0.11.bb            |  22 ++
 4 files changed, 395 insertions(+)
 create mode 100644 meta-multimedia/recipes-multimedia/faac/faac_1.28.bb
 create mode 100644 meta-multimedia/recipes-multimedia/faac/files/build-fix.patch
 create mode 100644 meta-multimedia/recipes-multimedia/schroedinger/files/configure.ac.patch
 create mode 100644 meta-multimedia/recipes-multimedia/schroedinger/schroedinger_1.0.11.bb

-- 
1.8.1.2


