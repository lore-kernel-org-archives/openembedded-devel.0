Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <heroor@gmail.com>) id 1QGTLZ-0007dH-Re
	for openembedded-devel@lists.openembedded.org;
	Sun, 01 May 2011 11:53:49 +0200
Received: by gxk3 with SMTP id 3so248036gxk.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 01 May 2011 02:51:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=XXp50e/huHO9k23kvAfa0SsyRk4At2iYsm4UIZ891tE=;
	b=AyqxSd+HSZczYog149ATYH8aNABQTNfzLn7quqAcrcAtxepzFggOFjstI2NZyAUShO
	TkfGq1j/MrsHE6JeYKwKrPJuLW/ix5SoWUUdHp9yXwz+6y3B/RDB9vP1Os0toVpziPF7
	qosls1CZK1IaaCK5mHh/bDKkZAQNoYmvUuZog=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=iaszoquXpNBwB6smYAWsZ5CH8Ktgv/0xRKZxYVS5e4cIwEO1b1r2Zf+WR5UBn9OTKb
	Yxq3PIg+V4lDwLy1A74u/6t6KF+DAT1gtGaSfj63NzZxp6D/8G791qia4BRcBe1lhDe7
	imS6wIjfB5zoQxpGHwQ1gT4BgmU6l1MtS5eEM=
Received: by 10.236.184.1 with SMTP id r1mr8119486yhm.73.1304243469545;
	Sun, 01 May 2011 02:51:09 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com [192.94.94.33])
	by mx.google.com with ESMTPS id s16sm4629207anj.0.2011.05.01.02.51.07
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 01 May 2011 02:51:09 -0700 (PDT)
From: Siddharth Heroor <heroor@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  1 May 2011 15:20:49 +0530
Message-Id: <1304243449-12028-2-git-send-email-heroor@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1304243449-12028-1-git-send-email-heroor@ti.com>
References: <1304243449-12028-1-git-send-email-heroor@ti.com>
Cc: Siddharth Heroor <heroor@ti.com>
Subject: [PATCH 2/2] zeromq: Add version 2.1.6
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
X-List-Received-Date: Sun, 01 May 2011 09:53:50 -0000


Signed-off-by: Siddharth Heroor <heroor@ti.com>
---
 recipes/zeromq/zeromq_2.1.6.bb |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)
 create mode 100644 recipes/zeromq/zeromq_2.1.6.bb

diff --git a/recipes/zeromq/zeromq_2.1.6.bb b/recipes/zeromq/zeromq_2.1.6.bb
new file mode 100644
index 0000000..f88f512
--- /dev/null
+++ b/recipes/zeromq/zeromq_2.1.6.bb
@@ -0,0 +1,4 @@
+require zeromq.inc
+
+SRC_URI[md5sum] = "77b9ca20e8f2426874022080f41d7b0b"
+SRC_URI[sha256sum] = "a1bbb352a9dbf34b18a3999b22a8db2d51e4a52508d098528d771811533f9fd0"
-- 
1.7.0.4



