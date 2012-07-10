Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SoWgo-0006m6-VQ
	for openembedded-devel@lists.openembedded.org;
	Tue, 10 Jul 2012 11:25:03 +0200
Received: by wgbdr1 with SMTP id dr1so11211318wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Jul 2012 02:13:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=TOdlkDlVm6kfu2CMuSEdkuYseTZiUz+SF09ndzs+d50=;
	b=TZ6z9z6ncTKdA9MZw1Qp0gNYpCXI0DE2bSZJS88LB6dtiHx4EDgefREAkaNmRS94x2
	H/P37TSYkociu88RS0N4e+sfyxr9mPy7tyMehve8wLPdZYzUSxR5NAcUsARHGdsgRHdi
	VwRX0dCtRP27Vf+wOBtm234pmzswOPuCO68AxKaD7Jm63ek2h/bm+hQXECGa5zB0vR2V
	74RE2qJbabJUiHB+E7GjrSSuNt24XphtekUNuZR0A89z8XJCGCIu4Yx5NTZfbdxVgS5w
	YFusnz9sDakEc0SbtIoHzmN+egJQQBBeRXgoKEiLbnPWT3S0qymFB5pkmr54VuTtYAs4
	5t8A==
Received: by 10.180.81.165 with SMTP id b5mr36455619wiy.17.1341911632729;
	Tue, 10 Jul 2012 02:13:52 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id e9sm41736540wiw.10.2012.07.10.02.13.51
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 10 Jul 2012 02:13:52 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 10 Jul 2012 11:13:47 +0200
Message-Id: <1341911627-13511-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
Subject: [meta-oe][PATCH] pixman: rename to match oe-core version
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
X-List-Received-Date: Tue, 10 Jul 2012 09:25:03 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 ...mplementation-of-pixman_blt-with-overlapp.patch |    0
 ...xman_0.25.2.bbappend => pixman_0.26.2.bbappend} |    0
 2 files changed, 0 insertions(+), 0 deletions(-)
 rename meta-oe/recipes-graphics/xorg-lib/{pixman-0.25.2 => pixman-0.26.2}/0008-Generic-C-implementation-of-pixman_blt-with-overlapp.patch (100%)
 rename meta-oe/recipes-graphics/xorg-lib/{pixman_0.25.2.bbappend => pixman_0.26.2.bbappend} (100%)

diff --git a/meta-oe/recipes-graphics/xorg-lib/pixman-0.25.2/0008-Generic-C-implementation-of-pixman_blt-with-overlapp.patch b/meta-oe/recipes-graphics/xorg-lib/pixman-0.26.2/0008-Generic-C-implementation-of-pixman_blt-with-overlapp.patch
similarity index 100%
rename from meta-oe/recipes-graphics/xorg-lib/pixman-0.25.2/0008-Generic-C-implementation-of-pixman_blt-with-overlapp.patch
rename to meta-oe/recipes-graphics/xorg-lib/pixman-0.26.2/0008-Generic-C-implementation-of-pixman_blt-with-overlapp.patch
diff --git a/meta-oe/recipes-graphics/xorg-lib/pixman_0.25.2.bbappend b/meta-oe/recipes-graphics/xorg-lib/pixman_0.26.2.bbappend
similarity index 100%
rename from meta-oe/recipes-graphics/xorg-lib/pixman_0.25.2.bbappend
rename to meta-oe/recipes-graphics/xorg-lib/pixman_0.26.2.bbappend
-- 
1.7.8.6



