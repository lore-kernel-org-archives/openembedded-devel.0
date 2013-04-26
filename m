Received: from mail-pa0-f50.google.com ([209.85.220.50])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UVj6A-0001cJ-Lz
	for openembedded-devel@lists.openembedded.org;
	Fri, 26 Apr 2013 15:54:14 +0200
Received: by mail-pa0-f50.google.com with SMTP id bg4so2499796pad.9
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Apr 2013 06:36:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=l5dBZ8RchZDzZeIBZcwWaCPpVS6A4/X1qYLddr/JbaY=;
	b=WweRYECm6LPXKaomtTeFgpMkiuGFff5eKnLDpAoJ97LPGErsyZ0Ckg8kasSdUiZ10F
	mQu5rL/0uyrEcvOCkQ7Yty90wyoqkawGb0LAizREk18eiT1gjekOUMzdlQTEcDDZ/B8Z
	1Pq/aXAc4HlXj2Cu+kaIxkyJCn6N76ceUU2H12ZX+DIGWmkbY8rhxbc/BKuesFNYQrpx
	sJPt1+fWkUKAGdWBcrrFRp2FCglRrhjIEHHPyKLDq/+7BOTgWqpe9DXdMdntmZl3WCOz
	fGDAC4fzJ0Ad3rKCaKOEAHNYgC11x0MYvFI8IO9A7wnxJyzCFDQCtThsa97t5acptfGt
	TDkA==
X-Received: by 10.66.88.38 with SMTP id bd6mr22729439pab.184.1366983376081;
	Fri, 26 Apr 2013 06:36:16 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	wi6sm11750631pbc.22.2013.04.26.06.36.13 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 26 Apr 2013 06:36:14 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 26 Apr 2013 15:36:21 +0200
Message-Id: <1366983384-31049-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.2.1
Subject: [meta-oe][PATCH 1/4] README: add me to maintainers in some layers
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
X-List-Received-Date: Fri, 26 Apr 2013 13:54:25 -0000
X-List-Received-Date: Fri, 26 Apr 2013 13:54:25 -0000

---
 meta-efl/README        | 3 ++-
 meta-gpe/README        | 3 ++-
 meta-multimedia/README | 3 ++-
 meta-oe/README         | 2 +-
 meta-systemd/README    | 2 +-
 5 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/meta-efl/README b/meta-efl/README
index 62daa0a..820d481 100644
--- a/meta-efl/README
+++ b/meta-efl/README
@@ -12,4 +12,5 @@ Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-efl]
 
 When sending single patches, please using something like 'git send-email -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-efl][PATCH'
 
-Interim layer maintainer: Koen Kooi <koen@dominion.thruhere.net>
+Interim layer maintainers: Koen Kooi <koen@dominion.thruhere.net>
+                           Martin Jansa <martin.jansa@gmail.com>
diff --git a/meta-gpe/README b/meta-gpe/README
index 220f031..8540ffe 100644
--- a/meta-gpe/README
+++ b/meta-gpe/README
@@ -12,4 +12,5 @@ Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-gpe]
 
 When sending single patches, please using something like 'git send-email -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-gpe][PATCH'
 
-Interim layer maintainer: Koen Kooi <koen@dominion.thruhere.net>
+Interim layer maintainers: Koen Kooi <koen@dominion.thruhere.net>
+                           Martin Jansa <martin.jansa@gmail.com>
diff --git a/meta-multimedia/README b/meta-multimedia/README
index 0e85179..2146a13 100644
--- a/meta-multimedia/README
+++ b/meta-multimedia/README
@@ -14,5 +14,6 @@ When sending single patches, please use something like 'git send-email -1 --to o
 
 You are encouraged to fork the mirror on github https://github.com/openembedded/meta-oe/ to share your patches, this is preferred for patch sets consisting of more than one patch. Other services like gitorious, repo.or.cz or self hosted setups are of course accepted as well, 'git fetch <remote>' works the same on all of them. We recommend github because it is free, easy to use, has been proven to be reliable and has a really good web GUI.
 
-Main layer maintainer: Koen Kooi <koen@dominion.thruhere.net>
+Main layer maintainers: Koen Kooi <koen@dominion.thruhere.net>
+                        Martin Jansa <martin.jansa@gmail.com>
 
diff --git a/meta-oe/README b/meta-oe/README
index 4226c29..4656a3d 100644
--- a/meta-oe/README
+++ b/meta-oe/README
@@ -11,4 +11,4 @@ When sending single patches, please use something like 'git send-email -1 --to o
 You are encouraged to fork the mirror on github https://github.com/openembedded/meta-oe/ to share your patches, this is preferred for patch sets consisting of more than one patch. Other services like gitorious, repo.or.cz or self hosted setups are of course accepted as well, 'git fetch <remote>' works the same on all of them. We recommend github because it is free, easy to use, has been proven to be reliable and has a really good web GUI.
 
 Main layer maintainer: Koen Kooi <koen@dominion.thruhere.net>
-
+                       Martin Jansa <martin.jansa@gmail.com>
diff --git a/meta-systemd/README b/meta-systemd/README
index 84578b5..ff25229 100644
--- a/meta-systemd/README
+++ b/meta-systemd/README
@@ -22,4 +22,4 @@ When sending single patches, please use something like 'git send-email -1 --to o
 You are encouraged to fork the mirror on github https://github.com/openembedded/meta-oe/ to share your patches, this is preferred for patch sets consisting of more than one patch. Other services like gitorious, repo.or.cz or self hosted setups are of course accepted as well, 'git fetch <remote>' works the same on all of them. We recommend github because it is free, easy to use, has been proven to be reliable and has a really good web GUI.
 
 Main layer maintainer: Koen Kooi <koen@dominion.thruhere.net>
-
+                       Martin Jansa <martin.jansa@gmail.com>
-- 
1.8.2.1



