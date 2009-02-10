Received: from [59.124.115.149] (helo=aakash.openmoko.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <nytowl@openmoko.org>) id 1LX1OD-0007up-0H
	for openembedded-devel@lists.openembedded.org;
	Tue, 10 Feb 2009 23:47:37 +0100
Received: from s0106001c100a3234.cg.shawcable.net ([70.73.132.19]
	helo=[172.16.14.101]) by aakash.openmoko.org with esmtpsa (SSL
	3.0:DHE_RSA_AES_256_CBC_SHA1:32) (Exim 4.63)
	(envelope-from <nytowl@openmoko.org>) id 1LX1My-0006KU-Aa
	for openembedded-devel@lists.openembedded.org;
	Wed, 11 Feb 2009 06:46:32 +0800
From: Angus Ainslie <nytowl@openmoko.org>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 10 Feb 2009 15:46:08 -0700
Message-Id: <1234305968.16455.3.camel@alap>
Mime-Version: 1.0
X-Mailer: Evolution 2.24.3 
X-SA-Exim-Connect-IP: 70.73.132.19
X-SA-Exim-Mail-From: nytowl@openmoko.org
X-Spam-Checker-Version: SpamAssassin 3.1.7-deb (2006-10-05) on 
	aakash.openmoko.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=5.0 tests=ALL_TRUSTED,AWL,BAYES_00 
	autolearn=ham version=3.1.7-deb
X-SA-Exim-Version: 4.2.1 (built Tue, 09 Jan 2007 17:23:22 +0000)
X-SA-Exim-Scanned: Yes (on aakash.openmoko.org)
Subject: [patch] bump qi rev on milestone5 branch
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
X-List-Received-Date: Tue, 10 Feb 2009 22:47:37 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

From 4ba89782561dfe7dd2d4a298d5873269d6d8bc3a Mon Sep 17 00:00:00 2001
From: OE Build User <oe@buildhost.openmoko.org>
Date: Tue, 10 Feb 2009 23:32:51 +0100
Subject: [PATCH] updating qi git revision

---
 conf/distro/include/sane-srcrevs.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/conf/distro/include/sane-srcrevs.inc
b/conf/distro/include/sane-srcrevs.inc
index 538c74a..4e28d2b 100644
--- a/conf/distro/include/sane-srcrevs.inc
+++ b/conf/distro/include/sane-srcrevs.inc
@@ -201,7 +201,7 @@ SRCREV_pn-tslib ?= "53"
 SRCREV_pn-qemu-native ?= "${QEMUSRCREV}"
 SRCREV_pn-qemu-sdk ?= "${QEMUSRCREV}"
 SRCREV_pn-qemu ?= "${QEMUSRCREV}"
-SRCREV_pn-qi ?= "ed52486b43dca91891305b9e832c8366a2742798"
+SRCREV_pn-qi ?= "1fc83905fe99da92ff18e6ba671ee339477b1b9e"
 SRCREV_pn-remoko ?= "121"
 SRCREV_pn-remoko-server ?= "121"
 SRCREV_pn-s3c24xx-gpio ?= "4130"
--
1.5.6.5





