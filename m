Received: from mail-ee0-f54.google.com ([74.125.83.54])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1Tt5Xd-0004vm-6s
	for openembedded-devel@lists.openembedded.org;
	Thu, 10 Jan 2013 00:58:44 +0100
Received: by mail-ee0-f54.google.com with SMTP id c13so1137610eek.13
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 09 Jan 2013 15:43:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:mime-version
	:content-type:content-transfer-encoding;
	bh=wJ2e/2Z6BeUb8gclMY/4jbT/gBfumLMtcWHrJaJZ70w=;
	b=rw5W4QcOB8Z4J/aPNryBSfpYteTPeV7J9nM/XE7b7qEDkByBuOXocnyLzFhBE9o6TU
	yiZfr/yEbfFNmr8rd8U1wfruKEsvruNCJ2oKXOhVbDG6ae2k+ahyyUSYJ7tlsmLMCpSe
	Nu56U9IB/f7hyg9p3VrkqKMIoGATEr53pj/k3OBetZAJsYwTcGZ8lAcDDugXsnVK0o/V
	VptaTSt6U28h4eaIyQr6rA4l87ykDhL1dL7/bwf/jQe8CmW4TGQNU2yVyhDL/goJeSv/
	E/Ev7mUZa0iRXqUIqYFbluTfS16EIgBKpBs6Jn2qbvbDurImS2L7fVSeRD+EzD12IKpc
	sW2Q==
X-Received: by 10.14.215.197 with SMTP id e45mr188196125eep.0.1357775008654;
	Wed, 09 Jan 2013 15:43:28 -0800 (PST)
Received: from localhost.localdomain (p5B0A280F.dip.t-dialin.net.
	[91.10.40.15])
	by mx.google.com with ESMTPS id e2sm144302197eeo.8.2013.01.09.15.43.27
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 09 Jan 2013 15:43:27 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 10 Jan 2013 00:43:12 +0100
Message-Id: <1357774995-1104-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
MIME-Version: 1.0
Subject: [meta-multimedia/meta-oe/meta-systemd 0/3] new recipes/appends
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
X-List-Received-Date: Wed, 09 Jan 2013 23:58:45 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

1+2 resend (Patchwork was down)
3. I have this in and working for long time

The following changes since commit 89d5899c38ec94b0560a3496b020e45b40d8251c:

  python-distutils-extra: initial add 2.36 (2013-01-09 16:20:22 +0100)

are available in the git repository at:
  git://gitorious.org/schnitzeltony-oe-meta/meta-openembedded.git patches

Andreas Müller (3):
      openal-soft: initial add 1.15.1
      physfs: initial add 2.0.3
      bluez4: add systemd support

 .../openal/openal-soft_1.15.1.bb                   |   20 ++++++++++++++++++++
 meta-oe/recipes-support/physfs/physfs_2.0.3.bb     |   11 +++++++++++
 .../bluez/bluez4_4.101.bbappend                    |    8 ++++++++
 3 files changed, 39 insertions(+), 0 deletions(-)
 create mode 100644 meta-multimedia/recipes-multimedia/openal/openal-soft_1.15.1.bb
 create mode 100644 meta-oe/recipes-support/physfs/physfs_2.0.3.bb
 create mode 100644 meta-systemd/oe-core/recipes-connectivity/bluez/bluez4_4.101.bbappend

-- 
1.7.4.4



