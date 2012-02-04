Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tworaz666@gmail.com>) id 1RtkXg-0008HD-C5
	for openembedded-devel@lists.openembedded.org;
	Sat, 04 Feb 2012 19:40:56 +0100
Received: by eaal10 with SMTP id l10so1144088eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 04 Feb 2012 10:32:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=SN9LJV+i9X7svZGLk4Ck2xlVCull44hyWxLJEzuJ9f0=;
	b=QQUrYkN+PGZrSNi6YGr1F20orgLJuuWBMj62bCywzX9VMnn1JKxooCW9SfbVxk/H/W
	3d+8M1Lwn9ByYrr+XDBvWc+yeKGCemnyBmtJa5aTapMLGJ8LriZK3gVk+2w29f6m0rMJ
	ZBK+M9PabEZZR+vJTCY5JK1WOOXtY7Mry3Bgc=
Received: by 10.213.11.20 with SMTP id r20mr444265ebr.4.1328380377630;
	Sat, 04 Feb 2012 10:32:57 -0800 (PST)
Received: from localhost.localdomain (89-77-50-243.dynamic.chello.pl.
	[89.77.50.243])
	by mx.google.com with ESMTPS id z47sm30330292eeh.9.2012.02.04.10.32.56
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 04 Feb 2012 10:32:56 -0800 (PST)
From: Peter Tworek <tworaz666@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  4 Feb 2012 19:30:46 +0100
Message-Id: <1328380249-11697-1-git-send-email-tworaz666@gmail.com>
X-Mailer: git-send-email 1.7.3.4
Subject: [meta-xfce][PATCH 0/3] Stable packages version updates + QA warning fixes.
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
X-List-Received-Date: Sat, 04 Feb 2012 18:40:56 -0000

Peter Tworek (3):
  xfconf: Update to latest stable version 4.8.1.
  xfce4-settings: Update to latest stable version 4.8.3.
  xfce4-panel: Disable building of static libraries.

 .../recipes-xfce/xfce4-panel/xfce4-panel_4.8.6.bb  |   13 +++++--------
 .../xfce4-settings/xfce4-settings_4.8.2.bb         |   16 ----------------
 .../xfce4-settings/xfce4-settings_4.8.3.bb         |   14 ++++++++++++++
 meta-xfce/recipes-xfce/xfconf/xfconf_4.8.0.bb      |   15 ---------------
 meta-xfce/recipes-xfce/xfconf/xfconf_4.8.1.bb      |   13 +++++++++++++
 5 files changed, 32 insertions(+), 39 deletions(-)
 delete mode 100644 meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.8.2.bb
 create mode 100644 meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.8.3.bb
 delete mode 100644 meta-xfce/recipes-xfce/xfconf/xfconf_4.8.0.bb
 create mode 100644 meta-xfce/recipes-xfce/xfconf/xfconf_4.8.1.bb

-- 
1.7.3.4



