Return-Path: <anders@chargestorm.se>
Received: from STOEXHUB01.domain01.net (STOEXHUB01.domain01.net
	[83.145.59.142])
	by mail.openembedded.org (Postfix) with ESMTP id 11FE06FE1F
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Jun 2014 13:01:33 +0000 (UTC)
Received: from localhost (213.114.64.43) by STOEXHUB01.domain01.net
	(10.12.10.1) with Microsoft SMTP Server id 8.3.279.1; Fri, 13 Jun 2014
	15:01:31 +0200
From: Anders Darander <anders@chargestorm.se>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 13 Jun 2014 15:01:20 +0200
Message-ID: <cover.1402664272.git.anders@chargestorm.se>
X-Mailer: git-send-email 2.0.0
MIME-Version: 1.0
Cc: Anders Darander <anders@chargestorm.se>
Subject: [meta-webserver][PATCH 0/2] webmin: themes and logins
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 13 Jun 2014 13:01:42 -0000
Content-Type: text/plain

This series improves the webmin recipe by:

1) allowing a layer to override the default login and password.
2) split out the themes from the main webmin package.

The following changes since commit 8316933b400ae6fda688637fcc3e202b38a8e12b:

  libol: compile issue files missing in B and packaging issue (2014-06-13 13:38:12 +0200)

are available in the git repository at:

  git://github.com/darander/meta-oe 362107ac6702cb380c86a7ac249b52f558d2b923
  https://github.com/darander/meta-oe/tree/webmin

Anders Darander (2):
  webmin: allow override of webmin login and password
  webmin: split out webmin themes

 meta-webserver/recipes-webadmin/webmin/webmin_1.620.bb | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

-- 
2.0.0


