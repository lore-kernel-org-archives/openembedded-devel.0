Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RSTKP-0001LN-EG
	for openembedded-devel@lists.openembedded.org;
	Mon, 21 Nov 2011 13:50:29 +0100
Received: by ggnh4 with SMTP id h4so4632388ggn.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Nov 2011 04:43:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer;
	bh=GnYA1mFWCkcAEz0nvuN14kMmwdNLtlTnGF7fYS3SJP4=;
	b=kgsmIctjTv1q3r7n189HepveaQRaaIHdqzkFmnFfoah4DYDTiFp3I3AzvBH7xiVA2C
	IZVQAta8Q9eeBH9b1a1TdXuZiQQIGPu7+dA5DtAmvkk6eC321KjaSk+L2CRt49WKtFHG
	7va+qjo50ywhNsvag12Nb7Dt2opY+aYIv0L7Q=
Received: by 10.101.17.2 with SMTP id u2mr2927710ani.34.1321879439487;
	Mon, 21 Nov 2011 04:43:59 -0800 (PST)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id v5sm29146205anf.3.2011.11.21.04.43.57
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 21 Nov 2011 04:43:58 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 21 Nov 2011 12:43:49 +0000
Message-Id: <cover.1321879157.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
Subject: [meta-oe][PATCH 0/1] FreeRDP repository fix
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
X-List-Received-Date: Mon, 21 Nov 2011 12:50:29 -0000

The following changes since commit 0c1147ad8da559ebc23c54f6c3d39b4c40dbf00a:

  systemd: add prerm u-a calls (2011-11-21 12:08:21 +0100)

are available in the git repository at:
  git://github.com/OSSystems/meta-oe master
  https://github.com/OSSystems/meta-oe/tree/master

Otavio Salvador (1):
  freerdp: use FreeRDP-old repository as 1.0 release is not stable yet

 meta-oe/recipes-support/freerdp/freerdp_git.bb |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

-- 
1.7.2.5



