Received: from [71.6.201.124] (helo=easi.embeddedalley.com)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <trini@embeddedalley.com>) id 1M1Ril-0006wJ-Oq
	for openembedded-devel@openembedded.org; Tue, 05 May 2009 22:58:36 +0200
Received: (qmail 6905 invoked from network); 5 May 2009 20:52:38 -0000
Received: from easi.embeddedalley.com (HELO localhost) (easi@71.6.201.124)
	by easi.embeddedalley.com with SMTP; 5 May 2009 13:52:38 -0700
Date: Tue, 5 May 2009 13:52:38 -0700
From: Tom Rini <trini@embeddedalley.com>
To: OpenEmbedded Devel List <openembedded-devel@openembedded.org>
Message-ID: <20090505205237.GL7973@smtp.west.cox.net>
References: <1240589520-1104-1-git-send-email-trini@kernel.crashing.org>
	<20090424182843.GA15489@smtp.west.cox.net>
	<20090502212847.GC20619@smtp.west.cox.net>
MIME-Version: 1.0
In-Reply-To: <20090502212847.GC20619@smtp.west.cox.net>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
Subject: Re: [PATCH][STABLE] Various SDK-related updates
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
X-List-Received-Date: Tue, 05 May 2009 20:58:36 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, May 02, 2009 at 02:28:47PM -0700, Tom Rini wrote:
> On Fri, Apr 24, 2009 at 11:28:43AM -0700, Tom Rini wrote:
> > On Fri, Apr 24, 2009 at 09:11:48AM -0700, Tom Rini wrote:
> > > The following series brings stable up to date with dev, with respect to
> > > SDK and Canadian SDK changes.  The only not directly SDK related change
> > > is the bugfix to wireless-tools so that libiw can be used.  mwester said
> > > I should pull the SlugOS-related fix in myself rather than wait for him
> > > to update SlugOS stuff in stable.  These changes have been build-tested
> > > for gcc 4.1.2/4.2.4/4.3.3 and at91sam9263ek qemuarm omap5912osk
> > > beagleboard vortex86sx qemux86 mpc8313e-rdb with DISTRO=angstrom-2008.1
> > > in both dev and stable with identical results.  These changes are also
> > > in the trini/stable/2009/sdk-updates branch.
> > 
> > Also now in
> > http://patchwork.openembedded.org/bundle/trini/trini-stable-2009-sdk-updates/
> 
> If I read the Stable wiki page correctly, changes like this need a
> maintainer ack (Khem has) and a second ack.  Still looking for a second
> ack.

hrw said on IRC that no, 1 ack is enough for SDK stuff, so this is being
pushed now.

-- 
Tom Rini


