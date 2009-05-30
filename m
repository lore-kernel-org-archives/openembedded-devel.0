Received: from [71.6.201.124] (helo=easi.embeddedalley.com)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <trini@embeddedalley.com>) id 1MAU3r-0000nG-0L
	for openembedded-devel@openembedded.org; Sat, 30 May 2009 21:17:43 +0200
Received: (qmail 27833 invoked from network); 30 May 2009 19:09:09 -0000
Received: from easi.embeddedalley.com (HELO localhost) (easi@71.6.201.124)
	by easi.embeddedalley.com with SMTP; 30 May 2009 12:09:09 -0700
Date: Sat, 30 May 2009 12:09:08 -0700
From: Tom Rini <trini@embeddedalley.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090530190908.GJ23842@smtp.west.cox.net>
References: <1243535051-10168-1-git-send-email-msmith@cbnco.com>
	<1243535051-10168-2-git-send-email-msmith@cbnco.com>
	<20090530164513.GH23842@smtp.west.cox.net>
	<Pine.LNX.4.64.0905301437110.27204@juice.ott.cti.com>
MIME-Version: 1.0
In-Reply-To: <Pine.LNX.4.64.0905301437110.27204@juice.ott.cti.com>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
Subject: Re: [PATCH] vim: be an alternative to /bin/vi; switch to INC_PR
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
X-List-Received-Date: Sat, 30 May 2009 19:17:43 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, May 30, 2009 at 02:41:12PM -0400, Michael Smith wrote:
> On Sat, 30 May 2009, Tom Rini wrote:
> 
> > On Thu, May 28, 2009 at 02:24:11PM -0400, Michael Smith wrote:
> > >  DEPENDS += "gtk+ xt"
> > > -PR = "r1"
> > > +PR = "${INC_PR}.1"
> > >  FILESPATHPKG =. "vim-${PV}:vim:"
> > 
> > The FILESPATHPKG change here hasn't been submitted yet :)
> 
> Oops, that was sloppy on my part -- would you mind trying to am again now 
> that the FILESPATHPKG series is applied? This is the URL:
> 
> http://patchwork.openembedded.org/patch/655/mbox/
> 
> (thanks for applying that series, btw)

Done, thanks for the good work :)

-- 
Tom Rini


