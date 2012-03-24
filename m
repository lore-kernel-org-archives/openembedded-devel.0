Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SBM1k-0005Yi-Pt
	for openembedded-devel@lists.openembedded.org;
	Sat, 24 Mar 2012 09:08:44 +0100
Received: by mail-wg0-f43.google.com with SMTP id dr12so2353674wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 24 Mar 2012 00:59:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=zdYTdsW0aHM7V3aT/lrzCE9ORxVDOx8V1TwYueCRWLo=;
	b=biCl8Gbsvr8UgsMbTN/K4ycQsnDJTw2T3tXBM4ypWTGHhwwRxvjZIstGf1Cj0ohj6n
	rIWbsdWDO4vGUzXAJyil/O8JoutHr1SAdHHBmLEXIe765xaqjR0Z16ZnowtlnJJ30lOb
	P+D4TO5HH0QR9bZpEvCATp+xRkkjmBZ8lRDhSIeo9C8ciJL3nbAIA/PKRG6RXorHci70
	jXw2wLbAWT8Ld3h46V6flJXGqsNNDGZxif8utgmGwdAfaSBhuutjVWoo7Bc77ca4Vfi1
	R4fIingQdenXEQ1JV+Hj52XYMpmL4J38vfi/QtKj9RM5RhslgOyfObOlRpQ5oFAj+z68
	KRRQ==
Received: by 10.180.95.1 with SMTP id dg1mr3262998wib.21.1332575990038;
	Sat, 24 Mar 2012 00:59:50 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id fl2sm34192392wib.4.2012.03.24.00.59.48
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 24 Mar 2012 00:59:49 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 24 Mar 2012 08:59:31 +0100
Message-Id: <f1ce43bfab41093ce9739759a29b62de49ac1597.1332575856.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.5
In-Reply-To: <caec63e12fc6f93d292da393985032c2d407d6f8.1332575856.git.Martin.Jansa@gmail.com>
References: <caec63e12fc6f93d292da393985032c2d407d6f8.1332575856.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1332575856.git.Martin.Jansa@gmail.com>
References: <cover.1332575856.git.Martin.Jansa@gmail.com>
Subject: [meta-efl][PATCH 3/3] e-tasks: bump PR
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
X-List-Received-Date: Sat, 24 Mar 2012 08:08:44 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/e17/e-tasks_git.bb |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/meta-efl/recipes-efl/e17/e-tasks_git.bb b/meta-efl/recipes-efl/e17/e-tasks_git.bb
index 5196f42..dea6f03 100644
--- a/meta-efl/recipes-efl/e17/e-tasks_git.bb
+++ b/meta-efl/recipes-efl/e17/e-tasks_git.bb
@@ -10,6 +10,7 @@ inherit autotools
 
 SRCREV = "b640f0e7287877983645d9d9a36f85a0b6a54631"
 PV = "0.0.2+gitr${SRCPV}"
+PR = "r1"
 
 SRC_URI = "git://github.com/shr-project/e-tasks.git;protocol=git;branch=master \
 "
-- 
1.7.8.5



