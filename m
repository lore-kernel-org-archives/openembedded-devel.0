Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <rpurdie@rpsys.net>) id 1HA6b5-0004vq-5N
	for openembedded-devel@openembedded.org; Thu, 25 Jan 2007 16:33:08 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l0PFX6eP004535
	for <openembedded-devel@openembedded.org>; Thu, 25 Jan 2007 15:33:06 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 04494-01 for <openembedded-devel@openembedded.org>;
	Thu, 25 Jan 2007 15:33:03 +0000 (GMT)
Received: from max.rpnet.com (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l0PFWxIs004524
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO)
	for <openembedded-devel@openembedded.org>; Thu, 25 Jan 2007 15:32:59 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <45B8C9F4.30402@gmail.com>
References: <45B8C9F4.30402@gmail.com>
Date: Thu, 25 Jan 2007 15:32:59 +0000
Message-Id: <1169739179.6182.17.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.6.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: thumb
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
X-List-Received-Date: Thu, 25 Jan 2007 15:33:08 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hi,

On Thu, 2007-01-25 at 18:17 +0300, Sergey Lapin wrote:
> Developing for small-RAM device, how could I have
> ARM_INSTRUCTION_SET="thumb" for most packages and
> ARM_INSTRUCTION_SET="arm" for packages like zlib and jpeg.

ARM_INSTRUCTION_SET = "thumb"
ARM_INSTRUCTION_SET_pn-zlib = "arm"
ARM_INSTRUCTION_SET_pn-jpeg = "arm"

?

Cheers,

Richard



