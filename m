Received: from [192.216.230.225] (helo=tinman.treke.net)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <bugzilla-daemon@tinman.treke.net>)
	id 1GSeCb-0007W9-5h for openembedded-devel@lists.openembedded.org;
	Wed, 27 Sep 2006 20:32:13 +0200
Received: by tinman.treke.net (Postfix, from userid 33)
	id 08F034014D2; Wed, 27 Sep 2006 11:02:56 -0700 (PDT)
X-Bugzilla-Reason: AssignedTo
To: openembedded-devel@lists.openembedded.org
From: bugzilla-daemon@tinman.treke.net
Message-Id: <20060927180256.08F034014D2@tinman.treke.net>
Date: Wed, 27 Sep 2006 11:02:56 -0700 (PDT)
Subject: [Bug 1439] perl 5.8.7 fails during configure
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
X-List-Received-Date: Wed, 27 Sep 2006 18:32:13 -0000

http://bugs.openembedded.org/show_bug.cgi?id=1439





------- Comment #3 from kristoffer_e1@hotmail.com  2006-09-27 11:02 -------
Colossus 7xx # grep -m1 "\/usr\/include\/.*\\.h" 
tmp/work/arm-linux/perl-5.8.7-r18/* -r | cut -f 1 -d ":"
Binary file tmp/work/arm-linux/perl-5.8.7-r18/perl-5.8.7/hostperl matches
Colossus 7xx # 


-- 
Configure bugmail: http://bugs.openembedded.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.


