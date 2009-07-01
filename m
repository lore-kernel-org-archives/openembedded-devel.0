Received: from [209.85.219.221] (helo=mail-ew0-f221.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <koansoftware@gmail.com>) id 1MLzxv-00073a-4F
	for openembedded-devel@lists.openembedded.org;
	Wed, 01 Jul 2009 15:35:12 +0200
Received: by mail-ew0-f221.google.com with SMTP id 21so1037793ewy.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 Jul 2009 06:23:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=CUZpkjb8vx49U6iY1adJ6X/jgZMbRO0Jb7NMkbh5X8E=;
	b=NzwBPDw1arGCn5/Pj1hN22ktKEKt+dkL0wyNY6J2keKe4lbfx4kXbr1WKaMXAh5FTM
	wi9bFg/Aapj2yOYqAGBNGOyA4K/bwHGNxPoNWXIm02pJd/e/U0PiKCgKo2026jBhuY0K
	aRDjVe0PkTub5V5AH7lNqWdYMUkPoDDA7sutg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=Ac+ScqaBfL4C/RC2SyODILOHRNzgfm03fxQPSOVSL50Yi94XxOqwEc4maZCw3Rhd0V
	2qU9iTOw0B2kFo3Kc6FHxqpCsVY6oDJTeo+11BzMvsNsFSgnnv7qvrgXnM5q5qJNt63E
	slz34q3PK23/L4mAdVPzKgjNwv0yQb8vF3HhI=
Received: by 10.216.25.209 with SMTP id z59mr2769058wez.204.1246454596905;
	Wed, 01 Jul 2009 06:23:16 -0700 (PDT)
Received: from localhost.localdomain
	(host56-7-static.30-87-b.business.telecomitalia.it [87.30.7.56])
	by mx.google.com with ESMTPS id i34sm2881887gve.28.2009.07.01.06.23.15
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 01 Jul 2009 06:23:16 -0700 (PDT)
From: Marco Cavallini <koansoftware@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  1 Jul 2009 15:23:49 +0200
Message-Id: <1246454629-20512-1-git-send-email-m.cavallini@koansoftware.com>
X-Mailer: git-send-email 1.6.3.3
Cc: Marco Cavallini <m.cavallini@koansoftware.com>
Subject: [PATCH 2/2] Added recipes/psplash/files/ronetix-pm9263/psplash-default
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
X-List-Received-Date: Wed, 01 Jul 2009 13:35:19 -0000


Signed-off-by: Marco Cavallini <m.cavallini@koansoftware.com>
---
 .../psplash/files/ronetix-pm9263/psplash-default   |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)
 create mode 100644 recipes/psplash/files/ronetix-pm9263/psplash-default

diff --git a/recipes/psplash/files/ronetix-pm9263/psplash-default b/recipes/psplash/files/ronetix-pm9263/psplash-default
new file mode 100644
index 0000000..c57d040
--- /dev/null
+++ b/recipes/psplash/files/ronetix-pm9263/psplash-default
@@ -0,0 +1,2 @@
+# Parameters to pass to psplash
+PARAMS="--angle 90"
-- 
1.6.3.3



