Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RNlLo-0002RK-UE
	for openembedded-devel@lists.openembedded.org;
	Tue, 08 Nov 2011 14:04:29 +0100
Received: by ywf9 with SMTP id 9so471188ywf.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 08 Nov 2011 04:58:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=iELEz3hPxtnWf5BiMWdtyubkRQcdkPrRl7TKcR0f2Tc=;
	b=HeV5lY+x+NUlcsEd4pGZeCK1Az2dkrVDsOeat4A7Jul10EE3AnvobpZYAuuljloT8b
	pP3pKSi6KjLUImTy+Z9qfkfm4S7Imdiz1YKV08jg5WfOp+RuPo3U33x+htGbfucPFy5v
	zvfQ95e1l5XbqD7lDlKFAxOulsT/467NS3ahM=
Received: by 10.236.83.81 with SMTP id p57mr17850446yhe.97.1320757094407;
	Tue, 08 Nov 2011 04:58:14 -0800 (PST)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id y58sm2066338yhi.17.2011.11.08.04.58.12
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 08 Nov 2011 04:58:13 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  8 Nov 2011 12:58:01 +0000
Message-Id: <5ce6c44c67ea34eaba2366493baaecb460668deb.1320757052.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1320757052.git.otavio@ossystems.com.br>
References: <cover.1320757052.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1320757052.git.otavio@ossystems.com.br>
References: <cover.1320757052.git.otavio@ossystems.com.br>
Subject: [meta-oe][PATCH 2/2] connman: bump PR due systemd.bbclass fixes
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
X-List-Received-Date: Tue, 08 Nov 2011 13:04:29 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 .../recipes-connectivity/connman/connman_0.77.bb   |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta-oe/recipes-connectivity/connman/connman_0.77.bb b/meta-oe/recipes-connectivity/connman/connman_0.77.bb
index 9c93e51..9ef368b 100644
--- a/meta-oe/recipes-connectivity/connman/connman_0.77.bb
+++ b/meta-oe/recipes-connectivity/connman/connman_0.77.bb
@@ -1,5 +1,5 @@
 require connman.inc
-PR = "r3"
+PR = "r4"
 
 EXTRA_OECONF += "\
   --disable-gtk-doc \
-- 
1.7.2.5



