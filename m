Received: from mail-ye0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1TUKhM-0002Oz-2p
	for openembedded-devel@lists.openembedded.org;
	Fri, 02 Nov 2012 18:06:24 +0100
Received: by mail-ye0-f175.google.com with SMTP id m2so715124yen.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 02 Nov 2012 09:52:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:x-mailer;
	bh=rhCx3bWkdV46puhWLPS64KghUDXTprENl/L0uN8HInM=;
	b=l6xjQ5KKwx+kGa9e5YJbcw6brki5R+5xC2Rfjvgc47X2GiCOQ/6WvDisls804KWt8l
	edwfiWftC4KLrYzX8ezQNExX5w9RkFs7vecTULP22ZRNSQsMlt9rNUMmbdTedIn7iWAc
	iDT/joyNU4jqfp4avORVKNcL2aMmrVpZ76MBvrY5hzuL0e9td4C336AZLmFyil7F0pAJ
	xLLlP0XpLPk0gZFoIMnd7TLYWiON7/Ictcq7MljYM79vV/8OPDkUkSQNAXQaG93IVtfa
	k0wo9EE7j+v7owk9So1NeazvxGWzrYj2csQwl3bI/ocpgyxzvuAxaVUCdeeYiwUIexqj
	KcSQ==
Received: by 10.236.124.131 with SMTP id x3mr2247357yhh.14.1351875163163;
	Fri, 02 Nov 2012 09:52:43 -0700 (PDT)
Received: from localhost.localdomain ([177.100.163.15])
	by mx.google.com with ESMTPS id s1sm9229472anj.1.2012.11.02.09.52.41
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 02 Nov 2012 09:52:42 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  2 Nov 2012 14:52:33 -0200
Message-Id: <1351875153-12669-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-oe][PATCH] freerdp: Bump SRCREV to 1.0.2 snapshot of 2012-10-30
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
X-List-Received-Date: Fri, 02 Nov 2012 17:06:24 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta-oe/recipes-support/freerdp/freerdp_git.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta-oe/recipes-support/freerdp/freerdp_git.bb b/meta-oe/recipes-support/freerdp/freerdp_git.bb
index 01ab390..0709bb7 100644
--- a/meta-oe/recipes-support/freerdp/freerdp_git.bb
+++ b/meta-oe/recipes-support/freerdp/freerdp_git.bb
@@ -9,7 +9,7 @@ PV = "gitr${SRCPV}"
 PKGV = "${GITPKGVTAG}"
 PR = "${INC_PR}.0"
 
-SRCREV = "19d4a4276869ec40ee1eef066ac460615734c043"
+SRCREV = "af940d2f2486e7af23c436e65cf480c09d8c8a06"
 SRC_URI = "git://github.com/FreeRDP/FreeRDP.git"
 
 S = "${WORKDIR}/git"
-- 
1.7.2.5



