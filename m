Received: from mail-pa0-f52.google.com ([209.85.220.52])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UWkKV-0000J9-6A
	for openembedded-devel@lists.openembedded.org;
	Mon, 29 Apr 2013 11:25:04 +0200
Received: by mail-pa0-f52.google.com with SMTP id fb10so1149041pad.39
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Apr 2013 02:07:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=0ni5ZdyGSME1ZwvtPP4yW6AIEeLZQbPNWvc8tZrLI1E=;
	b=q8xpXqMtVqya+oO5pI6iwVUQ0Ft8HGHQMIDIQ6m+qWcgCUUrWGJRvfrf22OkDP2mA9
	KfaLqYHGLL41BOwgf43F9BKAkf67GKEIcI0udrO+VKMreHARV0ogfYCbYKI6b/IfW3dG
	lR/zvZIkPe49bJD1vxKXKYhs4VBs+Z1eiayY1OUGgy3KpxJRwOqHb9Z8jZMW1jmzzTOg
	PYBsmQ2cKhJ4sL79IsRCVRu604MibyIT0zN1nqCJg/SErp6WKbbPGstePvknk4J94dLB
	Ts7zDRO8Vz0jKHfY+/cWvyT4hITiDvwI2WwDF2qVs0JZ9P3MAj3PHmscjUh3SUvJQDZ5
	xs9g==
X-Received: by 10.66.163.229 with SMTP id yl5mr41500695pab.104.1367226433555; 
	Mon, 29 Apr 2013 02:07:13 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	to7sm25113787pab.0.2013.04.29.02.07.10 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 29 Apr 2013 02:07:12 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 29 Apr 2013 11:07:23 +0200
Message-Id: <1367226443-30541-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.2.1
Subject: [meta-oe][PATCH] README: show github mirror URL in layer dependencies
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
X-List-Received-Date: Mon, 29 Apr 2013 09:25:04 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/README        | 4 ++--
 meta-gnome/README      | 4 ++--
 meta-gpe/README        | 4 ++--
 meta-initramfs/README  | 2 +-
 meta-multimedia/README | 4 ++--
 meta-networking/README | 2 +-
 meta-oe/README         | 2 +-
 meta-ruby/README       | 4 ++--
 meta-systemd/README    | 4 ++--
 meta-webserver/README  | 4 ++--
 meta-xfce/README       | 4 ++--
 toolchain-layer/README | 2 +-
 12 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta-efl/README b/meta-efl/README
index e3235af..f8b929e 100644
--- a/meta-efl/README
+++ b/meta-efl/README
@@ -1,10 +1,10 @@
 This layer depends on:
 
-URI: git://git.openembedded.org/openembedded-core
+URI: git://github.com/openembedded/oe-core.git
 branch: master
 revision: HEAD
 
-URI: git://git.openembedded.org/meta-openembedded
+URI: git://github.com/openembedded/meta-oe.git
 branch: master
 revision: HEAD
 
diff --git a/meta-gnome/README b/meta-gnome/README
index 90545a7..0c4fbd2 100644
--- a/meta-gnome/README
+++ b/meta-gnome/README
@@ -1,10 +1,10 @@
 This layer depends on:
 
-URI: git://git.openembedded.org/openembedded-core
+URI: git://github.com/openembedded/oe-core.git
 branch: master
 revision: HEAD
 
-URI: git://git.openembedded.org/meta-openembedded
+URI: git://github.com/openembedded/meta-oe.git
 branch: master
 revision: HEAD
 
diff --git a/meta-gpe/README b/meta-gpe/README
index 3c7522c..7d019f6 100644
--- a/meta-gpe/README
+++ b/meta-gpe/README
@@ -1,10 +1,10 @@
 This layer depends on:
 
-URI: git://git.openembedded.org/openembedded-core
+URI: git://github.com/openembedded/oe-core.git
 branch: master
 revision: HEAD
 
-URI: git://git.openembedded.org/meta-openembedded
+URI: git://github.com/openembedded/meta-oe.git
 branch: master
 revision: HEAD
 
diff --git a/meta-initramfs/README b/meta-initramfs/README
index 473c57d..e24acf9 100644
--- a/meta-initramfs/README
+++ b/meta-initramfs/README
@@ -11,7 +11,7 @@ Dependencies
 
 This layer depends on:
 
-URI: git://git.openembedded.org/openembedded-core
+URI: git://github.com/openembedded/oe-core.git
 branch: master
 revision: HEAD
 
diff --git a/meta-multimedia/README b/meta-multimedia/README
index 3562a29..cbdc1b5 100644
--- a/meta-multimedia/README
+++ b/meta-multimedia/README
@@ -1,10 +1,10 @@
 This layer depends on:
 
-URI: git://git.openembedded.org/openembedded-core
+URI: git://github.com/openembedded/oe-core.git
 branch: master
 revision: HEAD
 
-URI: git://git.openembedded.org/meta-openembedded
+URI: git://github.com/openembedded/meta-oe.git
 layers: meta-oe, meta-ruby
 branch: master
 revision: HEAD
diff --git a/meta-networking/README b/meta-networking/README
index 438f442..872b013 100644
--- a/meta-networking/README
+++ b/meta-networking/README
@@ -17,7 +17,7 @@ Dependencies
 
 This layer depends on:
 
-URI: git://git.openembedded.org/openembedded-core
+URI: git://github.com/openembedded/oe-core.git
 branch: master
 revision: HEAD
 
diff --git a/meta-oe/README b/meta-oe/README
index ede8011..6ad87c5 100644
--- a/meta-oe/README
+++ b/meta-oe/README
@@ -1,6 +1,6 @@
 This layer depends on:
 
-URI: git://git.openembedded.org/openembedded-core
+URI: git://github.com/openembedded/oe-core.git
 branch: master
 revision: HEAD
 
diff --git a/meta-ruby/README b/meta-ruby/README
index 7d8875e..99cd9bc 100644
--- a/meta-ruby/README
+++ b/meta-ruby/README
@@ -1,10 +1,10 @@
 This layer depends on:
 
-URI: git://git.openembedded.org/openembedded-core
+URI: git://github.com/openembedded/oe-core.git
 branch: master
 revision: HEAD
 
-URI: git://git.openembedded.org/meta-openembedded
+URI: git://github.com/openembedded/meta-oe.git
 branch: master
 revision: HEAD
 
diff --git a/meta-systemd/README b/meta-systemd/README
index f1f4835..2cd90b4 100644
--- a/meta-systemd/README
+++ b/meta-systemd/README
@@ -1,12 +1,12 @@
 This layer depends on:
 
-URI: git://git.openembedded.org/openembedded-core
+URI: git://github.com/openembedded/oe-core.git
 branch: master
 revision: HEAD
 
 And we're working to break the dependency on this one:
 
-URI: git://git.openembedded.org/meta-openembedded
+URI: git://github.com/openembedded/meta-oe.git
 branch: master
 revision: HEAD
 
diff --git a/meta-webserver/README b/meta-webserver/README
index 89deecc..f3fe735 100644
--- a/meta-webserver/README
+++ b/meta-webserver/README
@@ -11,14 +11,14 @@ Dependencies
 
 This layer depends on:
 
-URI: git://git.openembedded.org/openembedded-core
+URI: git://github.com/openembedded/oe-core.git
 subdirectory: meta
 branch: master
 revision: HEAD
 
 For some recipes, the meta-oe layer is required:
 
-URI: git://git.openembedded.org/meta-openembedded
+URI: git://github.com/openembedded/meta-oe.git
 subdirectory: meta-oe
 branch: master
 revision: HEAD
diff --git a/meta-xfce/README b/meta-xfce/README
index 2f4aa9f..e346888 100644
--- a/meta-xfce/README
+++ b/meta-xfce/README
@@ -1,10 +1,10 @@
 This layer depends on:
 
-URI: git://git.openembedded.org/openembedded-core
+URI: git://github.com/openembedded/oe-core.git
 branch: master
 revision: HEAD
 
-URI: git://git.openembedded.org/meta-openembedded
+URI: git://github.com/openembedded/meta-oe.git
 branch: master
 revision: HEAD
 meta-xfce depends on meta-oe and meta-multimedia in this repository.
diff --git a/toolchain-layer/README b/toolchain-layer/README
index 1f9be50..7af26ec 100644
--- a/toolchain-layer/README
+++ b/toolchain-layer/README
@@ -1,6 +1,6 @@
 This layer depends on:
 
-URI: git://git.openembedded.org/openembedded-core
+URI: git://github.com/openembedded/oe-core.git
 branch: master
 revision: HEAD
 
-- 
1.8.2.1



