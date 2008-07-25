Received: from [68.230.241.43] (helo=fed1rmmtao103.cox.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <trini@kernel.crashing.org>) id 1KMPfO-00078G-Lo
	for openembedded-devel@openembedded.org; Fri, 25 Jul 2008 17:57:15 +0200
Received: from fed1rmimpo01.cox.net ([70.169.32.71]) by fed1rmmtao103.cox.net
	(InterMail vM.7.08.02.01 201-2186-121-102-20070209) with ESMTP
	id <20080725155550.XIUE6482.fed1rmmtao103.cox.net@fed1rmimpo01.cox.net>
	for <openembedded-devel@openembedded.org>;
	Fri, 25 Jul 2008 11:55:50 -0400
Received: from localhost ([68.230.56.208]) by fed1rmimpo01.cox.net with bizsmtp
	id uFvr1Z00S4VZ64s03FvriK; Fri, 25 Jul 2008 11:55:51 -0400
Date: Fri, 25 Jul 2008 08:55:51 -0700
From: Tom Rini <trini@kernel.crashing.org>
To: openembedded-devel@openembedded.org
Message-ID: <20080725155551.GG4715@smtp.west.cox.net>
References: <4889169C.7040108@gmx.de> <20080725030222.GC4715@smtp.west.cox.net>
	<d1b08f940807250044k51c6b1f8h9d5f976d83069a54@mail.gmail.com>
	<200807250956.39492.openembedded@haerwu.biz>
	<d1b08f940807250109g5f2a4dfeqf2e89fdd551fd8b8@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <d1b08f940807250109g5f2a4dfeqf2e89fdd551fd8b8@mail.gmail.com>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.13 (2006-08-11)
Subject: Re: RFC: kernel.bbclass and collie changes
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10
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
X-List-Received-Date: Fri, 25 Jul 2008 15:57:15 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jul 25, 2008 at 10:09:04AM +0200, Andrea Adami wrote:
> >>while you're there please weak-assign too:
> >>
> >> KERNEL_IMAGETYPE ?= "zImage"
> 
> > Thats default set by kernel.bbclass
> 
> I meant in zaurus-2.6.inc

Er, isn't that at the level where you know what the board needs and do
want to enforce build choices?

-- 
Tom Rini


