Received: from hsvwanfw1-nat.mentorg.com ([139.181.24.34] helo=alm.mentorg.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom_rini@mentor.com>) id 1QjCQ2-0003p0-Sy
	for openembedded-devel@lists.openembedded.org;
	Tue, 19 Jul 2011 17:41:40 +0200
Received: from localhost.localdomain ([134.86.97.33])
	by alm.mentorg.com (8.12.10/8.12.10) with ESMTP id p6JFYIMg027736
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Jul 2011 10:34:18 -0500
From: Tom Rini <tom_rini@mentor.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 19 Jul 2011 08:34:18 -0700
Message-Id: <77d8aec24367e1b062cf529087d581039a2c8e98.1311089581.git.tom_rini@mentor.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1311089581.git.tom_rini@mentor.com>
References: <cover.1311089581.git.tom_rini@mentor.com>
In-Reply-To: <cover.1311089581.git.tom_rini@mentor.com>
References: <cover.1311089581.git.tom_rini@mentor.com>
Subject: [meta-oe][PATCH v2 1/2] guile: Move 'configure-fix.patch' to guile-1.8.7 dir
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
X-List-Received-Date: Tue, 19 Jul 2011 15:41:40 -0000

This patch is used by both native and target recipes.

Signed-off-by: Tom Rini <tom_rini@mentor.com>
---
 .../configure-fix.patch                            |    0
 1 files changed, 0 insertions(+), 0 deletions(-)
 rename meta-oe/recipes-support/guile/{guile-native-1.8.7 => guile-1.8.7}/configure-fix.patch (100%)

diff --git a/meta-oe/recipes-support/guile/guile-native-1.8.7/configure-fix.patch b/meta-oe/recipes-support/guile/guile-1.8.7/configure-fix.patch
similarity index 100%
rename from meta-oe/recipes-support/guile/guile-native-1.8.7/configure-fix.patch
rename to meta-oe/recipes-support/guile/guile-1.8.7/configure-fix.patch
-- 
1.7.0.4



