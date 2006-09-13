Received: from [192.216.230.225] (helo=tinman.treke.net)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <bugzilla-daemon@tinman.treke.net>)
	id 1GNQPn-0000Le-PG for openembedded-devel@lists.openembedded.org;
	Wed, 13 Sep 2006 10:48:16 +0200
Received: by tinman.treke.net (Postfix, from userid 33)
	id 84A98401B48; Wed, 13 Sep 2006 01:22:34 -0700 (PDT)
X-Bugzilla-Reason: AssignedTo
To: openembedded-devel@lists.openembedded.org
From: bugzilla-daemon@tinman.treke.net
Message-Id: <20060913082234.84A98401B48@tinman.treke.net>
Date: Wed, 13 Sep 2006 01:22:34 -0700 (PDT)
Subject: [Bug 1414] New: Working version of ixp_npe microcode generator
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
X-List-Received-Date: Wed, 13 Sep 2006 08:48:16 -0000

http://bugs.openembedded.org/show_bug.cgi?id=1414

           Summary: Working version of ixp_npe microcode generator
           Product: Openembedded
           Version: unspecified
          Platform: ARM
               URL: http://www.zen98237.zen.co.uk/ixp-npe.tgz
        OS/Version: Linux
            Status: NEW
          Severity: normal
          Priority: P2
         Component: Distributions
        AssignedTo: openembedded-devel@lists.openembedded.org
        ReportedBy: jonesml@fastmail.to
         QAContact: tinderbox-oe@gmx.net


Can packages/ixp4xx/ixp4xx-npe_0.1.bb be deleted and the files present in the
tgz archive be placed inside the ixp4xx directory?

The purpose of this package is to extract and package the NPE-B firmware
allowing it to be loaded by hotplug on boot.


-- 
Configure bugmail: http://bugs.openembedded.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.


