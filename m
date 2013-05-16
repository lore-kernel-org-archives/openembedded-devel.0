Received: from mail-pa0-f46.google.com ([209.85.220.46])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Ucuo4-0002me-Sj
	for openembedded-devel@lists.openembedded.org;
	Thu, 16 May 2013 11:49:11 +0200
Received: by mail-pa0-f46.google.com with SMTP id fa10so2340093pad.33
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 May 2013 02:30:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=CMWO1T5WwRmJtXdeH2A/ji3M96EJCDo4eE6Hu7lxbUY=;
	b=yHbjZax/BwZ+9zq6O7hKQdyCe+YWKx2S43EsRXusDdKtC1vSePeYrMAh/2TsCixmy9
	ivybVbM9XtWdUanD4/Y3W5kD3+iwfacJDeFTHD6qQsupzi8hu/2UCjE9GuLDIi5EvbUr
	pwuGCYaGIfEaVHdTGW+AK94PD+0ClCkTcXlJDWp1Zm9D0AXwB0m3y3jnb5pmjXjR9j4J
	Amsef2mWnJddpjX8ZxcK0kw0+obYnvhKXTickokXE0oQCEoJsXl8xujxEumXB5K/6Dlb
	JN2R5Rmz5w/Qq9opOUtyVhBMk5Ssc9hHViC2r446GOthPXDmmdVvmn9RoG6nlLpFVhQD
	hwag==
X-Received: by 10.68.244.72 with SMTP id xe8mr35172903pbc.51.1368696649911;
	Thu, 16 May 2013 02:30:49 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	yp2sm6858757pab.10.2013.05.16.02.30.47 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 16 May 2013 02:30:49 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 16 May 2013 11:30:49 +0200
Message-Id: <1368696649-3785-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.2.1
Subject: [meta-browser][PATCH] libxi: rename bbappend to match new version from oe-core
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
X-List-Received-Date: Thu, 16 May 2013 09:49:26 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes-graphics/libxi/{libxi_1.7.bbappend => libxi_1.7.1.bbappend} | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename recipes-graphics/libxi/{libxi_1.7.bbappend => libxi_1.7.1.bbappend} (100%)

diff --git a/recipes-graphics/libxi/libxi_1.7.bbappend b/recipes-graphics/libxi/libxi_1.7.1.bbappend
similarity index 100%
rename from recipes-graphics/libxi/libxi_1.7.bbappend
rename to recipes-graphics/libxi/libxi_1.7.1.bbappend
-- 
1.8.2.1



