Received: from [93.97.173.237] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1LiAyD-0005VR-4u
	for openembedded-devel@openembedded.org; Fri, 13 Mar 2009 18:14:53 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id n2DHEWSk014209
	for <openembedded-devel@openembedded.org>; Fri, 13 Mar 2009 17:14:32 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 14111-02 for <openembedded-devel@openembedded.org>;
	Fri, 13 Mar 2009 17:14:28 +0000 (GMT)
Received: from [192.168.1.3] (dax.rpnet.com [192.168.1.3])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id n2DHENow014203
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@openembedded.org>; Fri, 13 Mar 2009 17:14:23 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <20090313145610.GA26373@denix.org>
References: <20090313060546.GF26343@smtp.west.cox.net>
	<013b01c9a3e7$1b44b3f0$5e3018ac@Glamdring>
	<20090313145610.GA26373@denix.org>
Date: Fri, 13 Mar 2009 17:14:25 +0000
Message-Id: <1236964465.8433.21.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.12.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: PARALLEL_MAKE
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
X-List-Received-Date: Fri, 13 Mar 2009 17:14:53 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Fri, 2009-03-13 at 10:56 -0400, Denys Dmytriyenko wrote:
> After you change your configuration, bitbake rebuilds the cache - that is a 
> single threaded operation, hence uses only one core.

Some brave person could make the parsing process multi-threaded. Its
certainly possible and not that hard...

Cheers,

Richard




