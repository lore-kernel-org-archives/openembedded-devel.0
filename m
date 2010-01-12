Received: from mxa.rambler.ru ([81.19.66.231])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <alexondi@rambler.ru>) id 1NUjbR-0002BZ-HK
	for openembedded-devel@lists.openembedded.org;
	Tue, 12 Jan 2010 17:28:24 +0100
Received: from mcgi57.rambler.ru (mcgi57.rambler.ru [81.19.67.74])
	by mxa.rambler.ru (Postfix) with ESMTP id 2BBA1CAAB1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Jan 2010 19:26:14 +0300 (MSK)
Received: from mcgi57.rambler.ru (localhost [127.0.0.1])
	by mcgi57.rambler.ru (Postfix) with ESMTP id 824491141F
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Jan 2010 19:26:11 +0300 (MSK)
Received: from [77.52.17.176] by mcgi57.rambler.ru with HTTP (mailimap);
	Tue, 12 Jan 2010 19:26:08 +0300
From: Perepelica Alexander <alexondi@rambler.ru>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 12 Jan 2010 19:26:08 +0300
MIME-Version: 1.0
References: <1234549968.1263282575.49599928.71648@mcgi65.rambler.ru>	<1263288966.457.153.camel@lenovo.internal.reciva.com>	<728686868.1263292036.179341680.5053@mcgi53.rambler.ru>	<727203316.1263292376.164699196.97945@mcgi41.rambler.ru>
	<1263305804.3675.396.camel@mill.internal.reciva.com>
	<4B4C92E7.3090107@cbnco.com>
	<677336408.1263310008.156348904.7710@mcgi44.rambler.ru>
	<578649919.1263312754.64087816.75695@mcgi68.rambler.ru>
Message-Id: <649645510.1263313568.161559808.95427@mcgi57.rambler.ru>
X-Mailer: Ramail 3u, (untone), http://mail.rambler.ru
X-SA-Exim-Connect-IP: 81.19.66.231
X-SA-Exim-Mail-From: alexondi@rambler.ru
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Gnu/stubs-32.h not found
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
X-List-Received-Date: Tue, 12 Jan 2010 16:28:24 -0000
Content-Disposition: inline
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; format="flowed"

> > Thanks, Michael, Phil!
> > I will try but I now stuck with e2fsprogs and AM_GNU_GETTEXT.
> > After I resolve I try changes which Michael propose
 I don't why but I already two time stuck in problem when I get errors 
in
 compiling but after I comment my local.conf lines
 PARALLEL_MAKE = "-j 20"
 BB_NUMBER_THREADS = "4"
 all errors disapearing
 I think problem is in waiting of dependent task
 BUT I create hello-world for x86_64 !
 Thank you very much!!!
 Next I would try bootstrap and X11 images





--
Thank you.
Perepelica Alexander


