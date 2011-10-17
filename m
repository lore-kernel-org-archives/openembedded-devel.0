Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RFmze-0006gl-HY
	for openembedded-devel@lists.openembedded.org;
	Mon, 17 Oct 2011 15:12:38 +0200
Received: by ggnq1 with SMTP id q1so2809420ggn.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Oct 2011 06:06:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer;
	bh=B1e0MBa9CRZkcUiP5E2Yxb2nknhHQRdYgrQe3csUjNs=;
	b=wp4LVp3iiHrm2lq4FtekfNSq5yyUaLaocDuLZshYmjr0FRmI/jNu4odpxpjUtM4fGM
	aa7ZPZVO3baBLV1sbjfpKjwHGaf54DlvvtAuWGeYHLZETaAleUSphUtFlxNzFvj4QhKZ
	EWGhRvBUyGjna+8TpG8M07wl2D5pTYc8gEwWQ=
Received: by 10.151.13.10 with SMTP id q10mr15642631ybi.86.1318856807148;
	Mon, 17 Oct 2011 06:06:47 -0700 (PDT)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id u13sm36613507anf.14.2011.10.17.06.06.45
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 17 Oct 2011 06:06:46 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 17 Oct 2011 13:06:38 +0000
Message-Id: <cover.1318856759.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
Subject: [meta-oe][PATCH 0/1] Add digitemp
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
X-List-Received-Date: Mon, 17 Oct 2011 13:12:39 -0000

The following changes since commit fc95672460522ab79ad8fc5d1eb96e58e3358fe8:

  README: add top level readme, update meta-oe one (2011-10-17 09:27:01 +0200)

are available in the git repository at:
  git://github.com/OSSystems/meta-oe master
  https://github.com/OSSystems/meta-oe/tree/master

Otavio Salvador (1):
  digitemp: add 3.6.0 version

 meta-oe/recipes-support/digitemp/digitemp_3.6.0.bb |   16 ++++++++++++++++
 1 files changed, 16 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-support/digitemp/digitemp_3.6.0.bb

-- 
1.7.2.5



