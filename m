Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1NkkB9-000091-3c
	for openembedded-devel@lists.openembedded.org;
	Thu, 25 Feb 2010 21:19:23 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id o1PKGaGp012945
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Feb 2010 20:16:36 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 12914-01 for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Feb 2010 20:16:31 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id o1PKGR3h012939
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Feb 2010 20:16:28 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1267118467.18176.533.camel@trini-m4400>
References: <1265832780-19939-2-git-send-email-rep.dot.nop@gmail.com>
	<1265832780-19939-3-git-send-email-rep.dot.nop@gmail.com>
	<1265832780-19939-4-git-send-email-rep.dot.nop@gmail.com>
	<1265832780-19939-5-git-send-email-rep.dot.nop@gmail.com>
	<1265832780-19939-6-git-send-email-rep.dot.nop@gmail.com>
	<1265832780-19939-7-git-send-email-rep.dot.nop@gmail.com>
	<1265832780-19939-8-git-send-email-rep.dot.nop@gmail.com>
	<1265832780-19939-9-git-send-email-rep.dot.nop@gmail.com>
	<1265892781.3777.1050.camel@mill.internal.reciva.com>
	<20100213125146.GJ10632@mx.loc>  <20100213161449.GD30265@mx.loc>
	<1267058975.18176.527.camel@trini-m4400> <1267094388.4243.1.camel@rex>
	<1267118467.18176.533.camel@trini-m4400>
Date: Thu, 25 Feb 2010 20:16:21 +0000
Message-ID: <1267128981.4243.88.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.2 
X-Virus-Scanned: amavisd-new at rpsys.net
X-SA-Exim-Connect-IP: 93.97.173.237
X-SA-Exim-Mail-From: rpurdie@rpsys.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: *
X-Spam-Status: No, score=1.7 required=5.0 tests=AWL,RDNS_DYNAMIC,TVD_RCVD_IP
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: BBCLASSEXTEND canadian?
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
X-List-Received-Date: Thu, 25 Feb 2010 20:19:23 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2010-02-25 at 10:21 -0700, Tom Rini wrote:
> > BBCLASSEXTEND covers -native and -nativesdk
> 
> Is the -nativesdk part implicit in the anonfuncs in nativesdk.bbclass or
> just not merged yet?

It should be implicit in the anonfuncs. If that class differs to Poky,
the Poky changes should be merged though.

> > The -cross, -crosssdk, -canadian-cross and other combinations usually
> > have too many differences to be worth the effort although it would be
> > possible to make them work.
> 
> I'm not so sure about that, but we'll see.  I should have some form of
> canadian stuff working again shortly.

You're unsure it would be possible to make them work of that its not
worth the effort?

Cheers,

Richard





