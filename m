Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1TJcrP-0006qI-HF
	for openembedded-devel@lists.openembedded.org;
	Thu, 04 Oct 2012 06:16:31 +0200
Received: by mail-yx0-f175.google.com with SMTP id m2so13821yen.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 03 Oct 2012 21:03:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=QJWzEMH6eOM2cA5KM4GRhl7KUSwdHvpfhfqK1QotL9A=;
	b=QGEz/0jDhsKaIJ3HFqa1C9YmIcE0Umi9SiOxC28EXpYLoz5r46d+Ij93H965ylQJc4
	1E+DgOZPfKw3D/gBuASsq7WyKljzNscHzHoOdDuB3cmCfDT+8PyeYCi2b3//HoUNwMM0
	95VcURodBOJMHJ3kCQffFUpb9wF+ca45nLg/xiW0UQZlKtOJjD0bxxrh0UJe0+oMLHze
	6PdSRoUyg+OEGSw8QUSV+GPLiKY7yTxROMd4OateX6W20gubTWHr9yDRA6iTH1iP4yPy
	ve3x1IcKDZcjLOew4JeKi/pCmHwYEC9GaijRR1AiRM/sMi4hHgdZLZ92GAWkthjQtciU
	4lLA==
Received: by 10.236.146.239 with SMTP id r75mr3927613yhj.100.1349323413228;
	Wed, 03 Oct 2012 21:03:33 -0700 (PDT)
Received: from localhost.localdomain ([177.100.163.15])
	by mx.google.com with ESMTPS id h22sm8519798yhk.13.2012.10.03.21.03.31
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 03 Oct 2012 21:03:32 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  4 Oct 2012 01:03:07 -0300
Message-Id: <1349323389-16520-8-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1349323389-16520-1-git-send-email-otavio@ossystems.com.br>
References: <1349323389-16520-1-git-send-email-otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-oe][PATCH 7/9] mplayer2: bump PR due libav update
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
X-List-Received-Date: Thu, 04 Oct 2012 04:16:31 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb b/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb
index e2aadf5..4e3c18b 100644
--- a/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb
+++ b/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb
@@ -23,7 +23,7 @@ SRCREV = "e3f5043233336d8b4b0731c6a8b42a8fda5535ac"
 ARM_INSTRUCTION_SET = "arm"
 
 PV = "2.0+gitr${SRCPV}"
-PR = "r9"
+PR = "r10"
 
 PARALLEL_MAKE = ""
 
-- 
1.7.2.5



