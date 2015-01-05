Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 25A777275B
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  5 Jan 2015 11:01:05 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 05 Jan 2015 03:01:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.07,698,1413270000"; d="scan'208";a="646381121"
Received: from kregan-mobl.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.17.116])
	by fmsmga001.fm.intel.com with ESMTP; 05 Jan 2015 03:01:05 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  5 Jan 2015 11:00:49 +0000
Message-Id: <8c7a8dd6dc63b7dd6ab191ded3425d73c0ea16ea.1420455602.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <cover.1420455602.git.paul.eggleton@linux.intel.com>
References: <cover.1420455602.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1420455602.git.paul.eggleton@linux.intel.com>
References: <cover.1420455602.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 05/10] libmodplug: update to 0.8.8.5
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
X-List-Received-Date: Mon, 05 Jan 2015 11:01:06 -0000

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 .../libmodplug/{libmodplug_0.8.7.bb => libmodplug_0.8.8.5.bb}         | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-multimedia/libmodplug/{libmodplug_0.8.7.bb => libmodplug_0.8.8.5.bb} (80%)

diff --git a/meta-oe/recipes-multimedia/libmodplug/libmodplug_0.8.7.bb b/meta-oe/recipes-multimedia/libmodplug/libmodplug_0.8.8.5.bb
similarity index 80%
rename from meta-oe/recipes-multimedia/libmodplug/libmodplug_0.8.7.bb
rename to meta-oe/recipes-multimedia/libmodplug/libmodplug_0.8.8.5.bb
index 2361875..1070246 100644
--- a/meta-oe/recipes-multimedia/libmodplug/libmodplug_0.8.7.bb
+++ b/meta-oe/recipes-multimedia/libmodplug/libmodplug_0.8.8.5.bb
@@ -5,8 +5,8 @@ LICENSE = "PD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c9182faa1f7c316f7b97d404bcbe3685"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/modplug-xmms/libmodplug-${PV}.tar.gz"
-SRC_URI[md5sum] = "d2d9ccd8da22412999caed076140f786"
-SRC_URI[sha256sum] = "3cfdebb60833a082e2f2b8faa3892bc9201d05c64051503e8007d8c98ae9e4c2"
+SRC_URI[md5sum] = "5f30241db109d647781b784e62ddfaa1"
+SRC_URI[sha256sum] = "77462d12ee99476c8645cb5511363e3906b88b33a6b54362b4dbc0f39aa2daad"
 
 inherit autotools pkgconfig
 
-- 
1.9.3


