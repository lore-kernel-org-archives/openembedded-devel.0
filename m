Received: from softlayer.compulab.co.il ([50.23.254.55] helo=compulab.co.il)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ilya@compulab.co.il>) id 1SfTz6-0006i4-SD
	for openembedded-devel@lists.openembedded.org;
	Fri, 15 Jun 2012 12:42:33 +0200
Received: from [62.90.235.247] (port=14613 helo=zimbra-mta.compulab.co.il)
	by softlayer.compulab.co.il with esmtp (Exim 4.77)
	(envelope-from <ilya@compulab.co.il>) id 1SfTVW-0001FK-TY
	for openembedded-devel@lists.openembedded.org;
	Fri, 15 Jun 2012 13:11:59 +0300
Received: from localhost (localhost.localdomain [127.0.0.1])
	by zimbra-mta.compulab.co.il (Postfix) with ESMTP id 2F4FF644198
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Jun 2012 13:11:58 +0300 (IDT)
X-Virus-Scanned: amavisd-new at compulab.co.il
Received: from zimbra-mta.compulab.co.il ([127.0.0.1])
	by localhost (zimbra-mta.compulab.co.il [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id bMr-gDJXY0TE; Fri, 15 Jun 2012 13:11:56 +0300 (IDT)
Received: from ilya-pc (ilya-pc.compulab.local [10.1.1.23])
	by zimbra-mta.compulab.co.il (Postfix) with ESMTPS id 4AB30644192;
	Fri, 15 Jun 2012 13:11:56 +0300 (IDT)
Received: from ilya by ilya-pc with local (Exim 4.72)
	(envelope-from <ilya@compulab.co.il>)
	id 1SfTV6-0008GU-07; Fri, 15 Jun 2012 13:11:32 +0300
From: Ilya Ledvich <ilya@compulab.co.il>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 15 Jun 2012 13:10:55 +0300
Message-Id: <1339755055-31688-1-git-send-email-ilya@compulab.co.il>
X-Mailer: git-send-email 1.7.1
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - softlayer.compulab.co.il
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - compulab.co.il
Subject: libogg: add version 1.3.0
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
X-List-Received-Date: Fri, 15 Jun 2012 10:42:33 -0000

Signed-off-by: Ilya Ledvich <ilya@compulab.co.il>
---
 recipes/libogg/libogg_1.3.0.bb |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)
 create mode 100644 recipes/libogg/libogg_1.3.0.bb

diff --git a/recipes/libogg/libogg_1.3.0.bb b/recipes/libogg/libogg_1.3.0.bb
new file mode 100644
index 0000000..31079a0
--- /dev/null
+++ b/recipes/libogg/libogg_1.3.0.bb
@@ -0,0 +1,7 @@
+require libogg.inc
+
+PR = "${INC_PR}.0"
+
+
+SRC_URI[md5sum] = "0a7eb40b86ac050db3a789ab65fe21c2"
+SRC_URI[sha256sum] = "a8de807631014615549d2356fd36641833b8288221cea214f8a72750efe93780"
-- 
1.7.1



