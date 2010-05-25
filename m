Received: from mail-ww0-f47.google.com ([74.125.82.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OGvZ3-0002Cp-W9
	for openembedded-devel@lists.openembedded.org;
	Tue, 25 May 2010 16:57:06 +0200
Received: by wwi18 with SMTP id 18so312261wwi.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 May 2010 07:52:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:content-transfer-encoding:in-reply-to:user-agent;
	bh=LutEMTHQQ9UZuUcQ5GAERTtlqmCKmTgM/YjDUBSQBgU=;
	b=l85Z9edFgqfP27lnF1PGKP5n+N2V0z6A8OYV7jA47fGBp9r1Xvp9N5XOXVx4TcyD2o
	cLMOWKsFDqfUwPZ21QxAhwbuTqQKt2d54aL4JSB+KPE0e9RePShEbEmPuu8YvJhgPFD2
	PdmCL2y+eF7u851Fwk9R0lLLEPaQ1CX90Maac=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	b=sh8CqUb0Bv1hOVWAKUcBgHPcFXmYU9x4WBThyTTTXEcA5Tx48roN3XVvRAFTDR4kxe
	eRL889C6p9KU70nQJOu5PHupJOt16bGzbOcVx4F/jldzUXKDsWxI/o7gxR1tlPpAYMCd
	OUfvvi6QBtZ66vwnspO9gUTiDaaT3zTdsxFYQ=
Received: by 10.227.151.77 with SMTP id b13mr7119915wbw.13.1274799179024;
	Tue, 25 May 2010 07:52:59 -0700 (PDT)
Received: from gmail.com (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id f8sm39954643wbe.17.2010.05.25.07.52.56
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 25 May 2010 07:52:57 -0700 (PDT)
Date: Tue, 25 May 2010 07:52:48 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100525145248.GF26493@gmail.com>
References: <1274798249-312-1-git-send-email-eric@eukrea.com>
MIME-Version: 1.0
In-Reply-To: <1274798249-312-1-git-send-email-eric@eukrea.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 74.125.82.47
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] psplash: update OE logo
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
X-List-Received-Date: Tue, 25 May 2010 14:57:06 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On (25/05/10 16:37), Eric Bénard wrote:
> * use the shiny new logo
> 
> Signed-off-by: Eric Bénard <eric@eukrea.com>

Acked-by: Khem Raj <raj.khem@gmail.com>

> ---
>  recipes/psplash/files/psplash-poky-img.h | 2325 +++++++++++-------------------
>  recipes/psplash/psplash.inc              |    2 +-
>  2 files changed, 836 insertions(+), 1491 deletions(-)


