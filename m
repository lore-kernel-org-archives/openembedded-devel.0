Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <rpurdie@rpsys.net>) id 1IlPsT-0006lY-GM
	for openembedded-devel@openembedded.org; Fri, 26 Oct 2007 16:09:33 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l9QE25Bt018562
	for <openembedded-devel@openembedded.org>;
	Fri, 26 Oct 2007 15:02:05 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 18447-03 for <openembedded-devel@openembedded.org>;
	Fri, 26 Oct 2007 15:02:02 +0100 (BST)
Received: from [192.168.1.15] (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l9QE1vUS018554
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO)
	for <openembedded-devel@openembedded.org>;
	Fri, 26 Oct 2007 15:01:57 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <4721C41E.3070109@hni.uni-paderborn.de>
References: <4721C41E.3070109@hni.uni-paderborn.de>
Date: Fri, 26 Oct 2007 15:02:00 +0100
Message-Id: <1193407320.6177.78.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.10.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: How commit bugfix
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
X-List-Received-Date: Fri, 26 Oct 2007 14:09:33 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hi,

On Fri, 2007-10-26 at 12:40 +0200, Stefan Herbrechtsmeier wrote:
> What is the best way do commit a bugfix?
> 
> Is it ok, to open a new bug and set it to fixed with the solution of the 
> problem?

Please submit the bug with the fix attached. When its been applied to
the repository it will be marked as fixed.

Thanks,

Richard



