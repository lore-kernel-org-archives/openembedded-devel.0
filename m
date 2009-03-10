Received: from [68.230.241.45] (helo=fed1rmmtao101.cox.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <trini@kernel.crashing.org>) id 1Lh9Fz-0001x4-6K
	for openembedded-devel@openembedded.org; Tue, 10 Mar 2009 22:12:59 +0100
Received: from fed1rmimpo02.cox.net ([70.169.32.72]) by fed1rmmtao101.cox.net
	(InterMail vM.7.08.02.01 201-2186-121-102-20070209) with ESMTP id
	<20090310211254.URPM27308.fed1rmmtao101.cox.net@fed1rmimpo02.cox.net>
	for <openembedded-devel@openembedded.org>;
	Tue, 10 Mar 2009 17:12:54 -0400
Received: from localhost ([68.230.63.214]) by fed1rmimpo02.cox.net with bizsmtp
	id RZCu1b0074dMFYL04ZCuqb; Tue, 10 Mar 2009 17:12:54 -0400
X-Authority-Analysis: v=1.0 c=1 a=Obwr4fjDA7sA:10 a=KlC65CFGb8MA:10
	a=S9ld7CfN6Aoxn7LIeA8A:9 a=vRAKlXN7On78FbR-fvDoW3EpiCsA:4
	a=LY0hPdMaydYA:10
X-CM-Score: 0.00
Date: Tue, 10 Mar 2009 14:12:54 -0700
From: Tom Rini <trini@kernel.crashing.org>
To: openembedded-devel@openembedded.org
Message-ID: <20090310211253.GV26343@smtp.west.cox.net>
References: <156d82ae0903101247j7b17678w4d0b28b8842bfe1b@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <156d82ae0903101247j7b17678w4d0b28b8842bfe1b@mail.gmail.com>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
Subject: Re: OEandYourDistro: Building OE in MacOS and M$Windows
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
X-List-Received-Date: Tue, 10 Mar 2009 21:12:59 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Mar 10, 2009 at 04:47:52PM -0300, Rodrigo Vivi wrote:
> Hi there,
> 
> I've just noticed that there are 2 bronken links at OEandYourDistro wiki page:
> 
> One about using OpenEmbedded under MacOS and another one about work in
> progress of run OE build under M$ Windows..
> 
> Does anyone know the correct links to update the page?
> 
> BTW: I'd like to know what is the status about this "M$ Windows
> work"... Any news?

There are oustanding (and out of date) patches for building on Cygwin.
Some of these aren't needed now that building a MinGW SDK from Linux is
possible (the ones related to EXEEXT and such).

-- 
Tom Rini


