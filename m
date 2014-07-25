Return-Path: <paul.betafive@gmail.com>
Received: from mail-we0-f176.google.com (mail-we0-f176.google.com
	[74.125.82.176])
	by mail.openembedded.org (Postfix) with ESMTP id 30CFA6FEF8
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Jul 2014 11:56:52 +0000 (UTC)
Received: by mail-we0-f176.google.com with SMTP id q58so4146858wes.21
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Jul 2014 04:56:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id;
	bh=/QaZaOXfbuAi3jXy3+SfBpHeSKGOZUaJ44UOsPlItYQ=;
	b=qlQAaIAPuEd5TRENFsrUBFfge4nlZcOsjx+zmjlRTVI91LjtqJbKVP86jwZrwqUh1d
	I0opayujxmiBIWSrxPTpOwVkKCEkXteTtOWd/sUbqOA1t/YvcHt2eqpYgTa6jYy9rOGy
	kjoNlsR9m0YNWfE5O6BQCRv4Aw+xdMoP1cMT0rB1l2ShhEAaiiEZGaMqhYhwEviV2QxM
	vcpYNgOZK0GA6GATxbZzdmaRGK3kEIFyHPM/S0l9NEjLcxwZZI2FQVsZhtlS8i707mZF
	RrkWKzvrtp4b2DKc4AuOr+TJ2yFdqKvd1UMRRACVSXmMm7Fyih91qDmOD6wymobEBYTN
	MXGg==
X-Received: by 10.195.13.79 with SMTP id ew15mr20041092wjd.19.1406289412734;
	Fri, 25 Jul 2014 04:56:52 -0700 (PDT)
Received: from localhost.localdomain (ygg.betafive.co.uk. [5.9.90.21])
	by mx.google.com with ESMTPSA id
	au7sm24667703wjc.41.2014.07.25.04.56.51 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 25 Jul 2014 04:56:52 -0700 (PDT)
Sender: Paul Barker <paul.betafive@gmail.com>
From: Paul Barker <paul@paulbarker.me.uk>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 25 Jul 2014 11:56:41 +0000
Message-Id: <1406289401-25722-1-git-send-email-paul@paulbarker.me.uk>
X-Mailer: git-send-email 2.0.2
Subject: [meta-oe][PATCH] vim: Upgrade to v7.4.373
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
X-List-Received-Date: Fri, 25 Jul 2014 11:56:53 -0000

Signed-off-by: Paul Barker <paul@paulbarker.me.uk>
---
 meta-oe/recipes-support/vim/{vim_7.4.258.bb => vim_7.4.373.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/vim/{vim_7.4.258.bb => vim_7.4.373.bb} (99%)

diff --git a/meta-oe/recipes-support/vim/vim_7.4.258.bb b/meta-oe/recipes-support/vim/vim_7.4.373.bb
similarity index 99%
rename from meta-oe/recipes-support/vim/vim_7.4.258.bb
rename to meta-oe/recipes-support/vim/vim_7.4.373.bb
index 844be10..81c0ddf 100644
--- a/meta-oe/recipes-support/vim/vim_7.4.258.bb
+++ b/meta-oe/recipes-support/vim/vim_7.4.373.bb
@@ -10,7 +10,7 @@ SRC_URI = "hg://vim.googlecode.com/hg/;protocol=https;module=vim \
            file://disable_acl_header_check.patch;patchdir=.. \
            file://vim-add-knob-whether-elf.h-are-checked.patch;patchdir=.. \
 "
-SRCREV = "v7-4-258"
+SRCREV = "v7-4-373"
 
 S = "${WORKDIR}/${BPN}/src"
 
-- 
2.0.2


