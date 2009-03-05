Received: from [68.230.241.43] (helo=fed1rmmtao103.cox.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <trini@kernel.crashing.org>) id 1LfF1W-0005l0-Cl
	for openembedded-devel@openembedded.org; Thu, 05 Mar 2009 15:58:10 +0100
Received: from fed1rmimpo03.cox.net ([70.169.32.75]) by fed1rmmtao103.cox.net
	(InterMail vM.7.08.02.01 201-2186-121-102-20070209) with ESMTP
	id <20090305145348.EPBX4363.fed1rmmtao103.cox.net@fed1rmimpo03.cox.net>
	for <openembedded-devel@openembedded.org>;
	Thu, 5 Mar 2009 09:53:48 -0500
Received: from localhost ([68.230.63.214]) by fed1rmimpo03.cox.net with bizsmtp
	id PStm1b00N4dMFYL04StnuL; Thu, 05 Mar 2009 09:53:47 -0500
X-Authority-Analysis: v=1.0 c=1 a=PtGMK2djFQ4A:10 a=1JGWZoleitcA:10
	a=lwp0F9UxEp7olKD8OmgA:9 a=TpY_g4SAcpsZbGHwqp-qreT8xcQA:4
	a=LY0hPdMaydYA:10
X-CM-Score: 0.00
Date: Thu, 5 Mar 2009 07:53:46 -0700
From: Tom Rini <trini@kernel.crashing.org>
To: openembedded-devel@openembedded.org
Message-ID: <20090305145346.GG26343@smtp.west.cox.net>
References: <20090305143641.GF26343@smtp.west.cox.net>
	<49AFE5BE.4050205@xora.org.uk>
MIME-Version: 1.0
In-Reply-To: <49AFE5BE.4050205@xora.org.uk>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
Subject: Re: Add 2.6.28+2.6.29-rc7 or wait?
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
X-List-Received-Date: Thu, 05 Mar 2009 14:58:11 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Mar 05, 2009 at 02:46:22PM +0000, Graeme Gregory wrote:
> Tom Rini wrote:
> > Hey all.  Kicking off tests for the RPM package support made me realize
> > that one of the boards I'm goint to use (the mx31pdk, aka i.mx31
> > 3-stack) is finally supported to a degree upstream as of 2.6.29-rc1.
> > Should I go and add an -rc7 recipe now or just wait for 2.6.29 to
> > finally drop?  Thanks.
> >
> >   
> There are already rc5/rc6 recipes so feel free to do rc7

Ah, missed those, thanks.

-- 
Tom Rini


