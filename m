Received: from mail-fx0-f51.google.com ([209.85.161.51])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Qjdv5-0003D0-FG
	for openembedded-devel@lists.openembedded.org;
	Wed, 20 Jul 2011 23:03:03 +0200
Received: by fxh10 with SMTP id 10so2387421fxh.10
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Jul 2011 13:58:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=PXE1B/GqmKrKd4Xi+r/aK7HItnqTKOx08z+VPOROvPE=;
	b=BfEAn/VOYCP47mRv4WO1ujOfH6CkYpcL6Lla8CqD8shTgqFXfRGGZiRsj/aFGZ2v1G
	OFW8LvGEYSxmpDPyBF9+RO5/+K04xAfSkcRMcVyXg1X683gaJuV6ee36rCX7zL5IUtOk
	42Yktugx1CpyQvJrig6idr1aA8Cgb0nhDaO/s=
Received: by 10.204.154.194 with SMTP id p2mr2609342bkw.257.1311195525239;
	Wed, 20 Jul 2011 13:58:45 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id q1sm4070484faa.1.2011.07.20.13.58.42
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 20 Jul 2011 13:58:43 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 20 Jul 2011 22:58:35 +0200
Message-Id: <cover.1311195484.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.6
Subject: [meta-oe][PATCH 0/5] Pull request #18
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
X-List-Received-Date: Wed, 20 Jul 2011 21:03:03 -0000

The following changes since commit 037a063303d35c2fab8097d977aa5625c916c565:

  connman: update to 0.76 (2011-07-20 09:13:00 +0200)

are available in the git repository at:
  git://git.openembedded.org/meta-openembedded-contrib jansa/meta-oe
  http://cgit.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/?h=jansa/meta-oe

Martin Jansa (5):
  vala-dbus-binding-tool: inherit perlnative
  pidgin: inherit perlnative
  tangogps: add misssing dependency bluez4
  bluez4: add missing dependency usbpath
  vala-terminal: inherit perlnative

 meta-oe/recipes-connectivity/bluez/bluez4_4.93.bb  |    2 +-
 .../vala-dbus-binding-tool.inc                     |    2 +-
 .../recipes-navigation/tangogps/tangogps_0.99.4.bb |    2 +-
 meta-oe/recipes-support/pidgin/pidgin.inc          |    2 +-
 .../vala-terminal/vala-terminal_git.bb             |    2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

-- 
1.7.6



