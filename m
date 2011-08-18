Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QtxsF-00066e-Mc
	for openembedded-devel@lists.openembedded.org;
	Thu, 18 Aug 2011 10:22:47 +0200
Received: by mail-bw0-f47.google.com with SMTP id zu17so1462221bkb.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Aug 2011 01:18:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=lnznBAZPmmy0mx5NGngeS1TpNRZEFUv/Z+Vh1k1mxd0=;
	b=rfmR+G6nEPfqsVLU+nEpjjbgXASpK5d1rXASs0twrcFm2hu2Y5lcLVh75rVAPTsKhC
	LN3XG7YOyZYrQdRQ9fwIF1a5uLFgRp2r+w/WYVkEsTFHd7+WPYIgdehH5+GZpqlcsY0J
	3TzFPjN2HwTD+oexDfgxLHWQjer05HqLP7U9A=
Received: by 10.204.233.67 with SMTP id jx3mr207437bkb.266.1313655490752;
	Thu, 18 Aug 2011 01:18:10 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id n9sm639011bkd.40.2011.08.18.01.18.09
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 18 Aug 2011 01:18:09 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 18 Aug 2011 10:18:05 +0200
Message-Id: <1f806520f152cbda2bc4aa7cbfde0dbfea7dc9b7.1313655444.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <cover.1313655444.git.Martin.Jansa@gmail.com>
References: <cover.1313655444.git.Martin.Jansa@gmail.com>
Subject: [meta-efl][PATCH 1/2] e-base: bump EFL_SRCREV
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
X-List-Received-Date: Thu, 18 Aug 2011 08:22:47 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/classes/e-base.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta-efl/classes/e-base.bbclass b/meta-efl/classes/e-base.bbclass
index a2417c5..1b70382 100644
--- a/meta-efl/classes/e-base.bbclass
+++ b/meta-efl/classes/e-base.bbclass
@@ -2,7 +2,7 @@ HOMEPAGE = "http://www.enlightenment.org"
 SRCNAME ?= "${BPN}"
 
 # usually tracks svn trunk HEAD
-EFL_SRCREV ?= "61696"
+EFL_SRCREV ?= "62492"
 # revision when 1.0.0 was released, for recipes which don't need rebuild so often
 EFL_SRCREV_1.0.0 ?= "56356"
 
-- 
1.7.6



