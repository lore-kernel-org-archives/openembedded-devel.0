Received: from [213.165.64.20] (helo=mail.gmx.net)
	by linuxtogo.org with smtp (Exim 4.67)
	(envelope-from <tobias.pflug@gmx.net>) id 1IltxL-00064J-9k
	for openembedded-devel@lists.openembedded.org;
	Sun, 28 Oct 2007 00:16:35 +0200
Received: (qmail invoked by alias); 27 Oct 2007 22:08:59 -0000
Received: from p549AA970.dip0.t-ipconnect.de (EHLO [192.168.1.100])
	[84.154.169.112]
	by mail.gmx.net (mp005) with SMTP; 28 Oct 2007 00:08:59 +0200
X-Authenticated: #283898
X-Provags-ID: V01U2FsdGVkX18zrnlRVtszBt6IPW7T9pLufV5m2D5RobT9uEJIkQ
	Gcl0CFQS2QtEc2
From: Tobias Pflug <tobias.pflug@gmx.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20071027212600.GA6219@lenovo>
References: <471FC1C0.4010103@linux.it> <20071025001926.GA14645@lenovo>
	<472047C3.20208@student.utwente.nl> <20071025121153.GA8231@lenovo>
	<f96d234e0710251034s488b9c13me8c4d9731638a94e@mail.gmail.com>
	<20071026134528.GA6182@lenovo> <1193483219.6376.100.camel@toontown>
	<20071027153928.GA6118@lenovo> <47237509.8070405@student.utwente.nl>
	<20071027212600.GA6219@lenovo>
Date: Sun, 28 Oct 2007 00:09:17 +0200
Message-Id: <1193522957.6376.125.camel@toontown>
Mime-Version: 1.0
X-Mailer: Evolution 2.12.0 
X-Y-GMX-Trusted: 0
Subject: Re: getting started - docbook
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 27 Oct 2007 22:16:35 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit


On Sat, 2007-10-27 at 16:26 -0500, David Farning wrote:
> On Sat, Oct 27, 2007 at 07:27:37PM +0200, Koen Kooi wrote:
> > -----BEGIN PGP SIGNED MESSAGE-----
> > Hash: SHA1
> > 
> > David Farning schreef:
> > > On Sat, Oct 27, 2007 at 01:06:59PM +0200, Tobias Pflug wrote:
> > >> on 1: 
> > >> with big picture I mean there should be a description of the 
> > >> "system" with its main components. Currently i think there is too
> > >> little of that, and too many use-cases. ("In order to change xyz,
> > >> apply abc to 123").
> > > 
> > > I finished a rough draft of getting started this morning.  I am going
> > > to let it sit for a week before looking at it again.  Then I will
> > > rework as needed and submitte for review.
> > > 
> > > In the mean time I am starting on a introduction chapter.  This will
> > > be a very high level overview.  Below is a first stab at the outline.
> > 
> > Even if 99.9% if the people use OE to build linux stuff, it is able to
> > build nonlinux targets like bare-metal stuff for the msp430
> > microcontroller and things like arm-wince-pe or arm-apple-darwin.
> 
> That makes sense.  Nothing special about the Linux kernel.  For the
> purposes of documentation would you mind if we:
> 
> 1 Studied the device - processer, memory, IO, devices....
> 2 Studied a generic Linux distribution - kernel, libs, apps, packages,
> files system....
> 3 Discussed how to use bb/oe to create a customized distro to run on a
> specific device.

In my humble opinion that is way out of scope for a OE documentation.
The point is to present the workings and functionalities of OpenEmbedded
and not how to get some arbitrary hardware to run linux from 0 to
100% .. ?

At least that is my conception of what the OE documentation should
provide?

regards,
Tobi



