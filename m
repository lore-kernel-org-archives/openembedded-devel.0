Received: from static.88-198-71-155.clients.your-server.de ([88.198.71.155]
	helo=socrates.bennee.com) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kernel-hacker@bennee.com>) id 1PrpOR-0005Fk-KA
	for openembedded-devel@lists.openembedded.org;
	Tue, 22 Feb 2011 11:23:02 +0100
Received: from localhost ([127.0.0.1] helo=sloy.cambridgebroadband.com)
	by socrates.bennee.com with esmtp (Exim 4.72)
	(envelope-from <kernel-hacker@bennee.com>) id 1PrpNW-0006RI-JO
	for openembedded-devel@lists.openembedded.org;
	Tue, 22 Feb 2011 11:21:58 +0100
From: kernel-hacker@bennee.com
To: openembedded-devel@lists.openembedded.org
Date: Tue, 22 Feb 2011 10:21:30 +0000
Message-Id: <1298370092-31915-1-git-send-email-kernel-hacker@bennee.com>
X-Mailer: git-send-email 1.7.4.1
X-SA-Exim-Connect-IP: 127.0.0.1
X-SA-Exim-Mail-From: kernel-hacker@bennee.com
X-SA-Exim-Scanned: No (on socrates.bennee.com); SAEximRunCond expanded to false
Subject: RFC PATCHES for libnet and lmsensors
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
X-List-Received-Date: Tue, 22 Feb 2011 10:23:12 -0000
X-List-Received-Date: Tue, 22 Feb 2011 10:23:12 -0000

The following two patches are speculative. The libnet one has been
causing me headaches for a while and is very much in the works for me
category. Neater solutions welcome.

The second patch was a result of a suggestion on #oe.

[PATCH 1/2] libnet: fake a libnet pkg to allow libnet-dev to be in SDK
[PATCH 2/2] libsensors: Remove clashing header definition from package


