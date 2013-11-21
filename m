Return-Path: <ulf@emagii.com>
Received: from smtprelay-b11.telenor.se (smtprelay-b11.telenor.se
	[62.127.194.20])
	by mail.openembedded.org (Postfix) with ESMTP id 4B84E6D700
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Nov 2013 08:21:54 +0000 (UTC)
Received: from ipb1.telenor.se (ipb1.telenor.se [195.54.127.164])
	by smtprelay-b11.telenor.se (Postfix) with ESMTP id 7953BEB7CF
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Nov 2013 09:21:52 +0100 (CET)
X-SENDER-IP: [83.227.57.102]
X-LISTENER: [smtp.bredband.net]
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: AqZ3AETCjVJT4zlmPGdsb2JhbABYgwYBAYNBhHuuX4ckgRwXAwEBAQE4NYMCI09LCi2IBQHBBI4WgVUdhBwDmBKVOTs
X-IronPort-AV: E=Sophos;i="4.93,742,1378850400"; d="scan'208";a="659770496"
Received: from c-6639e353.011-39-73746f12.cust.bredbandsbolaget.se (HELO
	Hydra.bredbandsbolaget.se) ([83.227.57.102])
	by ipb1.telenor.se with ESMTP; 21 Nov 2013 09:21:42 +0100
From: Ulf Samuelsson <ulf@emagii.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 21 Nov 2013 09:21:26 +0100
Message-Id: <1385022086-30386-1-git-send-email-ulf@emagii.com>
X-Mailer: git-send-email 1.7.9.5
Cc: Ulf Samuelsson <ulf@emagii.com>
Subject: [PATCH] Ignore Edit backup files
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 21 Nov 2013 08:21:55 -0000

Signed-off-by: Ulf Samuelsson <ulf@emagii.com>
---
 .gitignore |    2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 .gitignore

diff --git a/.gitignore b/.gitignore
new file mode 100644
index 0000000..5236e1e
--- /dev/null
+++ b/.gitignore
@@ -0,0 +1,2 @@
+*~
+
-- 
1.7.9.5


