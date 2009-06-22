Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1MIgP9-0000BE-7A
	for openembedded-devel@openembedded.org; Mon, 22 Jun 2009 12:05:35 +0200
Received: (qmail 27812 invoked by uid 813007); 22 Jun 2009 09:54:39 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO localhost.localdomain)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 22 Jun 2009 09:54:38 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 22 Jun 2009 11:53:49 +0200
Message-Id: <1245664435-30183-6-git-send-email-marcin@juszkiewicz.com.pl>
X-Mailer: git-send-email 1.6.3.1
In-Reply-To: <200906041838.05838.marcin@juszkiewicz.com.pl>
References: <200906041838.05838.marcin@juszkiewicz.com.pl>
Subject: [STABLE][PATCH 029/125] gnutls: The 'extra' lib (and package) is GPLv3
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
X-List-Received-Date: Mon, 22 Jun 2009 10:05:35 -0000

From: Tom Rini <trini@embeddedalley.com>


Signed-off-by: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
---
 recipes/gnutls/gnutls_2.4.2.bb |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/recipes/gnutls/gnutls_2.4.2.bb b/recipes/gnutls/gnutls_2.4.2.bb
index d33e687..d8266c2 100644
--- a/recipes/gnutls/gnutls_2.4.2.bb
+++ b/recipes/gnutls/gnutls_2.4.2.bb
@@ -1,4 +1,5 @@
 require gnutls.inc
+LICENSE_${PN}-extra = "GPLv3"
 
 SRC_URI += "\
 	file://gnutls-openssl.patch;patch=1 \
-- 
1.6.3.1





