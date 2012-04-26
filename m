Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SNOK6-0006Lc-7g
	for openembedded-devel@lists.openembedded.org;
	Thu, 26 Apr 2012 15:01:26 +0200
Received: by wera1 with SMTP id a1so778718wer.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Apr 2012 05:51:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=hkEwSUqk45KRaCSySygY/0h9xB3gcmAVEuiP8mQnqzI=;
	b=pANWW2z2E6pRK0YkBBMiWLZBe/s9K1/p6IYgTQykHa6DkGfoRRww4wkH1d/GdJexb4
	i0+Fe04ZSbZdjOpNL3JGqJMt5uxr+X7jq0OFQPEXwA8BJ3dvnqb0gZv9upq7fnePmRUX
	Iuh8NOEcVoq/LGdnGf1uNkdStmTPpAse524Wl7ZYJuAeg+fxMMN7om6qHbEXGEkADZbA
	jGewh2F2DfBWoyMXUi5Q6A7PQASDblsTYHjCqOwh+pyFLg796wfbNeV7xArWJk2An1zT
	YUTZuLXo89J8mnuk3rfs1OdxbuMGOw+bU7WeM4MdIgAttmxtyvqIv0+YeDLMe0zcVfSZ
	MDRg==
Received: by 10.180.104.230 with SMTP id gh6mr16228146wib.22.1335444700462;
	Thu, 26 Apr 2012 05:51:40 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id k6sm44580217wiy.7.2012.04.26.05.51.39
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 26 Apr 2012 05:51:39 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 26 Apr 2012 14:50:15 +0200
Message-Id: <1e6431adca3b45ac710a0f8ed3b56604910af052.1335444528.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.5
In-Reply-To: <cover.1335444528.git.Martin.Jansa@gmail.com>
References: <cover.1335444528.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1335444528.git.Martin.Jansa@gmail.com>
References: <cover.1335444528.git.Martin.Jansa@gmail.com>
Subject: [[meta-oe][meta-efl] 10/15] expedite: add LIC_FILES_CHKSUM
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
X-List-Received-Date: Thu, 26 Apr 2012 13:01:27 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/e17/expedite.inc |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/meta-efl/recipes-efl/e17/expedite.inc b/meta-efl/recipes-efl/e17/expedite.inc
index f529963..9399d82 100644
--- a/meta-efl/recipes-efl/e17/expedite.inc
+++ b/meta-efl/recipes-efl/e17/expedite.inc
@@ -1,6 +1,7 @@
 DESCRIPTION = "Expedite is a comprehensive benchmarking suite for Evas"
 DEPENDS = "eet evas"
 LICENSE = "MIT BSD"
+LIC_FILES_CHKSUM = "file://COPYING;md5=d70bc65d46237e4ef386beebe7d0fe5b"
 
 INC_PR = "r0"
 
-- 
1.7.8.5



