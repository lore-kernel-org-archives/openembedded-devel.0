Received: from [209.85.219.172] (helo=mail-ew0-f172.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philipp.zabel@gmail.com>) id 1M76n9-00047b-1W
	for openembedded-devel@lists.openembedded.org;
	Thu, 21 May 2009 13:50:33 +0200
Received: by ewy20 with SMTP id 20so1193053ewy.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 May 2009 04:42:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=eiWX9DGs2rEAkhsCnbEBy9scHxwis1Xh2mHOwknnATI=;
	b=AeQ3eWmOzmdv4kU4CpCAn8F/tA5tQ6Q1tQX7rOY3u6mUaAD2sybQalYLaC7g8FP1UY
	wgFdQy45j9z/3AunrXDUVrGOcumU8QdwnO8YvHD0PmRspyUjv+wJw6H1EX6ZCYCoR+l6
	rQsbkYUp1MW34XQqCEB/zh+WvY6BCqWlUDzt0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=YTipWyBMWxUyf+h8IezZj6SbundQSYKw+wEvvlUq4puNHlTELdd9QCeFvBbGbtZUCF
	zJxDUY0TBNKczQfuLkNVoHE+BZhOQQlDYMbFTOTIEiwGpVdvYp8uEKxxSZJNXpIWy2tO
	7NTDQ4AR2C2/4IqoQKaS8jm76qLu+qZjL6qIU=
MIME-Version: 1.0
Received: by 10.210.87.11 with SMTP id k11mr3174628ebb.7.1242906173907; Thu, 
	21 May 2009 04:42:53 -0700 (PDT)
In-Reply-To: <1242810278-22217-1-git-send-email-khimov@altell.ru>
References: <1242810278-22217-1-git-send-email-khimov@altell.ru>
Date: Thu, 21 May 2009 13:42:53 +0200
Message-ID: <74d0deb30905210442h5f6deda5if6ec8c74d8712020@mail.gmail.com>
From: pHilipp Zabel <philipp.zabel@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 1/2] qemu 0.10.3: port OE patches, make preferable 	version
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
X-List-Received-Date: Thu, 21 May 2009 11:50:37 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On Wed, May 20, 2009 at 11:04 AM, Roman I Khimov <khimov@altell.ru> wrote:
> Fixes binary locale generation broken by
> 6065fa491c009118ae282ae933215649cccfcd24.

Please consider doing it the other way around next time :)

> Tested to work on ARM OABI (simpad), ARM EABI (qemuarm), PowerPC (efika)
> and i686 (x86-prescott).

Tested on ARM EABI (magician, hx4700), x68_64 host.

> Please ACK.

ACK. Please push.

cheers
Philipp


