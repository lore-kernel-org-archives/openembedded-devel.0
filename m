Received: from [68.230.241.41] (helo=fed1rmmtao105.cox.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <trini@kernel.crashing.org>) id 1Kl4tv-0003zb-DK
	for openembedded-devel@openembedded.org; Wed, 01 Oct 2008 18:50:11 +0200
Received: from fed1rmimpo03.cox.net ([70.169.32.75]) by fed1rmmtao105.cox.net
	(InterMail vM.7.08.02.01 201-2186-121-102-20070209) with ESMTP
	id <20081001164601.IKEO774.fed1rmmtao105.cox.net@fed1rmimpo03.cox.net>
	for <openembedded-devel@openembedded.org>;
	Wed, 1 Oct 2008 12:46:01 -0400
Received: from localhost ([68.230.61.57]) by fed1rmimpo03.cox.net with bizsmtp
	id MUm01a0091E665w04Um0w4; Wed, 01 Oct 2008 12:46:00 -0400
X-Authority-Analysis: v=1.0 c=1 a=z1tr3TCxCQgA:10 a=I0JlbsZgvJAA:10
	a=RQ9Spdt5BUDRD_feUN0A:9 a=OLWcXCAbq8gldNZChnM0Jyp9vuoA:4
	a=LY0hPdMaydYA:10
X-CM-Score: 0.00
Date: Wed, 1 Oct 2008 09:45:59 -0700
From: Tom Rini <trini@kernel.crashing.org>
To: openembedded-devel@openembedded.org
Message-ID: <20081001164559.GB3010@smtp.west.cox.net>
References: <gbvcad$aan$1@ger.gmane.org>
MIME-Version: 1.0
In-Reply-To: <gbvcad$aan$1@ger.gmane.org>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
Subject: Re: Using angstrom with org.oe.dev and bitbake from svn
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
X-List-Received-Date: Wed, 01 Oct 2008 16:50:11 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Oct 01, 2008 at 10:27:57AM +0200, Koen Kooi wrote:

> Hi,
>
> The env filtering got committed last night, so to keep your build  
> working do:
>
> export BB_ENV_EXTRAWHITE="MACHINE DISTRO ANGSTROM_MODE"
>
> or download the updated sourcing script[1]

Is this an angstrom-only thing?  Or will other distros need to do:
export BB_ENV_EXTRAWHITE="MACHINE DISTRO" now?  Thanks

-- 
Tom Rini


