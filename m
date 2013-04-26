Received: from mail-pd0-f169.google.com ([209.85.192.169])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UVj6f-0001f5-Jr
	for openembedded-devel@lists.openembedded.org;
	Fri, 26 Apr 2013 15:54:48 +0200
Received: by mail-pd0-f169.google.com with SMTP id 10so2475111pdc.28
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Apr 2013 06:36:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=9S98bkyYsYGe2WwLhIqpaB7Walwmk39xDuP+ARIZtyU=;
	b=zYFt4id+xSnOUfVpE6d7hbOizBLdrYROVNA3ISWHPNM0LkIQgfTM16YKQGoIe3eGiX
	aeRa7RqvMoIB9c25yCLZBbjVPfaQMumjiM8/O43g4P/IeOeTU8sYw0LCaz25WZznQ6C7
	FpJu2doHOa/Nu3hgRbooyKrb9cNS5ZFuIqJ7vvMQUPD2h7GOO+L6d/v3eCeungAhVDQ1
	LP6cpXnf4/Ekq4M9hf/pJ7CVvlBRwD5s2nDpDvYWd4A5fGBbNQird//YalDSoc60oThE
	has0Ds62g8Er+vKSIfpixEm/3KpcrgLAQ8hN6QbZeSk4jNiMLjS8eA9+pjAWH0QsslA0
	q+LQ==
X-Received: by 10.68.138.7 with SMTP id qm7mr60501764pbb.169.1366983408176;
	Fri, 26 Apr 2013 06:36:48 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	be7sm12789793pad.20.2013.04.26.06.36.45 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 26 Apr 2013 06:36:47 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 26 Apr 2013 15:36:24 +0200
Message-Id: <1366983384-31049-4-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.2.1
In-Reply-To: <1366983384-31049-1-git-send-email-Martin.Jansa@gmail.com>
References: <1366983384-31049-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 4/4] meta-ruby: Fix subject-prefix
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
X-List-Received-Date: Fri, 26 Apr 2013 13:54:58 -0000

---
 meta-ruby/README | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-ruby/README b/meta-ruby/README
index cf2f405..7d8875e 100644
--- a/meta-ruby/README
+++ b/meta-ruby/README
@@ -8,9 +8,9 @@ URI: git://git.openembedded.org/meta-openembedded
 branch: master
 revision: HEAD
 
-Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-oe]' in the subject'
+Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-ruby]' in the subject'
 
 When sending single patches, please using something like:
-'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-oe][PATCH'
+'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-ruby][PATCH'
 
 Interim layer maintainer: Martin Jansa <Martin.Jansa@gmail.com>
-- 
1.8.2.1



