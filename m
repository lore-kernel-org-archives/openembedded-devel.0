Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RaAaD-0002WW-CS
	for openembedded-devel@lists.openembedded.org;
	Mon, 12 Dec 2011 19:26:37 +0100
Received: by ghrr13 with SMTP id r13so4306058ghr.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Dec 2011 10:19:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer;
	bh=L3YAxc47umm5V9JkPLb+J5bWGWH0rvqMEpXV9hva0j8=;
	b=v/XveJniITqz7E86fbaq7wv7BHWpHx5hyAVmSPZ5pIIMTRL/PS/lLxESDewKIYiabm
	Q/V7GXMg/oxbg2MNiqTC9qvbpkkTcGDebvnwDziLnUHucCyibUjK5FknNIDcEC3kEpMD
	E4LBnHFzQGkKn6kPMzL/v3IjSA9yigBZYdDCI=
Received: by 10.236.165.98 with SMTP id d62mr7339517yhl.15.1323713979005;
	Mon, 12 Dec 2011 10:19:39 -0800 (PST)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id o9sm20041390yhk.20.2011.12.12.10.19.37
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 12 Dec 2011 10:19:38 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 12 Dec 2011 18:19:26 +0000
Message-Id: <cover.1323713931.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
Subject: [meta-oe][PATCH 0/2] Dropbear and qconnman changes
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
X-List-Received-Date: Mon, 12 Dec 2011 18:26:37 -0000

The following changes since commit 7ad9db8b3b6dd8fb9f85032b02344036015a9698:

  gnome-panel : Fix format of LICENSE field. (2011-12-12 18:45:06 +0100)

are available in the git repository at:
  git://github.com/OSSystems/meta-oe master
  https://github.com/OSSystems/meta-oe/tree/master

Otavio Salvador (2):
  dropbear: convert PR to use PRINC on bbappend
  qconnman: bump SRCREV

 .../dropbear/dropbear_2011.54.bbappend             |    2 +-
 meta-oe/recipes-qt/qconnman/qconnman.inc           |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

-- 
1.7.2.5



