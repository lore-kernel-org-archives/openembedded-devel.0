Received: from mail-qw0-f47.google.com ([209.85.216.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <andrea.adami@gmail.com>) id 1PAAKF-0001xu-9S
	for openembedded-devel@lists.openembedded.org;
	Mon, 25 Oct 2010 01:50:08 +0200
Received: by qwd6 with SMTP id 6so969223qwd.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 24 Oct 2010 16:49:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=hMlhY+04HeFAaAJhN7FB3n5pnO2wGs6bwnWnDA7hvFo=;
	b=RxhV+giLqXJ652DUhIqwZfYou2eENX8IYWC2P6+0366nF+lFYeCKeoUl0poOH/P0vT
	inMcm4wabOnz/mWB3lChUipstlgdADk9bKR/nyqxTTxRte6wJsfYTvMipH/3YckcLClt
	V5knZTPB5r+AWJ701YfO88+HEVs7GK68PA2nY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=MvHFH5fJe0qh9ho0UknhG243uft75yzT0Z2/cn2S89b2P1IEkam/XoF0+2t+o34D/a
	yHCph6cFkdrZDrJab1bQyOBlbJ/IbTP/u6/1D1d98mhV2W00LfoTAPYRk1JvBwh/Ve2N
	1mvHCqSxnZlVpAP/w3/Xmqr+jg49lDkYag2/4=
MIME-Version: 1.0
Received: by 10.229.87.74 with SMTP id v10mr5822685qcl.38.1287964155002; Sun,
	24 Oct 2010 16:49:15 -0700 (PDT)
Received: by 10.229.18.197 with HTTP; Sun, 24 Oct 2010 16:49:14 -0700 (PDT)
In-Reply-To: <E1P9vMs-0005pp-38@melo.openembedded.org>
References: <E1P9vMs-0005pp-38@melo.openembedded.org>
Date: Mon, 25 Oct 2010 01:49:14 +0200
Message-ID: <AANLkTi=xsCN=WMH870sFxfNYtu+wJD1rFZvt5C77C0bn@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.216.47
X-SA-Exim-Mail-From: andrea.adami@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [oe-commits] Frans Meulenbroeks : fbida/fbida_2.07.bb: removed unneeded EXTRA_OEMAKE
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
X-List-Received-Date: Sun, 24 Oct 2010 23:50:08 -0000
Content-Type: text/plain; charset=ISO-8859-1

build breaks on do_compile after that commit

Needs investigation

Andrea


