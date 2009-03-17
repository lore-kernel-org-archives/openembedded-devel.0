Received: from [68.230.241.40] (helo=fed1rmmtao106.cox.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <trini@kernel.crashing.org>) id 1Ljd3w-0002wb-VY
	for openembedded-devel@openembedded.org; Tue, 17 Mar 2009 18:27:00 +0100
Received: from fed1rmimpo03.cox.net ([70.169.32.75]) by fed1rmmtao106.cox.net
	(InterMail vM.7.08.02.01 201-2186-121-102-20070209) with ESMTP id
	<20090317172600.ISBJ22254.fed1rmmtao106.cox.net@fed1rmimpo03.cox.net>
	for <openembedded-devel@openembedded.org>;
	Tue, 17 Mar 2009 13:26:00 -0400
Received: from localhost ([68.230.63.214]) by fed1rmimpo03.cox.net with bizsmtp
	id UHS11b0024dMFYL04HS1Tc; Tue, 17 Mar 2009 13:26:01 -0400
X-Authority-Analysis: v=1.0 c=1 a=8li25rVEXPhIwaeO5NcA:9
	a=ec9pwOMuE1vY2P6Xj8xPKKRHvGoA:4 a=LY0hPdMaydYA:10
X-CM-Score: 0.00
Date: Tue, 17 Mar 2009 10:26:00 -0700
From: Tom Rini <trini@kernel.crashing.org>
To: openembedded-devel@openembedded.org
Message-ID: <20090317172600.GM26343@smtp.west.cox.net>
References: <200903171538.21499.marcin@juszkiewicz.com.pl>
	<49BFC107.5050806@dls.net>
	<20090317163556.GK26343@smtp.west.cox.net>
	<1237309579.20770.17.camel@homestead>
MIME-Version: 1.0
In-Reply-To: <1237309579.20770.17.camel@homestead>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
X-SA-Exim-Connect-IP: 68.230.241.40
X-SA-Exim-Mail-From: trini@kernel.crashing.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=5.0 tests=AWL,BAYES_00,RDNS_NONE
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: RFC: new stable release
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
X-List-Received-Date: Tue, 17 Mar 2009 17:27:06 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Mar 17, 2009 at 05:06:19PM +0000, Shane Dixon wrote:
> On Tue, 2009-03-17 at 09:35 -0700, Tom Rini wrote:
> 
> > 
> > I'd like to add Ubuntu 8.10.  Further, for each of these reference host
> > configurations we need to say what's installed, preferably by meta
> > packages (in Ubuntu's case, say ubuntu-minimal + ubuntu-standard) and
> > specific packages ('gcc', 'g++', etc..).  And I too can help with the
> > env.  FWIW, a chroot should be good enough for this..
> > 
> 
> 8.04 might be a better target for a "reference machine" because it's an
> LTS release (although I personally use 8.10).  I think that the goal
> should be solid support for the longest (within reason of course) amount
> of time.  If I intend to write a document for a vendor explaining how to
> use OE as a build environment for their code, the intent should be that
> I don't have to re-write it again and again over the course of the next
> year (Ubuntu releases every 6 months).  

8.04 works for me, really.  The same set of packages actually works for
me on 7.10/8.04/8.10, and I hope 9.04 :)

-- 
Tom Rini


