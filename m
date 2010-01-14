Received: from mxa.rambler.ru ([81.19.66.231])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <alexondi@rambler.ru>) id 1NVWuU-0002Qh-SP
	for openembedded-devel@lists.openembedded.org;
	Thu, 14 Jan 2010 22:07:22 +0100
Received: from mcgi35.rambler.ru (mcgi35.rambler.ru [81.19.67.225])
	by mxa.rambler.ru (Postfix) with ESMTP id 5FB9287864
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Jan 2010 00:05:09 +0300 (MSK)
Received: from mcgi35.rambler.ru (localhost [127.0.0.1])
	by mcgi35.rambler.ru (Postfix) with ESMTP id BFD631703D
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Jan 2010 00:05:06 +0300 (MSK)
Received: from [77.52.21.134] by mcgi35.rambler.ru with HTTP (mailimap);
	Fri, 15 Jan 2010 00:05:03 +0300
From: Perepelica Alexander <alexondi@rambler.ru>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 15 Jan 2010 00:05:03 +0300
MIME-Version: 1.0
References: <318819580.1263399029.155991028.16785@mcgi25.rambler.ru>
	<4B4EDCED.6000107@gefanuc.com> <4B4EE2DA.5080106@rambler.ru>
	<4B4EE7B5.3040206@gefanuc.com> <20100114202541.GD3529@gmail.com>
Message-Id: <359399015.1263503103.164409104.44434@mcgi35.rambler.ru>
X-Mailer: Ramail 3u, (untone), http://mail.rambler.ru
X-SA-Exim-Connect-IP: 81.19.66.231
X-SA-Exim-Mail-From: alexondi@rambler.ru
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Adding a new Machine question
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
X-List-Received-Date: Thu, 14 Jan 2010 21:07:22 -0000
Content-Disposition: inline
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; format="flowed"

After some conf changes I get unknown device sda - but I look at kernel 
config seems all is ok

* Khem Raj <raj.khem@gmail.com> [Thu, 14 Jan 2010 12:25:41 -0800]:
> On (14/01/10 09:45), Martyn Welch wrote:
> > Perepelica Alexander wrote:
> > > When I try boot image in qemu I see
> > > booting kernel ... and nothing.
> > >
>
> Did you set the console properly. i.e. -append "console=ttyS0" on qemu
> invocation ?
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel




--
Thank you.


