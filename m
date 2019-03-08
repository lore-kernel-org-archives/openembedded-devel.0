Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 059047C88C
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  8 Mar 2019 09:06:59 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 44G1pW0sHJz2s;
	Fri,  8 Mar 2019 10:06:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1552036019;
	bh=Qc+cJcq6m7PVgSObhWTGXfz9YW2Z9CBWK0E+DzfNLAc=;
	h=From:To:Cc:Subject:Date:From;
	b=B3jiJaH8F3J67Abmwdf4AWkv/6UcQBeNeo0G8O22SAyfOHpg5TM5yF7XyD7z8thrM
	O/B146D0T9F9sHYFbYV6VGn1yUzcnTwkaR2u5qLAFL3NnU3UTEeII3php7A3mIJZOc
	LDFMTFd05Ej4xvGjdhi3cGosAYrvJq8e/b7guJZTcQz8Is1a1H3TJ36petGkem4+xB
	qRppVmxfst0Nu+1ftyAHueWf+PPHOi18NhH4qevbV3dn11zm0GML0SIXI/6cudxkN8
	AS7k1rilwLA2P3hAPNVV+JA0YSlUyqAx9UDAWTtsN6R7OE/T/YXnSIqy3PKA3CNwdM
	FL/sj9a7zLtVS4iKIFRsIhYzYerj059qJCSwO5DUwh5DayTwq+gU32rTxWroZ7OSJZ
	+L+PEZjLR36Kfs8vKCA6SS8ttzkuo/gtB2C4vkGjjvkLBZNDxsj8/6rw12/hZfy3Rg
	OTf8ZgJqwveivjxAPKxAfe/RNEWhZnB5sbEME+MnnTa+ReQT98nSz6AyuNlJawaa7o
	Vm2tbTcmKqBF1/5eSShq2A1PWXH5U3BD0ysCvhOsRJIoVpEtuKAQfIDNV0q0fK/Eb+
	/44V5UePoRKFHefnjen4NQp2WXqY9eVl/DwhNIngChJg69SZHVl2b+2WBnwxIkRpgk
	AMqSDPUmGnrk8B41VNHEU5S4=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  8 Mar 2019 11:06:57 +0200
Message-Id: <20190308090657.4180-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Cc: Tom Rini <trini@konsulko.com>
Subject: [meta-oe][PATCH] Also remove meta-oe/licenses/vim
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
X-List-Received-Date: Fri, 08 Mar 2019 09:07:00 -0000

vim moved to OE-core.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 meta-oe/licenses/vim | 81 --------------------------------------------
 1 file changed, 81 deletions(-)
 delete mode 100644 meta-oe/licenses/vim

diff --git a/meta-oe/licenses/vim b/meta-oe/licenses/vim
deleted file mode 100644
index 4aa818eb2..000000000
--- a/meta-oe/licenses/vim
+++ /dev/null
@@ -1,81 +0,0 @@
-VIM LICENSE
-
-I)  There are no restrictions on distributing unmodified copies of Vim except
-    that they must include this license text.  You can also distribute
-    unmodified parts of Vim, likewise unrestricted except that they must
-    include this license text.  You are also allowed to include executables
-    that you made from the unmodified Vim sources, plus your own usage
-    examples and Vim scripts.
-
-II) It is allowed to distribute a modified (or extended) version of Vim,
-    including executables and/or source code, when the following four
-    conditions are met:
-    1) This license text must be included unmodified.
-    2) The modified Vim must be distributed in one of the following five ways:
-       a) If you make changes to Vim yourself, you must clearly describe in
-	  the distribution how to contact you.  When the maintainer asks you
-	  (in any way) for a copy of the modified Vim you distributed, you
-	  must make your changes, including source code, available to the
-	  maintainer without fee.  The maintainer reserves the right to
-	  include your changes in the official version of Vim.  What the
-	  maintainer will do with your changes and under what license they
-	  will be distributed is negotiable.  If there has been no negotiation
-	  then this license, or a later version, also applies to your changes.
-	  The current maintainer is Bram Moolenaar <Bram@vim.org>.  If this
-	  changes it will be announced in appropriate places (most likely
-	  vim.sf.net, www.vim.org and/or comp.editors).  When it is completely
-	  impossible to contact the maintainer, the obligation to send him
-	  your changes ceases.  Once the maintainer has confirmed that he has
-	  received your changes they will not have to be sent again.
-       b) If you have received a modified Vim that was distributed as
-	  mentioned under a) you are allowed to further distribute it
-	  unmodified, as mentioned at I).  If you make additional changes the
-	  text under a) applies to those changes.
-       c) Provide all the changes, including source code, with every copy of
-	  the modified Vim you distribute.  This may be done in the form of a
-	  context diff.  You can choose what license to use for new code you
-	  add.  The changes and their license must not restrict others from
-	  making their own changes to the official version of Vim.
-       d) When you have a modified Vim which includes changes as mentioned
-	  under c), you can distribute it without the source code for the
-	  changes if the following three conditions are met:
-	  - The license that applies to the changes permits you to distribute
-	    the changes to the Vim maintainer without fee or restriction, and
-	    permits the Vim maintainer to include the changes in the official
-	    version of Vim without fee or restriction.
-	  - You keep the changes for at least three years after last
-	    distributing the corresponding modified Vim.  When the maintainer
-	    or someone who you distributed the modified Vim to asks you (in
-	    any way) for the changes within this period, you must make them
-	    available to him.
-	  - You clearly describe in the distribution how to contact you.  This
-	    contact information must remain valid for at least three years
-	    after last distributing the corresponding modified Vim, or as long
-	    as possible.
-       e) When the GNU General Public License (GPL) applies to the changes,
-	  you can distribute the modified Vim under the GNU GPL version 2 or
-	  any later version.
-    3) A message must be added, at least in the output of the ":version"
-       command and in the intro screen, such that the user of the modified Vim
-       is able to see that it was modified.  When distributing as mentioned
-       under 2)e) adding the message is only required for as far as this does
-       not conflict with the license used for the changes.
-    4) The contact information as required under 2)a) and 2)d) must not be
-       removed or changed, except that the person himself can make
-       corrections.
-
-III) If you distribute a modified version of Vim, you are encouraged to use
-     the Vim license for your changes and make them available to the
-     maintainer, including the source code.  The preferred way to do this is
-     by e-mail or by uploading the files to a server and e-mailing the URL.
-     If the number of changes is small (e.g., a modified Makefile) e-mailing a
-     context diff will do.  The e-mail address to be used is
-     <maintainer@vim.org>
-
-IV)  It is not allowed to remove this license from the distribution of the Vim
-     sources, parts of it or from a modified version.  You may use this
-     license for previous Vim releases instead of the license that they came
-     with, at your option.
-
-===
-Read more about this license at http://vimdoc.sourceforge.net/htmldoc/uganda.html#license
-- 
2.17.1


