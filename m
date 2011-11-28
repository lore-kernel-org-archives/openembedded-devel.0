Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RV7XW-0000Um-Ii
	for openembedded-devel@lists.openembedded.org;
	Mon, 28 Nov 2011 21:10:58 +0100
Received: by yenl4 with SMTP id l4so1074770yen.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Nov 2011 12:04:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer;
	bh=Oo0/x7T9bSWo5Ph+W7qQb3T0qEHdQgyCp/xy+bpvffQ=;
	b=HrgovdrjBQrfK2u4IsIktLL3C8HQAOVzQSP8wKjV0mxbDfV8pw+fK2fU4NvX6OVuAi
	49h4g5b7QpQQ2eOtJHeS1rDaqo4OFaozQNSnXTnYakY2uXIwnwLV75XN/6a1KX4P12OV
	Bpi8lTNGzqnaLI/iusDg36HQbSyw9txkXdtFk=
Received: by 10.236.181.164 with SMTP id l24mr66693843yhm.22.1322510659915;
	Mon, 28 Nov 2011 12:04:19 -0800 (PST)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id k21sm22610168yhj.3.2011.11.28.12.04.18
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 28 Nov 2011 12:04:19 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 28 Nov 2011 20:04:06 +0000
Message-Id: <cover.1322510613.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
Subject: [meta-oe][PATCH 0/1] libinih: bump SRCREV
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
X-List-Received-Date: Mon, 28 Nov 2011 20:10:58 -0000

The following changes since commit 720cd3f32ca8cc4701e99effdd3b3da0cca8348d:

  digitemp: fix QA issues: (2011-11-28 11:58:39 +0100)

are available in the git repository at:
  git://github.com/OSSystems/meta-oe master
  https://github.com/OSSystems/meta-oe/tree/master

Otavio Salvador (1):
  libinih: bump SRCREV

 meta-oe/recipes-support/inih/libinih_git.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

-- 
1.7.2.5



