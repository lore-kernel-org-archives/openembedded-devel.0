Received: from qmta02.westchester.pa.mail.comcast.net ([76.96.62.24])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pspreadborough@comcast.net>) id 1NdOKk-0003ip-6L
	for openembedded-devel@lists.openembedded.org;
	Fri, 05 Feb 2010 14:34:57 +0100
Received: from omta07.westchester.pa.mail.comcast.net ([76.96.62.59])
	by qmta02.westchester.pa.mail.comcast.net with comcast
	id eCcj1d0051GhbT852DXQxg; Fri, 05 Feb 2010 13:31:24 +0000
Received: from sz0154.wc.mail.comcast.net ([76.96.58.220])
	by omta07.westchester.pa.mail.comcast.net with comcast
	id eDXQ1d0034l5d103TDXQf6; Fri, 05 Feb 2010 13:31:24 +0000
Date: Fri, 5 Feb 2010 13:31:24 +0000 (UTC)
From: pspreadborough@comcast.net
To: openembedded-devel@lists.openembedded.org
Message-ID: <766862422.46211265376684071.JavaMail.root@sz0154a.westchester.pa.mail.comcast.net>
In-Reply-To: <4B6C0F0D.8030308@vollmann.ch>
MIME-Version: 1.0
X-Originating-IP: [76.24.64.15]
X-Mailer: Zimbra 5.0.19_GA_3172.RHEL5_64 (ZimbraWebClient - FF3.0
	(Mac)/5.0.19_GA_3177.RHEL5_64)
X-SA-Exim-Connect-IP: 76.96.62.24
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
X-List-Received-Date: Fri, 05 Feb 2010 13:34:57 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit


----- "Detlef Vollmann" <dv@vollmann.ch> wrote:

> On 02/03/10 15:03, pspreadborough@comcast.net wrote:
> > My 2.6.29 kernel is built with the CodeSourcery
> arm-2009q3-67-arm-none-linux-gnueabi 
> > compiler and has the EABI and OABI_COMPAT config options enabled.
> Using this kernel 
> > I can boot my SA1110 iPaq into a OABI ramfs with no problems,
> however if I build a 
> > "HelloWorld" executable with the same compiler and try and run it I
> get an "Illegal Instruction" 
> > error. I build the test program using static linking, select the
> correct machine type and tune 
> > options but to no avail, I always get the illegal instruction. 
> Just checking: are you sure this is an EABI/OABI problem and not a
> Thumb code problem?

I don't think so as I have the no-thumb compiler option enabled.



