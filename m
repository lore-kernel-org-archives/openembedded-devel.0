Received: from [195.121.247.23] (helo=psmtp09.wxs.nl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gerwin@vanderkruis.net>) id 1L0pWo-0003hY-Ig
	for openembedded-devel@lists.openembedded.org;
	Fri, 14 Nov 2008 04:39:26 +0100
Received: from ubuntu.lan (ip5457b30e.direct-adsl.nl [84.87.179.14])
	by psmtp09.wxs.nl
	(iPlanet Messaging Server 5.2 HotFix 2.15 (built Nov 14 2006))
	with ESMTP id <0KAB00ISO0Q706@psmtp09.wxs.nl> for
	openembedded-devel@lists.openembedded.org; Fri,
	14 Nov 2008 04:37:19 +0100 (MET)
Date: Fri, 14 Nov 2008 04:37:20 +0100
From: Gerwin van der Kruis <gerwin@vanderkruis.net>
In-reply-to: <200811131603.56294.gerwin@vanderkruis.net>
To: openembedded-devel@lists.openembedded.org
Message-id: <200811140437.20187.gerwin@vanderkruis.net>
Organization: GO-2K
MIME-version: 1.0
User-Agent: KMail/1.9.10
References: <200811121733.59749.gerwin@vanderkruis.net>
	<c384c5ea0811130608v47862518j845053b4f3291958@mail.gmail.com>
	<200811131603.56294.gerwin@vanderkruis.net>
Subject: Re: Transferring images to flash avr32
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
X-List-Received-Date: Fri, 14 Nov 2008 03:39:27 -0000
Content-type: text/plain; charset=iso-8859-1
Content-transfer-encoding: 7BIT
Content-disposition: inline

On Thursday 13 November 2008 16:03:56 Gerwin van der Kruis wrote:
> On Thursday 13 November 2008 15:08:17 Leon Woestenberg wrote:
> > Gerwin,
> >
> > On Wed, Nov 12, 2008 at 5:33 PM, Gerwin van der Kruis
> >
> > <gerwin@vanderkruis.net> wrote:
> > > I managed to succesfully compile the images for avr32 .
> > >
> > > I want to use tftp and u-boot to boot the images on my ATNGW100 board.
> > >
> > > Is there somewhere a manual how to put the images on the board ?

Problem solved managed to load images. 

If I load an old minimal-image it works , the atngw100 is booting . 

With a new freshly compiled image it is booting but than dies with a signal 11 
in init. 

I am unsure why this is . 

Regards, 

Gerwin 


