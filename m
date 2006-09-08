Received: from [192.216.230.225] (helo=tinman.treke.net)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <bugzilla-daemon@tinman.treke.net>)
	id 1GLn7L-0007lV-BS for openembedded-devel@lists.openembedded.org;
	Fri, 08 Sep 2006 22:38:27 +0200
Received: by tinman.treke.net (Postfix, from userid 33)
	id 9BB18401B45; Fri,  8 Sep 2006 13:13:59 -0700 (PDT)
X-Bugzilla-Reason: AssignedTo
To: openembedded-devel@lists.openembedded.org
From: bugzilla-daemon@tinman.treke.net
Message-Id: <20060908201359.9BB18401B45@tinman.treke.net>
Date: Fri,  8 Sep 2006 13:13:59 -0700 (PDT)
Subject: [Bug 1380] HEAD uClibc build fails on uClibc install
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
X-List-Received-Date: Fri, 08 Sep 2006 20:38:27 -0000

http://bugs.openembedded.org/show_bug.cgi?id=1380





------- Comment #3 from jonesml@fastmail.to  2006-09-08 13:13 -------
(In reply to comment #2)
> fixed.
> 
> renamed do_stage to do_install_prepend 
> 
> (do_stage used to be before do_install, but nowadays it is after, which broke
> things for uclibc).
> 

Thanks!


-- 
Configure bugmail: http://bugs.openembedded.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.


