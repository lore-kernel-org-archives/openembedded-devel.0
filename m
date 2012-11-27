Received: from mail-ea0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TdS5j-0005dI-4N
	for openembedded-devel@lists.openembedded.org;
	Tue, 27 Nov 2012 21:49:16 +0100
Received: by mail-ea0-f175.google.com with SMTP id h11so4908028eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Nov 2012 12:35:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=y+hUApYfW75QISo8cPIPXYc6FgddhxXgCqOtAZsLy9I=;
	b=gPOYQ87nlgYFgSB4IjLY8/SAnmHO5ERYJd7RjaFoaTQ3NjVxoGCgcJE+iSelRgGi99
	pgJMpNhlDlvhvgpqIM643/pDdpYtmXo7GalBU+ackAoOcXVSDwIRVKD9hj3hX9KGuxcQ
	fhEZrWRydCyXj/djMwxJe3r1W30qJ0O9N52RQGgHVMYuNqnJk9TReZkMPOUKlEpjN8uN
	FZ5VO6UbZj+COYXB4/WySCYAA/iLmUrm8/ZWz/OIpWlSJGJ1uxggg/tszNdIyE2Rg1uY
	dl4I5ByLPGEv/2cwwLnNLweu76sAfu7FP11NASbxOOTo2wnEVDH+f16VkgVwhFF1I1O5
	q0fA==
Received: by 10.14.215.194 with SMTP id e42mr29237867eep.32.1354048504030;
	Tue, 27 Nov 2012 12:35:04 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id m48sm18956051eep.11.2012.11.27.12.35.03
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 27 Nov 2012 12:35:03 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 27 Nov 2012 21:33:46 +0100
Message-Id: <06c500f474c9d843d668f2d1dc2deba7f0ea0dec.1354034591.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0
In-Reply-To: <cover.1354034591.git.Martin.Jansa@gmail.com>
References: <cover.1354034591.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1354034591.git.Martin.Jansa@gmail.com>
References: <cover.1354034591.git.Martin.Jansa@gmail.com>
Subject: [PATCH 09/21] e-base: bump EFL_SRCREV for E17 alpha2
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
X-List-Received-Date: Tue, 27 Nov 2012 20:49:16 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/classes/e-base.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-efl/classes/e-base.bbclass b/meta-efl/classes/e-base.bbclass
index 90c71b4..03f673d 100644
--- a/meta-efl/classes/e-base.bbclass
+++ b/meta-efl/classes/e-base.bbclass
@@ -2,7 +2,7 @@ HOMEPAGE = "http://www.enlightenment.org"
 SRCNAME ?= "${BPN}"
 SRCVER ?= "${PV}"
 
-EFL_SRCREV ?= "78377"
+EFL_SRCREV ?= "78871"
 
 ARM_INSTRUCTION_SET = "arm"
 
-- 
1.8.0



