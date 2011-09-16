Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1R4ScX-0000Wp-IE
	for openembedded-devel@lists.openembedded.org;
	Fri, 16 Sep 2011 09:13:57 +0200
Received: by mail-fx0-f47.google.com with SMTP id 1so1430885fxi.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Sep 2011 00:08:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=qx2RDSx7iltTSMuaiqPy1pZCrvNxxKa43Wg8o6PGTcc=;
	b=g0Tuk0VAkJwAgg3ZP+JKt2heMD20t+hIs5ezbgiRW7FxJXVqPrWr3zl88W2wTNlUqM
	+g4HA31ptIx5zGg6AKLoDjqM9rfo4x1/opSg4iX/MV4m9e9CG64c6wLYbP/qO1/3+8iZ
	ajR1hBurAatOCILKLvhT3raX+Cg+O6aD9+dUI=
Received: by 10.223.55.218 with SMTP id v26mr35385fag.82.1316156927504;
	Fri, 16 Sep 2011 00:08:47 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id c5sm9505502fai.2.2011.09.16.00.08.45
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 16 Sep 2011 00:08:46 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 16 Sep 2011 09:08:38 +0200
Message-Id: <cover.1316156746.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.6.1
Subject: [meta-efl][PATCH 0/4] Pull request #12
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
X-List-Received-Date: Fri, 16 Sep 2011 07:13:57 -0000

The following changes since commit 9c4ff53d2fa688581d257eb7e045f9e6a20470d3:

  vlc: update to 1.1.11 and fix xml2 build (2011-09-15 15:59:26 +0200)

are available in the git repository at:
  git://git.openembedded.org/meta-openembedded-contrib jansa/meta-efl
  http://cgit.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/?h=jansa/meta-efl

pespin (4):
  enjoy: Add var LIC_FILES_CHKSUM to recipe
  enjoy: Add inherit gettext
  enjoy: Update gstreamer package names in RDEPENDS
  enjoy: Add gst-plugins-good-autodetect to RDEPENDS

 meta-efl/recipes-efl/e17/enjoy_svn.bb |   15 ++++++++-------
 1 files changed, 8 insertions(+), 7 deletions(-)

-- 
1.7.6.1



