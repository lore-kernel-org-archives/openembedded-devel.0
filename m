Received: from cpe.ge-0-2-0-951.faaqnqu1.customer.tele.dk ([93.167.193.22]
	helo=mail.mikrofyn.com) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgh@sgh.dk>) id 1QLuyX-00035L-LX
	for openembedded-devel@lists.openembedded.org;
	Mon, 16 May 2011 12:24:33 +0200
Received: from zemeckis.mikrofyn.local ([10.115.0.50]) by mail.mikrofyn.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Mon, 16 May 2011 12:26:42 +0200
From: =?UTF-8?q?S=C3=B8ren=20Holm?= <sgh@sgh.dk>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 16 May 2011 12:22:03 +0200
Message-Id: <1305541323-19773-1-git-send-email-sgh@sgh.dk>
X-Mailer: git-send-email 1.7.4.1
MIME-Version: 1.0
X-OriginalArrivalTime: 16 May 2011 10:26:42.0156 (UTC)
	FILETIME=[BF9AAAC0:01CC13B3]
Subject: [PATCH 3/3] angstrom: Prefer Qt 4.7.3
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
X-List-Received-Date: Mon, 16 May 2011 10:24:33 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

recipe for Qt 4.7.2 got delete, so prefer 4.7.3 instead.

Signed-off-by: Søren Holm <sgh@sgh.dk>
---
 .../include/angstrom-2010-preferred-versions.inc   |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/conf/distro/include/angstrom-2010-preferred-versions.inc b/conf/distro/include/angstrom-2010-preferred-versions.inc
index 611c4e7..87da854 100644
--- a/conf/distro/include/angstrom-2010-preferred-versions.inc
+++ b/conf/distro/include/angstrom-2010-preferred-versions.inc
@@ -1,5 +1,5 @@
 ANGSTROM_MESA_VERSION = "7.9.1"
-ANGSTROM_QT_VERSION ?= "4.7.2"
+ANGSTROM_QT_VERSION ?= "4.7.3"
 ANGSTROM_LIBTOOL_VERSION = "2.4"
 # Use new sysroot feature
 LIBTOOL_HAS_SYSROOT = "yes"
-- 
1.7.4.1



