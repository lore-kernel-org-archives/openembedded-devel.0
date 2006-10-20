Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <rpurdie@rpsys.net>) id 1Gb2UJ-0001UT-7a
	for openembedded-devel@openembedded.org; Sat, 21 Oct 2006 00:05:11 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id k9KLw0Tj021881
	for <openembedded-devel@openembedded.org>;
	Fri, 20 Oct 2006 22:58:00 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 21506-08 for <openembedded-devel@openembedded.org>;
	Fri, 20 Oct 2006 22:57:58 +0100 (BST)
Received: from max.rpnet.com (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id k9KLvsWx021872
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO)
	for <openembedded-devel@openembedded.org>;
	Fri, 20 Oct 2006 22:57:54 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <595433076.20061021003331@gmail.com>
References: <595433076.20061021003331@gmail.com>
Date: Fri, 20 Oct 2006 22:57:53 +0100
Message-Id: <1161381474.6639.75.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.6.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [RFC] Preferring tar.bz2 over tar.gz if there's a choice
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 20 Oct 2006 22:05:11 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Sat, 2006-10-21 at 00:33 +0300, Paul Sokolovsky wrote:
>   Nowadays, with multimegabyte software downloads, many projects
> provide both tar.bz2 and tar.gz archives for downloads. I'd like to
> make a proposal that we prefer tar.bz2 over .gz for obvious reason of
> saving bandwidth and disk space for lots of people using OE. In
> particular, I'd like to propose that it's ok to change .gz to .bz2 if
> such case is spotted.

FWIW, I'm perfectly ok with that preference. It was mentioned to me a
while ago regarding the Zaurus kernels and I hope I did change to prefer
bz2, I certainly intended to :).

Please go ahead and check in changes for anything you've noticed.

Regards,

Richard





