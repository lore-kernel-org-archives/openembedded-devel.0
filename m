Received: from [194.106.48.114] (helo=tim.rpsys.net ident=0)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1KM3L3-0007HK-LM
	for openembedded-devel@openembedded.org; Thu, 24 Jul 2008 18:06:45 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m6OG5TNF007699
	for <openembedded-devel@openembedded.org>;
	Thu, 24 Jul 2008 17:05:29 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 07487-06-2 for <openembedded-devel@openembedded.org>;
	Thu, 24 Jul 2008 17:05:18 +0100 (BST)
Received: from [192.168.1.3] (dax.rpnet.com [192.168.1.3])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m6OG542V007653
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@openembedded.org>;
	Thu, 24 Jul 2008 17:05:04 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <1216890646.6103.5.camel@dax.rpnet.com>
References: <1216087105.10214.7.camel@isis> <487DACFF.5010504@gmail.com>
	<c384c5ea0807161343s2085dda5ua5f526967583e293@mail.gmail.com>
	<20080720014112.GA13759@oberlord>  <20080723090416.GB24264@gmail.com>
	<1216890646.6103.5.camel@dax.rpnet.com>
Date: Thu, 24 Jul 2008 17:05:06 +0100
Message-Id: <1216915506.6103.40.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.12.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [RFC]: Toolchain build sequence alteration.
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10
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
X-List-Received-Date: Thu, 24 Jul 2008 16:06:46 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, 2008-07-24 at 10:10 +0100, Richard Purdie wrote:
> I've patched Poky with a patch similar to yours and am in the process of
> running some tests. So far its all looking good, I expect the final
> tests to complete later today and will report back when they complete.
> If they work out, I'm happy for this to be committed.

My tests all worked out apart from some unrelated issues so I'm happy
for this to be committed.

Cheers,

Richard



