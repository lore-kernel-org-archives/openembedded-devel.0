Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1P5ZVg-0003IE-EI
	for openembedded-devel@lists.openembedded.org;
	Tue, 12 Oct 2010 09:43:09 +0200
Received: by iwn2 with SMTP id 2so735189iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Oct 2010 00:42:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=7bh5qBm+iagEbiWW2j8LZMqn9Fw0atGqmxx/1fiCr64=;
	b=K8xQsfDe2hLc5gv+T0Fbgc9fCAD2/c8rNceslaHpySuoLSpvlwZo3xAKzSWtMYdX6F
	BJ7a5mx9eYJzrEx7Jlz7JYUEU9NkW99sM4F91JW4peL+6yFPdCsZVppom5OosU/6hDuQ
	3Yu2/6xTUPnbbBIVBUSH6TBUW9DzRxfchbmDc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=TIHx/34OucS72UcH3NwkOsXSpRAzw3rYovmHos6riBb2PEaupIm8JLq1WsRYcHBDO4
	P7wzmsr15i82Se7HvlhpUplxDieup2SjuthTWRpVNHgcPkmuNKhz5/qehKhMcFziLGYf
	TIKe1IGb/7kblwm0KFdK0SHeecsTQVUsEHRsc=
MIME-Version: 1.0
Received: by 10.42.171.7 with SMTP id h7mr337836icz.166.1286869351557; Tue, 12
	Oct 2010 00:42:31 -0700 (PDT)
Received: by 10.231.32.10 with HTTP; Tue, 12 Oct 2010 00:42:31 -0700 (PDT)
In-Reply-To: <20101012062257.104860@gmx.net>
References: <1286838628.3900.36.camel@mattotaupa>
	<AANLkTinW_tJ+FauxzQG149tDM+vKWfxwnWVNRHe=EETQ@mail.gmail.com>
	<20101012062257.104860@gmx.net>
Date: Tue, 12 Oct 2010 09:42:31 +0200
Message-ID: <AANLkTik_ocVOq_1Wrgpt-k7k=1SEqhR2r-QexE6sAvmh@mail.gmail.com>
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
Subject: Re: [PATCH 1/4] gedit: sort `DEPENDS` alphabetically
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
X-List-Received-Date: Tue, 12 Oct 2010 07:43:12 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/10/12 "Andreas M=FCller" <Schnitzeltony@gmx.de>:
> I saw the changes: Thanks :-)
>
> Am I right: no further action on this issue required from my side?
>

Not as far as I'm concerned.
I've updated the status of the patches in patchwork.

Frans


