Received: from mail-ea0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TjHhZ-0006vY-1C
	for openembedded-devel@lists.openembedded.org;
	Thu, 13 Dec 2012 23:56:25 +0100
Received: by mail-ea0-f175.google.com with SMTP id h11so957054eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Dec 2012 14:41:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=iwaj6PIeSr+pENvyrciOydlWj8MvIwgbW9A03wHAmJM=;
	b=C2yrHZ+Q4ZgkmJcOg68V2vpqCwIGjlNuK7H3hPGf2mIX3+DpYGF5gKBubQsB6wT3Ol
	zNLJ+SnwTWfaUE9mrOCg1o5tlm7MsBQ8DXFA/g4b6h+YTFyxrqcnHBjcmwFnTxKKSQaV
	AcPeOMkryHK+hq2qkfju6aCzYzmdaNXKqIYVsDImKmU++NZuRtWpIdRBGZNtqoXT/GJh
	dofMoBr7FulZ7iSBFDGEAh1RUanWPQw1fCOZI9Uk4usEVR/Ofpu6g7aylT8fd99V28Iv
	hUvkJGeUVKmGPYUyfAhaDNe53qlG20y4f9Rt9DEQDW5w3xfXe2ZgQJdEPL8M8eFT+D2e
	56xw==
Received: by 10.14.175.133 with SMTP id z5mr9313061eel.15.1355438509752;
	Thu, 13 Dec 2012 14:41:49 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id 44sm5697599eek.0.2012.12.13.14.41.46
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 13 Dec 2012 14:41:49 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 13 Dec 2012 23:41:43 +0100
Message-Id: <2985ea253c344762a801c12ed42a45aee000744c.1355438402.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0.2
In-Reply-To: <cover.1355438401.git.Martin.Jansa@gmail.com>
References: <cover.1355438401.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1355438401.git.Martin.Jansa@gmail.com>
References: <cover.1355438401.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 03/11] qt4: rename bbappends to match new 4.8.4 version from oe-core
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
X-List-Received-Date: Thu, 13 Dec 2012 22:56:25 -0000

From: Martin Jansa <martin.jansa@gmail.com>

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../qt4/{qt4-embedded_4.8.3.bbappend => qt4-embedded_4.8.4.bbappend}      | 0
 .../qt4/{qt4-x11-free_4.8.3.bbappend => qt4-x11-free_4.8.4.bbappend}      | 0
 2 files changed, 0 insertions(+), 0 deletions(-)
 rename meta-oe/recipes-qt/qt4/{qt4-embedded_4.8.3.bbappend => qt4-embedded_4.8.4.bbappend} (100%)
 rename meta-oe/recipes-qt/qt4/{qt4-x11-free_4.8.3.bbappend => qt4-x11-free_4.8.4.bbappend} (100%)

diff --git a/meta-oe/recipes-qt/qt4/qt4-embedded_4.8.3.bbappend b/meta-oe/recipes-qt/qt4/qt4-embedded_4.8.4.bbappend
similarity index 100%
rename from meta-oe/recipes-qt/qt4/qt4-embedded_4.8.3.bbappend
rename to meta-oe/recipes-qt/qt4/qt4-embedded_4.8.4.bbappend
diff --git a/meta-oe/recipes-qt/qt4/qt4-x11-free_4.8.3.bbappend b/meta-oe/recipes-qt/qt4/qt4-x11-free_4.8.4.bbappend
similarity index 100%
rename from meta-oe/recipes-qt/qt4/qt4-x11-free_4.8.3.bbappend
rename to meta-oe/recipes-qt/qt4/qt4-x11-free_4.8.4.bbappend
-- 
1.8.0.2



