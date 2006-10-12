Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <rpurdie@rpsys.net>) id 1GXxbQ-0001FB-3G
	for openembedded-devel@openembedded.org; Thu, 12 Oct 2006 12:15:48 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.6) with ESMTP id k9CA9QB4013221
	for <openembedded-devel@openembedded.org>;
	Thu, 12 Oct 2006 11:09:26 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 13111-04 for <openembedded-devel@openembedded.org>;
	Thu, 12 Oct 2006 11:09:24 +0100 (BST)
Received: from max.rpnet.com (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.6) with ESMTP id k9CA9KNE013215
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO)
	for <openembedded-devel@openembedded.org>;
	Thu, 12 Oct 2006 11:09:20 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@openembedded.org>
In-Reply-To: <427d64720610120250u7d09183au8d84abfd4ce62118@mail.gmail.com>
References: <427d64720610120250u7d09183au8d84abfd4ce62118@mail.gmail.com>
Date: Thu, 12 Oct 2006 11:09:20 +0100
Message-Id: <1160647760.5560.16.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.6.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: package hostap-modules-0.4.7-r4: task do_compile: failed
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.8
Precedence: list
Reply-To: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@lists.openembedded.org>
List-Id: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 12 Oct 2006 10:15:48 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, 2006-10-12 at 17:50 +0800, axel lin wrote:
> hi list,
> I got hostap-modules compile fail messages as below when I execute
> bitbake bootstrap-image.
> Do you have any suggestions about this error ?

For kernel 2.6.18, use the hostap driver in the kernel. See
linux-openzaurus as an example of how to handle this.

Regards,

Richard



