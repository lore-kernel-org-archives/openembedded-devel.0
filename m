Received: from mail-fx0-f51.google.com ([209.85.161.51])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QjdxX-0003hE-L4
	for openembedded-devel@lists.openembedded.org;
	Wed, 20 Jul 2011 23:05:37 +0200
Received: by fxh10 with SMTP id 10so2390408fxh.10
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Jul 2011 14:01:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=cNnR+WGVRcawRKiXriCFG0byB/R4OXpXVuwanmvICU4=;
	b=knEd1YSxrFcyPlGkDpO5HBB6zfHnDkqWi/y95JDo9rJEkbjF9Bx3mZ+Y+cblq1w4vd
	SQTByqvbM0YYgYY67uA3/47jgHPQq238ciiBR7zjGldGJ5Z2uAfukaBhR3jFBo4LJ8fj
	tKRbSFGdM3a4Wn710Gmvl3ATCGvNyXhqXgnN4=
Received: by 10.223.55.209 with SMTP id v17mr1157610fag.77.1311195689229;
	Wed, 20 Jul 2011 14:01:29 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id f7sm184101faa.32.2011.07.20.14.01.27
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 20 Jul 2011 14:01:28 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 20 Jul 2011 23:01:19 +0200
Message-Id: <cover.1311195655.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.6
Subject: [meta-gnome][PATCH 0/2] Pull request #1
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
X-List-Received-Date: Wed, 20 Jul 2011 21:05:37 -0000

The following changes since commit 037a063303d35c2fab8097d977aa5625c916c565:

  connman: update to 0.76 (2011-07-20 09:13:00 +0200)

are available in the git repository at:
  git://git.openembedded.org/meta-openembedded-contrib jansa/meta-gnome
  http://cgit.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/?h=jansa/meta-gnome

Martin Jansa (2):
  libgnome-keyring: inherit perlnative
  gconf: inherit perlnative

 meta-gnome/recipes-gnome/gconf/gconf_2.32.4.bb     |    2 +-
 .../libgnome/libgnome-keyring_2.32.0.bb            |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

-- 
1.7.6



