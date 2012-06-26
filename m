Received: from seketeli.net ([91.121.166.71] helo=ms.seketeli.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <apelete@seketeli.net>) id 1SjcPI-0002aS-7K
	for openembedded-devel@openembedded.org; Tue, 26 Jun 2012 22:30:40 +0200
Received: from localhost (unknown [109.190.26.176])
	by ms.seketeli.net (Postfix) with ESMTP id 8AA45EA040;
	Tue, 26 Jun 2012 22:26:36 +0200 (CEST)
Received: by localhost (Postfix, from userid 1000)
	id 4261864496; Tue, 26 Jun 2012 22:19:47 +0200 (CEST)
From: Apelete Seketeli <apelete@seketeli.net>
To: openembedded-devel@openembedded.org
Date: Tue, 26 Jun 2012 22:19:46 +0200
Message-Id: <1340741987-29429-1-git-send-email-apelete@seketeli.net>
X-Mailer: git-send-email 1.7.10
Cc: Kristoffer Ericson <kristoffer.ericson@gmail.com>
Subject: [oe-classic][PATCH 0/1] task-muffinman: remove phoneme-advanced-foundation
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
X-List-Received-Date: Tue, 26 Jun 2012 20:30:40 -0000

Hello,

phoneme-advanced-foundation which is used as a dependency in
task-muffinman.bb is not supported any longer. In order to build
muffinman-image, I removed the dependency from the task recipe.

The patch that comes as a follow-up of this message is what it's all
about, and it is targeting oe-classic.

Apelete Seketeli (1):
  task-muffinman: remove phoneme-advanced-foundation

 recipes/tasks/task-muffinman.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
1.7.10



