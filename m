Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OxmYr-0006mM-4F
	for openembedded-devel@lists.openembedded.org;
	Mon, 20 Sep 2010 22:02:01 +0200
Received: by yxg6 with SMTP id 6so1587129yxg.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Sep 2010 13:01:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=gPsqZdtd3HvpfJuamzDpkTcNPZ4wLShK9VYu4zXbLG4=;
	b=WWzrFUnOj9x8gHAEBlaCFe7qy6PUuUPsnHYEQE0N1OMer66jOT8r2fvj9LSFvSuZ0d
	DFiARuFcXrtiEprCeBJT96a41s4zwVapAInizH/9tccx7XORAgMyjIENQb8r4jSf9dSE
	uxg3+s1jV9JIZi+6OUkJuDkU9xiUkQG/7oLGI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=OSg2ZuMKFztRjjaN1VbnDd7TF/rMVaCKtI6QIejVFcaNp01/pdnICL2+m2MZfGOMc2
	f9Qw97G4j0zXPzr7dsj/w4nA14X8i51JaIbs/l4XBiOK3VkIFcgOo/bZcHcMZHNtPb4h
	pDqhQQEmO2YtP9InuK+9/fCcmFu0+pEBFUIHw=
MIME-Version: 1.0
Received: by 10.90.56.18 with SMTP id e18mr5291666aga.67.1285012917612; Mon,
	20 Sep 2010 13:01:57 -0700 (PDT)
Received: by 10.231.32.10 with HTTP; Mon, 20 Sep 2010 13:01:57 -0700 (PDT)
In-Reply-To: <1285009075-19687-2-git-send-email-khimov@altell.ru>
References: <1285009075-19687-1-git-send-email-khimov@altell.ru>
	<1285009075-19687-2-git-send-email-khimov@altell.ru>
Date: Mon, 20 Sep 2010 22:01:57 +0200
Message-ID: <AANLkTikunNJyaJAxFHuifbOFjrH9+2bmgKjf6r-BiPjS@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.213.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 2/2] bzip2: remove 1.0.2
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
X-List-Received-Date: Mon, 20 Sep 2010 20:02:01 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/9/20 Roman I Khimov <khimov@altell.ru>:
> Very old, not pinned, has known bugs and security issues.
>
> Signed-off-by: Roman I Khimov <khimov@altell.ru>
> ---

Acked-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>


