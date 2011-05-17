Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Noor_Ahsan@mentor.com>) id 1QMJMw-0002BP-Ff
	for openembedded-devel@lists.openembedded.org;
	Tue, 17 May 2011 14:27:23 +0200
Received: from nat-dem.mentorg.com ([195.212.93.2]
	helo=eu2-mail.mgc.mentorg.com) by relay1.mentorg.com with esmtp 
	id 1QMJK8-0007lE-LC from Noor_Ahsan@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Tue, 17 May 2011 05:24:28 -0700
Received: from localhost.localdomain ([137.202.156.152]) by
	eu2-mail.mgc.mentorg.com with Microsoft SMTPSVC(6.0.3790.4675); 
	Tue, 17 May 2011 14:24:23 +0200
From: Noor Ahsan <noor_ahsan@mentor.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 17 May 2011 17:23:31 +0500
Message-Id: <1305635011-6171-1-git-send-email-noor_ahsan@mentor.com>
X-Mailer: git-send-email 1.6.3.3
X-OriginalArrivalTime: 17 May 2011 12:24:23.0191 (UTC)
	FILETIME=[5AB8DA70:01CC148D]
Subject: [PATCH v2] Add new recipe for 0.5.4 version.
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
X-List-Received-Date: Tue, 17 May 2011 12:27:23 -0000

* Added a new recipe for 0.5.4 version

Signed-off-by: Noor Ahsan <noor_ahsan@mentor.com>
---
 recipes/lttng/userspace-rcu_0.5.4.bb |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/recipes/lttng/userspace-rcu_0.5.4.bb b/recipes/lttng/userspace-rcu_0.5.4.bb
new file mode 100644
index 0000000..e0d98e5
--- /dev/null
+++ b/recipes/lttng/userspace-rcu_0.5.4.bb
@@ -0,0 +1,3 @@
+require ${PN}.inc
+SRC_URI[md5sum] = "04147d24749be75200173859839207f7"
+SRC_URI[sha256sum] = "02aedbb16c16bd034e246d5c9637a9232be559c66fc2fe4eb28948e234bd89f1"
-- 
1.6.3.3



