Received: from [209.85.218.171] (helo=mail-bw0-f171.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <andrea.adami@gmail.com>) id 1M4s1j-0003Qy-SO
	for openembedded-devel@lists.openembedded.org;
	Fri, 15 May 2009 09:40:19 +0200
Received: by bwz19 with SMTP id 19so1726837bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 May 2009 00:33:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=54kl9EZUC4WLlZCZI/eoGdM/nOwU52QkKM7RK6p5uiY=;
	b=KvNqGuK6VeiE57KMAboKOz59nSuVGeUsUaG4gKA+HfAZvENBIUqZ/gPNkIl20rkJyZ
	JmuPR/8NR8TPXrdcHeajTJxGaHIzx6FcVEbee458slxsBW0hllAVDmLBPrWNoyNvZSPD
	CQhOfJgAfviDqD7f1xm0bldo3hMqRYxGMmCdo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=dJi9aJf8KZe8vXCi+UwzOE4LFOk9M2ml/X6ajSwmR9czdxGZm6PD/AD9HD1OU5nqe9
	79Jq9lteFJRxZ3R5Y/vW4MRHe3+8hNyKFYdYH6FYLYeJleb4UlKwFQ7eO3RbXPOGtPcp
	Wf049Wzms/wLp2ZWvXmXe5PGiqpqGiWy3OAcE=
MIME-Version: 1.0
Received: by 10.223.121.6 with SMTP id f6mr2203044far.77.1242372802548; Fri, 
	15 May 2009 00:33:22 -0700 (PDT)
In-Reply-To: <4A0CE800.5040407@dls.net>
References: <1242247998-30548-1-git-send-email-clarson@mvista.com>
	<4A0CE800.5040407@dls.net>
Date: Fri, 15 May 2009 09:33:22 +0200
Message-ID: <d1b08f940905150033r570ee6d7ta83eb4948b8e2d5a@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] bitbake.conf, freeze.inc: Add version lockdown implementation and use it by default.
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
X-List-Received-Date: Fri, 15 May 2009 07:40:20 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

>How do we
>propose to roll out this change?

What about adding a -u (update) option? This would just give old behaviour.

My 2 (euro)cents

Andrea


