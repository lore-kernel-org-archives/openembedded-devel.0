Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1P5ByX-0007lK-6x
	for openembedded-devel@lists.openembedded.org;
	Mon, 11 Oct 2010 08:35:09 +0200
Received: by mail-iw0-f175.google.com with SMTP id 7so2287807iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Oct 2010 23:34:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=RWVmWnsu5klfU2DspaHYlBJXLKIMSgmSJmDJXFpuOxA=;
	b=ejtPemCMLbu8XVJSY5F4BV/8AHDK890NFqFt6S1Mmdkz0bLdMrqLlhle1CQr8IBmZK
	EuVZm7jeDEaH3LnyGxDDLu7e0E7yYlwKlidb4BmRnrUS0JHSEPvWzFjnGIxvg1/AhXst
	4Juwx+Zr3vUkv470KVFXsoPAUsgIQKBJzZiaQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=GIzFCr8CxbPdbZhrW+138HHLosIhH2rdhxIl7PkxHkrnUxpMQ4lCxd3dgMNCqi+URQ
	JpAbSIBEdh3/AsrlwEe9+CsHgLsQE7NIizCfnnl760WNKM3s0bg9DPgN6418aYdxzs1v
	xtLYwU7DYizTx7c9PueCkNCnxir1g26QJTKK8=
MIME-Version: 1.0
Received: by 10.231.167.130 with SMTP id q2mr4256437iby.163.1286778886050;
	Sun, 10 Oct 2010 23:34:46 -0700 (PDT)
Received: by 10.231.32.10 with HTTP; Sun, 10 Oct 2010 23:34:46 -0700 (PDT)
In-Reply-To: <4CB2AD81.4020501@gmail.com>
References: <4CB2AD81.4020501@gmail.com>
Date: Mon, 11 Oct 2010 08:34:46 +0200
Message-ID: <AANLkTikgobwDVFWc7btD4ojvPTCkJzGT8ELS8-rc3tZr@mail.gmail.com>
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
Subject: Re: [PATCH] ion: move to obsolete.
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
X-List-Received-Date: Mon, 11 Oct 2010 06:35:09 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/10/11 Graham Gower <graham.gower@gmail.com>:
> This recipe has been marked BROKEN for 5 years or so.
>
> Signed-off-by: Graham Gower <graham.gower@gmail.com>
Acked-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>


