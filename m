Received: from [209.85.132.247] (helo=an-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1Lxo8q-0003hG-GH
	for openembedded-devel@lists.openembedded.org;
	Sat, 25 Apr 2009 22:06:28 +0200
Received: by an-out-0708.google.com with SMTP id b6so1054448ana.42
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 25 Apr 2009 13:01:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:date:x-google-sender-auth:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=JxuIglVLmYWGQmaJeDxADCdjJB5l7g0I54BvFRU5PVo=;
	b=iHju4gLxGZjNX6Rda693QtaqBlNu1DFN+rFLrcqoayBLPs9Ymln2C54Yy360fl2OWX
	O9OTI8nFW7FV0v/o3ldNZjp36UhRI3rRg3h5ImUNOXHfXHgUM2YRzKKrYmyzx9tyIYv9
	iegCiP76Wjr7zdvqoGwaSVCgYaQZv952rbW4s=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=i08HjwvU0CT7yjfk/xFcQnlBcySqoKnVru/GwlMh8/D+87loSNEp4ytf1oLoFQqCNs
	shvHhfkFORY+2kLES+xlV2T6+8mSxR56DdBm/bXQAu6vUnN4Ddaqm1WDJZfb7qq8u0zE
	y2es2andHJd6+GGqlvPL8uxTWaKKeEmXocl2Q=
MIME-Version: 1.0
Sender: otavio.salvador@gmail.com
Received: by 10.100.213.18 with SMTP id l18mr5476967ang.59.1240689696117; Sat, 
	25 Apr 2009 13:01:36 -0700 (PDT)
In-Reply-To: <200904252144.45513.mickey@vanille-media.de>
References: <20090425075933.E6E18188456@amethyst.openembedded.net>
	<200904252034.35801.mickey@vanille-media.de>
	<49F35A2B.7070907@xora.org.uk>
	<200904252144.45513.mickey@vanille-media.de>
Date: Sat, 25 Apr 2009 17:01:36 -0300
X-Google-Sender-Auth: e32df9a42cbc8f02
Message-ID: <be7a9f3d0904251301l19094360s2d9d7df2666290da@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [oe-commits] Koen Kooi : Revert "ecore: catch up with the new SONAMEs; move to autosplitting"
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
X-List-Received-Date: Sat, 25 Apr 2009 20:06:28 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hello Mickey,

On Sat, Apr 25, 2009 at 4:44 PM, Michael 'Mickey' Lauer
<mickey@vanille-media.de> wrote:
> This solution has now been reverted for the sake of the upgrade path. And just
> for the records, the technical issue wasn't the reason for me leaving the OE
> core team and resigning from all duties -- it was the way how this situation
> was handled. Again the core team pretty much stood watching in apathy and let
> the most vocal decide on his own, letting him carry his own way again.

Are you being serious? Are you leaving OE? you must be joking.

-- 
Otavio Salvador                  O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854         http://projetos.ossystems.com.br


