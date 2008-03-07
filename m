Received: from [194.106.48.114] (helo=tim.rpsys.net ident=0)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1JXZaQ-0000vG-46
	for openembedded-devel@openembedded.org; Fri, 07 Mar 2008 11:14:00 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m27ACHNK009663
	for <openembedded-devel@openembedded.org>; Fri, 7 Mar 2008 10:12:17 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 09620-01 for <openembedded-devel@openembedded.org>;
	Fri,  7 Mar 2008 10:12:13 +0000 (GMT)
Received: from [192.168.1.3] (dax.rpnet.com [192.168.1.3])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m27AC9gP009651
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@openembedded.org>; Fri, 7 Mar 2008 10:12:09 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <c384c5ea0803061458x79980e7cvf369d3baf5960adb@mail.gmail.com>
References: <1204740661.8110.135.camel@dax.rpnet.com>
	<c384c5ea0803051106he199460k7c9eaf232977e564@mail.gmail.com>
	<1204748655.8110.174.camel@dax.rpnet.com>
	<c384c5ea0803061458x79980e7cvf369d3baf5960adb@mail.gmail.com>
Date: Fri, 07 Mar 2008 10:12:07 +0000
Message-Id: <1204884727.8161.9.camel@dax.rpnet.com>
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
Subject: Re: sdk.bbclass and gcc-cross-sdk
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
X-List-Received-Date: Fri, 07 Mar 2008 10:14:01 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, 2008-03-06 at 23:58 +0100, Leon Woestenberg wrote:
> On Wed, Mar 5, 2008 at 9:24 PM, Richard Purdie <rpurdie@rpsys.net> wrote:
> >  sdk.bbclass (previously)
> >
> >   build = "build system"
> >   host = "build system with modified vendor"
> >   target = "set by machine config"
> >
> OK, so you meant that this last instance in fact was a Canadian cross
> toolchain?

Yes, it had turned into one but that wasn't the intent.

Cheers,

Richard



