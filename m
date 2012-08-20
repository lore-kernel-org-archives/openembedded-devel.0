Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1T3ZDk-0006ex-Rb
	for openembedded-devel@lists.openembedded.org;
	Mon, 20 Aug 2012 23:09:12 +0200
Received: by mail-we0-f175.google.com with SMTP id r6so4416325wey.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Aug 2012 13:57:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=Zi6Y4UzgziNb7OYTyhR6OmY9J+N+Hxx/KYQkaQdLm6o=;
	b=uzqniYpdGueAzjzj6AdOGC0GUstlAsvcqCAflxViqMjH94EMis8nWhNcP6PN00TCGC
	vEA/aHrMUZZ9VZIPA1JSK5bYjq4DFNQGWiwqvSMA9Ai3/duoZNo9qDJnECQ0JS7KS18X
	7CyNo34hfsHJjcygRwyvk4GMdhRTKYhCARDNW/nvFpNKfY8/KWpLCJzEvXGpevc11QnN
	KjTy+F18kIoFRj0DXxYX3D5vlLh5DU9SM+4mgMPX8Bbu3o5X07dINy5HDpaPesSyQSBY
	gxfdvDpTmBjj7uGYaV9iulO+WwoxxhqSMJ3nsfxYsf7ex9axFIk0iD5esN6QxE/kofyM
	igGA==
Received: by 10.180.105.130 with SMTP id gm2mr30594702wib.6.1345496232229;
	Mon, 20 Aug 2012 13:57:12 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id ck9sm44366614wib.2.2012.08.20.13.57.10
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 20 Aug 2012 13:57:11 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 20 Aug 2012 22:56:32 +0200
Message-Id: <b61b6ec8540ec9a73a75bfcb0020e08f55a8d6f1.1345496053.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
In-Reply-To: <cover.1345496053.git.Martin.Jansa@gmail.com>
References: <cover.1345496053.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1345496053.git.Martin.Jansa@gmail.com>
References: <cover.1345496053.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 5/8] connman: rename bbappend to match new 1.4 version from oe-core
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
X-List-Received-Date: Mon, 20 Aug 2012 21:09:13 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../{connman_1.3.bbappend => connman_1.4.bbappend} |    0
 1 files changed, 0 insertions(+), 0 deletions(-)
 rename meta-systemd/meta-oe/recipes-connectivity/connman/{connman_1.3.bbappend => connman_1.4.bbappend} (100%)

diff --git a/meta-systemd/meta-oe/recipes-connectivity/connman/connman_1.3.bbappend b/meta-systemd/meta-oe/recipes-connectivity/connman/connman_1.4.bbappend
similarity index 100%
rename from meta-systemd/meta-oe/recipes-connectivity/connman/connman_1.3.bbappend
rename to meta-systemd/meta-oe/recipes-connectivity/connman/connman_1.4.bbappend
-- 
1.7.8.6



