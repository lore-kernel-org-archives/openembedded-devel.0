Received: from [192.216.230.225] (helo=tinman.treke.net)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <bugzilla-daemon@tinman.treke.net>)
	id 1GGG1m-00033D-AL for openembedded-devel@lists.openembedded.org;
	Thu, 24 Aug 2006 16:17:50 +0200
Received: by tinman.treke.net (Postfix, from userid 33)
	id 82824401B3F; Thu, 24 Aug 2006 06:57:11 -0700 (PDT)
X-Bugzilla-Reason: AssignedTo
To: openembedded-devel@lists.openembedded.org
From: bugzilla-daemon@tinman.treke.net
Message-Id: <20060824135711.82824401B3F@tinman.treke.net>
Date: Thu, 24 Aug 2006 06:57:11 -0700 (PDT)
Subject: [Bug 1356] New: new ja.po files are ready for some gpe-* packages
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
X-List-Received-Date: Thu, 24 Aug 2006 14:17:50 -0000

http://bugs.openembedded.org/show_bug.cgi?id=1356

           Summary: new ja.po files are ready for some gpe-* packages
           Product: Openembedded
           Version: unspecified
          Platform: All
               URL: http://hp.vector.co.jp/authors/VA014481/team-ja/
        OS/Version: Linux
            Status: NEW
          Severity: enhancement
          Priority: P3
         Component: Distributions
        AssignedTo: openembedded-devel@lists.openembedded.org
        ReportedBy: hma@syd.odn.ne.jp
         QAContact: tinderbox-oe@gmx.net


Hi, I prepared Japanese message catalog file for some gpe related packages.
They are placed at:
http://hp.vector.co.jp/authors/VA014481/team-ja/

The message catalogs include:

gpe-clock-0.6.ja.po
gpe-edit-0.13.ja.po
gpe-go-0.05.ja.po
gpe-login-0.60.ja.po
gpe-ownerinfo-0.22.ja.po
gpe-package-0.3.ja.po
gpe-su-0.09.ja.po
gpe-todo-0.54.ja.po
gpe-todo-0.55.ja.po

As you can see, most of them are some versions behind the newest.
It is because the newest POT files are not praced in Translation Project.
If you, package mainteners have to (re-)read the procedure to let POT file
keep track after new releases, please refer the following URL:
http://www.iro.umontreal.ca/translation/HTML/maintainers.html

I hope above ja.po files are included in each packages and help
Japanese people to use the packages.


-- 
Configure bugmail: http://bugs.openembedded.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.


