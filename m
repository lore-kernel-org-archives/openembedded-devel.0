Received: from [192.216.230.225] (helo=tinman.treke.net)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <bugzilla-daemon@tinman.treke.net>)
	id 1GLClK-0000Jj-N1 for openembedded-devel@lists.openembedded.org;
	Thu, 07 Sep 2006 07:49:19 +0200
Received: by tinman.treke.net (Postfix, from userid 33)
	id 1832E401B48; Wed,  6 Sep 2006 22:25:15 -0700 (PDT)
X-Bugzilla-Reason: AssignedTo
To: openembedded-devel@lists.openembedded.org
From: bugzilla-daemon@tinman.treke.net
Message-Id: <20060907052515.1832E401B48@tinman.treke.net>
Date: Wed,  6 Sep 2006 22:25:15 -0700 (PDT)
Subject: [Bug 1394] New: OZ 3.5.4.1/GPE on Akita: 'New/Edit entry' data entry fields are too small in Contacts app
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
X-List-Received-Date: Thu, 07 Sep 2006 05:49:19 -0000

http://bugs.openembedded.org/show_bug.cgi?id=1394

           Summary: OZ 3.5.4.1/GPE on Akita: 'New/Edit entry' data entry
                    fields are too small in Contacts app
           Product: Openembedded
           Version: OpenZaurus 3.5.4.x
          Platform: ARM
        OS/Version: Linux
            Status: NEW
          Severity: normal
          Priority: P2
         Component: Distributions
        AssignedTo: openembedded-devel@lists.openembedded.org
        ReportedBy: re-miel@runbox.com
         QAContact: tinderbox-oe@gmx.net


When running Contacts app on Akita (OZ 3.5.4.1/GPE), and trying to create a new
entry, the data entry fields "Company", "Job Title", "Phone", etc, are really
too small: 4-5 characters wide. This makes them very hard to use. 
Part of the problem is that they are laid out in a 2 column arrangement. Could
an option be incorporated  which forces the "new entry" (and "edit old entry")
to lay the data entry window one-per-line, so that they can be a decent width?
Alternatively, could the application be changed so as to allow the user to
specify in a config file, by hand, the minimum width, in characters, of each
data entry field?


-- 
Configure bugmail: http://bugs.openembedded.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.


