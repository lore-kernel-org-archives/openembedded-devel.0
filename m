Received: from [71.6.201.124] (helo=easi.embeddedalley.com)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <trini@embeddedalley.com>) id 1M7jxB-0004Ut-V4
	for openembedded-devel@openembedded.org; Sat, 23 May 2009 07:39:30 +0200
Received: (qmail 32539 invoked from network); 23 May 2009 05:31:43 -0000
Received: from easi.embeddedalley.com (HELO localhost) (easi@71.6.201.124)
	by easi.embeddedalley.com with SMTP; 22 May 2009 22:31:43 -0700
Date: Fri, 22 May 2009 22:31:43 -0700
From: Tom Rini <trini@embeddedalley.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090523053143.GH23842@smtp.west.cox.net>
References: <20090522213142.GF23842@smtp.west.cox.net>
	<d1b08f940905221527v147487e3n128cf91e6a7a6e1d@mail.gmail.com>
	<gv817h$vbi$1@ger.gmane.org>
MIME-Version: 1.0
In-Reply-To: <gv817h$vbi$1@ger.gmane.org>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
Subject: Re: Kernel recipes with broken PRs now
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
X-List-Received-Date: Sat, 23 May 2009 05:39:31 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, May 23, 2009 at 07:22:56AM +0200, Koen Kooi wrote:
> On 23-05-09 00:27, Andrea Adami wrote:
>> I think the side-effects of the patch are blessing too much...
>
> That's called 'incentive' :) You are always complaining about  
> unmaintained kernel recipes, now you have a way to identify them :)
>
>> I'd propose a rethink of the patch as opt-in.
>
> Due to the way OE is structured, that's sadly impossible.

Can we please get a little write-up on the new variable on the wiki, to
point people at when they hit a broken recipe.

-- 
Tom Rini


