Received: from [209.85.218.171] (helo=mail-bw0-f171.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <andrea.adami@gmail.com>) id 1M3mQW-0004Eb-Q9
	for openembedded-devel@lists.openembedded.org;
	Tue, 12 May 2009 09:29:24 +0200
Received: by bwz19 with SMTP id 19so3070143bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 May 2009 00:22:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=Y1/EHjH05VN8Z4Z8hHBFS8qO5ECR5kcM51W4xpBCljA=;
	b=aTGl75sOK0LxzhB2S8fUcZlULlQffY9LAXqN24pMgxQThrd4B2vvNwYovGh1/3u5/j
	OLNf2z3FnRgieojU9YBgo06PLD7PSz2sYn69mZuaJdO7MokWszwPypY+tPt3ecS2teMg
	8nOhMoUUyxR1p+4oe1l23OtIIX2H+DUtojI5k=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=upTOUOVOuXNDuT7CRsDwyxxo2mBTBJjAA4AvO32Zka4cFUv58Ov4l2A8A/Dq/zaxd+
	wl13OD75aa4TxHergZY+Dg5HIBziVFcF29w05rZyXgby7wFpdtMW1W3bnLK+eelChIPy
	yftch85DGfpqTxnY+1LU2b5Oevxpl/dsI56sU=
MIME-Version: 1.0
Received: by 10.223.122.15 with SMTP id j15mr4411219far.10.1242112966449; Tue, 
	12 May 2009 00:22:46 -0700 (PDT)
In-Reply-To: <gu9f1m$d1q$1@ger.gmane.org>
References: <d1b08f940905110120t2a2162a6rbc2bd7237b2df09e@mail.gmail.com>
	<200905111620.39699.marcin@juszkiewicz.com.pl>
	<gu9f1m$d1q$1@ger.gmane.org>
Date: Tue, 12 May 2009 09:22:46 +0200
Message-ID: <d1b08f940905120022x218d7bf2k8e155ba5e34f2547@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: locale_base_ar_kw
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
X-List-Received-Date: Tue, 12 May 2009 07:29:25 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

>Isn't that a side effect of the double glibc override?

I'd say yes...locale_base_ar_kw disappeared in today's build
Seems fixed by yesterday's commit.

Thx

Andrea


