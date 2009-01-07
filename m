Received: from [68.230.241.45] (helo=fed1rmmtao101.cox.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <trini@kernel.crashing.org>) id 1LKMd8-0000EL-Lu
	for openembedded-devel@openembedded.org; Wed, 07 Jan 2009 01:50:43 +0100
Received: from fed1rmimpo02.cox.net ([70.169.32.72]) by fed1rmmtao101.cox.net
	(InterMail vM.7.08.02.01 201-2186-121-102-20070209) with ESMTP
	id <20090107004439.RYGG2948.fed1rmmtao101.cox.net@fed1rmimpo02.cox.net>
	for <openembedded-devel@openembedded.org>;
	Tue, 6 Jan 2009 19:44:39 -0500
Received: from localhost ([68.230.61.57]) by fed1rmimpo02.cox.net with bizsmtp
	id 0Qke1b0031E665w04QkegT; Tue, 06 Jan 2009 19:44:38 -0500
X-Authority-Analysis: v=1.0 c=1 a=UA0Z595oU3QA:10 a=nvBvAxcGjs0A:10
	a=Pd6mnzqO2RWthFhH4rkA:9 a=Vj3qP28-uD-W34ItFvk5YOYK5TAA:4
	a=LY0hPdMaydYA:10
X-CM-Score: 0.00
Date: Tue, 6 Jan 2009 17:45:08 -0700
From: Tom Rini <trini@kernel.crashing.org>
To: openembedded-devel@openembedded.org
Message-ID: <20090107004508.GB400@smtp.west.cox.net>
References: <1230827114.5320.42.camel@dax.rpnet.com>
	<20090101182526.GF7040@smtp.west.cox.net>
	<1230840687.5320.56.camel@dax.rpnet.com>
	<20090101220229.GH7040@smtp.west.cox.net>
	<1230858713.10424.4.camel@dax.rpnet.com>
	<20090102043755.GC400@smtp.west.cox.net>
	<d2b9ea600901050631h5eda6de5yee190bf0841e5b15@mail.gmail.com>
	<gjtg1m$rsd$1@ger.gmane.org>
	<d2b9ea600901061251n67c641a4ie03b8a552f3c4990@mail.gmail.com>
	<1231287266.5330.113.camel@dax.rpnet.com>
MIME-Version: 1.0
In-Reply-To: <1231287266.5330.113.camel@dax.rpnet.com>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
Subject: Re: Native/Cross/SDK rethink (Was: Re: RFC: "Virtual" native	and sdk recipes)
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
X-List-Received-Date: Wed, 07 Jan 2009 00:50:46 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jan 07, 2009 at 12:14:26AM +0000, Richard Purdie wrote:
[snip]
> So I propose we allow the canadian stuff to merge on the understanding
> that its doing things the wrong way and that we will most likely change
> to the "right" way in due course even if its less intuitive. That change
> may well break things but we're saying now this will happen and that
> people shouldn't be surprised.
> 
> Is that reasonable?
> 
> As for the mechanics of merging the branch, I'd like this to go in
> stages and will follow up with further email/discussion on that subject.
> I'm under time pressures at the moment so this won't be until later this
> week though. Sorry for the delay :(.

Agreed and I didn't intend the current branch for merging, just review.

> Also, people keep talking about building sdks for more than one machine
> with one bitbake command and other similar things. This is a really
> tricky idea and needs a lot of careful thought so as not to pull down
> the whole architecture. It is not a trivial issue.

Yes, we need to have some sort of discussion about what's reasonable and
what's a best design for making SDKs come out of OE.

-- 
Tom Rini


