Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Szpiw-0002eM-4e
	for openembedded-devel@lists.openembedded.org;
	Fri, 10 Aug 2012 15:57:58 +0200
Received: by mail-we0-f175.google.com with SMTP id r6so927806wey.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 Aug 2012 06:46:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=/rJIzIyPEcPBAg/7WlMcNWEERzUxyUyRB6hchBiVm54=;
	b=zjo9k7VUydINrZVSGGCzObCB1suOda1OOrwQzbnvVcU7WEd8y3y2nLNZHf4h+QgIxM
	Uy3gMHHAPSzbwZwrmR1EB+CDv8uMO3kkn9+f160r107b1+KfWkUVvCkOHA4dw59wTr9I
	CWa2I1ZZTItZbzMdRzLdP12sfc8V6Y8+l+Nc7r260bH0dYy7afBJJoKUSJ7bCUzpG9t/
	vTjd25i0tc2XNGAH+bjggmwT3urkWDR1EPTDxrGGhvkQB6+emUnWGB0PpWfTrHSpC2rY
	FMcWHtx08qlCxP5GIK2+ZClLIom3cbToCSPMUWTNqmowBQrC+i7Z0Im1DJ2wssb7J/ci
	+Zpw==
Received: by 10.216.241.198 with SMTP id g48mr1735438wer.153.1344606370641;
	Fri, 10 Aug 2012 06:46:10 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id z11sm11632654wiv.10.2012.08.10.06.46.09
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 10 Aug 2012 06:46:09 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 10 Aug 2012 15:43:14 +0200
Message-Id: <f03a6c3243d696428fd9969c2d966dee22dc1fd2.1344601517.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
In-Reply-To: <cover.1344601517.git.Martin.Jansa@gmail.com>
References: <cover.1342645937.git.Martin.Jansa@gmail.com>
	<cover.1344601517.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1344601517.git.Martin.Jansa@gmail.com>
References: <cover.1344601517.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][meta-efl][PATCH 19/46] e-base: bump EFL_SRCREV
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
X-List-Received-Date: Fri, 10 Aug 2012 13:57:58 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/classes/e-base.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta-efl/classes/e-base.bbclass b/meta-efl/classes/e-base.bbclass
index d52b4dc..4a06d4a 100644
--- a/meta-efl/classes/e-base.bbclass
+++ b/meta-efl/classes/e-base.bbclass
@@ -1,6 +1,6 @@
 HOMEPAGE = "http://www.enlightenment.org"
 SRCNAME ?= "${BPN}"
 
-EFL_SRCREV ?= "74419"
+EFL_SRCREV ?= "74527"
 
 ARM_INSTRUCTION_SET = "arm"
-- 
1.7.8.6



