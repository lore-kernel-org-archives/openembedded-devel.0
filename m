Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Qvb96-0001Cf-W7
	for openembedded-devel@lists.openembedded.org;
	Mon, 22 Aug 2011 22:30:57 +0200
Received: by mail-fx0-f47.google.com with SMTP id 11so3800464fxg.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Aug 2011 13:26:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=qD1kaw2VmCKE4Se/IDM+/wh1yl+678Psq/Jq7g1oKzo=;
	b=QyIhG4hWn+Oj72S7Ds0nnk8iFL+ang3O3ijeEg+h3Mm4IQkoQY8BTb1LZmrDBmUXkz
	wmfqSBGlOVz63UpQGO1IN6Fvvo4YoA+EARlNkqu5Bn4J77ssNs2q4iV0BxaEmdB+E7Ff
	D3i53VWEKQUquGrWtOiN5tLvg6pOyhgpsYIpQ=
Received: by 10.223.89.65 with SMTP id d1mr3204687fam.6.1314044774950;
	Mon, 22 Aug 2011 13:26:14 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id d5sm667775fak.24.2011.08.22.13.26.13
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 22 Aug 2011 13:26:14 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 22 Aug 2011 22:26:03 +0200
Message-Id: <f2d4302d43765f25c2fca5a78959300dd5fc5371.1314044687.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <cover.1314044687.git.Martin.Jansa@gmail.com>
References: <cover.1314044687.git.Martin.Jansa@gmail.com>
Subject: [meta-efl][PATCH 1/4] e-base: bump EFL_SRCREV
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
X-List-Received-Date: Mon, 22 Aug 2011 20:30:57 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/classes/e-base.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta-efl/classes/e-base.bbclass b/meta-efl/classes/e-base.bbclass
index 1b70382..6e8713d 100644
--- a/meta-efl/classes/e-base.bbclass
+++ b/meta-efl/classes/e-base.bbclass
@@ -2,7 +2,7 @@ HOMEPAGE = "http://www.enlightenment.org"
 SRCNAME ?= "${BPN}"
 
 # usually tracks svn trunk HEAD
-EFL_SRCREV ?= "62492"
+EFL_SRCREV ?= "62690"
 # revision when 1.0.0 was released, for recipes which don't need rebuild so often
 EFL_SRCREV_1.0.0 ?= "56356"
 
-- 
1.7.6



