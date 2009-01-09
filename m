Received: from [68.230.241.41] (helo=fed1rmmtao105.cox.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <trini@kernel.crashing.org>) id 1LLJkR-0004Fm-2f
	for openembedded-devel@openembedded.org; Fri, 09 Jan 2009 16:58:11 +0100
Received: from fed1rmimpo01.cox.net ([70.169.32.71]) by fed1rmmtao105.cox.net
	(InterMail vM.7.08.02.01 201-2186-121-102-20070209) with ESMTP
	id <20090109155154.SBWW8485.fed1rmmtao105.cox.net@fed1rmimpo01.cox.net>;
	Fri, 9 Jan 2009 10:51:54 -0500
Received: from localhost ([68.230.61.57]) by fed1rmimpo01.cox.net with bizsmtp
	id 1Trs1b00J1E665w03Trs9W; Fri, 09 Jan 2009 10:51:55 -0500
X-Authority-Analysis: v=1.0 c=1 a=ORC7H_SqY3wEPGmGGmIA:9
	a=pea9XMlGr03Vmm1O3vLOfAh8vscA:4 a=b8hG5vVbyAkA:10
X-CM-Score: 0.00
Date: Fri, 9 Jan 2009 08:52:24 -0700
From: Tom Rini <trini@kernel.crashing.org>
To: OpenEmbedded Devel List <openembedded-devel@openembedded.org>
Message-ID: <20090109155223.GF400@smtp.west.cox.net>
MIME-Version: 1.0
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
Subject: Blackfin support
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
X-List-Received-Date: Fri, 09 Jan 2009 15:58:15 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hey all.  Has anyone built any of the blackfin boards recently?  I'm
finding things like uClibc 0.9.29+ require -mfdpic which isn't in our
gcc 4.1.x, is in gcc 4.2.x (but requires a patch to define __FDPIC__
rather than __BFIN_FDPIC__) and other issues still.  Just seeing if
anyone else has these things working before I start getting down and
dirty.  Thanks!

-- 
Tom Rini


