Received: from [192.216.230.225] (helo=tinman.treke.net)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <bugzilla-daemon@tinman.treke.net>)
	id 1GVCgf-0006Uh-8c for openembedded-devel@lists.openembedded.org;
	Wed, 04 Oct 2006 21:45:49 +0200
Received: by tinman.treke.net (Postfix, from userid 33)
	id 4359E401B46; Wed,  4 Oct 2006 12:14:44 -0700 (PDT)
X-Bugzilla-Reason: AssignedTo
To: openembedded-devel@lists.openembedded.org
From: bugzilla-daemon@tinman.treke.net
Message-Id: <20061004191444.4359E401B46@tinman.treke.net>
Date: Wed,  4 Oct 2006 12:14:44 -0700 (PDT)
Subject: [Bug 1453] htcuniversal: Missing files in the and some other stuff
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.8
Precedence: list
Reply-To: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@lists.openembedded.org>
List-Id: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 04 Oct 2006 19:45:49 -0000

http://bugs.openembedded.org/show_bug.cgi?id=1453


pmiscml@gmail.com changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
            Summary|htc ubiversal: Missing files|htcuniversal: Missing files
                   |in the and some other stuff |in the and some other stuff




------- Comment #2 from pmiscml@gmail.com  2006-10-04 12:14 -------
Well, there's no duplicate line in inittab as of now. Also, why there's
machine-specific inittab at all? As of now, it just matches default one.

As foe EABI matter, newer handhelds-pxa-2.6_*.bb versions themeselves select
what to use based on distro type. But the default for all other defconfigs is
OABI, and I guess it's nice idea to stick to this convention.


-- 
Configure bugmail: http://bugs.openembedded.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.


