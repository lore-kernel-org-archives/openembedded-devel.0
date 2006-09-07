Received: from [192.216.230.225] (helo=tinman.treke.net)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <bugzilla-daemon@tinman.treke.net>)
	id 1GLLDV-0005ij-UW for openembedded-devel@lists.openembedded.org;
	Thu, 07 Sep 2006 16:50:58 +0200
Received: by tinman.treke.net (Postfix, from userid 33)
	id 0FD74401B48; Thu,  7 Sep 2006 07:26:49 -0700 (PDT)
X-Bugzilla-Reason: AssignedTo
To: openembedded-devel@lists.openembedded.org
From: bugzilla-daemon@tinman.treke.net
Message-Id: <20060907142649.0FD74401B48@tinman.treke.net>
Date: Thu,  7 Sep 2006 07:26:49 -0700 (PDT)
Subject: [Bug 1391] minimo package bit rotted badly
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
X-List-Received-Date: Thu, 07 Sep 2006 14:50:58 -0000

http://bugs.openembedded.org/show_bug.cgi?id=1391





------- Comment #4 from dp@xora.org.uk  2006-09-07 07:26 -------
It breaks very quickly in building for me.

/home/dp/zaurus/build-gcc/tmp/work/armv5te-linux/minimo-20060720-r0/mozilla/conf
ig/nsinstall -t -m 644 nsBuildID.h ../mozilla-config.h ./nsStaticComponents.h 
.
./dist/sdk/include
/home/dp/zaurus/build-gcc/tmp/work/armv5te-linux/minimo-20060720-r0/mozilla/conf
ig/nsinstall: cannot access nsBuildID.h: Invalid argument


-- 
Configure bugmail: http://bugs.openembedded.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.


