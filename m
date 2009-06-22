Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1MIgP9-0000BS-T7
	for openembedded-devel@openembedded.org; Mon, 22 Jun 2009 12:05:36 +0200
Received: (qmail 27862 invoked by uid 813007); 22 Jun 2009 09:54:39 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO localhost.localdomain)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 22 Jun 2009 09:54:39 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 22 Jun 2009 11:53:51 +0200
Message-Id: <1245664435-30183-8-git-send-email-marcin@juszkiewicz.com.pl>
X-Mailer: git-send-email 1.6.3.1
In-Reply-To: <200906041838.05838.marcin@juszkiewicz.com.pl>
References: <200906041838.05838.marcin@juszkiewicz.com.pl>
Subject: [STABLE][PATCH 031/125] mpfr: Both GPL and LGPL components
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
X-List-Received-Date: Mon, 22 Jun 2009 10:05:36 -0000

From: Tom Rini <trini@embeddedalley.com>


Signed-off-by: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
---
 recipes/mpfr/mpfr.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes/mpfr/mpfr.inc b/recipes/mpfr/mpfr.inc
index cf898b6..5f7f94c 100644
--- a/recipes/mpfr/mpfr.inc
+++ b/recipes/mpfr/mpfr.inc
@@ -1,6 +1,6 @@
 DESCRIPTION = "A C library for multiple-precision floating-point computations with exact rounding"
 HOMEPAGE = "http://www.mpfr.org/"
-LICENSE = "LGPL"
+LICENSE = "GPL LGPL"
 SECTION = "libs"
 
 inherit autotools
-- 
1.6.3.1





