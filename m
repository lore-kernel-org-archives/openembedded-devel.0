Received: from devils.ext.ti.com ([198.47.26.153])
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <jdk@ti.com>)
	id 1RLwGM-0008D8-6z for openembedded-devel@lists.openembedded.org;
	Thu, 03 Nov 2011 13:19:18 +0100
Received: from dlep34.itg.ti.com ([157.170.170.115])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id pA3CD55C029409
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 3 Nov 2011 07:13:05 -0500
Received: from dlep26.itg.ti.com (smtp-le.itg.ti.com [157.170.170.27])
	by dlep34.itg.ti.com (8.13.7/8.13.8) with ESMTP id pA3CD54t010634
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 3 Nov 2011 07:13:05 -0500 (CDT)
Received: from DFLE70.ent.ti.com (localhost [127.0.0.1])
	by dlep26.itg.ti.com (8.13.8/8.13.8) with ESMTP id pA3CD5eY028683
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 3 Nov 2011 07:13:05 -0500 (CDT)
Received: from dlelxv22.itg.ti.com (172.17.1.197) by dfle70.ent.ti.com
	(128.247.5.40) with Microsoft SMTP Server id 14.1.323.3; Thu, 3 Nov 2011
	07:13:04 -0500
Received: from D620.itg.ti.com (h16-209.vpn.ti.com [172.24.16.209])	by
	dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id pA3CD46F029891;
	Thu, 3 Nov 2011 07:13:04 -0500
From: Jason Kridner <jdk@ti.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 3 Nov 2011 08:13:03 -0400
Message-ID: <1320322383-19870-1-git-send-email-jdk@ti.com>
X-Mailer: git-send-email 1.7.4.1
MIME-Version: 1.0
Subject: [PATCH] rt-test: moved to github repo
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
X-List-Received-Date: Thu, 03 Nov 2011 12:19:18 -0000
Content-Type: text/plain

PR not bumped since previous builds would be identical.
---
 meta/recipes-rt/rt-tests/rt-tests_0.73.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-rt/rt-tests/rt-tests_0.73.bb b/meta/recipes-rt/rt-tests/rt-tests_0.73.bb
index a2cf6be..e816fa2 100644
--- a/meta/recipes-rt/rt-tests/rt-tests_0.73.bb
+++ b/meta/recipes-rt/rt-tests/rt-tests_0.73.bb
@@ -11,7 +11,7 @@ SRCREV = "81da016fb0f6ab0511fbec81fc8ba1a50398a20d"
 PV = "git${SRCPV}"
 PR = "r0"
 
-SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/clrkwllms/rt-tests.git;protocol=git"
+SRC_URI = "git://github.com/clrkwllms/rt-tests.git;protocol=git"
 
 S = "${WORKDIR}/git"
 
-- 
1.7.4.1



