Received: from mail-yi0-f47.google.com ([209.85.218.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1Qudts-0004dT-FB
	for openembedded-devel@lists.openembedded.org;
	Sat, 20 Aug 2011 07:15:16 +0200
Received: by yia28 with SMTP id 28so2547538yia.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Aug 2011 22:10:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=/OulCJtBdreGjtndbqDojVU2/MkTHCuILKc8yZ2dYfQ=;
	b=dWzEFeiWGb5pUY7GMIGHXjfFCCApvq4CPoUMfg+3cAtE4rdy7KPNEAaE1ts8xtsWV6
	wEEr++BvoZOL/hfz4Ewoo1XBaoqBWmuWEfbTj7nLc5JI7C8/GCMPbmWSKgjzUi9rIxhx
	4KWCydrMDld1zEB9CqW7gFKCJpKcQeakxfw/U=
Received: by 10.150.235.14 with SMTP id i14mr149002ybh.361.1313817034795;
	Fri, 19 Aug 2011 22:10:34 -0700 (PDT)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id k17sm772692yba.29.2011.08.19.22.10.32
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 19 Aug 2011 22:10:34 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 20 Aug 2011 05:10:19 +0000
Message-Id: <10c18d0a46f8fb0db9147382f9f9e87a469ef647.1313816970.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1313816970.git.otavio@ossystems.com.br>
References: <cover.1313816970.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1313816970.git.otavio@ossystems.com.br>
References: <cover.1313816970.git.otavio@ossystems.com.br>
Subject: [meta-oe][PATCH 1/3] freerdp: bump SRCREV to gather major RemoteFX improvements
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
X-List-Received-Date: Sat, 20 Aug 2011 05:15:16 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta-oe/recipes-support/freerdp/freerdp_git.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta-oe/recipes-support/freerdp/freerdp_git.bb b/meta-oe/recipes-support/freerdp/freerdp_git.bb
index a3f4a03..3df1e07 100644
--- a/meta-oe/recipes-support/freerdp/freerdp_git.bb
+++ b/meta-oe/recipes-support/freerdp/freerdp_git.bb
@@ -9,7 +9,7 @@ PV = "gitr${SRCPV}"
 PKGV = "${GITPKGVTAG}"
 PR = "${INC_PR}.2"
 
-SRCREV = "d1eef40acc994d85cb78c0a98914edc097c9b44d"
+SRCREV = "b05747b55ccea8d2f2b830f89d3c0eb622d66784"
 SRC_URI = "git://github.com/FreeRDP/FreeRDP.git;protocol=git"
 
 S = "${WORKDIR}/git"
-- 
1.7.2.5



