Received: from [68.230.241.45] (helo=fed1rmmtao101.cox.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <trini@kernel.crashing.org>) id 1LY3CB-00057h-7T
	for openembedded-devel@openembedded.org; Fri, 13 Feb 2009 19:55:27 +0100
Received: from fed1rmimpo02.cox.net ([70.169.32.72]) by fed1rmmtao101.cox.net
	(InterMail vM.7.08.02.01 201-2186-121-102-20070209) with ESMTP
	id <20090213185354.JRHQ2948.fed1rmmtao101.cox.net@fed1rmimpo02.cox.net>
	for <openembedded-devel@openembedded.org>;
	Fri, 13 Feb 2009 13:53:54 -0500
Received: from localhost ([68.230.61.57]) by fed1rmimpo02.cox.net with bizsmtp
	id FWts1b0091E665w04Wtsjc; Fri, 13 Feb 2009 13:53:52 -0500
X-Authority-Analysis: v=1.0 c=1 a=txmDflyvLeqZFbqq4bkA:9
	a=tKwTT6k0aJ9oFCtEHA0W4AImWqgA:4 a=LY0hPdMaydYA:10
X-CM-Score: 0.00
Date: Fri, 13 Feb 2009 11:53:52 -0700
From: Tom Rini <trini@kernel.crashing.org>
To: openembedded-devel@openembedded.org
Message-ID: <20090213185352.GX11815@smtp.west.cox.net>
References: <200902131833.55265.khimov@altell.ru>
	<20090213155637.GV11815@smtp.west.cox.net>
	<200902132119.22895.khimov@altell.ru>
MIME-Version: 1.0
In-Reply-To: <200902132119.22895.khimov@altell.ru>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
Subject: Re: [PATCH] New package: tnef
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
X-List-Received-Date: Fri, 13 Feb 2009 18:55:27 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Feb 13, 2009 at 09:19:22PM +0300, Roman I Khimov wrote:
> Tom Rini:
> > On Fri, Feb 13, 2009 at 06:33:54PM +0300, Roman I Khimov wrote:
> > > --- a/conf/checksums.ini	2009-02-13 15:05:24.976017132 +0300
> > > +++ b/conf/checksums.ini	2009-02-13 18:30:39.887017023 +0300
> >
> > Can you please run the sorter
> > (contrib/source-checker/oe-checksums-sorter.py) when you add new
> > entries?  Thanks.
> 
> Sure. Didn't know about that. So, updated one should be like this:

Done, thanks.

-- 
Tom Rini


