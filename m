Received: from [62.70.27.18] (helo=esparsett.troll.no)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <lorn.potter@trolltech.com>) id 1IvNUU-0002do-Jn
	for openembedded-devel@lists.openembedded.org;
	Fri, 23 Nov 2007 02:37:58 +0100
Received: from esparsett.troll.no (localhost [127.0.0.1])
	by localhost (Postfix) with SMTP id ED9BD74284
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Nov 2007 02:05:43 +0100 (CET)
Received: from mail.trolltech.com.au (unknown [10.1.1.12])
	by esparsett.troll.no (Postfix) with ESMTP id 6D73B7422D
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Nov 2007 02:05:43 +0100 (CET)
Received: from polarbear-replace.trolltech.com.au
	(polarbear-replace.trolltech.com.au [10.1.1.181])
	by mail.trolltech.com.au (Postfix) with ESMTP id 26690367556
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Nov 2007 11:05:42 +1000 (EST)
From: Lorn Potter <lorn.potter@trolltech.com>
Organization: Trolltech Pty Ltd
To: openembedded-devel@lists.openembedded.org
Date: Fri, 23 Nov 2007 11:05:39 +1000
User-Agent: KMail/1.9.5
References: <20071119120819.GA17788@lenovo> <47450371.9050005@trolltech.com>
	<1195719290.20614.0.camel@localhost>
In-Reply-To: <1195719290.20614.0.camel@localhost>
MIME-Version: 1.0
Message-Id: <200711231105.39635.lorn.potter@trolltech.com>
X-Mailman-Approved-At: Fri, 23 Nov 2007 12:42:26 +0100
Subject: Re: Getting Started -Makefile
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
X-List-Received-Date: Fri, 23 Nov 2007 01:37:59 -0000
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Thursday 22 November 2007 18:14, Esben Haabendal wrote:
> On Thu, 2007-11-22 at 14:20 +1000, Lorn Potter wrote:
> > Michael 'Mickey' Lauer wrote:
> > > Guilty as charged. Lets try not to force these people to use OE -- we
> > > can do this by releasing prebuilt toolchains. I'm going to start with
> > > releasing an OpenMoko toolchain next week.
> >
> > FYI, We have had a toolchain released when we first released Qtopia for
> > Neo tech preview, built with CROSS_DIR = "/opt/toolchains/arm920t-eabi".
> > I put it there because that is where the greenphone toolchain lived.
> >
> > It would be nice if we were to use the same location for toolchains. So
> > perhaps you could use our location? :)
>
> And prevent people from installing both toolchains on the same machine
> without fiddling with paths?
>

The toolchain is more or less the same for openmoko and qtopia, and are 
compatible in the least. If you have the openmoko toolchain installed, you 
can compile Qtopia with that as well.




-- 
Lorn 'ljp' Potter
Software Engineer, Systems Group, MES, Trolltech



