Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f179.google.com (mail-ea0-f179.google.com
	[209.85.215.179])
	by mail.openembedded.org (Postfix) with ESMTP id BA50160167
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 Feb 2014 22:22:24 +0000 (UTC)
Received: by mail-ea0-f179.google.com with SMTP id q10so2735386ead.10
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 Feb 2014 14:22:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=nKcO50nZspIFddbo5Caz6DmHHMGrrpSskQAl/C8NtNE=;
	b=p4veINiCNAfEs5SM6+c/58B0f92ZrpN+ejHMAZwdv/q3a1U9w7KxopJLGBYLluZ7pd
	g3b4z5Ju/YzHuS+QDK+tOIPFcgVK84VhCWHJuBSXSQPY/BZFDbQ50hs2sG3z2pTKwfuo
	9PSOte8KXsSURDVMLih+q4PdYsA+qQMHjOGlJpkYQo5XaqLkLndr3YyTXdoa2M9FDwSQ
	NBcwg0aygbPAIH4KxrKXeYHXcc9TTjMqJ7QcLIOVpsp7cLMsnT+jvi20lFqJBpjnmh17
	USpNEz+mYAp4iERvZMZN3KKdQI9ODIcDrO+7Su0KjTPNgvIDm7NNdbHKy6KU2A0Rw0Dy
	Qprw==
X-Received: by 10.14.179.73 with SMTP id g49mr20712796eem.71.1393194145114;
	Sun, 23 Feb 2014 14:22:25 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	x6sm56088077eew.20.2014.02.23.14.22.23 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 23 Feb 2014 14:22:24 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 23 Feb 2014 23:22:19 +0100
Message-Id: <1393194140-24218-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.9.0
Subject: [meta-oe][meta-efl][PATCH 1/2] screenshot: Move to nonworking because depends on emprint
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 23 Feb 2014 22:22:27 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../e17/{ => nonworking}/screenshot/screenshot-fix-mkinstalldirs.patch    | 0
 meta-efl/recipes-efl/e17/{ => nonworking}/screenshot_svn.bb               | 0
 2 files changed, 0 insertions(+), 0 deletions(-)
 rename meta-efl/recipes-efl/e17/{ => nonworking}/screenshot/screenshot-fix-mkinstalldirs.patch (100%)
 rename meta-efl/recipes-efl/e17/{ => nonworking}/screenshot_svn.bb (100%)

diff --git a/meta-efl/recipes-efl/e17/screenshot/screenshot-fix-mkinstalldirs.patch b/meta-efl/recipes-efl/e17/nonworking/screenshot/screenshot-fix-mkinstalldirs.patch
similarity index 100%
rename from meta-efl/recipes-efl/e17/screenshot/screenshot-fix-mkinstalldirs.patch
rename to meta-efl/recipes-efl/e17/nonworking/screenshot/screenshot-fix-mkinstalldirs.patch
diff --git a/meta-efl/recipes-efl/e17/screenshot_svn.bb b/meta-efl/recipes-efl/e17/nonworking/screenshot_svn.bb
similarity index 100%
rename from meta-efl/recipes-efl/e17/screenshot_svn.bb
rename to meta-efl/recipes-efl/e17/nonworking/screenshot_svn.bb
-- 
1.9.0


