Received: from mail-gx0-f179.google.com ([209.85.161.179])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1QNVLE-0005OJ-5C
	for openembedded-devel@lists.openembedded.org;
	Fri, 20 May 2011 21:26:32 +0200
Received: by gxk1 with SMTP id 1so1538918gxk.10
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 May 2011 12:23:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:sender:from:to:cc:subject:date:message-id
	:x-mailer; bh=CySOh4NuKW3F330Z6NZykwPC+2L3ZHghu9liganZ+tc=;
	b=A2SzoxMCwSWuUMg9NwBaZWD5/Fosr6x5fl7VJhkyRB86lwiQqdEK4BLaVFt3XSr6zM
	BkkfSeLjZyEAlplTyTkxge/Wz9+fHPYqXq8rcRbggyFxZbDwf8W2zxR3MLN15jkYQxHR
	1c0eHDPc9WG7ysXy3qosEcUEQTUIXVy0QWSkk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer;
	b=wCqL/skOhqXwU6tTPGKu4Rt1wFcakgdo/+ERs8mLh/503wA2u3tWwlNR0oW5213dEd
	IFHOz/GD+bAfbJadFEnmD3So/LdljuwoSNG9bMSMIT4EK/L9jJv4ABaMjXKZ4EwYFOsI
	1irBQw8oxfOsukToMngdAnqtdZ+rJTBp9PPw0=
Received: by 10.91.65.8 with SMTP id s8mr911600agk.203.1305919414487;
	Fri, 20 May 2011 12:23:34 -0700 (PDT)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id w1sm2821186anh.10.2011.05.20.12.23.31
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 20 May 2011 12:23:32 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 20 May 2011 19:23:03 +0000
Message-Id: <cover.1305917406.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-oe][PATCH 0/3] Pull request from O.S. Systems tree
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
X-List-Received-Date: Fri, 20 May 2011 19:26:32 -0000

The following changes since commit 5d96769da5d7acdd700f6f1a45f417e840e5a7d8:

  uclibc: Rename uclibc-libargp -> uclibc-argp and uclibc-libbacktrace -> uclibc-backtrace (2011-05-20 09:08:09 +0200)

are available in the git repository at:
  git://github.com/OSSystems/meta-oe.git master
  https://github.com/OSSystems/meta-oe/tree/master

Otavio Salvador (3):
  xorg-xserver/xorg-xserver-common.inc: do not install modules' .la
    files
  freerdp-extension-xpunlimited: add git version
  freerdp: fix homepage field

 .../xorg-xserver/xorg-xserver-common.inc           |    4 +-
 .../freerdp/freerdp-extension-xpunlimited_git.bb   |   23 ++++++++++++++++++++
 meta-oe/recipes-support/freerdp/freerdp.inc        |    2 +-
 3 files changed, 26 insertions(+), 3 deletions(-)
 create mode 100644 meta-oe/recipes-support/freerdp/freerdp-extension-xpunlimited_git.bb

-- 
1.7.2.5



