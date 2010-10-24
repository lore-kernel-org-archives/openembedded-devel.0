Received: from mail-qw0-f47.google.com ([209.85.216.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <andrea.adami@gmail.com>) id 1PA9x8-0001Pm-SR
	for openembedded-devel@lists.openembedded.org;
	Mon, 25 Oct 2010 01:26:16 +0200
Received: by mail-qw0-f47.google.com with SMTP id 6so962375qwd.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 24 Oct 2010 16:25:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=hMlhY+04HeFAaAJhN7FB3n5pnO2wGs6bwnWnDA7hvFo=;
	b=dtlRnQbY+maFNHiPjqhJXKW7RBfCkJuFVOZ9hnUgNNzOnGiF3/tFYuQjQyjthPuLV8
	Mapbdl9p71ndwQS4OEpb9HzllcrUBBnRL0rcc/YIS56wOK1hpMOuxHdG/oSmeFqk8v6Q
	xtYfZWRFnPjN/z6nDGaNGZE+oXMiiYH0wJoBM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=ctiLTQ/ouGVoUov8T3aJ1W+lx3JFJg2c9BTI0dAW96m+3vEaeLn9jnlgtYIuJhf+i1
	QY4jEJS58wWxA46rRDepb5DoS7n0o6RrEsUpKqv4eUAtYSPLwuhE3/ahiKlQig2UFEf7
	0ZLeRF7nFUwvEsz6cAE6j1WODwW0fBbu+6JBk=
MIME-Version: 1.0
Received: by 10.229.104.204 with SMTP id q12mr5739020qco.228.1287962736040;
	Sun, 24 Oct 2010 16:25:36 -0700 (PDT)
Received: by 10.229.18.197 with HTTP; Sun, 24 Oct 2010 16:25:35 -0700 (PDT)
In-Reply-To: <E1P9vMr-0005nc-48@melo.openembedded.org>
References: <E1P9vMr-0005nc-48@melo.openembedded.org>
Date: Mon, 25 Oct 2010 01:25:35 +0200
Message-ID: <AANLkTikb60YbUhzk+FNRZDJsYyg1wqappagRt0z0N3=W@mail.gmail.com>
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
Subject: Re: [oe-commits] Frans Meulenbroeks : tinylogin/tinylogin_1.4.bb: removed unneeded EXTRA_OEMAKE
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
X-List-Received-Date: Sun, 24 Oct 2010 23:26:16 -0000
Content-Type: text/plain; charset=ISO-8859-1

build breaks on do_compile after that commit

Needs investigation

Andrea


