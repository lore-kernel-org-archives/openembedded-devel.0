Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Szpjr-0003Pl-9x
	for openembedded-devel@lists.openembedded.org;
	Fri, 10 Aug 2012 15:58:55 +0200
Received: by weyr6 with SMTP id r6so928736wey.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 Aug 2012 06:47:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=/KAe9wZ4oHIuKLpTws7st2z7eWg2RKuGQF+r65+4Snw=;
	b=OmwM0WueNTEv3G/5r0Bi5FXV9yCSjnZLMMDqaNedxa4Ha6LdLXs1gJYL7V2KsckmPB
	3c/PBRKduQN690hL53lPFBEcMqkDo/ZE+OzyB9f2LduuYQ5YSjXlRjqrEP5IUHXu7KeX
	YfKq78QxbHqDqNifby0ibfryUiAhksRa7QZp0nZ1V0/RwMMjNIWY4Sczbeqo1ueMq7rj
	tUGHpCkN8ds9gbEYCkKOTEyMXkaOIAf+Y+0/1O3X+M64xYK8UvbXWm85bXlXq4+ywXom
	HvX3fV0cmF5eiJrZwuGJb76SUIfQK6laSpFKINAqFLjKe0tlC2jMTRvu6NgcEYSEFSV3
	40QA==
Received: by 10.180.93.68 with SMTP id cs4mr6126924wib.14.1344606425816;
	Fri, 10 Aug 2012 06:47:05 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id fu8sm7846636wib.5.2012.08.10.06.47.04
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 10 Aug 2012 06:47:04 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 10 Aug 2012 15:43:19 +0200
Message-Id: <164060f2efe32e994b84f5813ccbc7e5fd5a6aef.1344601517.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
In-Reply-To: <cover.1344601517.git.Martin.Jansa@gmail.com>
References: <cover.1342645937.git.Martin.Jansa@gmail.com>
	<cover.1344601517.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1344601517.git.Martin.Jansa@gmail.com>
References: <cover.1344601517.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][meta-efl][PATCH 24/46] e-base: bump EFL_SRCREV
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
X-List-Received-Date: Fri, 10 Aug 2012 13:58:55 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/classes/e-base.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta-efl/classes/e-base.bbclass b/meta-efl/classes/e-base.bbclass
index 4a06d4a..5198c4b 100644
--- a/meta-efl/classes/e-base.bbclass
+++ b/meta-efl/classes/e-base.bbclass
@@ -1,6 +1,6 @@
 HOMEPAGE = "http://www.enlightenment.org"
 SRCNAME ?= "${BPN}"
 
-EFL_SRCREV ?= "74527"
+EFL_SRCREV ?= "74542"
 
 ARM_INSTRUCTION_SET = "arm"
-- 
1.7.8.6



