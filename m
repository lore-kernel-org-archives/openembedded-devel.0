Received: from gravedo.de ([85.214.79.159])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <morphis@gravedo.de>) id 1OqKOy-0000O1-Ez
	for openembedded-devel@lists.openembedded.org;
	Tue, 31 Aug 2010 08:33:00 +0200
Received: by gravedo.de (Postfix, from userid 5001)
	id 2FEA7275D101; Tue, 31 Aug 2010 08:32:25 +0200 (CEST)
Received: from localhost (unknown [89.204.137.96])
	by gravedo.de (Postfix) with ESMTPSA id CBA55275CCC2;
	Tue, 31 Aug 2010 08:32:24 +0200 (CEST)
From: Simon Busch <morphis@gravedo.de>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 31 Aug 2010 08:32:00 +0200
Message-Id: <1283236322-5116-4-git-send-email-morphis@gravedo.de>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1283236322-5116-1-git-send-email-morphis@gravedo.de>
References: <1283236322-5116-1-git-send-email-morphis@gravedo.de>
X-SA-Exim-Connect-IP: 85.214.79.159
X-SA-Exim-Mail-From: morphis@gravedo.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_SORBS_WEB autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 3/5] fso-autorev: add msmcommd-specs and libmsmcomm
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
X-List-Received-Date: Tue, 31 Aug 2010 06:33:00 -0000

Signed-off-by: Simon Busch <morphis@gravedo.de>
---
 conf/distro/include/fso-autorev.inc |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/conf/distro/include/fso-autorev.inc b/conf/distro/include/fso-autorev.inc
index 33b9c90..2c618ec 100644
--- a/conf/distro/include/fso-autorev.inc
+++ b/conf/distro/include/fso-autorev.inc
@@ -26,6 +26,8 @@ SRCREV_pn-libmsmcomm = "${AUTOREV}"
 SRCREV_pn-libpersistence = "${AUTOREV}"
 SRCREV_pn-misc-vapi = "${AUTOREV}"
 SRCREV_pn-msmcommd = "${AUTOREV}"
+SRCREV_pn-msmcommd-specs = "${AUTOREV}"
+SRCREV_pn-libmsmcomm = "${AUTOREV}"
 SRCREV_pn-vala-dbus-binding-tool-native = "${AUTOREV}"
 SRCREV_pn-vala-dbus-binding-tool = "${AUTOREV}"
 SRCREV_pn-vala = "${AUTOREV}"
-- 
1.7.0.4



