Received: from [68.230.241.42] (helo=fed1rmmtao104.cox.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <trini@kernel.crashing.org>) id 1L97uF-00088t-2j
	for openembedded-devel@openembedded.org; Sun, 07 Dec 2008 01:53:55 +0100
Received: from fed1rmimpo01.cox.net ([70.169.32.71]) by fed1rmmtao104.cox.net
	(InterMail vM.7.08.02.01 201-2186-121-102-20070209) with ESMTP id
	<20081207005006.HTVN11567.fed1rmmtao104.cox.net@fed1rmimpo01.cox.net>
	for <openembedded-devel@openembedded.org>;
	Sat, 6 Dec 2008 19:50:06 -0500
Received: from localhost ([68.230.61.57]) by fed1rmimpo01.cox.net with bizsmtp
	id o0q71a0031E665w030q7CH; Sat, 06 Dec 2008 19:50:07 -0500
X-Authority-Analysis: v=1.0 c=1 a=seiNOWtGTbNX7FweWLYA:9
	a=mutpJc74wSA1NVgSkU9li89zFFUA:4 a=LY0hPdMaydYA:10
X-CM-Score: 0.00
Date: Sat, 6 Dec 2008 17:50:17 -0700
From: Tom Rini <trini@kernel.crashing.org>
To: openembedded-devel@openembedded.org
Message-ID: <20081207005017.GK16628@smtp.west.cox.net>
References: <20081207001050.GA1796@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20081207001050.GA1796@gmail.com>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
Subject: Re: mips site files update
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
X-List-Received-Date: Sun, 07 Dec 2008 00:53:55 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Dec 06, 2008 at 04:10:50PM -0800, Khem Raj wrote:

> Hi 
> 
> Trying to build for mips based machines. I needed this patch to get the
> console-image building. 
> 
> OK for .dev

Can we please please please start splitting things up into common-linux
and common-glibc/uclibc instead?  That way we fix more than mips.

-- 
Tom Rini


