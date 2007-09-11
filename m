Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <rpurdie@rpsys.net>) id 1IV2gu-0007Hf-GW
	for openembedded-devel@openembedded.org; Tue, 11 Sep 2007 12:09:56 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l8BA6rgZ026462
	for <openembedded-devel@openembedded.org>;
	Tue, 11 Sep 2007 11:06:53 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 26053-09 for <openembedded-devel@openembedded.org>;
	Tue, 11 Sep 2007 11:06:49 +0100 (BST)
Received: from [192.168.1.15] (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l8BA6ioe026441
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO)
	for <openembedded-devel@openembedded.org>;
	Tue, 11 Sep 2007 11:06:44 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <1325905859.20070910230801@vanille-media.de>
References: <1325905859.20070910230801@vanille-media.de>
Date: Tue, 11 Sep 2007 11:06:43 +0100
Message-Id: <1189505203.6163.13.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.10.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: yaffs2 image generation support
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
X-List-Received-Date: Tue, 11 Sep 2007 10:09:56 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, 2007-09-10 at 23:08 +0200, Dr. Michael Lauer wrote:
> Team OpenMoko needs yaffs2 image generation support in OpenEmbedded.
> Are there any patches out there, any experiences yet? If so, please
> speak up so we don't have to duplicated work :)

In case you're wondering about me, I don't have any yaffs2 patches ;-). 

I'd have thought jffs2 would be the preferred option due to the
compression support which yaffs2 lacks?

Cheers,

Richard



