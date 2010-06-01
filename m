Received: from 63.mail-out.ovh.net ([91.121.185.56])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <eric@eukrea.com>) id 1OJVF8-0004pE-9r
	for openembedded-devel@lists.openembedded.org;
	Tue, 01 Jun 2010 19:27:13 +0200
Received: (qmail 9179 invoked by uid 503); 1 Jun 2010 17:33:10 -0000
Received: from b7.ovh.net (HELO mail247.ha.ovh.net) (213.186.33.57)
	by 63.mail-out.ovh.net with SMTP; 1 Jun 2010 17:33:09 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 1 Jun 2010 19:22:54 +0200
Received: from pac33-2-82-240-38-71.fbx.proxad.net (HELO ?192.168.1.15?)
	(ebenard%eukrea.com@82.240.38.71)
	by ns0.ovh.net with SMTP; 1 Jun 2010 19:22:53 +0200
Message-ID: <4C0541EC.7010804@eukrea.com>
Date: Tue, 01 Jun 2010 19:22:52 +0200
From: =?ISO-8859-1?Q?Eric_B=E9nard?= <eric@eukrea.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; fr;
	rv:1.9.1.9) Gecko/20100317 Thunderbird/3.0.4
MIME-Version: 1.0
To: george.huntingtoniii@gmail.com
References: <AANLkTinRTX7FdWmz7NLEF1W6wI5DeCL30C68WgT1BiNT@mail.gmail.com>
In-Reply-To: <AANLkTinRTX7FdWmz7NLEF1W6wI5DeCL30C68WgT1BiNT@mail.gmail.com>
X-Ovh-Tracer-Id: 4750453183959117288
X-Ovh-Remote: 82.240.38.71 (pac33-2-82-240-38-71.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-SA-Exim-Connect-IP: 91.121.185.56
X-SA-Exim-Mail-From: eric@eukrea.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: what is the "right" way to add a recipe for building some out	of tree kernel modules
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
X-List-Received-Date: Tue, 01 Jun 2010 17:27:13 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit

Le 01/06/2010 19:07, George C. Huntington, III a écrit :
> I have some custom kernel modules, and i want to make a recipe for building
> them and having a package to include in my custom image.
> what is the "right" way to make my recipe and my Makefile/Kbuild file?
>
this link's instructions were working fine a few weeks ago :
http://www.kunen.org/uC/beagle/oe_kmod.html

Eric


