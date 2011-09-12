Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1R36vD-0003Z1-79
	for openembedded-devel@lists.openembedded.org;
	Mon, 12 Sep 2011 15:51:39 +0200
Received: by gwb11 with SMTP id 11so3374672gwb.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Sep 2011 06:46:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer;
	bh=2pypBI3mhRsdT0R8IznjdZY6T1MX7l3QNPTtXkaSesw=;
	b=XHgEPHU7LC8znNZJ8bxvo6V8CMo6uz4t0aXMt3AK1o5i6XaZKJBxaUTuJWAzFIz94T
	a1xUfZw8owmaZe9uZuZcwyMYSpPRLuxSrzfpLI3p8lSpGkL76Yu7yRYQjcpXbHZwKWWg
	jbs0HqxFUdn+g/Gps6pG1CizG+Chqw3lrCOJw=
Received: by 10.90.217.2 with SMTP id p2mr453708agg.76.1315835190452;
	Mon, 12 Sep 2011 06:46:30 -0700 (PDT)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id o39sm14214795ani.17.2011.09.12.06.46.27
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 12 Sep 2011 06:46:28 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 12 Sep 2011 13:46:17 +0000
Message-Id: <cover.1315835148.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
Subject: [meta-oe][PATCH 0/1] Add xf86-input-void
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
X-List-Received-Date: Mon, 12 Sep 2011 13:51:39 -0000

The following changes since commit 4f8e5549a9ea263f1c33fc0f05b5a216a1d36524:

  vlc: remove hal dependency, fix PR (2011-09-07 10:44:36 +0200)

are available in the git repository at:
  git://github.com/OSSystems/meta-oe master
  https://github.com/OSSystems/meta-oe/tree/master

Otavio Salvador (1):
  xf86-input-void: add 1.4.0 recipe

 .../xorg-driver/xf86-input-void_1.4.0.bb           |    8 ++++++++
 1 files changed, 8 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-graphics/xorg-driver/xf86-input-void_1.4.0.bb

-- 
1.7.2.5



