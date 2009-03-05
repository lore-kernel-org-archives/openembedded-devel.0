Received: from [68.230.241.42] (helo=fed1rmmtao104.cox.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <trini@kernel.crashing.org>) id 1LfEky-00054f-RF
	for openembedded-devel@openembedded.org; Thu, 05 Mar 2009 15:41:05 +0100
Received: from fed1rmimpo02.cox.net ([70.169.32.72]) by fed1rmmtao104.cox.net
	(InterMail vM.7.08.02.01 201-2186-121-102-20070209) with ESMTP id
	<20090305143640.CINL16134.fed1rmmtao104.cox.net@fed1rmimpo02.cox.net>
	for <openembedded-devel@openembedded.org>;
	Thu, 5 Mar 2009 09:36:40 -0500
Received: from localhost ([68.230.63.214]) by fed1rmimpo02.cox.net with bizsmtp
	id PSch1b00D4dMFYL04SchVP; Thu, 05 Mar 2009 09:36:41 -0500
X-Authority-Analysis: v=1.0 c=1 a=1DqO7UR4j4cO1NbSN_EA:9
	a=OFeMJ4A8Kpax9ADfEgxnnP7zXmkA:4 a=b8hG5vVbyAkA:10
X-CM-Score: 0.00
Date: Thu, 5 Mar 2009 07:36:41 -0700
From: Tom Rini <trini@kernel.crashing.org>
To: OpenEmbedded Devel List <openembedded-devel@openembedded.org>
Message-ID: <20090305143641.GF26343@smtp.west.cox.net>
MIME-Version: 1.0
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
Subject: Add 2.6.28+2.6.29-rc7 or wait?
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
X-List-Received-Date: Thu, 05 Mar 2009 14:41:05 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hey all.  Kicking off tests for the RPM package support made me realize
that one of the boards I'm goint to use (the mx31pdk, aka i.mx31
3-stack) is finally supported to a degree upstream as of 2.6.29-rc1.
Should I go and add an -rc7 recipe now or just wait for 2.6.29 to
finally drop?  Thanks.

-- 
Tom Rini


