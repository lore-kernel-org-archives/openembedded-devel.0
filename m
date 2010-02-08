Received: from mail-fx0-f227.google.com ([209.85.220.227])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rep.dot.nop@gmail.com>) id 1NeaxB-0004Io-F1
	for openembedded-devel@lists.openembedded.org;
	Mon, 08 Feb 2010 22:15:36 +0100
Received: by mail-fx0-f227.google.com with SMTP id 27so1137661fxm.27
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 08 Feb 2010 13:13:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:received:from:to:cc:subject
	:date:message-id:x-mailer:in-reply-to:references;
	bh=31Y9voM4r3sf3S70a7k2Gt+B15JAwuwtpsEZXMey83s=;
	b=hHPQ8nohu6o5amPUatuHm7Ec/ZnOG+TPFt2qp9UG5DR6NkfmUiLK3VtNv9YxWW7YyQ
	wsbyEBR7bQOY4yhi+DVe1mzTX6uIespvtg/okgpql8Ytp0kTl7JdzO6ULQa3SmFLF1nz
	xZQHzEK9cjX//KqMH9cU3AP25sGYuDfEZ2cno=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=Ca9SszeQ1Eyhfb69t+ipXByz95OcvLrmg3jFp8V6Y13kcMS8SqOADmnEjUS79+MAbt
	/TzBpjWCLEgKq57apgZ9krrPYjr1oXQsPY1inAZkGH0M05JLBAG1HhJjTePiaYZDj2SL
	xSsQCGMzN/0BlImzsJV/EmuSG/72LN3kdKBCA=
Received: by 10.223.101.148 with SMTP id c20mr3671200fao.94.1265663583239;
	Mon, 08 Feb 2010 13:13:03 -0800 (PST)
Received: from s42.loc ([84.119.103.202])
	by mx.google.com with ESMTPS id g28sm7233548fkg.38.2010.02.08.13.12.56
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 08 Feb 2010 13:12:57 -0800 (PST)
Received: from cow by s42.loc with local (Exim 4.71)
	(envelope-from <rep.dot.nop@gmail.com>)
	id 1NeawH-0004GJ-GS; Mon, 08 Feb 2010 22:14:37 +0100
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  8 Feb 2010 22:14:29 +0100
Message-Id: <1265663673-16312-9-git-send-email-rep.dot.nop@gmail.com>
X-Mailer: git-send-email 1.6.5
In-Reply-To: <1265663673-16312-8-git-send-email-rep.dot.nop@gmail.com>
References: <1265663673-16312-1-git-send-email-rep.dot.nop@gmail.com>
	<1265663673-16312-2-git-send-email-rep.dot.nop@gmail.com>
	<1265663673-16312-3-git-send-email-rep.dot.nop@gmail.com>
	<1265663673-16312-4-git-send-email-rep.dot.nop@gmail.com>
	<1265663673-16312-5-git-send-email-rep.dot.nop@gmail.com>
	<1265663673-16312-6-git-send-email-rep.dot.nop@gmail.com>
	<1265663673-16312-7-git-send-email-rep.dot.nop@gmail.com>
	<1265663673-16312-8-git-send-email-rep.dot.nop@gmail.com>
X-SA-Exim-Connect-IP: 209.85.220.227
X-SA-Exim-Mail-From: rep.dot.nop@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH 08/12] commentary typo fix
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
X-List-Received-Date: Mon, 08 Feb 2010 21:15:37 -0000

Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
---
 recipes/uclibc/uclibc_git.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes/uclibc/uclibc_git.bb b/recipes/uclibc/uclibc_git.bb
index 5f44466..757a538 100644
--- a/recipes/uclibc/uclibc_git.bb
+++ b/recipes/uclibc/uclibc_git.bb
@@ -1,4 +1,4 @@
-# UCLIBC_BASE should be the latest released revision of uclibc (that way
+# UCLIBC_BASE should be the latest released version of uclibc (that way
 # the config files will typically be correct!)  uclibc-svn takes precedence
 # over uclibc-${UCLIBC_BASE}, if a config file in uclibc-snv is out of date
 # try removing it
-- 
1.6.5



