Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Qz9ej-0008VC-Pe
	for openembedded-devel@lists.openembedded.org;
	Thu, 01 Sep 2011 17:58:17 +0200
Received: by mail-fx0-f47.google.com with SMTP id 11so881914fxg.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 01 Sep 2011 08:53:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=2zW/BX1KGAwPmCO2ng9ntoOdPQ+VHlo8QmBgEkE2pUA=;
	b=ADTTgmxOdVRBYficgo+WcgcYpHcU3cToVl7PAy3ht7+42cnjTRBsPGjKTjUTqEilV0
	W6IGqfjy/HsU40dSXwJGvaoBAp1PSJ6jaD3YPFr8rt/vLnsmwqd+j+L+J5YhcSosB/mW
	QKt0/JwJ3zBNEdP862DslY0eQpqkJwZCEsRvU=
Received: by 10.223.45.18 with SMTP id c18mr520561faf.86.1314892404323;
	Thu, 01 Sep 2011 08:53:24 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id l18sm136340fam.17.2011.09.01.08.53.22
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 01 Sep 2011 08:53:23 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  1 Sep 2011 17:53:08 +0200
Message-Id: <bd93a3112ecaf6f5e28e05e39ea45928a847e714.1314892354.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.6.1
In-Reply-To: <f25cc3380d321eae88a0566d20d2b2248258eb79.1314892354.git.Martin.Jansa@gmail.com>
References: <f25cc3380d321eae88a0566d20d2b2248258eb79.1314892354.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1314892354.git.Martin.Jansa@gmail.com>
References: <cover.1314892354.git.Martin.Jansa@gmail.com>
Subject: [meta-efl][PATCH 2/2] e-base: EFL_SRCREV bump
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
X-List-Received-Date: Thu, 01 Sep 2011 15:58:18 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/classes/e-base.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta-efl/classes/e-base.bbclass b/meta-efl/classes/e-base.bbclass
index 6e8713d..b4b91f4 100644
--- a/meta-efl/classes/e-base.bbclass
+++ b/meta-efl/classes/e-base.bbclass
@@ -2,7 +2,7 @@ HOMEPAGE = "http://www.enlightenment.org"
 SRCNAME ?= "${BPN}"
 
 # usually tracks svn trunk HEAD
-EFL_SRCREV ?= "62690"
+EFL_SRCREV ?= "63052"
 # revision when 1.0.0 was released, for recipes which don't need rebuild so often
 EFL_SRCREV_1.0.0 ?= "56356"
 
-- 
1.7.6.1



