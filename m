Received: from mail-gg0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1TTF3E-0007U3-GD
	for openembedded-devel@lists.openembedded.org;
	Tue, 30 Oct 2012 17:52:28 +0100
Received: by mail-gg0-f175.google.com with SMTP id p1so91048ggn.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Oct 2012 09:38:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:x-mailer;
	bh=h/ih47SI9+I6cyeKnUGedEy67KKCaLjmIhXfAQ/5g6w=;
	b=yz93zwodvxanqtQUKTxQIiigWJhcrehPAfS8r+F6i6HkwrnauPWNoTa9HpmF3d3EFO
	riS+qpRaeFH7pr7HdWGvOqZoFtA3q2IsB/drMbcHN9LADS5MflgczxO0ymyDwCgH9YRn
	91LJzkvg0fGWyvf92myR1fywtziiKLIhElXLfxHxNBXApuRsVRxcte6Z9QddB6ZeZB45
	7osrCa/3GFW2dXZccwAtF4JjZqHTNyGoySyxWyy+1QloeqL2FveFB8awYPTDySj4B2Jn
	f0cq76NWs5WKODh5mHRlXVrSeKSGOm1/MXPySCGnrQ9b5XjO+lyWnzTpsvkdnJ044run
	M0lw==
Received: by 10.236.134.49 with SMTP id r37mr33970437yhi.11.1351615132543;
	Tue, 30 Oct 2012 09:38:52 -0700 (PDT)
Received: from localhost.localdomain ([177.100.163.15])
	by mx.google.com with ESMTPS id u13sm1032273anh.9.2012.10.30.09.38.45
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 30 Oct 2012 09:38:51 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 30 Oct 2012 14:38:33 -0200
Message-Id: <1351615113-32300-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-oe][PATCH] freerdp: Bump SRCREV to 1.0.2 snapshot of 2012-10-29
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
X-List-Received-Date: Tue, 30 Oct 2012 16:52:29 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta-oe/recipes-support/freerdp/freerdp_git.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta-oe/recipes-support/freerdp/freerdp_git.bb b/meta-oe/recipes-support/freerdp/freerdp_git.bb
index 01ab390..6683d4f 100644
--- a/meta-oe/recipes-support/freerdp/freerdp_git.bb
+++ b/meta-oe/recipes-support/freerdp/freerdp_git.bb
@@ -9,7 +9,7 @@ PV = "gitr${SRCPV}"
 PKGV = "${GITPKGVTAG}"
 PR = "${INC_PR}.0"
 
-SRCREV = "19d4a4276869ec40ee1eef066ac460615734c043"
+SRCREV = "1eccaf0d2a4c99e2e70b38344120d3bf1a65ca89"
 SRC_URI = "git://github.com/FreeRDP/FreeRDP.git"
 
 S = "${WORKDIR}/git"
-- 
1.7.2.5



