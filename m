Received: from [68.230.241.42] (helo=fed1rmmtao104.cox.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <trini@kernel.crashing.org>) id 1LyRCb-000422-V7
	for openembedded-devel@openembedded.org; Mon, 27 Apr 2009 15:48:58 +0200
Received: from fed1rmimpo03.cox.net ([70.169.32.75]) by fed1rmmtao104.cox.net
	(InterMail vM.7.08.02.01 201-2186-121-102-20070209) with ESMTP
	id <20090427134353.QBS16134.fed1rmmtao104.cox.net@fed1rmimpo03.cox.net>
	for <openembedded-devel@openembedded.org>;
	Mon, 27 Apr 2009 09:43:53 -0400
Received: from localhost ([68.230.63.214]) by fed1rmimpo03.cox.net with bizsmtp
	id kdjs1b0044dMFYL04djsUs; Mon, 27 Apr 2009 09:43:52 -0400
X-Authority-Analysis: v=1.0 c=1 a=BJU0Syc8Wz4A:10 a=oofs9C6kbiIA:10
	a=KnRDxRxoFxVgRGkhjosA:9 a=rBuDoR7IFJXL255pxd1uZKDoK_kA:4
X-CM-Score: 0.00
Date: Mon, 27 Apr 2009 06:43:52 -0700
From: Tom Rini <trini@kernel.crashing.org>
To: openembedded-devel@openembedded.org
Message-ID: <20090427134352.GE18788@smtp.west.cox.net>
References: <49F59B68.1010208@balister.org>
	<69E6C70090A0A14498CC98FAE5E06B6E3CF793@hiob.intern.dresearch.de>
MIME-Version: 1.0
In-Reply-To: <69E6C70090A0A14498CC98FAE5E06B6E3CF793@hiob.intern.dresearch.de>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
Subject: Re: gcc_4.2.4.bb: QA Issue: No GNU_HASH in the elf binary
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
X-List-Received-Date: Mon, 27 Apr 2009 13:48:58 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Apr 27, 2009 at 03:37:25PM +0200, Sledz, Steffen wrote:
> > > At the moment we are not able to make a build out of the 
> > > .dev tree. :(
> > 
> > For what machine and distro?
> 
> hipox and angstrom
> 
> But does this problem really depends on them? I thought it's a problem in the gcc-4.2.4 recipe.

It's in all gcc versions, really.

-- 
Tom Rini


