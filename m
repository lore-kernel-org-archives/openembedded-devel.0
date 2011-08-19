Received: from mail-iy0-f171.google.com ([209.85.210.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QuS2r-0000jb-7W
	for openembedded-devel@lists.openembedded.org;
	Fri, 19 Aug 2011 18:35:45 +0200
Received: by iyf13 with SMTP id 13so5953092iyf.16
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Aug 2011 09:31:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=pOrjDjtF9dH6pWH+HFPJpdy4xesQ1syroxIz6b1Yh7Q=;
	b=G15sflMeux5M5CGjae/fd2DyFXv7GbRHoF/JrnK7cLWdwO7dDkbmQdfji97DwIXw5n
	jIdIzX4GbzrP6tCgxNBWX+rprK7vPQ4URHeaH9iSne2IwAcSewslgjCjNCooZT8BFuyB
	ig1QOWDjlbDv/Trt9aIuniZcHYEa4qrpNZnaE=
Received: by 10.142.234.5 with SMTP id g5mr1137824wfh.347.1313771462060; Fri,
	19 Aug 2011 09:31:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.68.40.168 with HTTP; Fri, 19 Aug 2011 09:29:56 -0700 (PDT)
In-Reply-To: <CAGDS+n=Fx-YYC6TbwWsM_xZEw4u0H1n5d8a0jMFwf1q+UZj+XA@mail.gmail.com>
References: <4E3A3C4B.8040208@dresearch-fe.de>
	<4E40FCA9.7060204@dresearch-fe.de>
	<4E439289.3050005@dresearch-fe.de> <1615282.kebj4eQ1MV@perseus>
	<4E44C076.90407@dresearch-fe.de> <4E4E28AB.8010806@dresearch-fe.de>
	<4E4E717C.2040506@gmail.com>
	<CAGDS+nm0mLkVnv3EKRYYA8d-uMwoedPq+N2Q1iXP_eyf8OUOVw@mail.gmail.com>
	<4E4E8152.5030500@gmail.com>
	<CAGDS+n=Fx-YYC6TbwWsM_xZEw4u0H1n5d8a0jMFwf1q+UZj+XA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 19 Aug 2011 09:29:56 -0700
Message-ID: <CAMKF1sqqFkovwwLkjQ4pkndKgtmm-VdZupuubWSAURsmx3ArDg@mail.gmail.com>
To: Steve Sakoman <sakoman@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [2011.03-maintenance] unsatisfied dependencies to libgcc
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
X-List-Received-Date: Fri, 19 Aug 2011 16:35:45 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Aug 19, 2011 at 8:32 AM, Steve Sakoman <sakoman@gmail.com> wrote:
>
> Which do you think should be disabled?
>
>

libgcc-dev


