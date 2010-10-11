Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1P5Bux-0007dz-Ps
	for openembedded-devel@lists.openembedded.org;
	Mon, 11 Oct 2010 08:31:29 +0200
Received: by iwn7 with SMTP id 7so2285412iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Oct 2010 23:30:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=/Ivmz6Aa3/RrKtW9MLlhbDwu+Ydf3mKg2CQa5b7g4Ao=;
	b=yA5ecsMuhnzDJ+pw8LsleAoYK5oZXMtJNSsrI91EgDAhL0kQFVAJHGWhxcsDtI4cDR
	ieav30OhIOFvldy/PdBAwrPdvZe7xYi2Q7G3Es6STmQusYU9+PGCZTePUDwUYQNJlsZO
	mKjgLWdmI+uX/3PBU7K2++2GseZQ9heQEt+8I=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=vhrxofI+t0QIkVu3w/N8KautW3nSzqgba9gL50q01d/ZymdwbEPYwjZow0+HRYyNib
	Ar0JgQtB3bGQrZ7S5werhd7nfWWGZ8n4z53tx74SZdCdwhf8wBttHvVjyrDDxP3LHdbu
	D0i7EHCW60KCnwb6lPXG/A7tzswCuQsFtOHE8=
MIME-Version: 1.0
Received: by 10.42.136.73 with SMTP id s9mr1633520ict.222.1286778657160; Sun,
	10 Oct 2010 23:30:57 -0700 (PDT)
Received: by 10.231.32.10 with HTTP; Sun, 10 Oct 2010 23:30:57 -0700 (PDT)
In-Reply-To: <4CB2ADA2.7080600@gmail.com>
References: <4CB2ADA2.7080600@gmail.com>
Date: Mon, 11 Oct 2010 08:30:57 +0200
Message-ID: <AANLkTinxAeh6=+Q3KF8ZvA_d3bvF4k4-8t+9Gj5FaC_n@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] lua, lua-gtk2: move to obsolete.
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
X-List-Received-Date: Mon, 11 Oct 2010 06:31:29 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/10/11 Graham Gower <graham.gower@gmail.com>:
> Lua fails to build. There are newer recipes (lua5.1) in tree, only
> lua-gtk2 uses this old recipe and nothing uses lua-gtk2.

Acked-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>


