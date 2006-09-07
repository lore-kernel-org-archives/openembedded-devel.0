Received: from [192.216.230.225] (helo=tinman.treke.net)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <bugzilla-daemon@tinman.treke.net>)
	id 1GLCZZ-0000CC-IH for openembedded-devel@lists.openembedded.org;
	Thu, 07 Sep 2006 07:37:10 +0200
Received: by tinman.treke.net (Postfix, from userid 33)
	id B75F5401B48; Wed,  6 Sep 2006 22:12:56 -0700 (PDT)
X-Bugzilla-Reason: AssignedTo
To: openembedded-devel@lists.openembedded.org
From: bugzilla-daemon@tinman.treke.net
Message-Id: <20060907051256.B75F5401B48@tinman.treke.net>
Date: Wed,  6 Sep 2006 22:12:56 -0700 (PDT)
Subject: [Bug 1393] New: OZ 3.5.4.1/GPE on Akita: A bug in GPE-Contacts app
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
X-List-Received-Date: Thu, 07 Sep 2006 05:37:11 -0000

http://bugs.openembedded.org/show_bug.cgi?id=1393

           Summary: OZ 3.5.4.1/GPE on Akita: A bug in GPE-Contacts app
           Product: Openembedded
           Version: OpenZaurus 3.5.4.x
          Platform: Other
        OS/Version: Linux
            Status: NEW
          Severity: major
          Priority: P2
         Component: Distributions
        AssignedTo: openembedded-devel@lists.openembedded.org
        ReportedBy: re-miel@runbox.com
         QAContact: tinderbox-oe@gmx.net


After running the Contacts app, I click on "Properties" and in the brought up
window choose the "Editing Layout" tab. There I create any new field, for
example I create a field titled "Nickname:" with tag "NICKNAME" in the section
titled "General". 
The field promptly appears, and I can fill it in both when editing the old
Contact entries and when entering new ones. 
However, when I quit the Contacts app and then run it again, the created field
("Nickname:") is
no longer in the layout, as can be verified by clicking on "Properties" and not
finding it anywhere in the "Editing Layout" tab. Apparently it (the layout)
just doesn't get saved when quitting the app.

For me, this renders app useless, as I really need to have more fields than in
the (very basic) default layout.


-- 
Configure bugmail: http://bugs.openembedded.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.


