Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1POETJ-0005Ls-RQ
	for openembedded-devel@lists.openembedded.org;
	Thu, 02 Dec 2010 20:05:38 +0100
Received: by iwn8 with SMTP id 8so7476940iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 02 Dec 2010 11:04:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=xz0ui0mNpkVxJScfVoCkRKoVkFLsA5FigC2iVtI8xsg=;
	b=RuhMvGHFFXYvPabvd82oPCFCpJWmuIBQJv4T0a/4VSCIFlfwkF7uIeVnGoa895a4sK
	ALkZGT+iCz0OwIciuGpmi8k8FgL/Eq+U6NHDiuS+ZjFvSiwFmtvvSLLIPm+0xmL4HK1y
	dC6Jj2S5441CbCg0Vt4rZ9hpGU6ari35RKEsY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=PttgQtQIvf/g+2fkYm2KB9+wjNMgW5svKRkdXOpdwmK/myPeW5AG0X+R2NcsodoTmL
	o4TSZZvO84sxrUTQBEGlYWLj8quHS1Lk6boolQiopXVzbhYK4Q2nR9sTAxGUhHTs/oJ9
	Xg7gB0hxi7pUbp9mUBWdtz54H+XWBfpmJ6K0Y=
MIME-Version: 1.0
Received: by 10.231.191.4 with SMTP id dk4mr624537ibb.82.1291316655145; Thu,
	02 Dec 2010 11:04:15 -0800 (PST)
Received: by 10.231.200.140 with HTTP; Thu, 2 Dec 2010 11:04:15 -0800 (PST)
In-Reply-To: <20101202092845.GA3507@rhein.zuhause.netz>
References: <AANLkTim4pT1+eojwGWidVVoCeMKCSaDEWeXibO4t-e14@mail.gmail.com>
	<20101202092845.GA3507@rhein.zuhause.netz>
Date: Thu, 2 Dec 2010 20:04:15 +0100
Message-ID: <AANLkTi=UUtv6ZNDfiEkL8h7mQhFAsqdyiOR1RHe3uvzL@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	RCVD_IN_DNSWL_LOW,SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: Commit Access for Bernhard Reutner-Fischer (blindvt)
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
X-List-Received-Date: Thu, 02 Dec 2010 19:05:38 -0000
Content-Type: text/plain; charset=ISO-8859-1

I'd say with 5 supporters and no nay's we have enough quorum although I
frankly must say I do not know the exact requirements.

Bernhard, please send your ssh key to Cliff Brake and/or Khem Raj.
And please read http://wiki.openembedded.net/index.php/Commit_Policy if you
haven't yet.

Welcome aboard! Frans

