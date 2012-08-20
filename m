Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1T3N76-0008QF-Ey
	for openembedded-devel@lists.openembedded.org;
	Mon, 20 Aug 2012 10:13:32 +0200
Received: by mail-wg0-f43.google.com with SMTP id dr1so4517151wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Aug 2012 01:01:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=5QfbAfgZ6MEgHpRZVlAMPdbzAKaXKbxnh9KhL0sZigo=;
	b=BGlp8IAecVjuzGAqaxTte0YAL5H//W/9VGltzBEivEvfI0/eXnHLzsa4185ojQXg5k
	JYNSEOcvSe4NIprXIFERTL6SucA3b2ZlG4XNGbUWEae5z/wkfSZ+hgdy0mYXM27NH5Na
	n87eEYFjIeBuOJZsVJNAYlgu/S5U9Uk1sVuZtEfiB8MVg3eK9V0PuV/wMm3vZ29wu7sE
	vQfHxm9qd8UTWqxdz8EJgkZACEbubcnFaJCac5eQcieajE5UorRT9E6ri3cqf7RP+KPD
	g8fPTeFwm6lc5Yz6iBvaT6BTMPJeXZUq7Gyd4EUwb6HOU5P3Jtvagte8jImcc2WTuIoR
	8Plw==
Received: by 10.216.135.148 with SMTP id u20mr6630843wei.137.1345449692594;
	Mon, 20 Aug 2012 01:01:32 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id ck9sm39788221wib.2.2012.08.20.01.01.30
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 20 Aug 2012 01:01:31 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 20 Aug 2012 10:00:54 +0200
Message-Id: <162776afa47a9dea8487ed68431dcba7155acb66.1345449578.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
In-Reply-To: <7c28fa0c71de1b487d05695b8401333140bc76b5.1345449578.git.Martin.Jansa@gmail.com>
References: <cover.1344601517.git.Martin.Jansa@gmail.com>
	<7c28fa0c71de1b487d05695b8401333140bc76b5.1345449578.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1345449578.git.Martin.Jansa@gmail.com>
References: <cover.1345449578.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][meta-efl][PATCH 51/52] expedite: move to efl subdir
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
X-List-Received-Date: Mon, 20 Aug 2012 08:13:32 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/{e17 => efl}/expedite.inc     |    0
 .../{e17 => efl}/expedite_1.6.99-beta.bb           |    0
 meta-efl/recipes-efl/{e17 => efl}/expedite_svn.bb  |    0
 3 files changed, 0 insertions(+), 0 deletions(-)
 rename meta-efl/recipes-efl/{e17 => efl}/expedite.inc (100%)
 rename meta-efl/recipes-efl/{e17 => efl}/expedite_1.6.99-beta.bb (100%)
 rename meta-efl/recipes-efl/{e17 => efl}/expedite_svn.bb (100%)

diff --git a/meta-efl/recipes-efl/e17/expedite.inc b/meta-efl/recipes-efl/efl/expedite.inc
similarity index 100%
rename from meta-efl/recipes-efl/e17/expedite.inc
rename to meta-efl/recipes-efl/efl/expedite.inc
diff --git a/meta-efl/recipes-efl/e17/expedite_1.6.99-beta.bb b/meta-efl/recipes-efl/efl/expedite_1.6.99-beta.bb
similarity index 100%
rename from meta-efl/recipes-efl/e17/expedite_1.6.99-beta.bb
rename to meta-efl/recipes-efl/efl/expedite_1.6.99-beta.bb
diff --git a/meta-efl/recipes-efl/e17/expedite_svn.bb b/meta-efl/recipes-efl/efl/expedite_svn.bb
similarity index 100%
rename from meta-efl/recipes-efl/e17/expedite_svn.bb
rename to meta-efl/recipes-efl/efl/expedite_svn.bb
-- 
1.7.8.6



