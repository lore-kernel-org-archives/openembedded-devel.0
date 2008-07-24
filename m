Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1KLwtA-0005ze-JB
	for openembedded-devel@openembedded.org; Thu, 24 Jul 2008 11:13:45 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m6O9B2oU011843;
	Thu, 24 Jul 2008 10:11:02 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 11609-07; Thu, 24 Jul 2008 10:10:52 +0100 (BST)
Received: from [192.168.1.3] (dax.rpnet.com [192.168.1.3])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m6O9AkWK011836
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Thu, 24 Jul 2008 10:10:46 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <20080723090416.GB24264@gmail.com>
References: <1216087105.10214.7.camel@isis> <487DACFF.5010504@gmail.com>
	<c384c5ea0807161343s2085dda5ua5f526967583e293@mail.gmail.com>
	<20080720014112.GA13759@oberlord>  <20080723090416.GB24264@gmail.com>
Date: Thu, 24 Jul 2008 10:10:46 +0100
Message-Id: <1216890646.6103.5.camel@dax.rpnet.com>
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
X-List-Received-Date: Thu, 24 Jul 2008 09:13:45 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hi,

On Wed, 2008-07-23 at 02:04 -0700, Khem Raj wrote:
> I have done some more builds particularly uclibc 0.9.27+ and had to fix
> uclibc recipes. 
> 
> Here is next updated patch.

Firstly, thanks for your work on this. It is is useful and appreciated,
sorry I've not got to testing this sooner!

I've patched Poky with a patch similar to yours and am in the process of
running some tests. So far its all looking good, I expect the final
tests to complete later today and will report back when they complete.
If they work out, I'm happy for this to be committed.

Cheers,

Richard



