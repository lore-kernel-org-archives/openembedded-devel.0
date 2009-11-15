Received: from [64.235.106.9] (helo=astoria.ccjclearline.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpjday@crashcourse.ca>) id 1N9oAF-0002yu-Ot
	for openembedded-devel@lists.openembedded.org;
	Mon, 16 Nov 2009 00:05:50 +0100
Received: from cpe002129687b04-cm001225dbafb6.cpe.net.cable.rogers.com
	([99.235.241.187] helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.69) (envelope-from <rpjday@crashcourse.ca>)
	id 1N9gWs-00028N-QW for openembedded-devel@lists.openembedded.org;
	Sun, 15 Nov 2009 09:56:38 -0500
Date: Sun, 15 Nov 2009 09:56:36 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost
To: OpenEmbedded Development mailing list
	<openembedded-devel@lists.openembedded.org>
Message-ID: <alpine.LFD.2.00.0911150948430.14311@localhost>
User-Agent: Alpine 2.00 (LFD 1167 2008-08-23)
MIME-Version: 1.0
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - astoria.ccjclearline.com
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-SA-Exim-Connect-IP: 64.235.106.9
X-SA-Exim-Mail-From: rpjday@crashcourse.ca
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: any ETA on a working dev beagleboard demo image?
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
X-List-Received-Date: Sun, 15 Nov 2009 23:05:51 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII


  yes, i know i'm sounding like a broken record, but i have an invite
to give a short local demo of the beagleboard this tuesday and i'd
like to do it with an angstrom development demo image, just because i
prefer to live out there on the edge.

  at the moment, there is just the one package standing in the way --
guile-native -- and as i recall, someone posted what looked like a
manual fix.  is that being turned into a patch at any point?  i
realize i'm nagging, but it's literally been *weeks* since that
particular bitbake target actually built, and every time it looks like
it's getting close to being buildable, more packages break.

  i appreciate that development means exactly that but, at the very
least, even the development branch should *build*, even if there are
run issues.

rday

p.s.  perhaps it would be useful to start tagging the development
branch at points where it builds, just so someone can always retreat
to the most recent known good build.

or perhaps start a branch named, oh, "bleeding", which, when it builds
properly, can be merged back into development.  whatever.  but it
strikes me that it's overwhelmingly pointless to have a development
branch that doesn't build since that gives no one the opportunity to
actually test it.

--

========================================================================
Robert P. J. Day                               Waterloo, Ontario, CANADA

            Linux Consulting, Training and Kernel Pedantry.

Web page:                                          http://crashcourse.ca
Twitter:                                       http://twitter.com/rpjday
========================================================================


