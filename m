Received: from [93.97.173.237] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1LpKyp-0005gQ-TE
	for openembedded-devel@openembedded.org; Thu, 02 Apr 2009 13:22:07 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id n32BIfFg028033
	for <openembedded-devel@openembedded.org>;
	Thu, 2 Apr 2009 12:18:41 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 27441-10 for <openembedded-devel@openembedded.org>;
	Thu,  2 Apr 2009 12:18:37 +0100 (BST)
Received: from [192.168.1.3] (dax.rpnet.com [192.168.1.3])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id n32BIYuD028027
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@openembedded.org>;
	Thu, 2 Apr 2009 12:18:34 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <49D42C75.9090805@dls.net>
References: <49D42C75.9090805@dls.net>
Date: Thu, 02 Apr 2009 12:19:11 +0100
Message-Id: <1238671151.5341.4.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.12.1 
X-Virus-Scanned: amavisd-new at rpsys.net
X-SA-Exim-Connect-IP: 93.97.173.237
X-SA-Exim-Mail-From: rpurdie@rpsys.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=5.0 tests=AWL,BAYES_00,RDNS_NONE
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: 2.6.29 kernel bloat
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
X-List-Received-Date: Thu, 02 Apr 2009 11:23:05 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit


On Wed, 2009-04-01 at 22:09 -0500, Mike (mwester) wrote:
> The IXP4xx kernel for 2.6.29 has jumped 85 KB in size (1105K on
> 2.6.27.8, vs 1190K for 2.6.29).  The defconfig is the same, or as nearly
> as I can make it (make ARCH=arm oldconfig, answer "N" to everything).
> 
> Anyone else observed this, or have I missed something?

It does this pretty much every kernel release :( Quite depressing.

Richard



