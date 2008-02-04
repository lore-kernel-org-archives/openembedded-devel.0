Received: from [194.106.48.114] (helo=tim.rpsys.net ident=0)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <rpurdie@rpsys.net>) id 1JMANE-0004Tb-2T
	for openembedded-devel@openembedded.org; Tue, 05 Feb 2008 00:05:12 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m14N5MYO031732
	for <openembedded-devel@openembedded.org>; Mon, 4 Feb 2008 23:05:22 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 31635-03 for <openembedded-devel@openembedded.org>;
	Mon,  4 Feb 2008 23:05:18 +0000 (GMT)
Received: from [192.168.1.15] (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m14N5GLR031723
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO)
	for <openembedded-devel@openembedded.org>; Mon, 4 Feb 2008 23:05:16 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <47A78C40.8000308@palm.com>
References: <47A78C40.8000308@palm.com>
Date: Mon, 04 Feb 2008 23:05:17 +0000
Message-Id: <1202166317.4788.105.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.10.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: getVar. setVar, "d", etc.
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
X-List-Received-Date: Mon, 04 Feb 2008 23:05:15 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, 2008-02-04 at 14:05 -0800, Rich Pixley wrote:
> I'm trying to figure out how to set bitbake variables from within python
> escapes but I'm not having much luck.
> 
> Could someone please explain the use of the "d" variable in the getVar
> and setVar calls?  Or point me towards enlightening pieces of code or
> documentation?

d is the data object you want to set the variables within or get the
variable from.

Regards,

Richard



