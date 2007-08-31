Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <openembedded@hrw.one.pl>) id 1IR1y6-0005FY-7l
	for openembedded-devel@openembedded.org; Fri, 31 Aug 2007 10:35:06 +0200
Received: (qmail 1916 invoked by uid 813007); 31 Aug 2007 08:33:08 -0000
X-clamdmail: clamdmail 0.18a
Received: from v813.rev.tld.pl (HELO home.lan)
	(marcin@hrw.one.pl@195.149.226.213)
	by smtp.host4.kei.pl with ESMTPA; 31 Aug 2007 08:33:08 -0000
From: Marcin Juszkiewicz <openembedded@hrw.one.pl>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 31 Aug 2007 10:33:04 +0200
User-Agent: KMail/1.9.7
MIME-Version: 1.0
Message-Id: <200708311033.06903.openembedded@hrw.one.pl>
Subject: disapproval of revision '4fb1a7447c5d8ace96a5ac6358c7fe10f0d951c4'
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 31 Aug 2007 08:35:06 -0000
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


Koen Kooi added ARM Crunch patchset into GCC to get EP39xx FPU support. 
Looks like it was not tested before commit as this change broke all ARM 
builds with gcc produced "fatal error: internal consistency failure".

I reverted that addon and bumped gcc/gcc-cross PR so people will get 
working toolchain again.

-- 
JID: hrw-jabber.org
OpenEmbedded developer/consultant

      I'm trying to decide if I should kill you or simply feign death
      until you feel awkward and leave.




