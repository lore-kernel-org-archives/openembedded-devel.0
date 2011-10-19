Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RGYGq-0004AU-Vd
	for openembedded-devel@lists.openembedded.org;
	Wed, 19 Oct 2011 17:41:33 +0200
Received: by yxo30 with SMTP id 30so1761253yxo.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Oct 2011 08:35:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer;
	bh=0axR/h3QkiwkzcVF27k3CHVHA4SbZot2hcbWzRJRZS8=;
	b=mu6kZg1zhIgbb7e5gkJmPJjLEJhlAC417SgAw3w1bbuzHVeRvWAVu3+PIuOHaZe8Ti
	+rmdgtxZ3n8zaaGOkPF4cAny7Mur7PnRynEIQSaf+L4D4AK12kiJsOOmDU1hbBmWZINf
	NVahgzbpE5k5IL08IIV+VwOwF9Hmw67Zw5lx8=
Received: by 10.151.92.21 with SMTP id u21mr6192159ybl.82.1319038541150;
	Wed, 19 Oct 2011 08:35:41 -0700 (PDT)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id m37sm16823371anq.11.2011.10.19.08.35.39
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 19 Oct 2011 08:35:40 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 19 Oct 2011 15:35:31 +0000
Message-Id: <cover.1319038482.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
Subject: [meta-oe][PATCH 0/1] SystemD related fix
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
X-List-Received-Date: Wed, 19 Oct 2011 15:41:33 -0000

The following changes since commit 59f9d80e83fd3275def5d909d7d0e1861fd8105b:

  cloud9 0.5.1: convert to fetch SRC_URI (2011-10-19 14:48:02 +0200)

are available in the git repository at:
  git://github.com/OSSystems/meta-oe master
  https://github.com/OSSystems/meta-oe/tree/master

Otavio Salvador (1):
  udev: udev-systemd refactory

 meta-oe/recipes-core/udev/udev_173.bb |    8 +++-----
 1 files changed, 3 insertions(+), 5 deletions(-)

-- 
1.7.2.5



