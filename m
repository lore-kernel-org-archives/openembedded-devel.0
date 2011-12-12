Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RaAaH-0002WX-4K
	for openembedded-devel@lists.openembedded.org;
	Mon, 12 Dec 2011 19:26:41 +0100
Received: by ggnh1 with SMTP id h1so5767307ggn.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Dec 2011 10:19:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=50OrO6NtDIQEQ3BbaQpzul08HFXML0TDBnhtBYwaXGA=;
	b=jC3fignxlZ6SgZS6aZoqZ7FZY7h6oqZhHX4MGUrlZWwuMasgkGY9knLl5G6O8qtqVS
	MUiDuDmaV52WZoK4DEFehmT9QVnk9fwIJo7kkbdJcUe/dXG8N9WTnVGPuNus9l6p7VHc
	SfRTfcUIWppexhj6OMP6g0j+FDKp8UaYnJ20w=
Received: by 10.236.131.82 with SMTP id l58mr27657952yhi.36.1323713983374;
	Mon, 12 Dec 2011 10:19:43 -0800 (PST)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id o9sm20041390yhk.20.2011.12.12.10.19.41
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 12 Dec 2011 10:19:42 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 12 Dec 2011 18:19:28 +0000
Message-Id: <e2fc9e584e6190326cc76d4531bb357d69a997fa.1323713931.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1323713931.git.otavio@ossystems.com.br>
References: <cover.1323713931.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1323713931.git.otavio@ossystems.com.br>
References: <cover.1323713931.git.otavio@ossystems.com.br>
Subject: [meta-oe][PATCH 2/2] qconnman: bump SRCREV
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
X-List-Received-Date: Mon, 12 Dec 2011 18:26:41 -0000

 * add translation support
 * doesn't allow simultaneous connections

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta-oe/recipes-qt/qconnman/qconnman.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta-oe/recipes-qt/qconnman/qconnman.inc b/meta-oe/recipes-qt/qconnman/qconnman.inc
index 280a002..06ad5fd 100644
--- a/meta-oe/recipes-qt/qconnman/qconnman.inc
+++ b/meta-oe/recipes-qt/qconnman/qconnman.inc
@@ -9,7 +9,7 @@ PR = "r1"
 inherit autotools
 
 PV = "0.0+gitr${SRCPV}"
-SRCREV = "9bab120f426e41552c369b7030414c792dd25a91"
+SRCREV = "f976b18c7c5584627224784801803e9fd3ebe0ff"
 SRC_URI = "git://github.com/OSSystems/qconnman.git"
 
 S = "${WORKDIR}/git/"
-- 
1.7.2.5



