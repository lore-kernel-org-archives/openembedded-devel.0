Received: from [71.6.201.124] (helo=easi.embeddedalley.com)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <trini@embeddedalley.com>) id 1M3jTG-0002qc-Bj
	for openembedded-devel@openembedded.org; Tue, 12 May 2009 06:20:02 +0200
Received: (qmail 4006 invoked from network); 12 May 2009 04:13:26 -0000
Received: from easi.embeddedalley.com (HELO localhost) (easi@71.6.201.124)
	by easi.embeddedalley.com with SMTP; 11 May 2009 21:13:26 -0700
Date: Mon, 11 May 2009 21:13:25 -0700
From: Tom Rini <trini@embeddedalley.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090512041325.GG7973@smtp.west.cox.net>
References: <c384c5ea0905071305s1b180deal8c5fd09b5d646308@mail.gmail.com>
	<1242096804-27041-1-git-send-email-msmith@cbnco.com>
	<1242096804-27041-2-git-send-email-msmith@cbnco.com>
	<20090512030227.GF7973@smtp.west.cox.net>
	<Pine.LNX.4.64.0905112317500.6446@juice.ott.cti.com>
MIME-Version: 1.0
In-Reply-To: <Pine.LNX.4.64.0905112317500.6446@juice.ott.cti.com>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
Subject: Re: [PATCH] grub: Split the grub-install script and friends	into a separate package.
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
X-List-Received-Date: Tue, 12 May 2009 04:20:03 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, May 11, 2009 at 11:18:29PM -0400, Michael Smith wrote:
> On Mon, 11 May 2009, Tom Rini wrote:
> 
> > >  SRC_URI = "ftp://alpha.gnu.org/gnu/grub/grub-${PV}.tar.gz \
> > 
> > Please switch to ${GNU_MIRROR}/grub/...
> 
> grub is not on ${GNU_MIRROR}, only alpha.
> 
> I can only guess because it never had an official release.

Oh right, my bad.

-- 
Tom Rini


