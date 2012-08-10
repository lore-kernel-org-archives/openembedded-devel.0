Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Szplw-0005H1-Mk
	for openembedded-devel@lists.openembedded.org;
	Fri, 10 Aug 2012 16:01:04 +0200
Received: by weyr6 with SMTP id r6so930135wey.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 Aug 2012 06:49:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=OtX9KIj/M7tTe8OfPk3eDnzAaWJ/LDFh1zOTarMoBX8=;
	b=jlGX7A4R1QU0fR5vroO3qLfWvvcPKPNBD4ihzd99AFwailTX5c4cPfyeoGHJWPWX+h
	lP4cjlXS8GVSM8Bs7krlHG3NxDY8HZjUH3RYmYQQPzoZpVaaggpUMfOiWNirLhCVUAkF
	IQTe772+of4XJUj9gxea0xZzDkqEAS8CDlhMy5sQHVkrDFAQQA2r5sOdKZH5XZolvw73
	DQXQ40gvpX01F7suxhl92T1Hxj11rp1LnfB4FJrFyt7UhB5/msYwSfSduwdF3yIS3ieH
	FsWn76/0xaAjPPCeo4dtKW/ImSSkSlJLEkxomAaoWu8VqPD+OVVmKLyYn0KlkfYHL/if
	SB3w==
Received: by 10.216.232.204 with SMTP id n54mr1723686weq.182.1344606555180;
	Fri, 10 Aug 2012 06:49:15 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id w7sm7867257wiz.0.2012.08.10.06.49.13
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 10 Aug 2012 06:49:14 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 10 Aug 2012 15:43:36 +0200
Message-Id: <7a6b23bfa818b1075a5081a3d18411b9d1a6e99b.1344601517.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
In-Reply-To: <cover.1344601517.git.Martin.Jansa@gmail.com>
References: <cover.1342645937.git.Martin.Jansa@gmail.com>
	<cover.1344601517.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1344601517.git.Martin.Jansa@gmail.com>
References: <cover.1344601517.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][meta-efl][PATCH 41/46] e-base: bump EFL_SRCREV
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
X-List-Received-Date: Fri, 10 Aug 2012 14:01:04 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/classes/e-base.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta-efl/classes/e-base.bbclass b/meta-efl/classes/e-base.bbclass
index 53f2347..439e5bf 100644
--- a/meta-efl/classes/e-base.bbclass
+++ b/meta-efl/classes/e-base.bbclass
@@ -1,6 +1,6 @@
 HOMEPAGE = "http://www.enlightenment.org"
 SRCNAME ?= "${BPN}"
 
-EFL_SRCREV ?= "75056"
+EFL_SRCREV ?= "75077"
 
 ARM_INSTRUCTION_SET = "arm"
-- 
1.7.8.6



