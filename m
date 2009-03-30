Received: from [68.230.241.39] (helo=fed1rmmtao107.cox.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <trini@kernel.crashing.org>) id 1Lo9yo-0001xo-59
	for openembedded-devel@openembedded.org; Mon, 30 Mar 2009 07:24:14 +0200
Received: from fed1rmimpo02.cox.net ([70.169.32.72]) by fed1rmmtao107.cox.net
	(InterMail vM.7.08.02.01 201-2186-121-102-20070209) with ESMTP id
	<20090330052208.TVFP10385.fed1rmmtao107.cox.net@fed1rmimpo02.cox.net>
	for <openembedded-devel@openembedded.org>;
	Mon, 30 Mar 2009 01:22:08 -0400
Received: from localhost ([68.230.63.214]) by fed1rmimpo02.cox.net with bizsmtp
	id ZHN71b0074dMFYL04HN72E; Mon, 30 Mar 2009 01:22:07 -0400
X-Authority-Analysis: v=1.0 c=1 a=vn01oPLS1NIA:10 a=PQxKyjgD8nkA:10
	a=wMnMka8-0ni_nMP8vnsA:9 a=-Cg9TFHmG9pS5K88sdQA:7
	a=6bEKDsYo4CESRrSYApFByiknFrAA:4 a=LY0hPdMaydYA:10
X-CM-Score: 0.00
Date: Sun, 29 Mar 2009 22:22:07 -0700
From: Tom Rini <trini@kernel.crashing.org>
To: openembedded-devel@openembedded.org
Message-ID: <20090330052206.GA14278@smtp.west.cox.net>
References: <ef4946070903292210t3ce4885cj1298cdaa0253ffdf@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <ef4946070903292210t3ce4885cj1298cdaa0253ffdf@mail.gmail.com>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
Subject: Re: Addition of the Coyote Linux distro and HAProxy
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
X-List-Received-Date: Mon, 30 Mar 2009 05:24:14 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Mar 30, 2009 at 01:10:10AM -0400, Joshua Jackson wrote:

> I have decided to use OE as the base for the next release of a 10 year old
> distribution named "Coyote Linux". After a couple weeks of tinkering and
> waiting many, long hours for compiles to either succeed or fail - I have put
> together my first patch.
> 
> The attached patch adds a distribution config for Coyote Linux v4 and adds
> the HAProxy recipe. This is my first submission to the project so please let
> me know if there is anything I need to change about the supplied patch or
> any other process I should be following.

The first suggestion would be to send the new recipe separate from the
distro conf.  A very quick skim of the patch and the recipe looked fine,
tho.

-- 
Tom Rini


