Received: from [194.106.48.114] (helo=tim.rpsys.net ident=0)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1L8yIt-00018G-Qc
	for openembedded-devel@openembedded.org; Sat, 06 Dec 2008 15:38:44 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id mB6EYwmN008795;
	Sat, 6 Dec 2008 14:34:58 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 08571-05; Sat,  6 Dec 2008 14:34:53 +0000 (GMT)
Received: from [192.168.1.3] (dax.rpnet.com [192.168.1.3])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id mB6EYrsU008789
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Sat, 6 Dec 2008 14:34:53 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: Cliff Brake <cliff.brake@gmail.com>
In-Reply-To: <f96d234e0811070902y7bc14e8bu13b87ba81f01d330@mail.gmail.com>
References: <f96d234e0811070902y7bc14e8bu13b87ba81f01d330@mail.gmail.com>
Date: Sat, 06 Dec 2008 14:34:52 +0000
Message-Id: <1228574092.5375.1.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.12.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-devel@openembedded.org, bitbake-dev@lists.berlios.de
Subject: Re: [Bitbake-dev] merging bitbake changes from poky
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
X-List-Received-Date: Sat, 06 Dec 2008 14:38:44 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hi,

On Fri, 2008-11-07 at 12:02 -0500, Cliff Brake wrote:
> I am experimenting with merging some bitbake changes from poky and
> they are available:
> 
>   URL: git://dev.bec-systems.com/bitbake.git
>   Tracked remote branches
>     bitbake-1.8 bitbake-1.8-poky-fixes master
> 
> Can we consider moving bitbake to git?  It would make activities like
> this a little easier.  It would also be easier for users to manage
> their own bitbake repositories which has been necessary for me several
> times in the past to include fixes.  Note, I am not suggested we merge
> bitbake with the OE source, but I don't see any problem with putting
> it in a separate repo on git.openembedded.net.

I'm broadly in favour of this provided we can reasonably preserve the
svn history. I think we will end up switching to git, its just a
question of when.

Cheers,

Richard





