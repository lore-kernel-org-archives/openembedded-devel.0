Received: from smtp203.alice.it ([82.57.200.99])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <GNUtoo@no-log.org>) id 1Pc4NE-0006iX-Fb
	for openembedded-devel@lists.openembedded.org;
	Mon, 10 Jan 2011 00:08:33 +0100
Received: from localhost.localdomain (80.180.55.19) by smtp203.alice.it
	(8.5.124.08) (authenticated as editempo@alice.it)
	id 4C1A2A9606E4FE5A; Mon, 10 Jan 2011 00:05:04 +0100
From: Denis 'GNUtoo' Carikli <GNUtoo@no-log.org>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 10 Jan 2011 00:05:02 +0100
Message-Id: <1294614302-19117-1-git-send-email-GNUtoo@no-log.org>
X-Mailer: git-send-email 1.7.0.4
Subject: [PATCH 2/2] xkeyboard-config_git: remove DEFAULT_PREFERENCE = "-1"
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
X-List-Received-Date: Sun, 09 Jan 2011 23:08:33 -0000

Signed-off-by: Denis 'GNUtoo' Carikli <GNUtoo@no-log.org>
---
 recipes/xkeyboard-config/xkeyboard-config_git.bb |    3 ---
 1 files changed, 0 insertions(+), 3 deletions(-)

diff --git a/recipes/xkeyboard-config/xkeyboard-config_git.bb b/recipes/xkeyboard-config/xkeyboard-config_git.bb
index 5fc0a77..b92bdc1 100644
--- a/recipes/xkeyboard-config/xkeyboard-config_git.bb
+++ b/recipes/xkeyboard-config/xkeyboard-config_git.bb
@@ -6,9 +6,6 @@ SRCREV = "547ae8589afb208d7b44ffe1e0ff7aba466c2ee3"
 PV = "2.0+gitr${SRCPV}"
 PR = "r0"
 
-DEFAULT_PREFERENCE = "-1"
-DEFAULT_PREFERENCE_shr = "1"
-
 SRC_URI = "git://anongit.freedesktop.org/xkeyboard-config;protocol=git;branch=master"
 
 S = "${WORKDIR}/git"
-- 
1.7.0.4



