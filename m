Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <rpurdie@rpsys.net>) id 1IzTpp-0001jh-27
	for openembedded-devel@openembedded.org; Tue, 04 Dec 2007 10:12:57 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id lB499OTv029214;
	Tue, 4 Dec 2007 09:09:24 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 28844-08; Tue,  4 Dec 2007 09:09:20 +0000 (GMT)
Received: from [192.168.1.15] (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id lB499Jcv029208
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO);
	Tue, 4 Dec 2007 09:09:19 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: "Dr. Mickey Lauer" <mickey@vanille-media.de>
In-Reply-To: <443804680.20071204021110@vanille-media.de>
References: <1196552859.6697.28.camel@localhost.localdomain>
	<443804680.20071204021110@vanille-media.de>
Date: Tue, 04 Dec 2007 09:09:19 +0000
Message-Id: <1196759359.4817.1.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.10.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-devel@openembedded.org
Subject: Re: Packaged Staging, nearly a reality!
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
X-List-Received-Date: Tue, 04 Dec 2007 09:12:57 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, 2007-12-04 at 02:11 +0100, Michael 'Mickey' Lauer wrote:
> Richard Purdie wrote:
> > As anyone watching the commits will notice, OE just gained the next
> > generation of packaged staging support!
> 
> Excellent!
> 
> > To use simply INHERIT = "packaged-staging2". Staging packages end up in
> > tmp/deploy/pstage.
> 
> Even without inherit'ing this, everything python-distutils breaks. Is
> this expected?

No, it wasn't expected or intended.

I don't think this is related to this wave of patches though, its more
likely to be from the time before.

Whats a good example of a python-distutils package thats broken?

Cheers,

Richard



