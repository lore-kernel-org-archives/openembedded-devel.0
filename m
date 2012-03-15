Received: from hermes.mlbassoc.com ([64.234.241.98] helo=mail.chez-thomas.org)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gthomas@mail.chez-thomas.org>) id 1S8DwG-0008Kn-Q9
	for openembedded-devel@lists.openembedded.org;
	Thu, 15 Mar 2012 17:54:09 +0100
Received: by mail.chez-thomas.org (Postfix, from userid 996)
	id CB8E2F811F3; Thu, 15 Mar 2012 10:45:22 -0600 (MDT)
From: Gary Thomas <gary@mlbassoc.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 15 Mar 2012 10:45:21 -0600
Message-Id: <1331829921-692-1-git-send-email-gary@mlbassoc.com>
X-Mailer: git-send-email 1.7.7.6
Subject: [meta-oe] midori: Add project home page info
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
X-List-Received-Date: Thu, 15 Mar 2012 16:54:09 -0000

Signed-off-by: Gary Thomas <gary@mlbassoc.com>
---
 meta-oe/recipes-connectivity/midori/midori.inc |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/meta-oe/recipes-connectivity/midori/midori.inc b/meta-oe/recipes-connectivity/midori/midori.inc
index 4c7147e..dccb3ee 100644
--- a/meta-oe/recipes-connectivity/midori/midori.inc
+++ b/meta-oe/recipes-connectivity/midori/midori.inc
@@ -1,4 +1,5 @@
 DESCRIPTION = "Midori is a lightweight web browser."
+HOMEPAGE = "http://www.twotoasts.de/index.php?/pages/midori_summary.html"
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=fbc093901857fcd118f065f900982c24"
 
-- 
1.7.7.6



