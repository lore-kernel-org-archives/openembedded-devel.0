Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Szpkg-0003Pl-VV
	for openembedded-devel@lists.openembedded.org;
	Fri, 10 Aug 2012 15:59:47 +0200
Received: by mail-we0-f175.google.com with SMTP id r6so928736wey.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 Aug 2012 06:47:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=gfFBoVwSO7Oak1Cqm9zzYjLrqfevhBKT29KQ7sHGDVk=;
	b=M0yW7B9H+5ehU/jj7Hxq8wdUjIpwXDM7syFdnrl6MjGxOceUBXnxmtNuObC9H4BCQH
	/iLXATA623ixGOHVFpYkl1xNI1FfEODmaI2+j1KXdlHLxmHdBgL2b4oYMnB68/G/wfqh
	BFbS/jJdMWFmbwOT6GWucATwFkfX3Dkbd4ZbnMPQcTevcBa1Wu2l53TwGSjLwo44map4
	fCwshyL0GxcnZ1aR9avUSHiGWEv2aQjedNynbqejbznVSV2fgC5ed4xevrrOfUsqfkqU
	Brx/KXtoRahhuLmzlrfYppVuCpozYvH3o4PohJXyCv11NPPHlRdD9b+WSxmou9fb9qns
	f6KA==
Received: by 10.180.14.35 with SMTP id m3mr6143935wic.16.1344606479536;
	Fri, 10 Aug 2012 06:47:59 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id cu1sm7841622wib.6.2012.08.10.06.47.58
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 10 Aug 2012 06:47:58 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 10 Aug 2012 15:43:26 +0200
Message-Id: <a79f3d913f5b65e89861401c60d702867d58d1be.1344601517.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
In-Reply-To: <cover.1344601517.git.Martin.Jansa@gmail.com>
References: <cover.1342645937.git.Martin.Jansa@gmail.com>
	<cover.1344601517.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1344601517.git.Martin.Jansa@gmail.com>
References: <cover.1344601517.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][meta-efl][PATCH 31/46] e-base: bump EFL_SRCREV
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
X-List-Received-Date: Fri, 10 Aug 2012 13:59:47 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/classes/e-base.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta-efl/classes/e-base.bbclass b/meta-efl/classes/e-base.bbclass
index 5198c4b..990ce5a 100644
--- a/meta-efl/classes/e-base.bbclass
+++ b/meta-efl/classes/e-base.bbclass
@@ -1,6 +1,6 @@
 HOMEPAGE = "http://www.enlightenment.org"
 SRCNAME ?= "${BPN}"
 
-EFL_SRCREV ?= "74542"
+EFL_SRCREV ?= "74702"
 
 ARM_INSTRUCTION_SET = "arm"
-- 
1.7.8.6



