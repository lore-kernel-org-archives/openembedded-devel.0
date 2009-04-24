Received: from [68.230.241.43] (helo=fed1rmmtao103.cox.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <trini@kernel.crashing.org>) id 1LxRDJ-0004U5-W5
	for openembedded-devel@lists.openembedded.org;
	Fri, 24 Apr 2009 21:37:34 +0200
Received: from fed1rmimpo02.cox.net ([70.169.32.72]) by fed1rmmtao103.cox.net
	(InterMail vM.7.08.02.01 201-2186-121-102-20070209) with ESMTP
	id <20090424193244.BYAE4363.fed1rmmtao103.cox.net@fed1rmimpo02.cox.net>
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Apr 2009 15:32:44 -0400
Received: from localhost ([68.230.63.214]) by fed1rmimpo02.cox.net with bizsmtp
	id jXYl1b00V4dMFYL04XYlSj; Fri, 24 Apr 2009 15:32:45 -0400
X-Authority-Analysis: v=1.0 c=1 a=KjjrOjXTx8cA:10 a=jExYjHyISV8A:10
	a=CQldGV4QtLz5lol5ITIA:9 a=ZLfe7L2cdhdvRA6IWy4u2Dv7Ry0A:4
X-CM-Score: 0.00
Date: Fri, 24 Apr 2009 12:32:45 -0700
From: Tom Rini <trini@kernel.crashing.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090424193245.GD15489@smtp.west.cox.net>
References: <gsst4a$cvj$1@ger.gmane.org> <49F1FCFB.9000205@balister.org>
	<gst2dn$u4j$1@ger.gmane.org>
MIME-Version: 1.0
In-Reply-To: <gst2dn$u4j$1@ger.gmane.org>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
Subject: Re: reverting some csets that kill package upgrade paths
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
X-List-Received-Date: Fri, 24 Apr 2009 19:37:34 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Apr 24, 2009 at 09:03:18PM +0200, Koen Kooi wrote:

> Upgrade paths are the foundation of package management, breaking them is  
> stabbing people using your binaries in the eye. Do you want to tell the  
> companies evaluating OE using .dev that they can't use the feature  
> anymore that drew them to OE, namely package management?

Red Herring.  No commerical device is going to point to some random feed
and just hope things work out fine.  No, they're going to point at their
supported feeds with updates they've tested and fixed any bugs that they
happened to have found (and pushed back because they're Good Guys).

-- 
Tom Rini


