Received: from static.88-198-71-155.clients.your-server.de ([88.198.71.155]
	helo=socrates.bennee.com) by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kernel-hacker@bennee.com>) id 1OjaKd-0005Nq-3z
	for openembedded-devel@lists.openembedded.org;
	Thu, 12 Aug 2010 18:08:39 +0200
Received: from localhost ([127.0.0.1] helo=pitcairn.cambridgebroadband.com)
	by socrates.bennee.com with esmtp (Exim 4.69)
	(envelope-from <kernel-hacker@bennee.com>) id 1OjZoU-0006Fl-99
	for openembedded-devel@lists.openembedded.org;
	Thu, 12 Aug 2010 17:35:26 +0200
From: kernel-hacker@bennee.com
To: openembedded-devel@lists.openembedded.org
Date: Thu, 12 Aug 2010 16:35:34 +0100
Message-Id: <1281627336-686-1-git-send-email-kernel-hacker@bennee.com>
X-Mailer: git-send-email 1.7.2.1
X-SA-Exim-Connect-IP: 88.198.71.155
X-SA-Exim-Mail-From: kernel-hacker@bennee.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: A few fixes (resend, hopefully not munged this time)
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
X-List-Received-Date: Thu, 12 Aug 2010 16:08:39 -0000

Hi,

Sorry for the delay resubmitting these. Please find attached the
following patches we added to OE during bringing up our tree. Our
actual patch series runs to around 14 patches but I assume your not
interested in more non-consumer boards or patches that "work for us".
However I'm happy to send them to the mailing list or privately if
someone wants to review them. A number of the patches were from Phil
Blundel and I believe have already worked their way upstream from his
trees.

[PATCH 1/2] freetype: include perl-native dependancy
[PATCH 2/2] recode: Fix configure step.

--
Alex.


