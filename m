Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <rpurdie@rpsys.net>) id 1IT2qH-0008Vr-KL
	for openembedded-devel@openembedded.org; Wed, 05 Sep 2007 23:55:23 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l85Lqq7Y001283
	for <openembedded-devel@openembedded.org>;
	Wed, 5 Sep 2007 22:52:52 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 01179-02 for <openembedded-devel@openembedded.org>;
	Wed,  5 Sep 2007 22:52:44 +0100 (BST)
Received: from [192.168.1.15] (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l85LqfGw001269
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO)
	for <openembedded-devel@openembedded.org>;
	Wed, 5 Sep 2007 22:52:41 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <E1ISyj9-00053v-G5@linuxtogo.org>
References: <E1ISyj9-00053v-G5@linuxtogo.org>
Date: Wed, 05 Sep 2007 22:52:40 +0100
Message-Id: <1189029160.7849.61.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.10.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [oe-commits] org.oe.dev conf/machine/i586-generic.conf: Add	pentium optimization for i586-generic machine
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
X-List-Received-Date: Wed, 05 Sep 2007 21:55:23 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, 2007-09-05 at 19:31 +0200, ifaistos commit wrote:
> conf/machine/i586-generic.conf: Add pentium optimization for i586-generic machine
> 
> Author: ifaistos@openembedded.org
> Branch: org.openembedded.dev
> Revision: 75a1835734e4451c1fbfe778538e2af0ae991114
> ViewMTN: http://monotone.openembedded.org/revision.psp?id=75a1835734e4451c1fbfe778538e2af0ae991114
> Files:
> 1
> conf/machine/include/tune-pentium.conf
> conf/machine/i586-generic.conf

I just renamed all of conf/machine/include to .inc :-(

Richard



