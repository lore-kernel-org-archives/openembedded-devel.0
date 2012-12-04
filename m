Received: from mail-ea0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TfyHu-0003Gh-8m
	for openembedded-devel@lists.openembedded.org;
	Tue, 04 Dec 2012 20:36:14 +0100
Received: by mail-ea0-f175.google.com with SMTP id h11so1700818eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 04 Dec 2012 11:21:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=rq4uo9qNgyOl1BJKLjSukG7Wl86nmF71IS02suI1rzY=;
	b=vMkJd8ZVzxW86Mz/LwB1akKPqg4rrhyV5ASxpB3Z5fClRFvDkSkuVlXqkrZ1wkfxgG
	LDpgI4mQ23bP+NyUkKqhOjKez0432Ewf+wDbthY28RikbA4SLCBPQizbUO9oKx9YsibL
	/DCpiGe3YhsHtn8wQQtOJoP4sZx+jpFVf5kSi4biDJBicpQ7GKkqX72yXwvJLe6E1Qll
	CfaXyRPK4ipCx8zVFN0joT8NRmlckRUvtzfQBTPbEehP5IAv0MWKq+46bCTW8JWta4W+
	Gj2vexTrUXY1IsMp96J7oo4SZZ9KX04iNlU7suOuGIBlxJcolL+y0We+nS6SGEUyotAW
	/j9w==
Received: by 10.14.208.137 with SMTP id q9mr51599068eeo.28.1354648913689;
	Tue, 04 Dec 2012 11:21:53 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id 44sm4339155eek.0.2012.12.04.11.21.52
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 04 Dec 2012 11:21:53 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  4 Dec 2012 20:21:30 +0100
Message-Id: <aec696511415aa7c457cda0d26d436dae23abcf3.1354646880.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0
In-Reply-To: <355794a5881513c8e8ef22d76e9224f3149d4d3c.1354646880.git.Martin.Jansa@gmail.com>
References: <cover.1354586187.git.Martin.Jansa@gmail.com>
	<355794a5881513c8e8ef22d76e9224f3149d4d3c.1354646880.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1354646880.git.Martin.Jansa@gmail.com>
References: <cover.1354646880.git.Martin.Jansa@gmail.com>
Subject: [PATCH 61/64] e-base.bbclass: bump EFL_SRCREV for E17 alpha8
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
X-List-Received-Date: Tue, 04 Dec 2012 19:36:14 -0000

* changelog: http://enlightenment.org/p.php?p=news/show&l=en&news_id=69

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/classes/e-base.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-efl/classes/e-base.bbclass b/meta-efl/classes/e-base.bbclass
index 7b42e44..ab0063b 100644
--- a/meta-efl/classes/e-base.bbclass
+++ b/meta-efl/classes/e-base.bbclass
@@ -2,7 +2,7 @@ HOMEPAGE = "http://www.enlightenment.org"
 SRCNAME ?= "${BPN}"
 SRCVER ?= "${PV}"
 
-EFL_SRCREV ?= "79912"
+EFL_SRCREV ?= "80174"
 
 ARM_INSTRUCTION_SET = "arm"
 
-- 
1.8.0



