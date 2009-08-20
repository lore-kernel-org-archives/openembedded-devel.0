Received: from [71.6.201.124] (helo=easi.embeddedalley.com)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <trini@embeddedalley.com>) id 1Me0Vs-0003Sw-9L
	for openembedded-devel@openembedded.org; Thu, 20 Aug 2009 07:48:40 +0200
Received: (qmail 19839 invoked from network); 20 Aug 2009 05:31:22 -0000
Received: from easi.embeddedalley.com (HELO localhost) (easi@71.6.201.124)
	by easi.embeddedalley.com with SMTP; 19 Aug 2009 22:31:22 -0700
Date: Wed, 19 Aug 2009 22:31:23 -0700
From: Tom Rini <trini@embeddedalley.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090820053123.GD4952@smtp.west.cox.net>
References: <20090814215138.GB31011@gmail.com>
	<20090815022703.GH14883@smtp.west.cox.net>
	<19c1b8a90908151021s67bbdd9fh52a07dce6d51ace8@mail.gmail.com>
	<20090817234049.GH2227@smtp.west.cox.net>
	<19c1b8a90908172329p55250179od552cd94fa4cbff5@mail.gmail.com>
	<20090818154440.GQ2227@smtp.west.cox.net>
	<20090818212827.GA26614@gmail.com>
	<20090818232002.GZ2227@smtp.west.cox.net>
	<19c1b8a90908181648nb43120bg978baa4ac0faa2cb@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <19c1b8a90908181648nb43120bg978baa4ac0faa2cb@mail.gmail.com>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
Subject: Re: [RFC] Adding eglibc versions of minimal and micro distro
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
X-List-Received-Date: Thu, 20 Aug 2009 05:48:40 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Aug 18, 2009 at 04:48:20PM -0700, Khem Raj wrote:
[snip]
> > So are we on the same page again, micro/minimal-uclibc can go away and
> > micro/minimal can ?= LIBC? :)
> 
> no. LIBC provides other packages too which is different for uclibc
> its same for glibc and eglibc so having same for glibc and eglibc is ok but not
> for uclibc

You've lost me, again.  What does uclibc.inc not set correct for uclibc?

-- 
Tom Rini


