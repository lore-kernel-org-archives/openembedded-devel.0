Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RadTb-0004Av-NF
	for openembedded-devel@lists.openembedded.org;
	Wed, 14 Dec 2011 02:17:43 +0100
Received: by yhoo47 with SMTP id o47so889767yho.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Dec 2011 17:10:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer;
	bh=0VA3gJhJ7gAMjwZaKRpfauB+QgKt0EeHs6YCcm9F/uM=;
	b=G05jVy8Ip6KtpgmvdZ4Exc3BaWLZ8/D2iJAjye41sUGNZATwUh5tNmAq3aNjn8UnQ9
	AWkvHcELmdZgtw2PZMMkQRDtKwJdkwyPOm/lhRxgQLcpX1zNZSfCL93vBFzRgJJQv28K
	8xpOgiDKqJEcMwHZ96gqqkspiJrx+/g7u5tzs=
Received: by 10.236.77.232 with SMTP id d68mr7666571yhe.98.1323825047094;
	Tue, 13 Dec 2011 17:10:47 -0800 (PST)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id 37sm2306489anu.21.2011.12.13.17.10.45
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 13 Dec 2011 17:10:46 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 14 Dec 2011 01:10:27 +0000
Message-Id: <cover.1323824998.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
Subject: [meta-oe][PATCH 0/8] Remove PRIORITY set as optional as it the default
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
X-List-Received-Date: Wed, 14 Dec 2011 01:17:43 -0000

The following changes since commit 7ad9db8b3b6dd8fb9f85032b02344036015a9698:

  gnome-panel : Fix format of LICENSE field. (2011-12-12 18:45:06 +0100)

are available in the git repository at:
  git://github.com/OSSystems/meta-oe master
  https://github.com/OSSystems/meta-oe/tree/master

Otavio Salvador (8):
  openvpn.inc: drop 'PRIORITY = "optional"' as it is the default
  faad2_2.7.bb: drop 'PRIORITY = "optional"' as it is the default
  id3lib_3.8.3.bb: drop 'PRIORITY = "optional"' as it is the default
  libav.inc: drop 'PRIORITY = "optional"' as it is the default
  mplayer2_git.bb: drop 'PRIORITY = "optional"' as it is the default
  xpext_1.0-5.bb: drop 'PRIORITY = "optional"' as it is the default
  qwt.inc: drop 'PRIORITY = "optional"' as it is the default
  liblinebreak_1.2.bb: drop 'PRIORITY = "optional"' as it is the
    default

 meta-oe/recipes-connectivity/openvpn/openvpn.inc   |    1 -
 meta-oe/recipes-multimedia/faad2/faad2_2.7.bb      |    1 -
 meta-oe/recipes-multimedia/id3lib/id3lib_3.8.3.bb  |    1 -
 meta-oe/recipes-multimedia/libav/libav.inc         |    1 -
 meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb |    1 -
 meta-oe/recipes-multimedia/xpext/xpext_1.0-5.bb    |    1 -
 meta-oe/recipes-qt/qwt/qwt.inc                     |    1 -
 .../liblinebreak/liblinebreak_1.2.bb               |    1 -
 8 files changed, 0 insertions(+), 8 deletions(-)

-- 
1.7.2.5



