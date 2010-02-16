Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1NhJdD-0005tP-Rr
	for openembedded-devel@lists.openembedded.org;
	Tue, 16 Feb 2010 10:22:16 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id o1G9JXeR022783
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Feb 2010 09:19:33 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 22482-05 for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Feb 2010 09:19:29 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id o1G9JRAj022777
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Feb 2010 09:19:27 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <ac9c93b11002160039j717d1611wbdd1d2fac220dd55@mail.gmail.com>
References: <b6ebd0a51002151538o524cdf17s228535e93b28d4d4@mail.gmail.com>
	<hldk2b$5tt$2@ger.gmane.org>
	<ac9c93b11002160039j717d1611wbdd1d2fac220dd55@mail.gmail.com>
Date: Tue, 16 Feb 2010 09:19:26 +0000
Message-ID: <1266311966.6436.110.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.2 
X-Virus-Scanned: amavisd-new at rpsys.net
X-SA-Exim-Connect-IP: 93.97.173.237
X-SA-Exim-Mail-From: rpurdie@rpsys.net
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Cleanup / janitors
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
X-List-Received-Date: Tue, 16 Feb 2010 09:22:17 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2010-02-16 at 09:39 +0100, Frans Meulenbroeks wrote:
> 2010/2/16 Koen Kooi <k.kooi@student.utwente.nl>:
> > On 16-02-10 00:38, Chris Larson wrote:

> The other thing that comes to mind is better describing the job. If it
> indeed is only removing do_stage it is probably better done by someone
> with commit access, otherwise someone else has to spend the same
> amount of time to apply the patch, remove it from patchwork etc.

I'd like to see a contrib tree which anyone can be given access to.
People can queue commits in this, then someone with access to OE.dev can
just pull (or cherrypick) from it.

This already exists for Poky.

Cheers,

Richard




