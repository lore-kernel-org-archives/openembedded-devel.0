Received: from [209.85.132.242] (helo=an-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <jonsmirl@gmail.com>) id 1HJDxi-00014n-Mm
	for openembedded-devel@openembedded.org; Mon, 19 Feb 2007 20:14:10 +0100
Received: by an-out-0708.google.com with SMTP id b2so213634ana
	for <openembedded-devel@openembedded.org>;
	Mon, 19 Feb 2007 11:14:09 -0800 (PST)
Received: by 10.114.94.1 with SMTP id r1mr2144519wab.1171912449178;
	Mon, 19 Feb 2007 11:14:09 -0800 (PST)
Received: by 10.114.195.13 with HTTP; Mon, 19 Feb 2007 11:14:09 -0800 (PST)
Message-ID: <9e4733910702191114w5985d708u99ae49dbb8fc451b@mail.gmail.com>
Date: Mon, 19 Feb 2007 14:14:09 -0500
From: "Jon Smirl" <jonsmirl@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <45D9E04D.1050502@dominion.kabel.utwente.nl>
MIME-Version: 1.0
References: <9e4733910702190810q496633c3gd782939046599a02@mail.gmail.com>
	<45D9E04D.1050502@dominion.kabel.utwente.nl>
Cc: openembedded-devel@openembedded.org
Subject: Re: Adding Ralink rt2x00 CVS to openembedded
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
X-List-Received-Date: Mon, 19 Feb 2007 19:14:10 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On 2/19/07, Koen Kooi <koen@dominion.kabel.utwente.nl> wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Jon Smirl schreef:
> > Ralink makes 802.11 wireless adapters. The dscape version of this has
> > not been merged into the main kernel yet so I need to use CVS to fetch
> > it. The CVS repository builds modules for five different adapters
> > simultaneously. How do I set the bitbake file up to make these
> > independently installable?
> >
> > This doesn't work, when I try to include rt73usb into the slugosbe
> > image make says it can't find rt73usb.
>
> Could you attach it to http://bugs.openembedded.org please?

I created bug 1890 and attached my two files.
http://bugs.openembedded.org/show_bug.cgi?id=1890

The attached files don't build the correct packages. I need some help
with bitbake on how to build five different packages from one CVS
repo.

-- 
Jon Smirl
jonsmirl@gmail.com


