Received: from [68.230.241.44] (helo=fed1rmmtao102.cox.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <trini@kernel.crashing.org>) id 1LSNvs-0008UE-TY
	for openembedded-devel@openembedded.org; Thu, 29 Jan 2009 04:51:13 +0100
Received: from fed1rmimpo03.cox.net ([70.169.32.75]) by fed1rmmtao102.cox.net
	(InterMail vM.7.08.02.01 201-2186-121-102-20070209) with ESMTP
	id <20090129034326.VUOP2342.fed1rmmtao102.cox.net@fed1rmimpo03.cox.net>
	for <openembedded-devel@openembedded.org>;
	Wed, 28 Jan 2009 22:43:26 -0500
Received: from localhost ([68.230.61.57]) by fed1rmimpo03.cox.net with bizsmtp
	id 9FjP1b00G1E665w04FjPeo; Wed, 28 Jan 2009 22:43:26 -0500
X-Authority-Analysis: v=1.0 c=1 a=J-sQMM1VYodFNAylcDEA:9
	a=S2JVYZfeeB1IXdSSCY4A:7 a=oK4Ou9Uj--IgUXcEw70hjSzDi6wA:4
	a=b8hG5vVbyAkA:10
X-CM-Score: 0.00
Date: Wed, 28 Jan 2009 20:43:23 -0700
From: Tom Rini <trini@kernel.crashing.org>
To: OpenEmbedded Devel List <openembedded-devel@openembedded.org>
Message-ID: <20090129034323.GL15885@smtp.west.cox.net>
MIME-Version: 1.0
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
Subject: Canadian SDK support
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
X-List-Received-Date: Thu, 29 Jan 2009 03:51:15 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hey all.  After pushing the new packages into dev, it turns out I forgot
what happens when a recipe can't be parsed, oops.  So, I've gone and
pushed the last few bits of the Canadian SDK stuff.  AFAICT the only
really objectionable part is just how much of canadian-sdk.bb c&p's from
meta-toolchain.bb.  I intend to see what I can turn into functions for a
meta-toolchain.inc shortly.

-- 
Tom Rini


