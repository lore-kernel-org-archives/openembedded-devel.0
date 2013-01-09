Received: from mail-ee0-f50.google.com ([74.125.83.50])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1TskGy-0008B1-VO
	for openembedded-devel@lists.openembedded.org;
	Wed, 09 Jan 2013 02:16:06 +0100
Received: by mail-ee0-f50.google.com with SMTP id b45so557628eek.9
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 08 Jan 2013 17:00:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:mime-version
	:content-type:content-transfer-encoding;
	bh=GQZ06AFSe0kpb0fR7F10tRjkByoUpEVFt0O8vy3nR6k=;
	b=llFIAvarAfw05ONxm0bEQVC0u2eGaVTu2aLEkxfmHtRRecr3hv4IZEYf3sazeAh6J/
	EDV8tn6qwaOkcbtOlI5LFMhi4K+a1xvlGU5+XyXpQNlG62/7H+C7hk/GzeNxZ8ncnW7V
	6TyP/MEyoKM7l42fhJrnBvQBGyNA88hLsIcxnx3kB8UPUnAzb8vAXHsPrabs8cdZNfmZ
	xXqm/AW+hBV/f27bvNjazerzJRD3/61zl6MSQ+KiZRY7whO3hVLRocr9rZqcd4gPXzla
	KG4yS+GmMB0AUiGubQnJy/PoPHUzZ69jUIwMcvN1zLgh8xKURIngIiLUJYAxL+L/idpL
	X6wQ==
X-Received: by 10.14.216.70 with SMTP id f46mr178167323eep.12.1357693253717;
	Tue, 08 Jan 2013 17:00:53 -0800 (PST)
Received: from localhost.localdomain (p5B0A0819.dip.t-dialin.net. [91.10.8.25])
	by mx.google.com with ESMTPS id q44sm138552893eep.5.2013.01.08.17.00.51
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 08 Jan 2013 17:00:52 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  9 Jan 2013 02:00:37 +0100
Message-Id: <1357693239-13210-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
MIME-Version: 1.0
Subject: [meta-oe/meta-multimedia 0/2] games preparations
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
X-List-Received-Date: Wed, 09 Jan 2013 01:16:09 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

While preparing / testing some games I would like to see these in common layers

Andreas Müller (2):
  openal-soft: initial add 1.15.1
  physfs: initial add 2.0.3

 .../openal/openal-soft_1.15.1.bb                   |   20 ++++++++++++++++++++
 meta-oe/recipes-support/physfs/physfs_2.0.3.bb     |   11 +++++++++++
 2 files changed, 31 insertions(+), 0 deletions(-)
 create mode 100644 meta-multimedia/recipes-multimedia/openal/openal-soft_1.15.1.bb
 create mode 100644 meta-oe/recipes-support/physfs/physfs_2.0.3.bb

-- 
1.7.4.4



