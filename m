Received: from mail-da0-f45.google.com ([209.85.210.45])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UXDof-0001I4-37
	for openembedded-devel@lists.openembedded.org;
	Tue, 30 Apr 2013 18:54:13 +0200
Received: by mail-da0-f45.google.com with SMTP id v40so318829dad.18
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Apr 2013 09:36:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=95zwPeSAde6xnTkQiX6IgI+9apBO1nxOcWTRnVocbQQ=;
	b=kYwuA4ov4XLUf/zs4VGxBAxv8zYCyanCL2QJN7GgSgGaZBX4LRSCuCjRiGkg8G+aBy
	Pnpnl9gYAvCzLBG2tRe7+QbvcgRoWeMqaswnrm/EHHH3xKUIdk+vhnpHPLonMmGWT5Yg
	R9f65gHlXQD9/EWpxsYyT8M0DFYTFa45AmOLsl3Cmj3z/dE3u8s0CLS11YM3TatREf9y
	pDktxa6N29QRUglivftTNgrUI+Gb4hb8hYe9JgQ8KXwXqgUIiJxVVjMR+Se+KQxkrrJ7
	dNz16v4CWqIT6eqVZ05CiWHMaHCevsCLmobVvvRKKEKjWFAEIE08s/KU14GEzeWXYykj
	fbqA==
X-Received: by 10.66.19.234 with SMTP id i10mr40463235pae.152.1367339761116;
	Tue, 30 Apr 2013 09:36:01 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	iy2sm29100209pbb.31.2013.04.30.09.35.57 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 30 Apr 2013 09:36:00 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 30 Apr 2013 18:32:58 +0200
Message-Id: <c9d9301ffd897b231985baf26e0565df6314a65f.1367339449.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.2.1
In-Reply-To: <cover.1367339449.git.Martin.Jansa@gmail.com>
References: <cover.1367339449.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1367339449.git.Martin.Jansa@gmail.com>
References: <cover.1367339449.git.Martin.Jansa@gmail.com>
Cc: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
Subject: [meta-oe][dylan][PATCH 08/12] meta-ruby: Fix subject-prefix
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
X-List-Received-Date: Tue, 30 Apr 2013 16:54:28 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-ruby/README | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-ruby/README b/meta-ruby/README
index 4f39aba..9ef9986 100644
--- a/meta-ruby/README
+++ b/meta-ruby/README
@@ -8,8 +8,8 @@ URI: git://git.openembedded.org/meta-openembedded
 branch: dylan
 revision: HEAD
 
-Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-oe][dylan]' in the subject'
+Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-ruby][dylan]' in the subject'
 
-When sending single patches, please using something like 'git send-email -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-oe][dylan][PATCH'
+When sending single patches, please using something like 'git send-email -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-ruby][dylan][PATCH'
 
 Interim layer maintainer: Martin Jansa <Martin.Jansa@gmail.com>
-- 
1.8.2.1



