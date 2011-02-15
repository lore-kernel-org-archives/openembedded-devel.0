Received: from mail.multimedia-labs.de ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1PpLf5-00031V-3R
	for openembedded-devel@lists.openembedded.org;
	Tue, 15 Feb 2011 15:13:51 +0100
Received: from localhost (localhost [127.0.0.1])
	by mail.multimedia-labs.de (Postfix) with ESMTP id 24456314DA7A
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Feb 2011 15:12:38 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.multimedia-labs.de
Received: from mail.multimedia-labs.de ([127.0.0.1])
	by localhost (mail.multimedia-labs.de [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id JcmQqFsfDVeb
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Feb 2011 15:12:33 +0100 (CET)
Received: from [172.22.22.61] (ip-94-79-168-47.unitymediagroup.de
	[94.79.168.47])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.multimedia-labs.de (Postfix) with ESMTPSA id 2138C314D990
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Feb 2011 15:12:32 +0100 (CET)
Message-ID: <4D5A89CD.803@opendreambox.org>
Date: Tue, 15 Feb 2011 15:12:29 +0100
From: Andreas Oberritter <obi@opendreambox.org>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.14) Gecko/20110208 Lightning/1.0b2 Thunderbird/3.1.8
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4D5A5871.7000005@dresearch.de>
In-Reply-To: <4D5A5871.7000005@dresearch.de>
Subject: Re: linux-libc-headers version (reloaded)
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 15 Feb 2011 14:13:51 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02/15/2011 11:41 AM, Steffen Sledz wrote:
> "Kernel headers are backwards compatible, but not forwards compatible.  This
> means that a program built against a C library using older kernel headers
> should run on a newer kernel (although it may not have access to new
> features), but a program built against newer kernel headers may not work on an
> older kernel."[2]

Isn't this what the variable OLDEST_KERNEL is good for, when compiling
glibc?

Regards,
Andreas


