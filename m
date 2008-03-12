Received: from [212.227.126.174] (helo=moutng.kundenserver.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <robert@linuxdevelopment.de>) id 1JZXEA-0004md-SD
	for openembedded-devel@lists.openembedded.org;
	Wed, 12 Mar 2008 21:07:12 +0100
Received: from [10.0.0.200] (X135b.x.pppool.de [89.59.19.91])
	by mrelayeu.kundenserver.de (node=mrelayeu2) with ESMTP (Nemesis)
	id 0MKwtQ-1JZXC60gbJ-0003xU; Wed, 12 Mar 2008 21:04:59 +0100
Message-ID: <47D83769.5020405@linuxdevelopment.de>
Date: Wed, 12 Mar 2008 21:04:57 +0100
From: =?ISO-8859-1?Q?Robert_W=F6rle?= <robert@linuxdevelopment.de>
User-Agent: Thunderbird 2.0.0.9 (X11/20070801)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <200803121450.09688.geoffrey@pager.net>
In-Reply-To: <200803121450.09688.geoffrey@pager.net>
X-Enigmail-Version: 0.95.5
X-Provags-ID: V01U2FsdGVkX19L/azIT1FEdqlKnKOG9Rf4GghRGHEbU+NRr7a
	+XYXHjh8uaRfYDwkbDUJ1Nb5ZOjGHjpeBFjbBvgXgQzk7/OWLa
	dTI0SGs3MbRm+6xgOfS+YAs5IE4n4pwxIyUOkqCpnA=
X-SA-Exim-Connect-IP: 212.227.126.174
X-SA-Exim-Mail-From: robert@linuxdevelopment.de
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Eureka! AVR32 ld-uClibc.so segfault solved
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
X-List-Received-Date: Wed, 12 Mar 2008 20:07:12 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit




> So I now have a working OE based AVR32 build system, using binutils 
> 2.17.atmel.0.0.99 20060623, gcc 4.2.1-atmel.1.0.3, and uClibc 0.9.29-atmel.1.  
> This is essentially the same as Atmel's buildroot-avr32-v2.1.0.  As soon as I 
> clean stuff up a little, I'll submit patches for this via bugzilla.  Minus 
> this uclibc.inc diff.  I need more expert opinion on this.
> 
> Thanks to all those who helped!
> ---


excellent job, can you supply any patches you have already, i would be
more then happy to bring this up ( again !)

rob_w


