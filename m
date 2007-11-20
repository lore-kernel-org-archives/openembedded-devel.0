Received: from [68.230.241.11] (helo=fed1rmpop107.cox.net)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <trini@kernel.crashing.org>) id 1IuJm8-0006ah-5y
	for openembedded-devel@openembedded.org; Tue, 20 Nov 2007 04:27:48 +0100
Received: from fed1rmimpo03.cox.net ([70.169.32.75]) by fed1rmmtao104.cox.net
	(InterMail vM.7.08.02.01 201-2186-121-102-20070209) with ESMTP id
	<20071120003819.XNPN14792.fed1rmmtao104.cox.net@fed1rmimpo03.cox.net>
	for <openembedded-devel@openembedded.org>;
	Mon, 19 Nov 2007 19:38:19 -0500
Received: from opus ([24.255.11.70]) by fed1rmimpo03.cox.net with bizsmtp
	id EoeJ1Y00V1Wgi200000000; Mon, 19 Nov 2007 19:38:19 -0500
Date: Mon, 19 Nov 2007 17:38:19 -0700
From: Tom Rini <trini@kernel.crashing.org>
To: OpenEmbedded Development List <openembedded-devel@openembedded.org>
Message-ID: <20071120003819.GV12002@smtp.west.cox.net>
MIME-Version: 1.0
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.13 (2006-08-11)
Subject: Packaging up <build>/{stamps,cross,staging}
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
X-List-Received-Date: Tue, 20 Nov 2007 03:27:50 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi everyone.  I'm hoping someone can point me in the right direction
here.  I'm working on a project where we need to have all outputs from a
build target packaged up (so that later someone can extract the all of
the packages and have a dev env).  I realize this is a bit beyond the
scope of the current packaged staging stuff, but I was thinking, the
(presumably out of date) wiki page PackagedStaging talks about swapping
the staging dir out, populating  and packaging that up.  I looked around
a little and couldn't find any patches for that however.  Can someone
point me in that direction?  I think I could expand on that for this
project.  Or any better suggestions welcome.  Thanks!

-- 
Tom Rini


