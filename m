Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SJiVH-0000mV-QT
	for openembedded-devel@lists.openembedded.org;
	Mon, 16 Apr 2012 11:45:47 +0200
Received: by wibhj13 with SMTP id hj13so4441038wib.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Apr 2012 02:36:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=Tx1Am4QatAwSEKQFfNSuydfey67yvdiKBOb7itgdMRI=;
	b=zLLAn4XXmLmB+ojFt+LwdfYrNxGP7VLfTg8S4dxKEiGu/Nud3U1NnLW1EItiZFKN6+
	b2O2Y4G8GZJOv35PwRygfc6PnzzV3P68eClUb8qCIFXe2qG2oAVCshJB0OAURHvkLOwQ
	qSTTc9thPtINJUAKgjlSNYYji01bgf56wKTSJBClF/RZBtmGqSCpqClnVxW7lJXRR9+k
	4G3NKxHIU8tKLou94tx5BQh9QRFXkC8KDsQ2jvEM3O9H8B1KSFKmmhsMaEfcI9FQ3SPN
	Pj/pzWKLaFzchZTstY+FsGbdC73IuhKE4N7P+p4xUYt9qPk5kMhxnc2OfXsQZHLascO9
	PGNQ==
Received: by 10.180.78.164 with SMTP id c4mr12493202wix.10.1334568983251;
	Mon, 16 Apr 2012 02:36:23 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id ff9sm18503416wib.2.2012.04.16.02.36.22
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 16 Apr 2012 02:36:22 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 16 Apr 2012 11:36:15 +0200
Message-Id: <cover.1334568930.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.5
Cc: Radek Dostal <rd@radekdostal.com>
Subject: [meta-oe][meta-efl][PATCH 0/3] Small changes and EFL bump 20120416
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
X-List-Received-Date: Mon, 16 Apr 2012 09:45:47 -0000

The following changes since commit 397dba1ab21184317019e9808a3cc36e61050680:

  systemd: create empty machine-id to fix first boot failures (2012-04-16 11:01:38 +0200)

are available in the git repository at:
  git://git.openembedded.org/meta-openembedded-contrib jansa/pull2
  http://cgit.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/?h=jansa/pull2

Martin Jansa (2):
  e-base: bump EFL_SRCREV
  pixman: remove IWMMXT setting

Radek Dostal (1):
  lighttpd: lastest oe-core installs lighttpd.conf directly to /etc/

 meta-efl/classes/e-base.bbclass                    |    2 +-
 .../lighttpd/lighttpd/lighttpd.service             |    2 +-
 .../lighttpd/lighttpd_1.4.30.bbappend              |    4 ++--
 .../xorg-lib/pixman_0.25.2.bbappend                |    6 ++----
 4 files changed, 6 insertions(+), 8 deletions(-)

-- 
1.7.8.5



