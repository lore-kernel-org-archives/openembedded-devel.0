Received: from [68.230.241.39] (helo=fed1rmmtao107.cox.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <trini@kernel.crashing.org>) id 1Lc2Pv-00077G-TZ
	for openembedded-devel@openembedded.org; Tue, 24 Feb 2009 19:54:08 +0100
Received: from fed1rmimpo01.cox.net ([70.169.32.71]) by fed1rmmtao107.cox.net
	(InterMail vM.7.08.02.01 201-2186-121-102-20070209) with ESMTP id
	<20090224185101.BCUP10385.fed1rmmtao107.cox.net@fed1rmimpo01.cox.net>
	for <openembedded-devel@openembedded.org>;
	Tue, 24 Feb 2009 13:51:01 -0500
Received: from localhost ([68.230.63.214]) by fed1rmimpo01.cox.net with bizsmtp
	id Kuqz1b00V4dMFYL03uqzxK; Tue, 24 Feb 2009 13:51:02 -0500
X-Authority-Analysis: v=1.0 c=1 a=o95VN5vaAAAA:8 a=JzlCuvWwUopXQ0WakAoA:9
	a=q4NZYlvneqWJp2uny0sA:7 a=Y5FPf9hqtP1mcGZ4Ejqdjzp8IWUA:4
	a=LY0hPdMaydYA:10 a=SR-wqsnMdtQA:10
X-CM-Score: 0.00
Date: Tue, 24 Feb 2009 11:50:59 -0700
From: Tom Rini <trini@kernel.crashing.org>
To: openembedded-devel@openembedded.org
Message-ID: <20090224185059.GL2172@smtp.west.cox.net>
References: <200902131728.08634.openembedded@haerwu.biz>
	<20090224064639.GE2172@smtp.west.cox.net>
	<1235492001.27962.60.camel@andromeda>
	<8763izyarp.fsf@neumann.lab.ossystems.com.br>
	<fce2a370902241036y359e2c7cv1126a62c8627d2bb@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <fce2a370902241036y359e2c7cv1126a62c8627d2bb@mail.gmail.com>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
Subject: Re: checksums situation
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
X-List-Received-Date: Tue, 24 Feb 2009 18:54:08 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Tue, Feb 24, 2009 at 08:36:35PM +0200, Ihar Hrachyshka wrote:
> On Tue, Feb 24, 2009 at 8:01 PM, Otavio Salvador
> <otavio@ossystems.com.br> wrote:
> > Michael 'Mickey' Lauer <mlauer@vanille-media.de> writes:
> >
> >> Am Montag, den 23.02.2009, 23:46 -0700 schrieb Tom Rini:
> >>> I'm going to make a different suggestion.  Lets just drop it.
> >>
> >> I'm in favour of this. I don't think they give us the safety we want and
> >> they introduce more inconvenience.
> >
> > After reading the thread I'm also in favour of this.
> 
> If you guys don't need it then just disable this checksum feature. No problem.

This misses the point.  We're trying to get things to the point (and
keep them there) where the default case is things working well.  I and
others are arguing that the checksum feature is at best a lazy way to
check only for files changing and not their correctness.  I'm not saying
we don't need a feature to check for correctness, I'm saying what we
have now doesn't.

-- 
Tom Rini


