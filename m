Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RaPwu-00055r-0E
	for openembedded-devel@lists.openembedded.org;
	Tue, 13 Dec 2011 11:51:04 +0100
Received: by mail-yx0-f175.google.com with SMTP id m12so4873540yen.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Dec 2011 02:44:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=50OrO6NtDIQEQ3BbaQpzul08HFXML0TDBnhtBYwaXGA=;
	b=j38pMAVYQZinWFwCExp47H8XHgYR31sJMn8KqCtFuUTsSrLx7kDIYqXsaeNz2RrEET
	zqYDkW0MtK4i6fkmqqlVIYTxlaRfqr3eCXHJMwOMkzWjp30IVogw8S7RS9klQ3vjL60n
	auUORdL8mP1X0D1K8PJDkvC2EHBCMC+uYko+k=
Received: by 10.236.91.84 with SMTP id g60mr2655448yhf.90.1323773050700;
	Tue, 13 Dec 2011 02:44:10 -0800 (PST)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id 37sm33437204anu.21.2011.12.13.02.44.08
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 13 Dec 2011 02:44:10 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 13 Dec 2011 10:43:46 +0000
Message-Id: <670a53f897525652548ec3eeb2b4bf2a8ef3924b.1323772987.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1323772986.git.otavio@ossystems.com.br>
References: <cover.1323772986.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1323772986.git.otavio@ossystems.com.br>
References: <cover.1323772986.git.otavio@ossystems.com.br>
Subject: [meta-oe][PATCH 4/4] qconnman: bump SRCREV
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
X-List-Received-Date: Tue, 13 Dec 2011 10:51:05 -0000

 * add translation support
 * doesn't allow simultaneous connections

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta-oe/recipes-qt/qconnman/qconnman.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta-oe/recipes-qt/qconnman/qconnman.inc b/meta-oe/recipes-qt/qconnman/qconnman.inc
index 280a002..06ad5fd 100644
--- a/meta-oe/recipes-qt/qconnman/qconnman.inc
+++ b/meta-oe/recipes-qt/qconnman/qconnman.inc
@@ -9,7 +9,7 @@ PR = "r1"
 inherit autotools
 
 PV = "0.0+gitr${SRCPV}"
-SRCREV = "9bab120f426e41552c369b7030414c792dd25a91"
+SRCREV = "f976b18c7c5584627224784801803e9fd3ebe0ff"
 SRC_URI = "git://github.com/OSSystems/qconnman.git"
 
 S = "${WORKDIR}/git/"
-- 
1.7.2.5



