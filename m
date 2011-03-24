Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Q2twZ-0004AQ-Fd
	for openembedded-devel@lists.openembedded.org;
	Fri, 25 Mar 2011 00:27:55 +0100
Received: by mail-bw0-f47.google.com with SMTP id 10so577628bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Mar 2011 16:26:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=1vbPApUjLLExozdUMUw8oWUQO9ZFGdP/5cGBymnmHLM=;
	b=roPSt/9wOc/zrqdqnbMBUa30Mnmmb5blEOtHKLo277dn21ic4gUm2DYhFw4RaYJKer
	V2ZsWm/G1dCn9uJippyPBbjN2ZGisgfN4JeZoXSdqshkccIBmEL5b5h3mcVOHhZTaDW9
	jxkFcyw1N11G7MbqTF9eR4jIOKSPlIZ3nUEeI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=xTUHR3zGTS+eSz/j9UcvmTr9RVN+GOG2TVV5JN4pQeBkTBpSnf1g+k0HIYsAhNcR2K
	U4Nf7ZKBtmK5zs1XuCp6u04Fkmaqr5sXsQ0w0QHirk7pkF2fHTUhxpIer5lsXTd4Xv9S
	FQsF6XLZnx1IDAUJaVDTfh1JDMTQPqG3FV9kw=
Received: by 10.204.20.71 with SMTP id e7mr66053bkb.144.1301009164082;
	Thu, 24 Mar 2011 16:26:04 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id k5sm318329bku.16.2011.03.24.16.26.02
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 24 Mar 2011 16:26:03 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 25 Mar 2011 00:25:57 +0100
Message-Id: <8bb2fc4ac905fa4482aabceee171b878eda96054.1301008354.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1301008354.git.Martin.Jansa@gmail.com>
References: <cover.1301008354.git.Martin.Jansa@gmail.com>
Subject: [PATCH 5/8] efreet: add LIC_FILES_CHKSUM
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
X-List-Received-Date: Thu, 24 Mar 2011 23:27:55 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/efl/efreet.inc |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/meta-efl/recipes-efl/efl/efreet.inc b/meta-efl/recipes-efl/efl/efreet.inc
index 98fcb0a..227b620 100644
--- a/meta-efl/recipes-efl/efl/efreet.inc
+++ b/meta-efl/recipes-efl/efl/efreet.inc
@@ -1,6 +1,7 @@
 DESCRIPTION = "The Enlightenment freedesktop.org library"
 DEPENDS = "ecore"
 LICENSE = "MIT BSD"
+LIC_FILES_CHKSUM = "file://COPYING;md5=49e56d2cc74d0b06fce18906e6ebc9ae"
 
 inherit efl
 
-- 
1.7.4.1



