Received: from [212.60.202.196] (helo=mail.kernelconcepts.de)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <florian.boor@kernelconcepts.de>) id 1Hw7V3-0007mv-LJ
	for openembedded-devel@lists.openembedded.org;
	Thu, 07 Jun 2007 04:13:32 +0200
Received: from [211.160.27.7] (helo=[172.16.3.144])
	by mail.kernelconcepts.de with esmtpsa
	(TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32) (Exim 4.63)
	(envelope-from <florian.boor@kernelconcepts.de>) id 1Hw7U5-0000Id-Tu
	for openembedded-devel@lists.openembedded.org;
	Thu, 07 Jun 2007 04:12:22 +0200
Message-ID: <4667691F.9060706@kernelconcepts.de>
Date: Thu, 07 Jun 2007 04:10:39 +0200
From: Florian Boor <florian.boor@kernelconcepts.de>
User-Agent: Thunderbird 1.5.0.10 (X11/20070403)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <46673D2F.9000404@nospam.arcornews.de>
In-Reply-To: <46673D2F.9000404@nospam.arcornews.de>
X-Enigmail-Version: 0.94.2.0
Subject: Re: issues with oe.org website
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
X-List-Received-Date: Thu, 07 Jun 2007 02:14:11 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hi,

Rolf Leggewie wrote:
> something seems to be wrong with the server that openembedded.org runs on.
> hvontres reminded me that I do have a shell account on linuxtogo.org who 
> kindly host the site and other things.  Thus I think I was able to 
> dispell the first belief that the machine is just plain and simple 
> overloaded.  Looking at top, I frequently see the machine going up to a 
> load of 20 over extended periods of time.  At the same time, the CPU is 
> around 90% idle.  Is there something I/O-bound? kernel bug (as suggested 
> by wirelessdreamer on IRC)?  Imminent hardware-failure?

right, we noticed the same some days ago. For some reason that effect was gone
when I checked later. I suspect a problem with the combination of I/O throughput
(maybe a bad driver) and swapping. I am going to look into this as soon as I am
back home next week.

Greetings

Florian

-- 
The dream of yesterday                  Florian Boor
is the hope of today                    Tel: +49 271-771091-14
and the reality of tomorrow.            Fax: +49 271-771091-19
[Robert Hutchings Goddard, 1904]        florian.boor@kernelconcepts.de

1D78 2D4D 6C53 1CA4 5588  D07B A8E7 940C 25B7 9A76


