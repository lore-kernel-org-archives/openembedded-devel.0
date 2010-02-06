Received: from qmta14.westchester.pa.mail.comcast.net ([76.96.59.212])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pspreadborough@comcast.net>) id 1Ndniq-0006Ju-UV
	for openembedded-devel@lists.openembedded.org;
	Sat, 06 Feb 2010 17:41:32 +0100
Received: from omta14.westchester.pa.mail.comcast.net ([76.96.62.60])
	by qmta14.westchester.pa.mail.comcast.net with comcast
	id ef4Y1d00A1HzFnQ5EgeznR; Sat, 06 Feb 2010 16:38:59 +0000
Received: from sz0154.wc.mail.comcast.net ([76.96.58.220])
	by omta14.westchester.pa.mail.comcast.net with comcast
	id egez1d0034l5d103agezvg; Sat, 06 Feb 2010 16:38:59 +0000
Date: Sat, 6 Feb 2010 16:38:59 +0000 (UTC)
From: pspreadborough@comcast.net
To: openembedded-devel@lists.openembedded.org
Message-ID: <1481725733.574451265474339086.JavaMail.root@sz0154a.westchester.pa.mail.comcast.net>
In-Reply-To: <19c1b8a91002060827g8336a7uda4dce4652548846@mail.gmail.com>
MIME-Version: 1.0
X-Originating-IP: [76.24.64.15]
X-Mailer: Zimbra 5.0.19_GA_3172.RHEL5_64 (ZimbraWebClient - FF3.0
	(Linux)/5.0.19_GA_3177.RHEL5_64)
X-SA-Exim-Connect-IP: 76.96.59.212
X-SA-Exim-Mail-From: pspreadborough@comcast.net
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: EABI pain and frustration!
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
X-List-Received-Date: Sat, 06 Feb 2010 16:41:32 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit


----- "Khem Raj" <raj.khem@gmail.com> wrote: 

> > 
> > Perhaps it's time for me to try the OE EABI compiler. Can you advise me 
> > on which OE recipes to use for this? 
> 
> use 4.4.2 or 4.4.3 
> 

Mmmm, I don't see any 4.4.? targets:

bitbake -s

gcc                                      0:4.2.4-r3                     
gcc-canadian-sdk                         0:4.2.4-r2                     
gcc-cross                      0:4.3.2+csl-arm-2008q3-39-r1           0:4.2.4-r5
gcc-cross-initial                        0:4.2.4-r5                     
gcc-cross-intermediate                   0:4.2.4-r5                     
gcc-cross-kernel-3.3.3                   0:3.3.3-r6                     
gcc-cross-kernel-3.3.4                   0:3.3.4-r9                     
gcc-cross-kernel-3.4.4                  0:3.4.4-r13                     
gcc-cross-kernel-4.2.1         0:4.2.1+csl-arm-2007q3-53-r4                     
gcc-cross-kernel-4.2.4                   0:4.2.4-r5                     
gcc-cross-sdk                            0:4.2.4-r5                     
gcc-native                              0:3.4.6-r10                     
gcc-noemu                                0:4.1.2-r0 
                 
> > 
> > Regards, 
> > 
> > Pete 
> > 
> > 
> _______________________________________________ 
> Openembedded-devel mailing list 
> Openembedded-devel@lists.openembedded.org 
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel 
> 


