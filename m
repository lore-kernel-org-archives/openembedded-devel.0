Received: from mail-pb0-f49.google.com ([209.85.160.49])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1UIFKj-0001Xc-3R
	for openembedded-devel@lists.openembedded.org;
	Wed, 20 Mar 2013 10:29:21 +0100
Received: by mail-pb0-f49.google.com with SMTP id xa12so1170200pbc.8
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Mar 2013 02:12:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=BQcpgoWXeyQi1QOS8P2LCIJIT1zEtp/9Lm4zfUhYiaU=;
	b=SXGN1nbs3+XYc9YtDhtthU3RZGDHEijgVFM0TX1BDPQL48gpJI/TuO87ubassnkNBd
	970pqXQTsOU7ewaf2hkEDzgQ4Wlc7wxifBHC5TiZFEFTUQ3Lzb1eZjVjP1w6XEBYMCn9
	vS8e7dgdwgyuhMRhNefvCM7zl9xwkEx/j0a1nx6fHhSs2+Rh5lHQ55pU57pH3Xj4vwR5
	A4X89l8QY0/TAxJpjdps79GoBFfMEHa5N4C/k/LxYi2U+QD/Y6VOt7tHtMLm0EI4OH7v
	+ngB2UIGto9W05jbiRMFlQanujs3CA8YNvyCoyluPzUQu6pqRYPZhdvMGAsrwJ2w+gxw
	5l5Q==
X-Received: by 10.66.49.130 with SMTP id u2mr7806387pan.191.1363770749867;
	Wed, 20 Mar 2013 02:12:29 -0700 (PDT)
Received: from isis.gateway.2wire.net
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPS id xc4sm1410309pbc.41.2013.03.20.02.12.28
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 20 Mar 2013 02:12:29 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 20 Mar 2013 02:12:08 -0700
Message-Id: <1363770728-21218-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [meta-browser][PATCH] libxi: Rename bbappend to match oe-core
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
X-List-Received-Date: Wed, 20 Mar 2013 09:29:23 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../{libxi_1.6.1.bbappend => libxi_1.7.bbappend}   |    0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename recipes-graphics/libxi/{libxi_1.6.1.bbappend => libxi_1.7.bbappend} (100%)

diff --git a/recipes-graphics/libxi/libxi_1.6.1.bbappend b/recipes-graphics/libxi/libxi_1.7.bbappend
similarity index 100%
rename from recipes-graphics/libxi/libxi_1.6.1.bbappend
rename to recipes-graphics/libxi/libxi_1.7.bbappend
-- 
1.7.9.5



