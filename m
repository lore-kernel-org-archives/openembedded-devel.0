Received: from qmta08.westchester.pa.mail.comcast.net ([76.96.62.80])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pspreadborough@comcast.net>) id 1Ne9W7-0001gX-9N
	for openembedded-devel@lists.openembedded.org;
	Sun, 07 Feb 2010 16:57:50 +0100
Received: from omta14.westchester.pa.mail.comcast.net ([76.96.62.60])
	by qmta08.westchester.pa.mail.comcast.net with comcast
	id f3JX1d0081HzFnQ583uFlF; Sun, 07 Feb 2010 15:54:15 +0000
Received: from sz0154.wc.mail.comcast.net ([76.96.58.220])
	by omta14.westchester.pa.mail.comcast.net with comcast
	id f3uF1d0034l5d103a3uFPx; Sun, 07 Feb 2010 15:54:15 +0000
Date: Sun, 7 Feb 2010 15:54:15 +0000 (UTC)
From: pspreadborough@comcast.net
To: openembedded-devel@lists.openembedded.org
Message-ID: <1655665943.863651265558055071.JavaMail.root@sz0154a.westchester.pa.mail.comcast.net>
In-Reply-To: <19c1b8a91002060927n255e2db7xe618110ffdac6623@mail.gmail.com>
MIME-Version: 1.0
X-Originating-IP: [76.24.64.15]
X-Mailer: Zimbra 5.0.19_GA_3172.RHEL5_64 (ZimbraWebClient - FF3.0
	(Linux)/5.0.19_GA_3177.RHEL5_64)
X-SA-Exim-Connect-IP: 76.96.62.80
X-SA-Exim-Mail-From: pspreadborough@comcast.net
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: EABI pain and frustration! - Solved
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
X-List-Received-Date: Sun, 07 Feb 2010 15:57:50 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit


----- "Khem Raj" <raj.khem@gmail.com> wrote:

> On Sat, Feb 6, 2010 at 8:38 AM,  <pspreadborough@comcast.net> wrote:
> >
> > ----- "Khem Raj" <raj.khem@gmail.com> wrote:
> >
> >> >
> >> > Perhaps it's time for me to try the OE EABI compiler. Can you
> advise me
> >> > on which OE recipes to use for this?
> >>
> >> use 4.4.2 or 4.4.3
> >>
> >
> > Mmmm, I don't see any 4.4.? targets:
> >
> 
> are you using .dev branch ?

I switched to the .dev branch, built the 4.4.2 EABI compiler and it now
works, I can boot to a EABI ramfs.

Thanks for the assistance.

Pete


