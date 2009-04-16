Received: from [68.230.241.39] (helo=fed1rmmtao107.cox.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <trini@kernel.crashing.org>) id 1LuZrv-0005PM-A7
	for openembedded-devel@openembedded.org; Fri, 17 Apr 2009 00:15:41 +0200
Received: from fed1rmimpo02.cox.net ([70.169.32.72]) by fed1rmmtao107.cox.net
	(InterMail vM.7.08.02.01 201-2186-121-102-20070209) with ESMTP id
	<20090416221141.BWWG10385.fed1rmmtao107.cox.net@fed1rmimpo02.cox.net>
	for <openembedded-devel@openembedded.org>;
	Thu, 16 Apr 2009 18:11:41 -0400
Received: from localhost ([68.230.63.214]) by fed1rmimpo02.cox.net with bizsmtp
	id gNBg1b00J4dMFYL04NBgNt; Thu, 16 Apr 2009 18:11:41 -0400
X-Authority-Analysis: v=1.0 c=1 a=r3eygV1rdZgA:10 a=ReZai5HaP1skdfGlnsAA:9
	a=7zqc4a0oHDZ4GU4Yi4F7GyHwiVQA:4
X-CM-Score: 0.00
Date: Thu, 16 Apr 2009 15:11:40 -0700
From: Tom Rini <trini@kernel.crashing.org>
To: openembedded-devel@openembedded.org
Message-ID: <20090416221140.GQ17629@smtp.west.cox.net>
References: <200904151633.49146.khimov@altell.ru>
MIME-Version: 1.0
In-Reply-To: <200904151633.49146.khimov@altell.ru>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
X-SA-Exim-Connect-IP: 68.230.241.39
X-SA-Exim-Mail-From: trini@kernel.crashing.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=AWL,BAYES_20,RDNS_NONE
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFC] AMD64 and multilib support
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
X-List-Received-Date: Thu, 16 Apr 2009 22:15:42 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Apr 15, 2009 at 04:33:48PM +0400, Roman I Khimov wrote:

> Hello all.
> 
> This patch series (will follow in replies) tries to bring in AMD64/x86_64 
> support into OE. This required some intrusive toolchain fixes that I want to 
> post here for review and feedback as I think (or rather know ;)) I might have 
> broken something along the way.

Have you done a build of meta-toolchain as well?

-- 
Tom Rini


