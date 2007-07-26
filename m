Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <rpurdie@rpsys.net>) id 1IE6a1-0003HY-8A
	for openembedded-devel@openembedded.org; Thu, 26 Jul 2007 18:52:49 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l6QGpSvg022635
	for <openembedded-devel@openembedded.org>;
	Thu, 26 Jul 2007 17:51:28 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 22362-07 for <openembedded-devel@openembedded.org>;
	Thu, 26 Jul 2007 17:51:17 +0100 (BST)
Received: from [192.168.1.15] (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l6QGpExk022617
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO)
	for <openembedded-devel@openembedded.org>;
	Thu, 26 Jul 2007 17:51:14 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <46A89F67.5080907@klever.net>
References: <46A88A22.5010608@dominion.kabel.utwente.nl>
	<46A89F67.5080907@klever.net>
Date: Thu, 26 Jul 2007 17:51:13 +0100
Message-Id: <1185468673.6132.43.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.10.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [RFC] make building working zaurus images easier
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
X-List-Received-Date: Thu, 26 Jul 2007 16:52:49 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, 2007-07-26 at 15:19 +0200, Michael Krelin wrote:
> I have never looked into all this machinery, but since we have, e.g.
> x11-image-spitz.tar.gz and zImage-spitz.bin symlinks, I'd guess that we 
> can do without these somewhat ugly when unnecessary `ls|sort|uniq|tail` 
> things, can't we?

Correct.

Cheers,

Richard



