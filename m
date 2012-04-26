Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SNOK9-00068S-KQ
	for openembedded-devel@lists.openembedded.org;
	Thu, 26 Apr 2012 15:01:30 +0200
Received: by mail-we0-f175.google.com with SMTP id a1so778636wer.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Apr 2012 05:51:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=KVl2hM0EbvywBykYECt+i8XUr4Zi6kMpa9goBVRW+8I=;
	b=blwIZqbcPLUWnkQrVM3RiQ+KMYRr7m3TYyYd8rKW5qgnMlC9mTu7zzq4MPygh4ATtr
	iTmMZYm9XXzvQRtJcjC788hfrsaNhyIlj2UFMwmSHWgmGYI/mp5AUq8msHPIR3I5Oc/F
	boNJoQeW6fXmB4HwCXiqy56uKZ0R3ZbjjOMLY4KAe2m18ASqvZhHAYxC22wTyq1aW6O2
	cw9dG0J/atty1Ed1+UXmP2Ft8eJsuVFnJYakSiri0p+z2Mt4CwVcmxTeXpZOCu2A7Yhr
	jPu3iuP+nEdf6vCmFKHJzIR5gSiZgjghfblITEgeXkI+3g40Vvev/dxUcHdtFqMDUn7f
	xyVg==
Received: by 10.216.138.202 with SMTP id a52mr4140640wej.53.1335444714956;
	Thu, 26 Apr 2012 05:51:54 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id o2sm10773605wiv.11.2012.04.26.05.51.53
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 26 Apr 2012 05:51:54 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 26 Apr 2012 14:50:17 +0200
Message-Id: <5cee0a2325b26e849590b041edd47607b56c5af3.1335444528.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.5
In-Reply-To: <cover.1335444528.git.Martin.Jansa@gmail.com>
References: <cover.1335444528.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1335444528.git.Martin.Jansa@gmail.com>
References: <cover.1335444528.git.Martin.Jansa@gmail.com>
Subject: [[meta-oe][meta-efl] 12/15] qt4: rename bbappends to match 4.8.1 from oe-core
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
X-List-Received-Date: Thu, 26 Apr 2012 13:01:31 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 ..._4.8.0.bbappend => qt4-embedded_4.8.1.bbappend} |    0
 ..._4.8.0.bbappend => qt4-x11-free_4.8.1.bbappend} |    0
 2 files changed, 0 insertions(+), 0 deletions(-)
 rename meta-oe/recipes-qt/qt4/{qt4-embedded_4.8.0.bbappend => qt4-embedded_4.8.1.bbappend} (100%)
 rename meta-oe/recipes-qt/qt4/{qt4-x11-free_4.8.0.bbappend => qt4-x11-free_4.8.1.bbappend} (100%)

diff --git a/meta-oe/recipes-qt/qt4/qt4-embedded_4.8.0.bbappend b/meta-oe/recipes-qt/qt4/qt4-embedded_4.8.1.bbappend
similarity index 100%
rename from meta-oe/recipes-qt/qt4/qt4-embedded_4.8.0.bbappend
rename to meta-oe/recipes-qt/qt4/qt4-embedded_4.8.1.bbappend
diff --git a/meta-oe/recipes-qt/qt4/qt4-x11-free_4.8.0.bbappend b/meta-oe/recipes-qt/qt4/qt4-x11-free_4.8.1.bbappend
similarity index 100%
rename from meta-oe/recipes-qt/qt4/qt4-x11-free_4.8.0.bbappend
rename to meta-oe/recipes-qt/qt4/qt4-x11-free_4.8.1.bbappend
-- 
1.7.8.5



