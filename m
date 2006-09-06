Received: from [192.216.230.225] (helo=tinman.treke.net)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <bugzilla-daemon@tinman.treke.net>)
	id 1GKvDj-00061k-Qt for openembedded-devel@lists.openembedded.org;
	Wed, 06 Sep 2006 13:05:28 +0200
Received: by tinman.treke.net (Postfix, from userid 33)
	id 7B67F401B2B; Wed,  6 Sep 2006 03:41:32 -0700 (PDT)
X-Bugzilla-Reason: AssignedTo
To: openembedded-devel@lists.openembedded.org
From: bugzilla-daemon@tinman.treke.net
Message-Id: <20060906104132.7B67F401B2B@tinman.treke.net>
Date: Wed,  6 Sep 2006 03:41:32 -0700 (PDT)
Subject: [Bug 1390] New: iptables support in 3.5.4.1 (OZ/GPE)
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
X-List-Received-Date: Wed, 06 Sep 2006 11:05:28 -0000

http://bugs.openembedded.org/show_bug.cgi?id=1390

           Summary: iptables support in 3.5.4.1 (OZ/GPE)
           Product: Openembedded
           Version: OpenZaurus 3.5.4.x
          Platform: ARM
        OS/Version: Linux
            Status: NEW
          Severity: major
          Priority: P1
         Component: Build
        AssignedTo: openembedded-devel@lists.openembedded.org
        ReportedBy: bart_botma@yahoo.com
         QAContact: tinderbox-oe@gmx.net
 BugsThisDependsOn: 465


This is NOT a duplicate of bug 455.
It looks like a duplicate of 465, but that one is for the 2.4 kernel. And that
one is removed because of a claimed duplicate for bug 455.

Taken from 465:
> gpe-shield is part of the 3.5.4RC gpe image, and requires kernel support for
> iptables.
> But CONFIG_IP_NF_IPTABLES is not defined in the kernel config for akita.
> Maybe gpe-shield should be removed... or better, netfilter/iptables support
> added to the akita 2.4 kernel.

But this applies now to OZ/GPE 3.5.4.1 with a 2.6 kernel!
Add support as kernel module?

Many thanks in advance.


-- 
Configure bugmail: http://bugs.openembedded.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.


