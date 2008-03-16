Received: from [194.106.48.114] (helo=tim.rpsys.net ident=0)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1JapeW-0000qx-DL
	for openembedded-devel@openembedded.org; Sun, 16 Mar 2008 10:59:42 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m2G9vE1r015456
	for <openembedded-devel@openembedded.org>; Sun, 16 Mar 2008 09:57:14 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 15296-06 for <openembedded-devel@openembedded.org>;
	Sun, 16 Mar 2008 09:57:09 +0000 (GMT)
Received: from [192.168.1.3] (dax.rpnet.com [192.168.1.3])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m2G9v6Wd015444
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@openembedded.org>; Sun, 16 Mar 2008 09:57:06 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <19c1b8a90803151937i6a7113abxdd4452db2d2eaa4a@mail.gmail.com>
References: <1205629164.4551.20.camel@dax.rpnet.com>
	<19c1b8a90803151937i6a7113abxdd4452db2d2eaa4a@mail.gmail.com>
Date: Sun, 16 Mar 2008 09:57:05 +0000
Message-Id: <1205661425.4524.3.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.12.1 
X-Virus-Scanned: amavisd-new at rpsys.net
X-SA-Exim-Connect-IP: 194.106.48.114
X-SA-Exim-Mail-From: rpurdie@rpsys.net
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=AWL,RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: gcc recipes cleanup
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
X-List-Received-Date: Sun, 16 Mar 2008 09:59:43 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hi,

On Sat, 2008-03-15 at 19:37 -0700, Khem Raj wrote:
> Here is what I am getting
> 
> ERROR: Could not include required file gcc-cross-kernel.inc while
> parsing /local/sandbox/openembedded/org.openembedded.dev/packages/gcc/gcc-cross-kernel-3.3.4_3.3.4.bb

Sorry, I'd missed out and mtn add. The missing file has now made it into
the repository.

Cheers,

Richard



