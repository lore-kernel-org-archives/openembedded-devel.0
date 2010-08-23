Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OnPrP-0007hU-Ej
	for openembedded-devel@lists.openembedded.org;
	Mon, 23 Aug 2010 07:46:20 +0200
Received: by iwn2 with SMTP id 2so2717435iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 22 Aug 2010 22:45:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=BdAv3IIs2CqUYC/UrIMQkAOYw9n+DEaaekrMk8QJvUo=;
	b=wi/xn1btCPcFv9S0lPhRWMUnBEQDV12NyZVIJWhbSvntCanX2m2iAFgOj9iboCejVh
	L8DSsvwoY09tHwmGX44/iIeV3bFC2AJqsBH7GILiybrXYpqWZB4qlJPXt0Xljv7iuTWy
	JWsBQmQeP01cgJIg+PYYVagZN5DtLc3mBAC5w=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=vWSJAasguub0P8pTr/Mz2aJqO3T+PbEODE3vgY55eqRfb83OlOdJPLd/U8nUYhpaeM
	WaSD+Y7HBgNF7EezNtxVoxiyRxbSSgSNY5eWPrZq/BbcXjYoIETpTDxMOBbVdVCaVEXT
	ZCFTfOw+wtQFJrd5YERyCJ7KzND5kAD8dtCEs=
MIME-Version: 1.0
Received: by 10.231.33.73 with SMTP id g9mr5098138ibd.117.1282542356829; Sun,
	22 Aug 2010 22:45:56 -0700 (PDT)
Received: by 10.231.205.138 with HTTP; Sun, 22 Aug 2010 22:45:56 -0700 (PDT)
In-Reply-To: <AANLkTinYmjwS13hGmRf6yq1iQjq=0bAmNtAXxra3to7d@mail.gmail.com>
References: <1282198068-25415-1-git-send-email-coolaj86@gmail.com>
	<i4iqg8$g6i$2@dough.gmane.org>
	<AANLkTim2hsYd7ya-SZ6hRpjU2_MHRAQAeczkTnQVuRD3@mail.gmail.com>
	<AANLkTikoa8bZuk-xbkbtbym2ST=zsy+_Ro9qGA5S7_Xp@mail.gmail.com>
	<AANLkTinYmjwS13hGmRf6yq1iQjq=0bAmNtAXxra3to7d@mail.gmail.com>
Date: Mon, 23 Aug 2010 07:45:56 +0200
Message-ID: <AANLkTimHzXPoBOqbHN2Fq1wQc3JHiznX48BG8Tov3Coj@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] added a .bb for node.js
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
X-List-Received-Date: Mon, 23 Aug 2010 05:46:20 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/8/23 AJ ONeal <coolaj86@gmail.com>:
> I did
>
> git commit -m "[v2] blah blah blah"

Not really the desired way as now [v2] becomes part of the commit message.

Frans

> git format-patch -1
> git send-email *blah*
>
> AJ ONeal


