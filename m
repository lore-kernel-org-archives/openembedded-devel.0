Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <joe.macdonald@windriver.com>) id 1UImCh-00051S-9w
	for openembedded-devel@lists.openembedded.org;
	Thu, 21 Mar 2013 21:35:16 +0100
Received: from yow-assmunch-03.corp.ad.wrs.com (yow-jmacdona-d3.wrs.com
	[128.224.147.66])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r2LKIKu3006936;
	Thu, 21 Mar 2013 13:18:20 -0700 (PDT)
From: Joe MacDonald <joe.macdonald@windriver.com>
To: openembedded-devel@lists.openembedded.org, marcin.juszkiewicz@linaro.org
Date: Thu, 21 Mar 2013 16:18:17 -0400
Message-Id: <1363897098-26498-1-git-send-email-joe.macdonald@windriver.com>
X-Mailer: git-send-email 1.8.2
Subject: cyrus-sasl2: Clean up QA issues
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
X-List-Received-Date: Thu, 21 Mar 2013 20:35:17 -0000

This resolves the situation for my builds and is based on a fix we did in a
previous tree I worked on.

Marcin:  Would you be able to confirm for me that this doesn't break anything
of yours?  I'm using this for building cyrus-sasl to support building OpenLDAP
myself, but I'd like to know it doesn't break anything of yours, since you
indicated you were using the current, RPATH-messy, version as a build
dependency.

-- 
-Joe.
:wq



