Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1QR3oI-0007dQ-Pc
	for openembedded-devel@lists.openembedded.org;
	Mon, 30 May 2011 16:51:14 +0200
Received: by gwb11 with SMTP id 11so1566881gwb.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 May 2011 07:48:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:sender:from:to:cc:subject:date:message-id
	:x-mailer; bh=e5gFT1ttVabukrdzzYZQ/KhceKz1EG5duqUbYuq92/o=;
	b=SsyjDvbEeoJEcWf/emVqe0+U3YS6doXMaExe18RGMjNzWojD9Ur+KhSv34RFe5kB2m
	yBxiDm8hLPilWtis+R1I6pQMfT83Fv7doQgcndIscDzgh46CV0NmR2SOTP+WpajdFNp4
	mgxC140qiEUwNnC+p1SL07tHz01p51InbQkQw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer;
	b=izU1kY2K4mP6bdpz/e5QgjlkXZ3/7mS1S+Y3pi924sFCfInJod3IkCRXDQ/3tkWQ6h
	/5ADcNjJLkALHWnkM94ZEwneeuXFaLxYJbMZjhlH4dqFlLe9+1VCauLkuLadcquJyhPZ
	5F+DHEY5lXA8+bSJUcUUc1AAXffhptb4Nw8CU=
Received: by 10.90.61.8 with SMTP id j8mr4194449aga.76.1306766885916;
	Mon, 30 May 2011 07:48:05 -0700 (PDT)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id c21sm3346170ana.50.2011.05.30.07.48.03
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 30 May 2011 07:48:05 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 30 May 2011 14:47:54 +0000
Message-Id: <cover.1306766797.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-oe][PATCH 0/1] FreeRDP related fix from O.S. Systems tree
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
X-List-Received-Date: Mon, 30 May 2011 14:51:14 -0000

The following changes since commit a753f40478a1b4b7ee831f880bc5cac0cddb3758:

  udev: drop 168 and associated files (2011-05-30 13:54:49 +0200)

are available in the git repository at:
  git://github.com/OSSystems/meta-oe master
  https://github.com/OSSystems/meta-oe/tree/master

Otavio Salvador (1):
  freerdp-extension-xpunlimited: bump to fix a cache issue SRCREV

 .../freerdp/freerdp-extension-xpunlimited_git.bb   |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

-- 
1.7.2.5



