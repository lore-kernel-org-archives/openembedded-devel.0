Return-Path: <paul.betafive@gmail.com>
Received: from mail-la0-f47.google.com (mail-la0-f47.google.com
	[209.85.215.47])
	by mail.openembedded.org (Postfix) with ESMTP id 1FCA4607A9
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Oct 2014 14:01:10 +0000 (UTC)
Received: by mail-la0-f47.google.com with SMTP id pv20so1118596lab.34
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Oct 2014 07:01:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=68T/Pkezfcgo1QNHhcoGvklMW4bKLXEULjvwmMdA0P8=;
	b=tXzShM2QBmY9YqkPmm0gOp2MDrSW7f4JHu1lY5bFXEKVsj4KDZBRt7oLtCqGwwjmvD
	kv1JNu6u2tATpWLOubtFDvsJBjZlTEGWjXWgKrv2gRn9fGZgJHNYJnhfIRU52fUNlvQ1
	X3OajFsyiLFmlofziu7Z+O1hgO2ELxWp3euKWhmmX9+owKtTpisy6wiMB+pWrghYdNd5
	ZoNOq5rEwK+oLXp1RRwmJ9V37L1TAAMJJwUkX9kWFsajXdpC5XHF0sUuWv+F5524ooq5
	RmPwg5hvddsN2OklvKkDfv8ng2ZHdLy9HxnH72JGb/L9Zhf0HdQgatBb/xd2nKX4Od8R
	U9aA==
X-Received: by 10.112.11.201 with SMTP id s9mr16704322lbb.79.1413900070593;
	Tue, 21 Oct 2014 07:01:10 -0700 (PDT)
Received: from loki.localdomain (ygg.betafive.co.uk. [5.9.90.21])
	by mx.google.com with ESMTPSA id n10sm3818659laf.38.2014.10.21.07.01.09
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 21 Oct 2014 07:01:09 -0700 (PDT)
Sender: Paul Barker <paul.betafive@gmail.com>
From: Paul Barker <paul@paulbarker.me.uk>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 21 Oct 2014 14:01:02 +0000
Message-Id: <1413900063-1999-2-git-send-email-paul@paulbarker.me.uk>
X-Mailer: git-send-email 2.1.2
In-Reply-To: <1413900063-1999-1-git-send-email-paul@paulbarker.me.uk>
References: <1413900063-1999-1-git-send-email-paul@paulbarker.me.uk>
Subject: [meta-oe][PATCH 1/2] vim: Upgrade to v7.4.481
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
X-List-Received-Date: Tue, 21 Oct 2014 14:01:15 -0000

Signed-off-by: Paul Barker <paul@paulbarker.me.uk>
---
 meta-oe/recipes-support/vim/{vim_7.4.373.bb => vim_7.4.481.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/vim/{vim_7.4.373.bb => vim_7.4.481.bb} (99%)

diff --git a/meta-oe/recipes-support/vim/vim_7.4.373.bb b/meta-oe/recipes-support/vim/vim_7.4.481.bb
similarity index 99%
rename from meta-oe/recipes-support/vim/vim_7.4.373.bb
rename to meta-oe/recipes-support/vim/vim_7.4.481.bb
index 14fee3e..b85ff63 100644
--- a/meta-oe/recipes-support/vim/vim_7.4.373.bb
+++ b/meta-oe/recipes-support/vim/vim_7.4.481.bb
@@ -10,7 +10,7 @@ SRC_URI = "hg://vim.googlecode.com/hg/;protocol=https;module=vim \
            file://disable_acl_header_check.patch;patchdir=.. \
            file://vim-add-knob-whether-elf.h-are-checked.patch;patchdir=.. \
 "
-SRCREV = "v7-4-373"
+SRCREV = "v7-4-481"
 
 S = "${WORKDIR}/${BPN}/src"
 
-- 
2.1.2


