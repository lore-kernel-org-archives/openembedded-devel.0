Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1Loh03-00050k-83
	for openembedded-devel@openembedded.org; Tue, 31 Mar 2009 18:39:43 +0200
Received: (qmail 21643 invoked by uid 813007); 31 Mar 2009 16:37:29 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO home.localnet)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 31 Mar 2009 16:37:28 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 31 Mar 2009 18:37:27 +0200
User-Agent: KMail/1.11.0 (Linux/2.6.29; KDE/4.2.1; x86_64; ; )
MIME-Version: 1.0
Message-Id: <200903311837.28324.marcin@juszkiewicz.com.pl>
Subject: [STABLE] branch created: stable/2009
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 31 Mar 2009 16:39:43 -0000
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


Hi

I would like to announce creation of new branch: stable/2009 in 
OpenEmbedded repository. It was branched few days ago, build tested and 
got some bugfixes which were added to .dev tree (and back to 
stable/2009).

What was in build test? Distro "angstrom-2008.1", machines: qemuarm 
(armv5te), at91sam9263ek (armv5te), beagleboard (armv7a), qemux86 (i586) 
and vortex86sx (486sx). I tested building of next images: console, 
console-base, x11, beagleboard-demo for each of those machines. So far 
only glibc builds were tested, uclibc one is queued.

I also imported BitBake 1.8.12 (last release) into "stable/2009" branch 
as this is minimal stable version which works with this repository.

Feel free to clone and do tests. I will write more later.

Regards, 
-- 
JID:      hrw@jabber.org
Website:  http://marcin.juszkiewicz.com.pl/
LinkedIn: http://www.linkedin.com/in/marcinjuszkiewicz




