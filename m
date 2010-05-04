Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <andrea.adami@gmail.com>) id 1O95hf-0005a6-08
	for openembedded-devel@lists.openembedded.org;
	Tue, 04 May 2010 02:09:35 +0200
Received: by fxm11 with SMTP id 11so2572517fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 03 May 2010 17:05:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=EVaPxBryxl8gfkJZVzeFS+P2Y67ufPJyayIRpDkSfpg=;
	b=Tz6UmWL8uDuVLx+bL8j2grKaXHqCs1gzNM4bAYFXAm4k8iEFVJF3HHhUUAiChVAUrE
	XB4hOjZ9N1a59nA22jVluokjb3vQoFQGZopyAc7I3q5HjebD3NwUXIe6FWngyf/3k0If
	sOKQ5cdmHaqLDhXTWzj7+hUt9ABJQtG8QROvU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=U/4sFR1tUpOK+3Z74I50nV+FsHejJKzeOrC1xwM3NWpooXPArYReyqgQWdf8G9rfyV
	HPrV1pcdBZKvFROx3mjW4a0+J6FYt/pBrHUjP8eSRybZKgCwuzdZcXJ7o00dx1/lCIoZ
	KiRuh0+vU0cYna3q/YoA8PTuOIu4WkwXtHA64=
MIME-Version: 1.0
Received: by 10.239.167.145 with SMTP id g17mr1501009hbe.123.1272931548794; 
	Mon, 03 May 2010 17:05:48 -0700 (PDT)
Received: by 10.239.192.77 with HTTP; Mon, 3 May 2010 17:05:48 -0700 (PDT)
In-Reply-To: <1272911713-981-1-git-send-email-Martin.Jansa@gmail.com>
References: <1272911713-981-1-git-send-email-Martin.Jansa@gmail.com>
Date: Tue, 4 May 2010 02:05:48 +0200
Message-ID: <w2yd1b08f941005031705v52bdf480yb321595b89c33736@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: andrea.adami@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] kexec-tools: update kexec-tools-2-klibc.patch for latest klibc/kernel
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
X-List-Received-Date: Tue, 04 May 2010 00:09:35 -0000
Content-Type: text/plain; charset=ISO-8859-1

built just fine with linux_2.6.26

thx

Andrea


