Received: from [192.216.230.225] (helo=tinman.treke.net)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <bugzilla-daemon@tinman.treke.net>)
	id 1GLLsT-0002Kl-Pg for openembedded-devel@lists.openembedded.org;
	Thu, 07 Sep 2006 17:33:18 +0200
Received: by tinman.treke.net (Postfix, from userid 33)
	id A5A82401B46; Thu,  7 Sep 2006 08:09:08 -0700 (PDT)
X-Bugzilla-Reason: AssignedTo
To: openembedded-devel@lists.openembedded.org
From: bugzilla-daemon@tinman.treke.net
Message-Id: <20060907150908.A5A82401B46@tinman.treke.net>
Date: Thu,  7 Sep 2006 08:09:08 -0700 (PDT)
Subject: [Bug 1391] minimo package bit rotted badly
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
X-List-Received-Date: Thu, 07 Sep 2006 15:33:18 -0000

http://bugs.openembedded.org/show_bug.cgi?id=1391





------- Comment #5 from koen@dominion.kabel.utwente.nl  2006-09-07 08:09 -------
minimo.patch fails to apply here:

NOTE: package minimo-20060720: started
NOTE: package minimo-20060720-r0: task do_patch: started
NOTE: Applying patch 'minimo.patch'
Command Error: exit status: 1  Output:
Applying patch minimo.patch
patching file content/html/content/src/nsFormSubmission.cpp
patching file embedding/base/Makefile.in
patching file js/src/Makefile.in
patching file minimo/Makefile.in
patching file minimo/base/Makefile.in
patching file minimo/base/Minimo.cpp
patching file minimo/base/SplashScreen.cpp
patching file minimo/chrome/content/minimo.js
patching file minimo/config/linux_package.sh
patching file profile/dirserviceprovider/src/Makefile.in
patching file security/coreconf/Linux.mk
patching file security/coreconf/arch.mk
patching file toolkit/components/build/Makefile.in
patching file toolkit/components/startup/src/Makefile.in
patching file toolkit/xre/Makefile.in
patching file xpcom/build/Makefile.in
patching file xpcom/reflect/xptcall/src/md/unix/xptcstubs_arm.cpp
patching file xpfe/browser/src/Makefile.in
patching file xpfe/components/build/Makefile.in
patching file xpfe/components/filepicker/src/Makefile.in
patching file xpfe/components/find/src/Makefile.in
patching file content/html/content/src/nsFormSubmission.cpp
Hunk #1 FAILED at 1315.
1 out of 1 hunk FAILED -- saving rejects to file
content/html/content/src/nsFormSubmission.cpp.rej
patching file embedding/base/Makefile.in
Hunk #1 FAILED at 43.
1 out of 1 hunk FAILED -- saving rejects to file embedding/base/Makefile.in.rej
patching file js/src/Makefile.in
Hunk #1 FAILED at 46.
1 out of 1 hunk FAILED -- saving rejects to file js/src/Makefile.in.rej
patching file minimo/Makefile.in
Hunk #1 FAILED at 41.
1 out of 1 hunk FAILED -- saving rejects to file minimo/Makefile.in.rej
patching file minimo/base/Makefile.in
Hunk #1 FAILED at 95.
Hunk #2 FAILED at 138.
Hunk #3 FAILED at 171.
3 out of 3 hunks FAILED -- saving rejects to file minimo/base/Makefile.in.rej


-- 
Configure bugmail: http://bugs.openembedded.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.


