Received: from [148.204.64.197] (helo=localhost.localdomain)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <aalonso@localhost.localdomain>) id 1NnhRG-00061f-Mw
	for openembedded-devel@lists.openembedded.org;
	Sat, 06 Mar 2010 01:00:15 +0100
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by localhost.localdomain (8.14.3/8.14.3) with ESMTP id o25NFS66014753; 
	Fri, 5 Mar 2010 17:15:28 -0600
Received: (from aalonso@localhost)
	by localhost.localdomain (8.14.3/8.14.3/Submit) id o25NFRp8014751;
	Fri, 5 Mar 2010 17:15:27 -0600
From: Adrian Alonso <aalonso00@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  5 Mar 2010 17:15:13 -0600
Message-Id: <1267830919-14718-1-git-send-email-aalonso00@gmail.com>
X-Mailer: git-send-email 1.6.6.1
In-Reply-To: <openembedded-devel@lists.openembedded.org>
References: <openembedded-devel@lists.openembedded.org>
X-SA-Exim-Connect-IP: 148.204.64.197
X-SA-Exim-Mail-From: aalonso@localhost.localdomain
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=AWL,BAYES_00,HELO_LH_LD,
	NO_DNS_FOR_FROM,RDNS_NONE autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 1/7] device_table_add-xsa: add dev nodes for system ace
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
X-List-Received-Date: Sat, 06 Mar 2010 00:00:15 -0000

Signed-off-by: Adrian Alonso <aalonso00@gmail.com>
---
 files/device_table_add-xsa.txt |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)
 create mode 100644 files/device_table_add-xsa.txt

diff --git a/files/device_table_add-xsa.txt b/files/device_table_add-xsa.txt
new file mode 100644
index 0000000..a7b8429
--- /dev/null
+++ b/files/device_table_add-xsa.txt
@@ -0,0 +1,5 @@
+# Add nodes for xilinx system ace
+/dev/xsa    b   640     0   0   125     0   0   0   -
+/dev/xsa1   b   640     0   1   125     0   0   0   -
+/dev/xsa2   b   640     0   2   125     0   0   0   -
+/dev/xsa3   b   640     0   3   125     0   0   0   -
-- 
1.6.6.1



