Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1ObL16-0007eL-4h
	for openembedded-devel@lists.openembedded.org;
	Wed, 21 Jul 2010 00:10:25 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id o6KMAEbo001588
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Jul 2010 23:10:14 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 01070-07 for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Jul 2010 23:10:10 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id o6KMA5tA001579
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Jul 2010 23:10:08 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20100720190410.GM1512@excalibur.local>
References: <20100709204055.GA12163@excalibur.local>
	<20100720070108.GE1512@excalibur.local> <i23lkm$ftn$1@dough.gmane.org>
	<20100720084026.GI1512@excalibur.local> <i24kf7$3d3$1@dough.gmane.org>
	<20100720173425.GL1512@excalibur.local> <i24qm2$qc6$1@dough.gmane.org>
	<20100720190410.GM1512@excalibur.local>
Date: Tue, 20 Jul 2010 23:09:59 +0100
Message-ID: <1279663799.22581.1586.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
X-Virus-Scanned: amavisd-new at rpsys.net
X-SA-Exim-Connect-IP: 93.97.173.237
X-SA-Exim-Mail-From: rpurdie@rpsys.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=AWL,BAYES_00,RDNS_DYNAMIC,
	TVD_RCVD_IP autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFC] New stable branch (and maybe a new process?)
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
X-List-Received-Date: Tue, 20 Jul 2010 22:10:25 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2010-07-20 at 21:04 +0200, Stefan Schmidt wrote:
> Hello.
> 
> On Tue, 2010-07-20 at 20:42, Koen Kooi wrote:
> > 
> > On 20-07-10 19:34, Stefan Schmidt wrote:
> > > 
> > > Wasn't there a list produced with all recipes that used legacy staging? I swear
> > > I have seen something like this but I can't find it in my recent builds.
> > 
> > In your TMPDIR:
> > 
> > koen@dominion:/OE/angstrom-dev$ cat legacy-staging.log | sort | uniq | wc -l
> > 53
> 
> Ha, there it was. :)
> 
> > It includes beasts like perl and python.
> 
> Hmm, that would be tricky. But there are some more easier ones that could get
> nucked before.

Poky has removed legacy staging for perl and python so it is possible
and there is an example out there...

Cheers,

Richard



