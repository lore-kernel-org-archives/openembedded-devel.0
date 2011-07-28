Received: from na3sys009aog108.obsmtp.com ([74.125.149.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bengardiner@nanometrics.ca>) id 1QmXUB-0003zX-FW
	for openembedded-devel@lists.openembedded.org;
	Thu, 28 Jul 2011 22:47:15 +0200
Received: from mail-qy0-f180.google.com ([209.85.216.180]) (using TLSv1) by
	na3sys009aob108.postini.com ([74.125.148.12]) with SMTP
	ID DSNKTjHJ0kZ6Gqp6+YqT4PA4cDZkY/Gr3dqc@postini.com;
	Thu, 28 Jul 2011 13:43:01 PDT
Received: by mail-qy0-f180.google.com with SMTP id 30so2038075qyk.4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Jul 2011 13:42:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nanometrics.ca; s=google;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=pLpBVeB3zY8ZubzumTI7xlGpzwRJ6nWqildnHx3n/4M=;
	b=ie+gpN0fInEWU4wsjjru5X6ig0grziq/eeXGFYki3K/NpIiWjXm/xCUWQNf9BWcrBE
	lNYmQnJnemLSCVKc9qqdW7uL/2odOs/fZWzZKXSo6W1b+ZRIEM+QhonCGe70hlYc4oya
	gZLLZRLuM/0sxp0Zc32PNjzAdTWd1TKzu1RPg=
Received: by 10.229.190.211 with SMTP id dj19mr384371qcb.95.1311884394792;
	Thu, 28 Jul 2011 13:19:54 -0700 (PDT)
Received: from localhost.localdomain ([206.191.47.130])
	by mx.google.com with ESMTPS id q9sm920439qct.32.2011.07.28.13.19.53
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 28 Jul 2011 13:19:53 -0700 (PDT)
From: Ben Gardiner <bengardiner@nanometrics.ca>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 28 Jul 2011 16:19:46 -0400
Message-Id: <1311884386-21622-1-git-send-email-bengardiner@nanometrics.ca>
X-Mailer: git-send-email 1.7.4.1
Subject: [2011.03-maintenance]
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
X-List-Received-Date: Thu, 28 Jul 2011 20:47:16 -0000

Cherry-pick: f1d24b5a986233f869364eb109476f5184e76d10
Tested-by: Ben Gardiner <bengardiner@nanometrics.ca>

please add this to the 2011.03-maintenance branch

Ben Gardiner (1):
  raptor: add libxml2 DEPENDS

 recipes/raptor/raptor_1.4.21.bb |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

-- 
1.7.4.1



