Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Q8tyw-0001o3-JZ
	for openembedded-devel@lists.openembedded.org;
	Sun, 10 Apr 2011 14:43:10 +0200
Received: by bwz5 with SMTP id 5so4004112bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Apr 2011 05:40:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=RgIGUYtLEe44TP9gpbJHTsvDZ/XkL3BWSBN85cnx+2M=;
	b=kzhtyR1FZMHyw0xeWYBt6Vt7bcAjt8M4D6C9ifphCKKR1YqYEJ0mkBmILoYuA95ps/
	daFBrJ+W5XPdUZRUEvhr5Wz+b8zcqGEm2yCPCeq+07kdnRdeJMiqdNV7ZjjMASNcs1bb
	hEnpE4OAbtcMTeu6N7zqYvKBylG3tLHlLB08Y=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=RA9TLlD01OOKu8DB7r2AsIAlSk15N2y/Q6kb1B+QMbyatIqDu3bkFQWTlQRZLjG50e
	WJjLWubD0jrsc6S6vUAJXvJRjn4rva/uhdFMf6kNqwH430x304tXsU3aLW03Dp81TddY
	XyRfH+WqOeF718AU5Ot8+r1osB11o/lZYBsxU=
Received: by 10.204.23.81 with SMTP id q17mr3888023bkb.2.1302439255093;
	Sun, 10 Apr 2011 05:40:55 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id l1sm2640831bkl.1.2011.04.10.05.40.53
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 10 Apr 2011 05:40:54 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 10 Apr 2011 14:40:52 +0200
Message-Id: <36837169207e7b6daf60fc1bf6370c6090ec1502.1302439112.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1302439112.git.Martin.Jansa@gmail.com>
References: <cover.1302439112.git.Martin.Jansa@gmail.com>
Subject: [PATCH 1/3] e-base: bump SRCREV
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
X-List-Received-Date: Sun, 10 Apr 2011 12:43:10 -0000

---
 meta-efl/classes/e-base.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta-efl/classes/e-base.bbclass b/meta-efl/classes/e-base.bbclass
index 2692cfe..b25ddf2 100644
--- a/meta-efl/classes/e-base.bbclass
+++ b/meta-efl/classes/e-base.bbclass
@@ -2,7 +2,7 @@ HOMEPAGE = "http://www.enlightenment.org"
 SRCNAME ?= "${BPN}"
 
 # usually tracks svn trunk HEAD
-EFL_SRCREV ?= "58315"
+EFL_SRCREV ?= "58429"
 # revision when 1.0.0 was released, for recipes which don't need rebuild so often
 EFL_SRCREV_1.0.0 ?= "56356"
 
-- 
1.7.4.1



