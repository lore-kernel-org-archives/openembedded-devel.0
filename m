Received: from [68.230.241.43] (helo=fed1rmmtao103.cox.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <trini@kernel.crashing.org>) id 1LoOcy-0003Ir-AW
	for openembedded-devel@openembedded.org; Mon, 30 Mar 2009 23:02:40 +0200
Received: from fed1rmimpo03.cox.net ([70.169.32.75]) by fed1rmmtao103.cox.net
	(InterMail vM.7.08.02.01 201-2186-121-102-20070209) with ESMTP
	id <20090330210006.QGDY4363.fed1rmmtao103.cox.net@fed1rmimpo03.cox.net>
	for <openembedded-devel@openembedded.org>;
	Mon, 30 Mar 2009 17:00:06 -0400
Received: from localhost ([68.230.63.214]) by fed1rmimpo03.cox.net with bizsmtp
	id ZZ051b00R4dMFYL04Z05wN; Mon, 30 Mar 2009 17:00:05 -0400
X-Authority-Analysis: v=1.0 c=1 a=6WQpoopjgy8A:10 a=v6f0jDbYLdupzSdXdFQA:9
	a=3l4NRdUoTpTXSZ5okCxlTvCI24AA:4 a=LY0hPdMaydYA:10
X-CM-Score: 0.00
Date: Mon, 30 Mar 2009 14:00:05 -0700
From: Tom Rini <trini@kernel.crashing.org>
To: openembedded-devel@openembedded.org
Message-ID: <20090330210005.GF14278@smtp.west.cox.net>
References: <200903302155.17027.joerg@hakker.de>
	<20090330200610.GD14278@smtp.west.cox.net>
	<200903302236.41493.joerg@hakker.de>
MIME-Version: 1.0
In-Reply-To: <200903302236.41493.joerg@hakker.de>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
Subject: Re: [PATCH] linux-epia-2.6.19.2
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
X-List-Received-Date: Mon, 30 Mar 2009 21:02:40 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Mon, Mar 30, 2009 at 10:36:41PM +0200, Jörg Bakker wrote:
> Am Montag 30 März 2009 22:06:10 schrieb Tom Rini:
> > On Mon, Mar 30, 2009 at 09:55:16PM +0200, Jörg Bakker wrote:
> > > Building of linux-epia-2.6.19.2 stops with the following error:
> >
> > [snip]
> >
> > This is actually quite a common error.  Can we call the patch something
> > more generic and stick it into files/ ? Thanks.
> 
> ok, called the actual patch linux-2.6-limits.patch and moved it to files/
> 
> Resulting diff is attached. However, the patch is currently only applyed in 
> linux-epia_2.6.19.2.bb as I don't know which recipes are affected also.

Pushed (and added to the nokia recipes which I always hit this on).

-- 
Tom Rini


