Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 37F177F7D5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Nov 2019 16:40:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 47Bc7J0wQ9z6P;
	Mon, 11 Nov 2019 17:40:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1573490428;
	bh=aB1f2lLQj1w7zkVa5LvMiJKHrxqtjUwFOgNxusJyB8s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=q5soibX+bTDqray02U4La3kztBr6MRfSbzG1uKbbetkW0hbzkBap/ZuL/eAJWBKux
	TWE1p4Cmmt/h/2n+7JCMjXvD9dZ8ej4k1wxplLhlprOaGIUiKFP8KAv74MgUPB+zSA
	4x+RAxje0X28vUpUczkmSfEI3Trt+4SOGtsD6CrDMlu2Csp7LrMfRM0Xl4B/vWa3Z5
	Yjx/t8NOVmpdCLFgoqkZX0zkzNTyCSS3PksuK+l5lCvuucKATgsiEIlNbUFOX69C6u
	vpTCkyGGSnHvOg9MjG+lQCc5T6miAy7q/IGdfI8FW5ucY6002VpbEcnTMH1qit82Zm
	CsXjHAN1S2YdIJ9no37bArq83qcpw+HW/Us/KzBodNwSM74yb3ax8KEh0+1rxIHsN5
	xV4038wKbUhVDPhbKlii9aTtiioJRarc/5p/OGzoke8MFiKmpx0cf17FqHqI1sTWtv
	ZgSIeG7ZqbBkkAMjRGRtNC+afneBzqHSLXDnHQnYEaXzEql8ZdMpRjX7BxQXZR81q2
	DoKTTHQ7Y7hcUDourexp1KPkPwOnRcqeRShW4NB6Vj/3NauC+cFhY7IA6Zalj4D6nb
	QPQdWxgUINX98vwvJZklY6Y5Be82MDBS+RVKVGM2otHck1RSGwS0WRIaKvdX73cMDa
	r4BgQG+t63YtDz8Kt4y+cgYo=
Date: Mon, 11 Nov 2019 18:40:26 +0200
From: Adrian Bunk <bunk@stusta.de>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20191111164026.GI28797@localhost>
References: <20191111160535.547773-1-raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20191111160535.547773-1-raj.khem@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-networking][PATCH] lowpan-tools: Blacklist as its deprecated use wpan-tools instead
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 11 Nov 2019 16:40:28 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

This should also be removed from packagegroup-meta-networking.

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


