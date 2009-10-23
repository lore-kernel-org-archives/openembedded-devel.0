Received: from [213.186.62.213] (helo=30.mail-out.ovh.net)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <eric@eukrea.com>) id 1N1LZr-0005hP-CZ
	for openembedded-devel@openembedded.org; Fri, 23 Oct 2009 16:57:18 +0200
Received: (qmail 11994 invoked by uid 503); 23 Oct 2009 14:56:16 -0000
Received: from b7.ovh.net (HELO mail437.ha.ovh.net) (213.186.33.57)
	by 30.mail-out.ovh.net with SMTP; 23 Oct 2009 14:56:16 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 23 Oct 2009 14:56:23 -0000
Received: from pac33-2-82-240-38-71.fbx.proxad.net (HELO ?192.168.1.15?)
	(ebenard%eukrea.com@82.240.38.71)
	by ns0.ovh.net with SMTP; 23 Oct 2009 14:56:22 -0000
Message-ID: <4AE1C40B.7050809@eukrea.com>
Date: Fri, 23 Oct 2009 16:56:11 +0200
From: =?ISO-8859-1?Q?Eric_B=E9nard?= <eric@eukrea.com>
User-Agent: Thunderbird 2.0.0.23 (X11/20090817)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4AE0BEFA.4020905@mlbassoc.com>	<19c1b8a90910221735t5c91498ft9a692cd75c442db4@mail.gmail.com>
	<200910230326.13922.holger+oe@freyther.de>
In-Reply-To: <200910230326.13922.holger+oe@freyther.de>
X-Ovh-Tracer-Id: 14129199407302487369
X-Ovh-Remote: 82.240.38.71 (pac33-2-82-240-38-71.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-SA-Exim-Connect-IP: 213.186.62.213
X-SA-Exim-Mail-From: eric@eukrea.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: SDK problems
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
X-List-Received-Date: Fri, 23 Oct 2009 14:57:18 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit

Hi Holger,

Holger Hans Peter Freyther a écrit :
> thanks to Khem on irc and pointing me to -Wl,-verbose there is something fishy 
> with the libc_nonshared.a in the SDK. I have no idea what kind of problem but 
> the workaround is to copy libc_nonshared.a from the OE staging to
> 
> /usr/local/angstrom/arm/arm-angstrom-linux-gnueabi/usr/lib.
> 
works fine here both for meta-toolchain & meta-toolchain-qte.

Thanks,
Eric


