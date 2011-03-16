Received: from gate.tarent.de
	([212.79.178.249] helo=ugs.tarent.de ident=daemon)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <henning@tarent.de>) id 1PzoYS-0003pv-Hy
	for openembedded-devel@lists.openembedded.org;
	Wed, 16 Mar 2011 12:06:19 +0100
Received: from localhost (localhost [127.0.0.1])
	by ugs.tarent.de (Postfix) with ESMTP id 5EFF1400571A0;
	Wed, 16 Mar 2011 11:55:07 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by ugs.tarent.de (Postfix) with ESMTP id 572114005161C;
	Wed, 16 Mar 2011 11:55:07 +0100 (CET)
Received: from ugs.tarent.de ([127.0.0.1])
	by localhost (ugs.tarent.de [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4KlqOt7hQQbo; Wed, 16 Mar 2011 11:55:07 +0100 (CET)
Received: from entw1 (lui.tarent.buero [192.168.4.41])
	by ugs.tarent.de (Postfix) with ESMTPSA id 3BBC2400571A0;
	Wed, 16 Mar 2011 11:55:07 +0100 (CET)
Received: from henning by entw1 with local (Exim 4.71)
	(envelope-from <henning@tarent.de>)
	id 1PzoNe-0006KO-Oq; Wed, 16 Mar 2011 11:55:06 +0100
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 16 Mar 2011 11:54:42 +0100
Message-Id: <1300272884-24220-3-git-send-email-heinold@inf.fu-berlin.de>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1300272884-24220-1-git-send-email-heinold@inf.fu-berlin.de>
References: <1300272884-24220-1-git-send-email-heinold@inf.fu-berlin.de>
Cc: Henning Heinold <h.heinold@tarent.de>
Subject: [PATCH 2/4] cacao-hg: update to latest revision
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
X-List-Received-Date: Wed, 16 Mar 2011 11:06:20 -0000

From: Henning Heinold <h.heinold@tarent.de>

---
 recipes/cacao/cacao-native_hg.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes/cacao/cacao-native_hg.bb b/recipes/cacao/cacao-native_hg.bb
index 0f0df64..6ece8dd 100644
--- a/recipes/cacao/cacao-native_hg.bb
+++ b/recipes/cacao/cacao-native_hg.bb
@@ -3,7 +3,7 @@ require cacao-native.inc
 PV = "1.1.0+hgr${SRCPV}"
 PR = "r2"
 
-SRCREV = "1ac977fe271c"
+SRCREV = "c7bf150bfa46"
 SRC_URI = "hg://mips.complang.tuwien.ac.at/hg/;module=cacao;rev=${SRCREV}"
 
 S = "${WORKDIR}/cacao"
-- 
1.7.0.4



