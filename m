Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1ROXgz-0006yA-5J
	for openembedded-devel@lists.openembedded.org;
	Thu, 10 Nov 2011 17:41:33 +0100
Received: by yenm3 with SMTP id m3so2138832yen.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Nov 2011 08:35:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer;
	bh=tcC4aLhMZQqXYbESQKzLFyeH7SIuYvOd8Gs0ioWn9u0=;
	b=EuwNniaWUqCrUX8KQNHYTiulnxKVL8/5va2SgDI3I9xGCMmckYpKOytCpcgApyuVkQ
	2AEyuU9leXF9ZM+u6jaiKt8qjUGp1c12ghWvgmLn6ZcyA497W4PTAcNg+mBhuIfOMvl1
	fQrdC20nEVUs7nc0F9CHK/uzuAheNJy8lgKE0=
Received: by 10.101.188.11 with SMTP id q11mr1861231anp.144.1320942913758;
	Thu, 10 Nov 2011 08:35:13 -0800 (PST)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id f76sm12832266yhj.21.2011.11.10.08.35.11
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 10 Nov 2011 08:35:12 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 10 Nov 2011 16:35:04 +0000
Message-Id: <cover.1320942838.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
Subject: [meta-oe][PATCH 0/1] add atftp
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
X-List-Received-Date: Thu, 10 Nov 2011 16:41:33 -0000

This adds the atftp but this is not based on OE-Classic recipe as it
has many changes and improvement if compared against it.

The following changes since commit 1e93fb3cb6d716ad811bd26154fdcec42195c360:

  kbd: move to oe-core (2011-11-10 13:21:52 +0100)

are available in the git repository at:
  git://github.com/OSSystems/meta-oe master
  https://github.com/OSSystems/meta-oe/tree/master

Otavio Salvador (1):
  atftp: add 0.7 version

 meta-oe/recipes-extended/atftp/atftp_0.7.bb        |   51 ++++++++++++++++++++
 meta-oe/recipes-extended/atftp/files/atftpd.init   |   37 ++++++++++++++
 .../recipes-extended/atftp/files/atftpd.service    |   11 ++++
 3 files changed, 99 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-extended/atftp/atftp_0.7.bb
 create mode 100644 meta-oe/recipes-extended/atftp/files/atftpd.init
 create mode 100644 meta-oe/recipes-extended/atftp/files/atftpd.service

-- 
1.7.2.5



