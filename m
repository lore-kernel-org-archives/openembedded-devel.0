Return-Path: <net147@gmail.com>
Received: from mail-pa0-f54.google.com (mail-pa0-f54.google.com
	[209.85.220.54])
	by mail.openembedded.org (Postfix) with ESMTP id 22D06762A2
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  7 Sep 2015 03:01:05 +0000 (UTC)
Received: by pacej10 with SMTP id ej10so820013pac.3
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 06 Sep 2015 20:01:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=I4VvzswM6hpTLbENq5KTh9QLhxSq+HOPloc2pTnY+fc=;
	b=uSu25KySJ5PVyPKSQL/vWW52ARMeMrAIeu795H3JCdfsCSSLG0DeHCXiLXcNdkBeH6
	9RLZht1CBb0BoZiAGo3G3kqeWHiibau2KyAQwlBtbWPi+IWGLw/B7gWKwRuIpLQ98/6V
	E9oIdKfOpnZGxFVJYVR3sObUQfJvBtpal7r9TCX6EQJurzw25BfCHB+y7svvZ8ZNDzyi
	ZVvKi7FJfjxpj4LYCL8nJyLdFSzlZ6Z/wKmeYvTYmdTcimUgKZ+ZIU+nAVXnV+62WWr1
	1qkt1rNM+ZwMhWB6ZuMU0rOO4zUnmaj1sXUMlpz5XPoGv9PRaXcqQUEUoMp83y3dd9Kv
	i0AQ==
X-Received: by 10.68.166.196 with SMTP id zi4mr39987294pbb.83.1441594865692;
	Sun, 06 Sep 2015 20:01:05 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by smtp.gmail.com with ESMTPSA id
	un2sm10053651pac.28.2015.09.06.20.01.03
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 06 Sep 2015 20:01:03 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  7 Sep 2015 13:01:43 +1000
Message-Id: <1441594903-6021-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 2.5.0
Subject: [meta-qt5][PATCH] libconnman-qt5: update to 1.0.92
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
X-List-Received-Date: Mon, 07 Sep 2015 03:01:09 -0000

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 recipes-qt/libconnman-qt/libconnman-qt5_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-qt/libconnman-qt/libconnman-qt5_git.bb b/recipes-qt/libconnman-qt/libconnman-qt5_git.bb
index f79dc0c..8724e67 100644
--- a/recipes-qt/libconnman-qt/libconnman-qt5_git.bb
+++ b/recipes-qt/libconnman-qt/libconnman-qt5_git.bb
@@ -5,9 +5,9 @@ HOMEPAGE = "https://github.com/nemomobile/libconnman-qt"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://libconnman-qt/clockmodel.h;endline=8;md5=ea9f724050803f15d2d900ce3c5dac88"
 DEPENDS += "qtbase qtdeclarative"
-PV = "1.0.91+git${SRCPV}"
+PV = "1.0.92+git${SRCPV}"
 
-SRCREV = "f9ce5eaa124fc5a1a554540c94331301bb2b1b49"
+SRCREV = "2591cd6013936478d9edaf75f1a45482851af0f2"
 SRC_URI = "git://github.com/nemomobile/libconnman-qt.git"
 
 S = "${WORKDIR}/git"
-- 
2.5.0


