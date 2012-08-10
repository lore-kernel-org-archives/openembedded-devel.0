Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SzplX-0004Sp-Rl
	for openembedded-devel@lists.openembedded.org;
	Fri, 10 Aug 2012 16:00:39 +0200
Received: by mail-wi0-f171.google.com with SMTP id hq4so1197427wib.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 Aug 2012 06:48:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=Mxa0CFqsAslfS9witNcmFqcuiQ+ZfulSnx+nZRLAKh0=;
	b=GO/kjgAsAtL9/2T195Pi/E9/ORgvBcz0pXvsOdufhfEHrtEgS52O5OJP6Y6k21qLFp
	fGW0/6pgGoIhumU3WgPP6nkc3DScKhKzmh/cXWY9nn8g9SG1xqnAPzNP8qWLxkOtzQP/
	ZpUWDOAwTQDetXNMf5yZWeb3TlbgHUqzI+Y4z1Fd2AV/0DF7sJ057S6kGcJsrkfK76Ky
	m6aHnQLpZl1GWcK35dqWJXJBe9X5Qu50Lyonh1tE1ftpni48FJxdfRcvTjS8B/xIBDU2
	HJC6pbmz4OX466F45FQlkLK+EGuJwyBp+1cU/WuTl3cWNjxsKwVpwLygm2QyLUFQXG3j
	9adg==
Received: by 10.216.131.135 with SMTP id m7mr1747679wei.72.1344606532455;
	Fri, 10 Aug 2012 06:48:52 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id dc3sm7846361wib.7.2012.08.10.06.48.50
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 10 Aug 2012 06:48:51 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 10 Aug 2012 15:43:33 +0200
Message-Id: <d32cbd667dd1396e0974e81127667811e1e7cf90.1344601517.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
In-Reply-To: <cover.1344601517.git.Martin.Jansa@gmail.com>
References: <cover.1342645937.git.Martin.Jansa@gmail.com>
	<cover.1344601517.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1344601517.git.Martin.Jansa@gmail.com>
References: <cover.1344601517.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][meta-efl][PATCH 38/46] e-base: bump EFL_SRCREV
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
X-List-Received-Date: Fri, 10 Aug 2012 14:00:39 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/classes/e-base.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta-efl/classes/e-base.bbclass b/meta-efl/classes/e-base.bbclass
index 1ee7ca8..3621217 100644
--- a/meta-efl/classes/e-base.bbclass
+++ b/meta-efl/classes/e-base.bbclass
@@ -1,6 +1,6 @@
 HOMEPAGE = "http://www.enlightenment.org"
 SRCNAME ?= "${BPN}"
 
-EFL_SRCREV ?= "74879"
+EFL_SRCREV ?= "74924"
 
 ARM_INSTRUCTION_SET = "arm"
-- 
1.7.8.6



