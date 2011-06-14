Received: from mail-vw0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1QWWrX-0006RA-WF
	for openembedded-devel@lists.openembedded.org;
	Tue, 14 Jun 2011 18:53:12 +0200
Received: by vws2 with SMTP id 2so5172754vws.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Jun 2011 09:49:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:sender:from:to:cc:subject:date:message-id
	:x-mailer; bh=OsCVXGRxdDUYSU/Ayy1wA4motW2nMz/ehPMiYfuihWs=;
	b=fuwQK8FFFJH/cNw2Ng1ZwsITlhE7HUMkZZ/xejpYrHsOTl/HabEVIAoi1Nlw4xU+xM
	Wv3UeMVXQEukSZ24eZPp/LIeqze+w/gA+rgYvP5LLB67in5UtsjtS41I3201PHoSBUJd
	QE7YufyUBPGHfR9UviTvPjbC/QTD1Y9zMgev0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer;
	b=SRcTKNZJbC8rbYmpxCXRIdhRcirQTwVj8WVwd05z40hW/PP6bVDdgtO0c4ZE+mvFas
	pR2V0OsR4U4zELTkKdYveuieKO6+wakKR+liO96xtRK0OQ8vi1QGR4sTGeaD/T3iJfgz
	f4TUMjacxvLFQH1SM1o4gylCoJbfnMIJL5Q7c=
Received: by 10.52.76.162 with SMTP id l2mr9869581vdw.140.1308070186185;
	Tue, 14 Jun 2011 09:49:46 -0700 (PDT)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id bt2sm2307123vdc.12.2011.06.14.09.49.43
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 14 Jun 2011 09:49:45 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 14 Jun 2011 16:49:31 +0000
Message-Id: <cover.1308070134.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [[meta-oe][PATCH 0/3] Pending fixes in O.S. Systems tree
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
X-List-Received-Date: Tue, 14 Jun 2011 16:53:12 -0000

The following changes since commit 797fc635c1a693abb07392a22e0b001bc331f633:

  gvfs: the sftp plugin only works with openssh-ssh (2011-06-13 20:20:15 +0200)

are available in the git repository at:
  git://github.com/OSSystems/meta-oe master
  https://github.com/OSSystems/meta-oe/tree/master

Otavio Salvador (3):
  xf86-video-geode: add 2.11.12 version recipe
  freerdp: bump SRCREV to gather fixes
  freerdp-extension-xpunlimited: bump SRCREV due library renaming

 .../xorg-driver/xf86-video-geode_2.11.12.bb        |   11 +++++++++++
 .../freerdp/freerdp-extension-xpunlimited_git.bb   |    2 +-
 meta-oe/recipes-support/freerdp/freerdp_git.bb     |    2 +-
 3 files changed, 13 insertions(+), 2 deletions(-)
 create mode 100644 meta-oe/recipes-graphics/xorg-driver/xf86-video-geode_2.11.12.bb

-- 
1.7.2.5



