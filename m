Received: from [71.6.201.124] (helo=easi.embeddedalley.com)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <trini@embeddedalley.com>) id 1MAXAT-0003xC-IE
	for openembedded-devel@openembedded.org; Sun, 31 May 2009 00:36:45 +0200
Received: (qmail 28280 invoked from network); 30 May 2009 22:28:11 -0000
Received: from easi.embeddedalley.com (HELO localhost) (easi@71.6.201.124)
	by easi.embeddedalley.com with SMTP; 30 May 2009 15:28:11 -0700
Date: Sat, 30 May 2009 15:28:10 -0700
From: Tom Rini <trini@embeddedalley.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090530222810.GV23842@smtp.west.cox.net>
References: <20090522213142.GF23842@smtp.west.cox.net>
	<200905242049.30726.marcin@juszkiewicz.com.pl>
	<20090530191647.GL23842@smtp.west.cox.net>
	<gvs7gu$3ha$2@ger.gmane.org>
	<20090530213323.GR23842@smtp.west.cox.net>
	<be7a9f3d0905301516r30b0f82fv8227f2a3ba28a89f@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <be7a9f3d0905301516r30b0f82fv8227f2a3ba28a89f@mail.gmail.com>
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
X-List-Received-Date: Sat, 30 May 2009 22:36:46 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Sat, May 30, 2009 at 07:16:29PM -0300, Otavio Salvador wrote:
> Hello Tom,
> 
> On Sat, May 30, 2009 at 6:33 PM, Tom Rini <trini@embeddedalley.com> wrote:
> [...]
> > Every machine might be able to make use of it, if it either depends on
> > unstable / in development programs or modules, OR it can use some
> > external kernel module (IMHO the right answer for this is versioned
> > dependancies, having the PR be increasing from 2.6.29 to 2.6.30 is
> > different than normal behavior).  This isn't always going to be an
> > option.
> 
> I agree that a versioned dependency would be the optimal solution for
> it, even better would be if we could use ABI versions for those
> depends (somewhat as done for X packages in Debian) however AFAIK
> bitbake doesn't support it yet, does it?

No, it does not.

-- 
Tom Rini


