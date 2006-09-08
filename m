Received: from [192.216.230.225] (helo=tinman.treke.net)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <bugzilla-daemon@tinman.treke.net>)
	id 1GLfD0-0008MO-63 for openembedded-devel@lists.openembedded.org;
	Fri, 08 Sep 2006 14:11:46 +0200
Received: by tinman.treke.net (Postfix, from userid 33)
	id DC78D401B45; Fri,  8 Sep 2006 04:47:23 -0700 (PDT)
X-Bugzilla-Reason: AssignedTo
To: openembedded-devel@lists.openembedded.org
From: bugzilla-daemon@tinman.treke.net
Message-Id: <20060908114723.DC78D401B45@tinman.treke.net>
Date: Fri,  8 Sep 2006 04:47:23 -0700 (PDT)
Subject: [Bug 1400] New: Can not get 3.5.4.2-rc1 to work on collie
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
X-List-Received-Date: Fri, 08 Sep 2006 12:11:46 -0000

http://bugs.openembedded.org/show_bug.cgi?id=1400

           Summary: Can not get 3.5.4.2-rc1 to work on collie
           Product: Openembedded
           Version: OpenZaurus 3.5.4.x
          Platform: ARM
        OS/Version: Linux
            Status: NEW
          Severity: normal
          Priority: P2
         Component: Distributions
        AssignedTo: openembedded-devel@lists.openembedded.org
        ReportedBy: pavel@ucw.cz
         QAContact: tinderbox-oe@gmx.net


Wow, and big thanks to openzaurus team.

Well, and then some problems... I'm testing 3.5.4.2-rc1 (perhaps some shorter
versions would be nice?).

bootstrap image complains about no altboot config, wrong kernel, then hangs
with splashscreen. I'll have to figure out how to turn the splash off... some
hint (alt-leftarrow) flashes there briefly, but I do not know how to press alt
on collie. fn-lshift-left nor fn-rshift-left helps (AFAICT, my keyboard is old
and arrows are no longer reliable).

opie image also stops in splash screen, this time with "ln /etc/resolv.conf: No
space left on device". I lost my patience after 4 minutes-or-so.

Ok, moving on to gpe image.. wow, gpe got past "splashscreen", I'm now
calibrating touchscreen... except that touchscreen does not work at this point.
Is there some trick? But X seem to work, and that is good. I'll need to figure
out how to break into shell somewhere.


-- 
Configure bugmail: http://bugs.openembedded.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.


