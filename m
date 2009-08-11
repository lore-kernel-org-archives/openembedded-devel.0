Received: from [206.46.173.7] (helo=vms173007pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1Manlg-0000dV-Tu
	for openembedded-devel@lists.openembedded.org;
	Tue, 11 Aug 2009 11:35:45 +0200
Received: from gandalf.denix.org ([71.255.235.240]) by vms173007.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 6.3-7.04 (built Sep 26 2008;
	32bit)) with ESMTPA id <0KO700DNLGKD6W42@vms173007.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Tue,
	11 Aug 2009 04:19:25 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 4028A14AF5F; Tue,
	11 Aug 2009 05:19:25 -0400 (EDT)
Date: Tue, 11 Aug 2009 05:19:25 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20090811091925.GA11120@denix.org>
References: <20090810205124.GA15812@gmail.com>
	<4A80976B.6020108@soundmetrics.com> <20090811014358.GA8250@denix.org>
	<19c1b8a90908110034j73e16bacqcf7c7c8c1d3a3607@mail.gmail.com>
	<fce2a370908110100m2347b6fag409721b7f024b847@mail.gmail.com>
MIME-version: 1.0
In-reply-to: <fce2a370908110100m2347b6fag409721b7f024b847@mail.gmail.com>
User-Agent: Mutt/1.5.16 (2007-06-09)
Subject: Re: Missing OMAP35x_Graphics_SDK_setuplinux_3_00_00_08.bin	during libgles-omap3_3.00.00.08.bb
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
X-List-Received-Date: Tue, 11 Aug 2009 09:35:45 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Tue, Aug 11, 2009 at 11:00:47AM +0300, Ihar Hrachyshka wrote:
> On Tue, Aug 11, 2009 at 10:34 AM, Khem Raj<raj.khem@gmail.com> wrote:
> > On Mon, Aug 10, 2009 at 6:43 PM, Denys Dmytriyenko<denis@denix.org> wrote:
> >> On Mon, Aug 10, 2009 at 02:55:55PM -0700, John Faith wrote:
> >>> Khem Raj wrote:
> >>>> ...
> >>>> It seems like this file
> >>>> /home/kraj/work/oe/openembedded/recipes/powervr-drivers/libgles-omap3/OMAP35x_Graphics_SDK_setuplinux_3_00_00_08.bin
> >>>> is missing in my case.
> >>>>
> >>>> Where should it come from
> >>>
> >>> The Graphics SDK installer must be downloaded from Ti and manually put in
> >>> place before building libgles:
> >>> http://code.google.com/p/beagleboard/wiki/HowtoUseSGXunderAngstrom
> >>
> >> By the way, should it be done the same way as DVSDK - i.e. expect the
> >> installer in the downloads/ instead of the recipes/? Which way is better?
> >
> > FWIW I would prefer if it downloads the file for me somehow
> 
> Texas Instruments doesn't allow it.

For now, but it is being addressed and should be better in the future...

Denys


