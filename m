Received: from [213.165.64.20] (helo=mail.gmx.net)
	by linuxtogo.org with smtp (Exim 4.63)
	(envelope-from <Patrick.Ohly@gmx.de>) id 1GhZ9D-0006GC-VR
	for openembedded-devel@openembedded.org; Tue, 07 Nov 2006 23:10:24 +0100
Received: (qmail invoked by alias); 07 Nov 2006 22:08:58 -0000
Received: from c-134-176-149.d.dsl.de.ignite.net (EHLO ip6-localhost)
	[62.134.176.149]
	by mail.gmx.net (mp020) with SMTP; 07 Nov 2006 23:08:58 +0100
X-Authenticated: #489940
Received: from patrick by ip6-localhost with local (Exim 3.36 #1 (Debian))
	id 1GhYzB-0003we-00; Tue, 07 Nov 2006 23:00:01 +0100
From: Patrick Ohly <Patrick.Ohly@gmx.de>
To: OpenEmbedded <openembedded-devel@openembedded.org>
Date: Tue, 07 Nov 2006 23:00:01 +0100
Message-Id: <1162936801.4808.78.camel@ip6-localhost>
Mime-Version: 1.0
X-Mailer: Evolution 2.6.3 
Sender: Patrick Ohly <patrick@gmx.de>
X-Y-GMX-Trusted: 0
Subject: cross-compiling for x86_64
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
X-List-Received-Date: Tue, 07 Nov 2006 22:10:27 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hi all,

I tried to build a cross-compilation SDK on a 32 bit Debian stable host
with x86_64 as target. My idea is to regularly test 64 compilation of a
project that I work on.

I had considerable problems getting libc-initial and libc-immediate to
build. Most of the problems seemed to be related to not having the right
(kernel?) header files in place. After working around some problems it
completely failed in the end.

Is this something that someone has done already and perhaps can share a
local.conf for? Should I try again and report my problems in more
detail?

-- 
Bye, Patrick Ohly
--  
Patrick.Ohly@gmx.de
http://www.estamos.de/


