Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Tfi1X-0001vt-L6
	for openembedded-devel@lists.openembedded.org;
	Tue, 04 Dec 2012 03:14:16 +0100
Received: by mail-ee0-f47.google.com with SMTP id e51so1925600eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 03 Dec 2012 17:59:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=9Dc+EFPPXpFwtkEpzcX1UToiFanZ3wFRZOEaQLqkj/4=;
	b=b8Fb+xYiaGAVyxpdGtzRjmbipcKAQFgzTnJGMzqoLPrpgbLH3SFtcSPs9wDyZIDTJA
	G4SwhZ4Y9/eSQf/VSYogiHjPQMNAf6IhBtjOEp+Qlk51NdfWQCAz6guRQoawK44UaEag
	/66NNy+5DXcHOVLk9ucBAfQQ3QDj6FHDcV4Aefqf4+RtSemuL6vU2SwxgrklTkPgVuCv
	rXeBvUkWMDpIOkGId4kK6EvBeFxYwpm0zx/u30nyWvJeBj8fDp9Oez7SgERu0WvqfKDV
	gjRLfH5DtqhgsuZFkDziyOulBJnFhCoPpCfBkFHEpEIHv+TPmkiDDeyJXtHwTnE+Uuh4
	pMog==
Received: by 10.14.225.4 with SMTP id y4mr13049716eep.6.1354586396065;
	Mon, 03 Dec 2012 17:59:56 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id 46sm34797675eeg.4.2012.12.03.17.59.55
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 03 Dec 2012 17:59:55 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  4 Dec 2012 02:58:35 +0100
Message-Id: <1ae7bff22e75265d5dcf77f05af57428147cac92.1354586187.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0
In-Reply-To: <cover.1354586187.git.Martin.Jansa@gmail.com>
References: <cover.1354586187.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1354586187.git.Martin.Jansa@gmail.com>
References: <cover.1354586187.git.Martin.Jansa@gmail.com>
Subject: [PATCH 02/58] e-base.bbclass: bump EFL_SRCREV for E17 alpha7
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
X-List-Received-Date: Tue, 04 Dec 2012 02:14:16 -0000

* changelog: http://enlightenment.org/p.php?p=news/show&l=en&news_id=68

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/classes/e-base.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-efl/classes/e-base.bbclass b/meta-efl/classes/e-base.bbclass
index 9ff0ffc..7b42e44 100644
--- a/meta-efl/classes/e-base.bbclass
+++ b/meta-efl/classes/e-base.bbclass
@@ -2,7 +2,7 @@ HOMEPAGE = "http://www.enlightenment.org"
 SRCNAME ?= "${BPN}"
 SRCVER ?= "${PV}"
 
-EFL_SRCREV ?= "79754"
+EFL_SRCREV ?= "79912"
 
 ARM_INSTRUCTION_SET = "arm"
 
-- 
1.8.0



