Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RDv8C-00005k-Tm
	for openembedded-devel@lists.openembedded.org;
	Wed, 12 Oct 2011 11:29:45 +0200
Received: by bke11 with SMTP id 11so705782bke.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Oct 2011 02:24:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=7zuTOt+5MLMNKzXYQvDi5Mvtngz6y8toaU6V9L8Qou0=;
	b=kvYRaA2xF7i0wudl+F49CwFxMgzAvcW8mTtqy6onqNuySUdOXPokaJdMnrhFhWu0JW
	UG4hduqjV2KRL7TXPUexFD+BZv6Xawom1lnhIOwnl5QmES9bsNKf8hnxvYUb0kwl1nCO
	opBwsR7Ttph5Q4sV2sSZz62bHL+v65Qlyqbqw=
Received: by 10.204.154.12 with SMTP id m12mr12636347bkw.25.1318411442514;
	Wed, 12 Oct 2011 02:24:02 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id d17sm1365630bkq.11.2011.10.12.02.24.00
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 12 Oct 2011 02:24:01 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 12 Oct 2011 11:23:53 +0200
Message-Id: <cover.1318411412.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.7
Subject: [meta-handheld 0/2] xserver-xf86-config and newer linux-git
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
X-List-Received-Date: Wed, 12 Oct 2011 09:29:45 -0000

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



