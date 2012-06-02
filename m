Received: from mail-vb0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1SasVI-0006rd-5U
	for openembedded-devel@lists.openembedded.org;
	Sat, 02 Jun 2012 19:52:44 +0200
Received: by vbbfr13 with SMTP id fr13so2065503vbb.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 02 Jun 2012 10:42:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:subject:date:message-id:x-mailer;
	bh=r3L8RVd3rvhKlSGF9gcM7HtDkhvKXAEWPWRP8E8Bw84=;
	b=FGReUPzODY0FOzKLrR/vi3212cHNJ2apPkJO2jvJQp8wymT2vBUoKM44h1HQRqkBlq
	XdAsx7ypOuSpN0q2eowaXvqDp5QAqE+JxfzKfvGn8feUjonPCOllW2UuaFUhBJRkINvc
	07NHXhRr44b9ZJrhOHW3ZGHqHQubVZtP9U8/yJzDnTLLmrRpn1Gk+bXtDMYEBN4yfc6I
	YZoaqBOFrsDi+/+KN0vkg1IwjQ8LH+eEUW1ZOJ4pcgmvx9Ylcfo79gxIP+y1PWgwgQc7
	zG/z0ABj8ya7mrtB0uxW4vjVtwkf6lUgHCs7e/xcFiUqk+Za+bXDzhkYYCYtXMbitx0A
	3qDQ==
Received: by 10.52.34.200 with SMTP id b8mr6098716vdj.115.1338658941432;
	Sat, 02 Jun 2012 10:42:21 -0700 (PDT)
Received: from localhost.localdomain ([186.218.100.214])
	by mx.google.com with ESMTPS id bj6sm8849957vdc.12.2012.06.02.10.42.20
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 02 Jun 2012 10:42:20 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  2 Jun 2012 14:42:12 -0300
Message-Id: <cover.1338658900.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
Subject: [PATCH][meta-oe 0/2] Patches fixing issues with owfs
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
X-List-Received-Date: Sat, 02 Jun 2012 17:52:44 -0000

The following changes since commit fb360b53a5f9715320fe161637e4b46737f52d8f:

  gcalctool: remove older version and drop 'patch=1' (2012-06-01 09:26:11 +0200)

are available in the git repository at:
  git://github.com/OSSystems/meta-oe master
  https://github.com/OSSystems/meta-oe/tree/master

Otavio Salvador (2):
  owfs: update to 2.8p15
  owfs: enable/disable modules to make build predicable

 .../owfs/{owfs_2.8p14.bb => owfs_2.8p15.bb}        |   11 +++++++++--
 1 files changed, 9 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-extended/owfs/{owfs_2.8p14.bb => owfs_2.8p15.bb} (88%)

-- 
1.7.2.5



