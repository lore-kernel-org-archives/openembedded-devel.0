Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <rpurdie@rpsys.net>) id 1HCDqI-00044X-7B
	for openembedded-devel@openembedded.org; Wed, 31 Jan 2007 12:41:36 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l0VBfY1r002814;
	Wed, 31 Jan 2007 11:41:34 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 02535-05; Wed, 31 Jan 2007 11:41:31 +0000 (GMT)
Received: from max.rpnet.com (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l0VBfQBI002803
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO);
	Wed, 31 Jan 2007 11:41:26 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org, zechao wang <wzc0066@yahoo.com.cn>
In-Reply-To: <413134.14299.qm@web15201.mail.cnb.yahoo.com>
References: <413134.14299.qm@web15201.mail.cnb.yahoo.com>
Date: Wed, 31 Jan 2007 11:41:26 +0000
Message-Id: <1170243686.5809.34.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.6.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: Not a question !
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
X-List-Received-Date: Wed, 31 Jan 2007 11:41:37 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, 2007-01-31 at 18:47 +0800, zechao wang wrote:
> I have thought the poky is very similar with the oe, so a lot of 
> questions were  posted here. But now i realized that they are 
> very different. Thanks Koen Kooi, you made me know it. 

They are very similar but there are important differences too. People
have tried to explain that you're doing something best done with OE, not
Poky.

> Don't sneer me, i think everyone of you have grown up from a newbie 
> to an old hand, right ?

Yes, but we did this by listening to other people, understanding what
they were telling us and learning from it. When people suggest things,
think about why they suggested it and perhaps try what they suggested.

> Ok, i have known that if i have trouble with poky, i would ask o-hand 
> for help, and if my trouble is caused by oe, i would come here.

As previously mentioned, you should not be using poky, you should be
using OE. What you're trying to do with Poky is not supported by o-hand
(I work for them so I can tell you for certain).

Regards,

Richard



