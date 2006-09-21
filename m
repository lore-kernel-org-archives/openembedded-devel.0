Received: from [192.216.230.225] (helo=tinman.treke.net)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <bugzilla-daemon@tinman.treke.net>)
	id 1GQXan-0002GZ-O9 for openembedded-devel@lists.openembedded.org;
	Fri, 22 Sep 2006 01:04:29 +0200
Received: by tinman.treke.net (Postfix, from userid 33)
	id 76959401B45; Thu, 21 Sep 2006 15:36:41 -0700 (PDT)
X-Bugzilla-Reason: AssignedTo
To: openembedded-devel@lists.openembedded.org
From: bugzilla-daemon@tinman.treke.net
Message-Id: <20060921223641.76959401B45@tinman.treke.net>
Date: Thu, 21 Sep 2006 15:36:41 -0700 (PDT)
Subject: [Bug 1431] New: Build of ixp4xx-kernel includes non-fatal depmod error
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
X-List-Received-Date: Thu, 21 Sep 2006 23:04:30 -0000

http://bugs.openembedded.org/show_bug.cgi?id=1431

           Summary: Build of ixp4xx-kernel includes non-fatal depmod error
           Product: Openembedded
           Version: unspecified
          Platform: All
        OS/Version: Linux
            Status: NEW
          Severity: normal
          Priority: P2
         Component: Build
        AssignedTo: openembedded-devel@lists.openembedded.org
        ReportedBy: jonesml@fastmail.to
         QAContact: tinderbox-oe@gmx.net


Currently building ixp4xx-kernel_2.6.18 in OE HEAD.

I'm getting an error 'armeb-linux-depmod not found' in the kernel build
process. This seems to stem back to the Kernel bbclass and the fact that the
depmod executable in my tmp/cross/bin folder is called armeb-linux-depmod-2.6.

Thanks,

blaster8


-- 
Configure bugmail: http://bugs.openembedded.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.


