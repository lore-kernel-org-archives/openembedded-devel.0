Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f196.google.com (mail-qt0-f196.google.com
	[209.85.216.196])
	by mail.openembedded.org (Postfix) with ESMTP id 30360606D1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Jul 2016 12:32:56 +0000 (UTC)
Received: by mail-qt0-f196.google.com with SMTP id j37so491389qta.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Jul 2016 05:32:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=5DvGXNU4BZAyaW8m4tgYsSSNeZ8iUAU/nckaAOEo6tA=;
	b=fN6922N8cChxPT8Z4WzwsMu3lTR4IhEi6d7ygX3zYv8qYKvIZLJdvyuIJOFo1ThTxi
	9qYXMC9V0ibHdY3TxBSyo+2dJf/Ex5v85iR0h9wMxxptmgD5ZViXBRi1Kn7lcKGj2dur
	PRPgfDJ7Z5Cv+O07CbAZ1jdbzPgz8eJZ1QbeCZ+0GgYEfgSlWx/cT94Q3NOk9OlGgBD1
	XjCiGzqjA4LcKmUZ+W5mutITo/5udvzNPVxKd0xjNjMw7CWONS91GjzCKmtPbcYEOnPk
	A3UZUWkm0W1S/hJG3bn5wLL7hcre5RYSF9bQ4RuwKOGAj6vNtqrYgAbcndbCMl06mC/O
	nxPA==
X-Gm-Message-State: ALyK8tIHEkFaCbS/BaBJyD87Wae7FYBVHGP+tjwPtydMGg9ePQSsJdpmxmmz2vnny4fnaQ==
X-Received: by 10.237.33.69 with SMTP id 63mr22001453qtc.45.1468153977267;
	Sun, 10 Jul 2016 05:32:57 -0700 (PDT)
Received: from lnx-desktop.minotaur.lab (c-73-172-178-168.hsd1.md.comcast.net.
	[73.172.178.168]) by smtp.gmail.com with ESMTPSA id
	w17sm2205131qtc.47.2016.07.10.05.32.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 10 Jul 2016 05:32:56 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 10 Jul 2016 08:32:45 -0400
Message-Id: <1468153965-26801-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 1.9.1
Subject: [meta-python][PATCH] python-visitor: update to version 0.1.3
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 10 Jul 2016 12:32:57 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/{python-visitor_0.1.2.bb => python-visitor_0.1.3.bb}       | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-visitor_0.1.2.bb => python-visitor_0.1.3.bb} (57%)

diff --git a/meta-python/recipes-devtools/python/python-visitor_0.1.2.bb b/meta-python/recipes-devtools/python/python-visitor_0.1.3.bb
similarity index 57%
rename from meta-python/recipes-devtools/python/python-visitor_0.1.2.bb
rename to meta-python/recipes-devtools/python/python-visitor_0.1.3.bb
index f53091e..1236506 100644
--- a/meta-python/recipes-devtools/python/python-visitor_0.1.2.bb
+++ b/meta-python/recipes-devtools/python/python-visitor_0.1.3.bb
@@ -2,7 +2,7 @@ SUMMARY = "A tiny pythonic visitor implementation."
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=8227180126797a0148f94f483f3e1489"
 
-SRC_URI[md5sum] = "e9471b44e5d426b0adf5d27694598be0"
-SRC_URI[sha256sum] = "d9444ffca56a46a920719460d4952f8c88f8fef97f1ea7d2b1f7c50f675022bd"
+SRC_URI[md5sum] = "94a024ed0ec1b02b4497c15267d319ca"
+SRC_URI[sha256sum] = "2c737903b2b6864ebc6167eef7cf3b997126f1aa94bdf590f90f1436d23e480a"
 
 inherit pypi setuptools
-- 
1.9.1


