Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Szpli-00052i-2b
	for openembedded-devel@lists.openembedded.org;
	Fri, 10 Aug 2012 16:00:50 +0200
Received: by wibhn17 with SMTP id hn17so401688wib.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 Aug 2012 06:49:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=JWdLVtub2mg5Ku+eUJo2xQMlmmBW7WHsPCY7N5kmeaU=;
	b=hEShGLqlqth6ue79De3kk7+/2RgLnr6fBQptrPFYla/GPoilCx9U2ZJeD7RnzndqLP
	WyN27S7uKUU8FYQBk7qNjIGottVUm2SpjPB6RYrTphhIO2LSoD+pwLvQz3aTwQyOUomL
	I2nkWSnrOvP00Ozxnu9im4C8GI5C8s78v07alagJDTnClztvu2aUiduXcqPoqaZvRZBy
	rPqswBcV3EGlK8AWIMR8Un8XgCzewMwV/UyGQO8O0RqAMT44XCBnx/TLRJVZNq4NO58i
	cAEbcOI6yns9B8WbVv4QKZmM+as1KS0gMmbUPzh8Z0sSBgZjfzvTy8CzTSlaAZWQy6Eu
	LZbg==
Received: by 10.216.132.135 with SMTP id o7mr1565591wei.6.1344606539955;
	Fri, 10 Aug 2012 06:48:59 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id q4sm7840834wix.9.2012.08.10.06.48.58
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 10 Aug 2012 06:48:59 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 10 Aug 2012 15:43:34 +0200
Message-Id: <c03956de9408d060615bafb8d60227b8e1b0bd56.1344601517.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
In-Reply-To: <cover.1344601517.git.Martin.Jansa@gmail.com>
References: <cover.1342645937.git.Martin.Jansa@gmail.com>
	<cover.1344601517.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1344601517.git.Martin.Jansa@gmail.com>
References: <cover.1344601517.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][meta-efl][PATCH 39/46] e-base: bump EFL_SRCREV
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
X-List-Received-Date: Fri, 10 Aug 2012 14:00:52 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/classes/e-base.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta-efl/classes/e-base.bbclass b/meta-efl/classes/e-base.bbclass
index 3621217..53f2347 100644
--- a/meta-efl/classes/e-base.bbclass
+++ b/meta-efl/classes/e-base.bbclass
@@ -1,6 +1,6 @@
 HOMEPAGE = "http://www.enlightenment.org"
 SRCNAME ?= "${BPN}"
 
-EFL_SRCREV ?= "74924"
+EFL_SRCREV ?= "75056"
 
 ARM_INSTRUCTION_SET = "arm"
-- 
1.7.8.6



