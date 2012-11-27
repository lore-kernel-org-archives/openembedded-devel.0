Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TdS71-0005cR-0D
	for openembedded-devel@lists.openembedded.org;
	Tue, 27 Nov 2012 21:50:35 +0100
Received: by mail-ee0-f47.google.com with SMTP id l10so6973088eei.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Nov 2012 12:36:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=2RTaKO2jcjdnyHxNuTPjplIgEHCf0Nuwc62jYR/W88c=;
	b=YqGKLY0yRiEhJn1CcY2JV0HHAuTyQAUYQzI9fvTMAFFsVgat1m+laI1hmcjBwxwy2w
	QB81sfDRZ/bGOl9O6FHQdiFFaHUFyHBk50PQC0ZaTEYSUZaaRvhTYV2YJeQGWskT/xFV
	nmkzDZspD8aegV5IMp7NVt9sf4Yjn4wGZ1nD587qyxT6s5epLlf+15Or/gdp04/AbBi6
	WEP7yuJ2Ev9yl5T6UyUlBlBa/XROklwUwumGJONu1roSAUwEUDI0ZwoHQIITzw1oi1dy
	DG3nTbk38BHKqwQakY/R/xGBN1rhCYgFaYFy6w69qVWtwbyOJDPGavtgCqCsRpCQ7M9l
	K/YA==
Received: by 10.14.214.132 with SMTP id c4mr41031522eep.18.1354048583891;
	Tue, 27 Nov 2012 12:36:23 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id e2sm42848461eeo.8.2012.11.27.12.36.22
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 27 Nov 2012 12:36:23 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 27 Nov 2012 21:33:58 +0100
Message-Id: <9ff6421501a6844b087be1fae45f826055b22bf9.1354034591.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0
In-Reply-To: <cover.1354034591.git.Martin.Jansa@gmail.com>
References: <cover.1354034591.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1354034591.git.Martin.Jansa@gmail.com>
References: <cover.1354034591.git.Martin.Jansa@gmail.com>
Subject: [PATCH 21/21] e-base.bbclass: bump EFL_SRCREV for E17 alpha5
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
X-List-Received-Date: Tue, 27 Nov 2012 20:55:34 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/classes/e-base.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-efl/classes/e-base.bbclass b/meta-efl/classes/e-base.bbclass
index 933ad76..4099351 100644
--- a/meta-efl/classes/e-base.bbclass
+++ b/meta-efl/classes/e-base.bbclass
@@ -2,7 +2,7 @@ HOMEPAGE = "http://www.enlightenment.org"
 SRCNAME ?= "${BPN}"
 SRCVER ?= "${PV}"
 
-EFL_SRCREV ?= "79502"
+EFL_SRCREV ?= "79741"
 
 ARM_INSTRUCTION_SET = "arm"
 
-- 
1.8.0



