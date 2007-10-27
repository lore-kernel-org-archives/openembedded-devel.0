Received: from [64.233.166.181] (helo=py-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <dfarning@gmail.com>) id 1IltHs-0005h5-O3
	for openembedded-devel@lists.openembedded.org;
	Sat, 27 Oct 2007 23:33:45 +0200
Received: by py-out-1112.google.com with SMTP id a25so2476945pyi
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 27 Oct 2007 14:26:08 -0700 (PDT)
Received: by 10.65.188.14 with SMTP id q14mr9446337qbp.1193520367627;
	Sat, 27 Oct 2007 14:26:07 -0700 (PDT)
Received: from lenovo ( [75.121.171.134])
	by mx.google.com with ESMTPS id r15sm3424839nza.2007.10.27.14.26.05
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 27 Oct 2007 14:26:06 -0700 (PDT)
Received: by lenovo (sSMTP sendmail emulation); Sat, 27 Oct 2007 16:26:01 -0500
Date: Sat, 27 Oct 2007 16:26:01 -0500
From: David Farning <dfarning@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20071027212600.GA6219@lenovo>
References: <471FC1C0.4010103@linux.it> <20071025001926.GA14645@lenovo>
	<472047C3.20208@student.utwente.nl> <20071025121153.GA8231@lenovo>
	<f96d234e0710251034s488b9c13me8c4d9731638a94e@mail.gmail.com>
	<20071026134528.GA6182@lenovo> <1193483219.6376.100.camel@toontown>
	<20071027153928.GA6118@lenovo>
	<47237509.8070405@student.utwente.nl>
MIME-Version: 1.0
In-Reply-To: <47237509.8070405@student.utwente.nl>
User-Agent: Mutt/1.5.15+20070412 (2007-04-11)
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
X-List-Received-Date: Sat, 27 Oct 2007 21:33:45 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Oct 27, 2007 at 07:27:37PM +0200, Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
> 
> David Farning schreef:
> > On Sat, Oct 27, 2007 at 01:06:59PM +0200, Tobias Pflug wrote:
> >> on 1: 
> >> with big picture I mean there should be a description of the 
> >> "system" with its main components. Currently i think there is too
> >> little of that, and too many use-cases. ("In order to change xyz,
> >> apply abc to 123").
> > 
> > I finished a rough draft of getting started this morning.  I am going
> > to let it sit for a week before looking at it again.  Then I will
> > rework as needed and submitte for review.
> > 
> > In the mean time I am starting on a introduction chapter.  This will
> > be a very high level overview.  Below is a first stab at the outline.
> 
> Even if 99.9% if the people use OE to build linux stuff, it is able to
> build nonlinux targets like bare-metal stuff for the msp430
> microcontroller and things like arm-wince-pe or arm-apple-darwin.

That makes sense.  Nothing special about the Linux kernel.  For the
purposes of documentation would you mind if we:

1 Studied the device - processer, memory, IO, devices....
2 Studied a generic Linux distribution - kernel, libs, apps, packages,
files system....
3 Discussed how to use bb/oe to create a customized distro to run on a
specific device.

Once the user understands how to create a custom linux distro the
theory can be extended to other OSs.

By looking specifically a linux first, the reader has a lot of good, concrete,
 documentation available to them.


> > 1.1. Linux ................................................
> >       1.1.1. Linux Overview ...................
> >       1.1.2. Linux Arctoture ...................
> 
> ^ typo
> 
Sorry you will find lots of typos and sentences out of order until
things start nearing a final draft stage.  I have dyslexia so my
drafts are pretty rough.  For the final draft, I have someone read
each sentence aloud so I can get it right;)

Thanks
David Farning


