Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RAo2l-0007nP-GW
	for openembedded-devel@lists.openembedded.org;
	Mon, 03 Oct 2011 21:19:16 +0200
Received: by ggnq1 with SMTP id q1so437113ggn.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 03 Oct 2011 12:13:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=qEalsmdPmzeYn/m6f51xWG4ohCccT5Y2joci2D9xpp0=;
	b=nRuKaohB4OQ0Ou1lh1rfFQOc6+XpfswxYHaQ0VPAAasvKaWaVggdoR0t5Vakhsi8bS
	01jJBPrM6+uCtT7Hw/KE0lTb0kHgM7lyLrJmJSHHnJBQrsyWXn04d/L1SchyE1wDXIUx
	ZOyJghiAWmmeGRfqrvFPXoTP7J31X3aTjebL0=
Received: by 10.100.53.11 with SMTP id b11mr147023ana.34.1317669222140;
	Mon, 03 Oct 2011 12:13:42 -0700 (PDT)
Received: from [172.23.2.133] (natint3.juniper.net. [66.129.224.36])
	by mx.google.com with ESMTPS id o17sm13960833anj.3.2011.10.03.12.13.40
	(version=SSLv3 cipher=OTHER); Mon, 03 Oct 2011 12:13:41 -0700 (PDT)
Message-ID: <4E8A0963.9020209@gmail.com>
Date: Mon, 03 Oct 2011 12:13:39 -0700
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:7.0.1) Gecko/20110929 Thunderbird/7.0.1
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <20110929092859.GB5030@jama.jama.net>
	<1317304678-27094-1-git-send-email-Martin.Jansa@gmail.com>
	<CAMKF1spa2wDNGzmOxPPhxEKKyHGo1RxjLEkNasfk8vP+65PFFg@mail.gmail.com>
	<20110929142643.GD5030@jama.jama.net>
In-Reply-To: <20110929142643.GD5030@jama.jama.net>
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: Re: [PATCH] gcc-4.6: drop/update few patches from gcc-4_6-branch-linaro-backports.inc
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
X-List-Received-Date: Mon, 03 Oct 2011 19:19:16 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 9/29/2011 7:26 AM, Martin Jansa wrote:
> Thanks, I'll try your patch.. not sure why I haven't seen it on ML (or
> was it sent just now? - if yes, can you please send such patch at the
> same time as patch for oe-core? so people willing to test it can do it
> before applying oe-core patch?).

I serialised it. Since it could have confused more.


