Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Tfi3E-0002Sw-JU
	for openembedded-devel@lists.openembedded.org;
	Tue, 04 Dec 2012 03:16:00 +0100
Received: by mail-ee0-f47.google.com with SMTP id e51so1926125eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 03 Dec 2012 18:01:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=om18/criJqJOZrOExQqfvylZtaA4+ljwI1+8Hj/qHL8=;
	b=beRUmEg482RhS3AGnpjVqSy3y4Jk9hWMChoJSmIrihM9SAvjvGRl0uQ+xhpKY9MoUY
	bapDrffkHhVc+/hvBkFSrzLgAKw+0FAP2cjDDTLQNeHwiCGtqFvsdJdqsLNsha9ZuG3j
	FLAWhuHvYU2b4YGYW4GInIvPdMDOdN9lqyCjtlZ5Ztf0UH8s4+7TGAsYJzjqm4Cvmx6P
	7X+BKNfOKlFtEinFMiKO2OKrN8f2pHPg8rW3gEh6PHDyeB15Fbs9f8eIiXbU4ZU896Og
	zcXgUr33vaQ+xLjASOj2AI1uWczo3RdJDjdGLARWUP6SIZzMcuCSyqZV/JFHohXInAqD
	95Ww==
Received: by 10.14.223.135 with SMTP id v7mr42829673eep.41.1354586493946;
	Mon, 03 Dec 2012 18:01:33 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id 44sm25509972eek.0.2012.12.03.18.01.32
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 03 Dec 2012 18:01:33 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  4 Dec 2012 02:58:47 +0100
Message-Id: <87646c3ba26e36045f811f78afc97ea6f28b1963.1354586187.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0
In-Reply-To: <cover.1354586187.git.Martin.Jansa@gmail.com>
References: <cover.1354586187.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1354586187.git.Martin.Jansa@gmail.com>
References: <cover.1354586187.git.Martin.Jansa@gmail.com>
Subject: [PATCH 14/58] qconnman: update git repo URL
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
X-List-Received-Date: Tue, 04 Dec 2012 02:16:00 -0000

* it was probably renamed on github, old SRCREV works

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-qt/qconnman/qconnman.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-qt/qconnman/qconnman.inc b/meta-oe/recipes-qt/qconnman/qconnman.inc
index 06ad5fd..f26274b 100644
--- a/meta-oe/recipes-qt/qconnman/qconnman.inc
+++ b/meta-oe/recipes-qt/qconnman/qconnman.inc
@@ -10,6 +10,6 @@ inherit autotools
 
 PV = "0.0+gitr${SRCPV}"
 SRCREV = "f976b18c7c5584627224784801803e9fd3ebe0ff"
-SRC_URI = "git://github.com/OSSystems/qconnman.git"
+SRC_URI = "git://github.com/OSSystems/qconnman-ui.git"
 
 S = "${WORKDIR}/git/"
-- 
1.8.0



