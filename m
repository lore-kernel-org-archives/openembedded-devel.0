Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1OgEcc-0003zQ-HB
	for openembedded-devel@lists.openembedded.org;
	Tue, 03 Aug 2010 12:21:27 +0200
Received: by fxm12 with SMTP id 12so2016591fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 03 Aug 2010 03:21:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=eytXDn2bz0gBuy5P/XHvJsUR71rBFCKZ+RF7CulU6pA=;
	b=So9dYssDo3R73g45nZ2wtxSRjUK6Uv7iC2l9zpGtczeANNDwsWAm/eZfOuiARhY2f3
	szIXQB8nGequK09IIr5tehir7LrtJ8jkKIn/N3VEz2AFMITV40x2mnemvfAG1S4BVUQy
	tX0sAELn1bMEB3GKilXjgt9q+HgNuN0rFKnRA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=BVK5+aE5IUOwqPCrRBfPvloYyA94oh/7Jzo6HBM5HPwBVxGUWK/cD4ZisYak5M6Rlt
	Fb9XxVD04j82KWlTaSFPirpC8jAcavk584ndCwPvLD1sbTENZ1zC0ZeUWaSj9HYxKblz
	kHzILeZneUkC+JA1aHB/DF1m4B+79euDQ1Iyc=
Received: by 10.223.124.205 with SMTP id v13mr7012506far.94.1280830879127;
	Tue, 03 Aug 2010 03:21:19 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id w11sm2408436fao.13.2010.08.03.03.21.18
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 03 Aug 2010 03:21:18 -0700 (PDT)
Date: Tue, 3 Aug 2010 12:21:19 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100803102119.GB12134@jama>
References: <1280554451-27780-1-git-send-email-raj.khem@gmail.com>
	<i30rie$8aq$1@dough.gmane.org> <i318p1$ec3$1@dough.gmane.org>
	<i31rhg$4a8$1@dough.gmane.org> <i363dm$17p$1@dough.gmane.org>
	<AANLkTinE0=x74yBxHsGCpRLFoQfDF+gHeuHFMG=D+rY_@mail.gmail.com>
	<i38q56$4hq$1@dough.gmane.org>
MIME-Version: 1.0
In-Reply-To: <i38q56$4hq$1@dough.gmane.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 0/5][v4] Make multi-machine toolchains to co-exist (Alternate approach)
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
X-List-Received-Date: Tue, 03 Aug 2010 10:21:27 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Aug 03, 2010 at 12:13:58PM +0200, Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
> 
> Acked-by: Koen Kooi <k-kooi@ti.com>

> If noone objects, can we get this in ASAP?

We're using it for multimachine SHR builds too and seems to work OK.

whole serie:
Acked-by: Martin Jansa <Martin.Jansa@gmail.com>

-- 
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com


