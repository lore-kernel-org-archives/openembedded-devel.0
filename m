Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Noor_Ahsan@mentor.com>) id 1QMJLL-00020f-KE
	for openembedded-devel@lists.openembedded.org;
	Tue, 17 May 2011 14:25:43 +0200
Received: from nat-dem.mentorg.com ([195.212.93.2]
	helo=eu2-mail.mgc.mentorg.com) by relay1.mentorg.com with esmtp 
	id 1QMJIZ-0007dy-EG from Noor_Ahsan@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Tue, 17 May 2011 05:22:51 -0700
Received: from localhost.localdomain ([137.202.156.152]) by
	eu2-mail.mgc.mentorg.com with Microsoft SMTPSVC(6.0.3790.4675); 
	Tue, 17 May 2011 14:22:47 +0200
From: Noor Ahsan <noor_ahsan@mentor.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 17 May 2011 17:21:56 +0500
Message-Id: <1305634916-6132-1-git-send-email-noor_ahsan@mentor.com>
X-Mailer: git-send-email 1.6.3.3
X-OriginalArrivalTime: 17 May 2011 12:22:47.0910 (UTC)
	FILETIME=[21EE2060:01CC148D]
Subject: [PATCH] Add new recipe for 0.12 version
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
X-List-Received-Date: Tue, 17 May 2011 12:25:43 -0000

* Add new recipe for 0.12 version

Signed-off-by: Noor Ahsan <noor_ahsan@mentor.com>
---
 recipes/lttng/ust_0.12.bb |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/recipes/lttng/ust_0.12.bb b/recipes/lttng/ust_0.12.bb
new file mode 100644
index 0000000..1efb853
--- /dev/null
+++ b/recipes/lttng/ust_0.12.bb
@@ -0,0 +1,4 @@
+require ${PN}.inc
+
+SRC_URI[md5sum] = "fae6e324a56016658c5b83ec14ba0043"
+SRC_URI[sha256sum] = "215b05f47d0c9e3a2934926a7d14fa9c67025db917c3a1f641df40b08314ab0c"
-- 
1.6.3.3



