Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1Rb9R9-0002tw-O6
	for openembedded-devel@lists.openembedded.org;
	Thu, 15 Dec 2011 12:25:20 +0100
Received: by yhoo47 with SMTP id o47so2013067yho.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Dec 2011 03:18:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer;
	bh=xclmC0Zj/hei4jo2ANxKBYsR5ReXa7Ypz1zxCJItUHU=;
	b=ZEAsVRUrLqXq2tDbbX4VbAeJ+yhbHZiECt9NSX+t1vTopt/FCM8qZEj4yJiBKbWx0f
	rRYBhZoZFpnAx9HIbgxxhTKPPBPuSJYmbYuuyw78ApTShlqTC4rLlaBPMygRRUJ74lZG
	6HjKff7maAlC3WPX3vW85eQbJB/JEDhjmIE+w=
Received: by 10.236.175.72 with SMTP id y48mr4766470yhl.17.1323947899960;
	Thu, 15 Dec 2011 03:18:19 -0800 (PST)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id c44sm8652593yhm.5.2011.12.15.03.18.16
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 15 Dec 2011 03:18:17 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 15 Dec 2011 11:18:01 +0000
Message-Id: <cover.1323947853.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
Subject: [meta-oe][PATCH 0/5] Misc fixes
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
X-List-Received-Date: Thu, 15 Dec 2011 11:25:21 -0000

The following changes since commit 6f36625d072054737e0aa797fb791c35d999addc:

  florence: clean up recipe (2011-12-15 09:42:59 +0100)

are available in the git repository at:
  git://github.com/OSSystems/meta-oe master
  https://github.com/OSSystems/meta-oe/tree/master

Otavio Salvador (5):
  setxkbmap: fix checksum
  xrdb: fix checksum
  twm: fix checksum
  sessreg: fix checksum
  dropbear: cleanup packaging

 .../dropbear/dropbear_2011.54.bbappend             |   11 ++---------
 meta-oe/recipes-graphics/xorg-app/sessreg_1.0.6.bb |    4 ++--
 .../recipes-graphics/xorg-app/setxkbmap_1.2.0.bb   |    4 ++--
 meta-oe/recipes-graphics/xorg-app/twm_1.0.6.bb     |    4 ++--
 meta-oe/recipes-graphics/xorg-app/xrdb_1.0.9.bb    |    4 ++--
 5 files changed, 10 insertions(+), 17 deletions(-)

-- 
1.7.2.5



