Received: from mail-pz0-f192.google.com ([209.85.222.192])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OE5yF-0006dm-34
	for openembedded-devel@lists.openembedded.org;
	Mon, 17 May 2010 21:27:29 +0200
Received: by pzk30 with SMTP id 30so2516956pzk.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 May 2010 12:23:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=s2paRejogPgw1OQ8aZS2dIZuZv0rOeOxi7yLg51PN3U=;
	b=IajomyZQg/8/E3ReJxSAHyjMgDf2QZIs7zamU1hsXdB0uCFRAQU7kjnxaI62AXCdYV
	oszMTxfa4Ek5cQezgLLj69l6CVqQRWTr4QD1UMDugAO5xLWgK/94AN+XxKzMSGwTGy0p
	nadsKWZeQvTjR29tGhRGlUQrwNUCkv+Hd7eO0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=jxEMRRqe9Me/ig8Z9eEYmTu1TmVF3NmlGd6Vq3bhnSTbN1GJ1NLwSXsajdO6kFEUTB
	Rtw1ZTvRAm6x77Ixm0B0HJwEyFGWwy/jw2qQHMNmSUt1+XzTJSZirqdiN4pGH2HmTQB3
	4mo6+LNCnR6qw4NubfntTEUUWh3+cjnJ8lzdg=
Received: by 10.142.6.37 with SMTP id 37mr3852815wff.129.1274123888280;
	Mon, 17 May 2010 12:18:08 -0700 (PDT)
Received: from gmail.com (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id 20sm4268654pzk.11.2010.05.17.12.18.06
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 17 May 2010 12:18:07 -0700 (PDT)
Date: Mon, 17 May 2010 12:18:37 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100517191837.GB7932@gmail.com>
References: <AANLkTinM-N-vAT4yP0ptz0UcMBNsLHpQZ1er2VwnsDDv@mail.gmail.com>
	<20100517190152.GB7868@gmail.com>
	<AANLkTinsmKk2J576bTB0-Wkk48G5He9koqeQiU4MHhL_@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <AANLkTinsmKk2J576bTB0-Wkk48G5He9koqeQiU4MHhL_@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.222.192
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Microblaze gcc 4.5.0 support
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
X-List-Received-Date: Mon, 17 May 2010 19:27:30 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (17/05/10 14:14), Adrian Alonso wrote:
> Hi Khem,
> 
> log.do_configure at http://pastebin.com/AjAtfnpu
> log.do_compile at http://pastebin.com/bqAmHvuu

post config.log from inside the gcc build tree.



