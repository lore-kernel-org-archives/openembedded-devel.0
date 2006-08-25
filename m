Received: from [192.216.230.225] (helo=tinman.treke.net)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <bugzilla-daemon@tinman.treke.net>)
	id 1GGfCc-0002uA-E0 for openembedded-devel@lists.openembedded.org;
	Fri, 25 Aug 2006 19:10:42 +0200
Received: by tinman.treke.net (Postfix, from userid 33)
	id 98C3B4014D2; Fri, 25 Aug 2006 09:49:46 -0700 (PDT)
X-Bugzilla-Reason: AssignedTo
To: openembedded-devel@lists.openembedded.org
From: bugzilla-daemon@tinman.treke.net
Message-Id: <20060825164946.98C3B4014D2@tinman.treke.net>
Date: Fri, 25 Aug 2006 09:49:46 -0700 (PDT)
Subject: [Bug 1358] New: gkdial packages doesn't create required /etc/chatscripts directory
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
X-List-Received-Date: Fri, 25 Aug 2006 17:10:43 -0000

http://bugs.openembedded.org/show_bug.cgi?id=1358

           Summary: gkdial packages doesn't create required /etc/chatscripts
                    directory
           Product: Openembedded
           Version: OpenZaurus 3.5.4.x
          Platform: ARM
        OS/Version: Linux
            Status: NEW
          Severity: major
          Priority: P2
         Component: Distributions
        AssignedTo: openembedded-devel@lists.openembedded.org
        ReportedBy: uncle.grog@gmail.com
         QAContact: tinderbox-oe@gmx.net


As the summary says, the gkdial package doesn't create the needed
/etc/chatscripts directory to be able to save host information.


-- 
Configure bugmail: http://bugs.openembedded.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.


