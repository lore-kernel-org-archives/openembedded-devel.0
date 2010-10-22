Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1P9DWv-00020u-OP
	for openembedded-devel@lists.openembedded.org;
	Fri, 22 Oct 2010 11:03:18 +0200
Received: by bwz15 with SMTP id 15so1033732bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Oct 2010 02:02:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=Jd5ExDLvNt1xClUfc4npYbiK2Il6jvkkHKQ5K7yZEn0=;
	b=MV5o/LS4l4wAcPppv395NZdeFVJT2APSo6vocax+cpWMkBfoOeEvt1VyorrqZQt3ME
	T0PMuetRxnKYNKZWR2osrJA/17Dx2iqU7gZ3Uq2L+TyUIIo3jEFm1Hg52jl2HlQCzoDb
	xVHRLa4+oNy/XpGlHQZ+bSWQerEQ1hr5umlUs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=mc0I/Qfv81Ej2E9O2+hl8hG7NtE6XXy+xeVlEi5PlKKErjRyQLCAGn76oK96/EuBdS
	VXc54s2UNwzsJkkjhD+BhghOC8T/oYrfTcYVeJqS062pZRfbNQzJedtQUIJk0X9dhjme
	rrJ0NF3Kr4dUzR33SXNb3YegkOpm95ocj1uec=
Received: by 10.204.52.208 with SMTP id j16mr1705766bkg.133.1287738158444;
	Fri, 22 Oct 2010 02:02:38 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id d27sm1955619bkw.14.2010.10.22.02.02.37
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 22 Oct 2010 02:02:37 -0700 (PDT)
Date: Fri, 22 Oct 2010 11:02:43 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20101022090243.GE3527@jama>
References: <1287074146-3705-1-git-send-email-fransmeulenbroeks@gmail.com>
	<1287074146-3705-2-git-send-email-fransmeulenbroeks@gmail.com>
	<1287074146-3705-3-git-send-email-fransmeulenbroeks@gmail.com>
	<1287074146-3705-4-git-send-email-fransmeulenbroeks@gmail.com>
	<1287074146-3705-5-git-send-email-fransmeulenbroeks@gmail.com>
	<1287074146-3705-6-git-send-email-fransmeulenbroeks@gmail.com>
	<1287074146-3705-7-git-send-email-fransmeulenbroeks@gmail.com>
	<AANLkTinWx9kdBbjfDXvFTNcWqg-dN8Rhyynttow57cTk@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <AANLkTinWx9kdBbjfDXvFTNcWqg-dN8Rhyynttow57cTk@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-SA-Exim-Connect-IP: 209.85.214.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 7/7] kaffe-gtk_cvs.bb: remove useless EXTRA_OECONF += ""
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
X-List-Received-Date: Fri, 22 Oct 2010 09:03:18 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Oct 22, 2010 at 10:56:29AM +0200, Frans Meulenbroeks wrote:
> ping; i know this is a fairly trivial patch but as it is a recipe I am
> not familiar with, I would appreciate it if e.g. the recipe maintainer
> would send an ack

I'm not recipe maintainer but fwiw

all 7 patches

Acked-by: Martin Jansa <Martin.Jansa@gmail.com>

-- 
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com


