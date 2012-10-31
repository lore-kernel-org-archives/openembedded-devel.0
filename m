Received: from mail-ye0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1TTWNE-0002hr-NT
	for openembedded-devel@lists.openembedded.org;
	Wed, 31 Oct 2012 12:22:16 +0100
Received: by mail-ye0-f175.google.com with SMTP id m2so236193yen.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 31 Oct 2012 04:08:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=nh4Q/6Bw8fqagecjwPyzX9/CjBS7hTXjkBOktxpqZR8=;
	b=fdxw8lUpSXP/IaajpOdBQWUUoYnTbh2WNt2o5kowudVRv8Kh+yUWxIdQMOrpLv4kUM
	yDF6PMLFMEhh7hN3dcSl8nx81Tzaf9U46ebf2wvFUGf9wDbOKxtywybDeFL06V1COQWL
	43ic8qGPod3RLvJKRDQz8GaJbpGMNcXk/DNFyoRcvinEHAOaoCE+9njRc4SlsOy+8pck
	SZstj5RL2ycqYrAp5pz9UTOdgpIsGYXYZM+rzd+lsqLXInl8UF3L5qPnxhCVS5ivWYOg
	R8+a21LhHIbFDs0wVUUhXuRGPct1SF/ewK618DqOEdc0f8CVVQ8tgwajisDbVI7fkCOa
	laqQ==
Received: by 10.236.134.49 with SMTP id r37mr36525234yhi.11.1351681719873;
	Wed, 31 Oct 2012 04:08:39 -0700 (PDT)
Received: from localhost.localdomain ([177.100.163.15])
	by mx.google.com with ESMTPS id u49sm3307372yhd.18.2012.10.31.04.08.37
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 31 Oct 2012 04:08:39 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 31 Oct 2012 09:08:26 -0200
Message-Id: <1351681706-12778-3-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1351681706-12778-1-git-send-email-otavio@ossystems.com.br>
References: <1351681706-12778-1-git-send-email-otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-oe][PATCH v2 3/3] freerdp: Bump SRCREV to 1.0.2 snapshot of 2012-10-30
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
X-List-Received-Date: Wed, 31 Oct 2012 11:22:16 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta-oe/recipes-support/freerdp/freerdp_git.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta-oe/recipes-support/freerdp/freerdp_git.bb b/meta-oe/recipes-support/freerdp/freerdp_git.bb
index 01ab390..35228ad 100644
--- a/meta-oe/recipes-support/freerdp/freerdp_git.bb
+++ b/meta-oe/recipes-support/freerdp/freerdp_git.bb
@@ -9,7 +9,7 @@ PV = "gitr${SRCPV}"
 PKGV = "${GITPKGVTAG}"
 PR = "${INC_PR}.0"
 
-SRCREV = "19d4a4276869ec40ee1eef066ac460615734c043"
+SRCREV = "e0f2b3ccc986a165d9c289a569b60eab66153792"
 SRC_URI = "git://github.com/FreeRDP/FreeRDP.git"
 
 S = "${WORKDIR}/git"
-- 
1.7.2.5



