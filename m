Received: from tygrysek.juszkiewicz.com.pl ([178.33.81.99])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <marcin.juszkiewicz@linaro.org>) id 1U3ZJG-0007Ch-DY
	for openembedded-devel@lists.openembedded.org;
	Thu, 07 Feb 2013 22:47:10 +0100
Received: from puchatek.dom (87-206-60-225.dynamic.chello.pl [87.206.60.225])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marcin@juszkiewicz.com.pl)
	by tygrysek.juszkiewicz.com.pl (Postfix) with ESMTPSA id 3E5E5D2271
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  7 Feb 2013 11:51:15 +0100 (CET)
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  7 Feb 2013 11:50:55 +0100
Message-Id: <1360234263-18278-1-git-send-email-marcin.juszkiewicz@linaro.org>
X-Mailer: git-send-email 1.8.0
Subject: Some recipes from my work on HipHopVM
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
X-List-Received-Date: Thu, 07 Feb 2013 21:47:10 -0000
X-List-Received-Date: Thu, 07 Feb 2013 21:47:10 -0000

Some time ago I started working on porting HipHopVM for AArch64
platform. My job was to identify and build all dependencies. Effect of
it is in this patchset.

I added them to meta-oe/recipes-support/ just to show them and get
suggestions where to move them. Some may be useful for people outside of
HHVM (which is 64bit only and (iirc) supports x86-64 now).

For most of them I will have updates during next months.



