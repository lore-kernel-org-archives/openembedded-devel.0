Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1QRrtF-0007X4-GG
	for openembedded-devel@lists.openembedded.org;
	Wed, 01 Jun 2011 22:19:41 +0200
Received: by gxk3 with SMTP id 3so81554gxk.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 Jun 2011 13:16:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:sender:from:to:cc:subject:date:message-id
	:x-mailer:in-reply-to:references:in-reply-to:references;
	bh=NDHosQiL3HuVA/ALOvwtgY5JZri3nEC82eoFY2ERfos=;
	b=KJ6PlVZKEXwi4lpe14SneTxpdSa9/KzTknIR+0D65H+CatcaOgmngExPIwrWpH25nA
	dVltJqMMJI8hHokbV4nFOB3vTZ5TWaWpE79NggUU8jpWUK/tV2mfVdOSRn3L1+9tcvRd
	H/FedrBQR1tlgO2IovGeMbMbLdZBULJTH+000=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references;
	b=pxCwTayir7oO0nM4rWLZIDCuGgljAORiQTfn7fzGSnM+52P+wAbL1UJwyp+jH2urMs
	Cs6kfnsUCGWgWlw08yQgBrhcIS08XdecxgCCo6ENvjZn9yyHZ/ntEQL/PVgvqG695IW0
	fJTuBjryL1mKYRmmGzbhyIVP1Ms0N2YkExt6I=
Received: by 10.236.186.99 with SMTP id v63mr9624145yhm.85.1306959390377;
	Wed, 01 Jun 2011 13:16:30 -0700 (PDT)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id t43sm1478016yhm.70.2011.06.01.13.16.28
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 01 Jun 2011 13:16:29 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  1 Jun 2011 20:16:11 +0000
Message-Id: <b9290fdafc2e1704b9f333fa6cc41f6a4d5b2fcd.1306959338.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1306959338.git.otavio@ossystems.com.br>
References: <cover.1306959338.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1306959338.git.otavio@ossystems.com.br>
References: <cover.1306959338.git.otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-oe][PATCH 1/5] inih: bump SRCREV
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
X-List-Received-Date: Wed, 01 Jun 2011 20:19:41 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta-oe/recipes-support/inih/libinih_git.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/inih/libinih_git.bb b/meta-oe/recipes-support/inih/libinih_git.bb
index 4807bc7..f750bdb 100644
--- a/meta-oe/recipes-support/inih/libinih_git.bb
+++ b/meta-oe/recipes-support/inih/libinih_git.bb
@@ -6,10 +6,10 @@ PKGV = "${GITPKGVTAG}"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=dae28cbf28207425e0d0b3eb835f4bde"
 
-PR = "r0"
+PR = "r1"
 
 # The github repository provides a cmake and pkg-config integration
-SRCREV = "715cb4dc3d56714d7d53dcd94ae4b41c950119a7"
+SRCREV = "af230b4c7ef2529413ffc37cee513ef8f35c9598"
 SRC_URI = "git://github.com/OSSystems/inih.git;protocol=git"
 
 S = "${WORKDIR}/git"
-- 
1.7.2.5



