Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RDv70-0008QM-Rm
	for openembedded-devel@lists.openembedded.org;
	Wed, 12 Oct 2011 11:28:30 +0200
Received: by bke11 with SMTP id 11so704793bke.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Oct 2011 02:22:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=7zuTOt+5MLMNKzXYQvDi5Mvtngz6y8toaU6V9L8Qou0=;
	b=d5iFii75EBDeSVIIzpczpt2wgMHWx0j8EQZwcgAuIdebPioiglLGK3I73MdtdN5xaB
	/BllX+ovHvtH4MupxZLYz0mZ2/gumeG6GEGs8MHJzMFdZ7MuQDv3b4klTjW7finJQGLI
	8+sqFj3L8co2TTmnrm36VOmHweLKaGGmGujdo=
Received: by 10.204.140.73 with SMTP id h9mr2831446bku.30.1318411368210;
	Wed, 12 Oct 2011 02:22:48 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id d17sm1361687bkq.11.2011.10.12.02.22.46
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 12 Oct 2011 02:22:47 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 12 Oct 2011 11:22:38 +0200
Message-Id: <cover.1318411311.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.7
Subject: [oe-core 0/2] xserver-xf86-config and newer linux-git
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
X-List-Received-Date: Wed, 12 Oct 2011 09:28:31 -0000

The following changes since commit b4c1268763f3d4f0f9b4326d6fa27ba9c03aeaae:

  Ensure FILESEXTRAPATHS_prepend has a trailing colon (2011-09-19 16:27:42 +0100)

are available in the git repository at:
  git://gitorious.org/shr/meta-handheld jansa/pull

Martin Jansa (2):
  xserver-xf86-config: add bbappend and spitz xorg.conf
  linux: bump SRCREV for 3.1.0-rc9 and use repo on kernel.org again

 .../xserver-xf86-config/spitz/xorg.conf            |   49 ++++++++++++++++++++
 .../xorg-xserver/xserver-xf86-config_0.1.bbappend  |    1 +
 recipes-kernel/linux/linux-git.inc                 |    7 +--
 3 files changed, 53 insertions(+), 4 deletions(-)
 create mode 100644 recipes-graphics/xorg-xserver/xserver-xf86-config/spitz/xorg.conf
 create mode 100644 recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bbappend

-- 
1.7.7



