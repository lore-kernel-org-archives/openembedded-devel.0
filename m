Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f178.google.com (mail-ea0-f178.google.com
	[209.85.215.178])
	by mail.openembedded.org (Postfix) with ESMTP id 7BBF661AD1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Jun 2013 17:57:45 +0000 (UTC)
Received: by mail-ea0-f178.google.com with SMTP id l15so512598eak.23
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Jun 2013 10:57:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=Z6G8HL0i9YkKfvxNqkB+Jup9GKd9tJoPwc/ToA4Wm0c=;
	b=VvGjVhnoUQzmG5JPMK0jg/WxhEO4rh8Qo9D/Gzqk4rK7VpGW7WnLg0QjIG+r2Fsu7b
	gqZ2m+gyCLI2qJ3gIJduOb7BQ+bu0kGYfAkOkrtS/Kkbl3Cca5+a6XLBCIUd5vKzDL3X
	SAKJFua/pR3Y6Rw1bNEz7tb5o6BuSnt3uH3S0lTR/DLo3oWHaF3MFIESSRb2BRwzp5mU
	HmAomBQ1GkfL5U7zBIDLWazm8ZVCQbq4fXjgviERf07CorntRDPk/LF/WLfpTwgsAT2Q
	jrgMNdBhdPXe9Z8nk1FR/1SDJFTMTOaR3E0nomdG8Pcb8wwPPxCkTh+m/UE1R7oTybtQ
	gbug==
X-Received: by 10.15.94.131 with SMTP id bb3mr4404726eeb.20.1371232665871;
	Fri, 14 Jun 2013 10:57:45 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	m1sm5048447eex.17.2013.06.14.10.57.45 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 14 Jun 2013 10:57:45 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 14 Jun 2013 19:58:09 +0200
Message-Id: <1371232689-494-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.2.1
Subject: [meta-systemd][PATCH] util-linux: rename bbappend to match new version from oe-core
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 14 Jun 2013 17:57:45 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../util-linux/{util-linux_2.23.bbappend => util-linux_2.23.1.bbappend}   | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename meta-systemd/oe-core/recipes-core/util-linux/{util-linux_2.23.bbappend => util-linux_2.23.1.bbappend} (100%)

diff --git a/meta-systemd/oe-core/recipes-core/util-linux/util-linux_2.23.bbappend b/meta-systemd/oe-core/recipes-core/util-linux/util-linux_2.23.1.bbappend
similarity index 100%
rename from meta-systemd/oe-core/recipes-core/util-linux/util-linux_2.23.bbappend
rename to meta-systemd/oe-core/recipes-core/util-linux/util-linux_2.23.1.bbappend
-- 
1.8.2.1


