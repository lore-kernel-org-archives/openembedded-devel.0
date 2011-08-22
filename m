Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Qvb9S-0001Cf-9y
	for openembedded-devel@lists.openembedded.org;
	Mon, 22 Aug 2011 22:31:18 +0200
Received: by mail-fx0-f47.google.com with SMTP id 11so3800464fxg.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Aug 2011 13:26:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=PYZf0CiVab/+QkqJhHnay8zNIclKpDqORURoE9QGA+4=;
	b=ZlBtcplOxN/wKs6mg8zeLLj0C6sKQuEnLA23vD7/cUNMH15D0z3506psQQQUQNRXml
	xAXenUpBERIYVCU8Ryc0RmofRBiyKENLuhslUn6Z6X4bNaaqchvefGSbgHMZgJo/dznj
	ZZGRNH9aif0f5+qaMkGpf2iCVRvFKRrJYZDG4=
Received: by 10.223.76.71 with SMTP id b7mr4243746fak.30.1314044796264;
	Mon, 22 Aug 2011 13:26:36 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id 16sm5375142faw.18.2011.08.22.13.26.35
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 22 Aug 2011 13:26:35 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 22 Aug 2011 22:26:06 +0200
Message-Id: <22ec18224f7a7c64850c76b14017dff2ff4345f2.1314044687.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <f2d4302d43765f25c2fca5a78959300dd5fc5371.1314044687.git.Martin.Jansa@gmail.com>
References: <f2d4302d43765f25c2fca5a78959300dd5fc5371.1314044687.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1314044687.git.Martin.Jansa@gmail.com>
References: <cover.1314044687.git.Martin.Jansa@gmail.com>
Subject: [meta-efl][PATCH 4/4] elfe: Add LIC_FILES_CHKSUM to recipe
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
X-List-Received-Date: Mon, 22 Aug 2011 20:31:18 -0000

From: pespin <pespin.shar@gmail.com>

Signed-off-by: Pau Espin Pedrol <pespin.shar@gmail.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/e17/elfe_svn.bb |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/meta-efl/recipes-efl/e17/elfe_svn.bb b/meta-efl/recipes-efl/e17/elfe_svn.bb
index 8b8f09d..b5126f9 100644
--- a/meta-efl/recipes-efl/e17/elfe_svn.bb
+++ b/meta-efl/recipes-efl/e17/elfe_svn.bb
@@ -1,4 +1,5 @@
 LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://COPYING;md5=344895f253c32f38e182dcaf30fe8a35"
 PV = "0.0.1+svnr${SRCPV}"
 PR = "${INC_PR}.0"
 
-- 
1.7.6



