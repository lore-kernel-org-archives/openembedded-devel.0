Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <rpurdie@rpsys.net>) id 1GSDMh-0006Cj-2e
	for openembedded-devel@openembedded.org; Tue, 26 Sep 2006 15:52:51 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.6) with ESMTP id k8QDm0XJ003524;
	Tue, 26 Sep 2006 14:48:00 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 03467-01; Tue, 26 Sep 2006 14:47:58 +0100 (BST)
Received: from max.rpnet.com (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.6) with ESMTP id k8QDlu5K003518
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO);
	Tue, 26 Sep 2006 14:47:56 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@openembedded.org>
In-Reply-To: <1865823264.20060926150138@gmail.com>
References: <45190D58.2020807@adtelecom.es>
	<1865823264.20060926150138@gmail.com>
Date: Tue, 26 Sep 2006 14:47:56 +0100
Message-Id: <1159278477.5573.85.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.6.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: List of dependent packages
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.8
Precedence: list
Reply-To: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@lists.openembedded.org>
List-Id: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 26 Sep 2006 13:52:51 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, 2006-09-26 at 15:01 +0300, Paul Sokolovsky wrote:
> > Is there any way to know the set of packages to be included in an
> > image? Or more generally, how can I list the set of packages (with
> > recursion) that are needed for one specified package?
> 
> > This should be done once processed the config file and updated the cache
> > and before the compilation of packages.
> 
>   bitbake --help would the first place to consult. --dry-run,
> --verbose, --graphviz swicthes would be of primary interest. And yes,
> bitbake still doesn't provide enough insight into its internal
> functioning. Patches to improve that (given they cover broad usecases)
> would be welcome by Bitbake maintainers, I guess.

The bitbake maintainers would certainly welcome patches and its not the
first time I've seen a request for this feature :)

I'd also be happy to discuss a roadmap for bitbake. Your comments in #oe
have highlighted the fact that whilst I and perhaps some others know
where things are going, a lot of things are in my head which isn't
perhaps the best place for them.

See a follow up email I'll send later today...

Regards,

Richard




