Received: from [68.230.241.41] (helo=fed1rmmtao105.cox.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <trini@kernel.crashing.org>) id 1LMT6m-0007Vi-4r
	for openembedded-devel@openembedded.org; Mon, 12 Jan 2009 21:10:00 +0100
Received: from fed1rmimpo01.cox.net ([70.169.32.71]) by fed1rmmtao105.cox.net
	(InterMail vM.7.08.02.01 201-2186-121-102-20070209) with ESMTP
	id <20090112200330.ONQ8485.fed1rmmtao105.cox.net@fed1rmimpo01.cox.net>; 
	Mon, 12 Jan 2009 15:03:30 -0500
Received: from localhost ([68.230.61.57]) by fed1rmimpo01.cox.net with bizsmtp
	id 2k3W1b0031E665w03k3WWC; Mon, 12 Jan 2009 15:03:30 -0500
X-Authority-Analysis: v=1.0 c=1 a=rINLuMDxMIoA:10 a=7OzDuaD8CwYA:10
	a=3lOzt4MzpjnEgDxB9UYA:9 a=8KiehCiVCZcEG-TP3pi9HfGCFHEA:4
	a=LY0hPdMaydYA:10
X-CM-Score: 0.00
Date: Mon, 12 Jan 2009 13:04:03 -0700
From: Tom Rini <trini@kernel.crashing.org>
To: openembedded-devel@openembedded.org, Koen Kooi <k.kooi@student.utwente.nl>
Message-ID: <20090112200403.GB3342@smtp.west.cox.net>
References: <f96d234e0901120802m7d4bbe48pb98a08cf04434c2e@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <f96d234e0901120802m7d4bbe48pb98a08cf04434c2e@mail.gmail.com>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
Subject: Re: OE weekly changelog 2009-01-05 to 2009-01-12
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
X-List-Received-Date: Mon, 12 Jan 2009 20:10:00 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jan 12, 2009 at 11:02:34AM -0500, Cliff Brake wrote:
[snip]
> Koen Kooi (57):
[snip]
>       mtd-utils: add 1.2.0+git for ubifs-support
>       mtd-utils: package *all* ubifs utils

Anything in particular holding back on a -native version too? (and I
haven't done a new pull yet, so forgive me if it's in already)  If not,
I'll go and push that in shortly, along with mkfs.ubi (unless that got
merged in, it was stand alone when I delt with it all).  Thanks!

-- 
Tom Rini


