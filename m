Received: from [194.106.48.114] (helo=tim.rpsys.net ident=0)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1JYQHG-0003vv-2d
	for openembedded-devel@openembedded.org; Sun, 09 Mar 2008 19:29:44 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m29IRqjp008117
	for <openembedded-devel@openembedded.org>; Sun, 9 Mar 2008 18:27:52 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 08078-01 for <openembedded-devel@openembedded.org>;
	Sun,  9 Mar 2008 18:27:44 +0000 (GMT)
Received: from [192.168.1.3] (dax.rpnet.com [192.168.1.3])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m29IReem008100
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@openembedded.org>; Sun, 9 Mar 2008 18:27:40 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <c384c5ea0803090948n743bd9e0vfd3bee0eeffd80f2@mail.gmail.com>
References: <c384c5ea0803090750jba077bld01cad88f051ba45@mail.gmail.com>
	<200803091716.40438.zecke@selfish.org>
	<c384c5ea0803090942h63638a5j7dfbecaaf1b39a39@mail.gmail.com>
	<c384c5ea0803090948n743bd9e0vfd3bee0eeffd80f2@mail.gmail.com>
Date: Sun, 09 Mar 2008 18:27:42 +0000
Message-Id: <1205087262.4532.1.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.12.1 
X-Virus-Scanned: amavisd-new at rpsys.net
X-SA-Exim-Connect-IP: 194.106.48.114
X-SA-Exim-Mail-From: rpurdie@rpsys.net
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=AWL,RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [ANNOUNCE] witpa - content addressable package URL	maintenance
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
X-List-Received-Date: Sun, 09 Mar 2008 18:29:44 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Sun, 2008-03-09 at 17:48 +0100, Leon Woestenberg wrote:
> On Sun, Mar 9, 2008 at 5:42 PM, Leon Woestenberg
> <leon.woestenberg@gmail.com> wrote:
> >  >  > A package URL maintenance tool. See usage and example below. Would be
> >  >  > neat to have this as a web service.
> >  >
> It's only proof-of-concept. I would like to see OpenEmbedded move away
> from a single SRC_URI.
> 
> Is it possible to change the checksums.ini / fetcher / hash validation
> code in OpenEmbedded/Bitbake to cope with multiple URLs?

We already have the MIRRORs/PREMIRRORs code, it should just be a case of
extending the knowlege of that code to add extra sources.

Cheers,

Richard



