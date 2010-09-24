Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Oz3fY-0000le-90
	for openembedded-devel@lists.openembedded.org;
	Fri, 24 Sep 2010 10:30:13 +0200
Received: by iwn2 with SMTP id 2so418379iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Sep 2010 01:30:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=KC3kqals6a9ko/DWo7md+7pEtMIENJvW9JL1BrmJoWU=;
	b=dErdYXx9H1Rk5DISnw4WWucHOPj1RSmEl4dHXvNg3ZnKR9YdW/vzkBXne7xogRfznj
	VL9UTb1/8qAi76lXsEnUXt1G9QoF7fGoXJ6ACeA3dtTa2Vh2INsdeIRxqiyyCBiv/TIo
	Vc53h/EripIZyOnBQe+OBn/I+M/2TIvUqPhbI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=pq0/42FJlx4iJzIL4F2j+XRfBVFv4RGJOUHd3vrzrA6ViiWWKlpa8aL3Hl5CnHfAcv
	u3LE23GscKJT1Y6zKqQtIZghnunWTuXTNWdqeARbTB8yUczkeJ2vYb1a25Xcme06iivG
	MWHdKow+7kU4V0OS8Y5UtbTRYzAxB+27+oeqY=
MIME-Version: 1.0
Received: by 10.231.182.201 with SMTP id cd9mr3608956ibb.21.1285317005914;
	Fri, 24 Sep 2010 01:30:05 -0700 (PDT)
Received: by 10.231.32.10 with HTTP; Fri, 24 Sep 2010 01:30:05 -0700 (PDT)
In-Reply-To: <1285315653.3715.10.camel@mattotaupa>
References: <4C9950EA.2070306@gmail.com>
	<AANLkTim8cnSprD7+T_vZF-nrJ24V8u6PnZGjpUd0q+gd@mail.gmail.com>
	<1285315653.3715.10.camel@mattotaupa>
Date: Fri, 24 Sep 2010 10:30:05 +0200
Message-ID: <AANLkTinQPUVMAX3rmMr+ZXuZ59ZZG7DW7nL5w0zUOZ24@mail.gmail.com>
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
Subject: Re: [PATCH] mythfront-config.bb: Fix do_unpack for machines other than epia.
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
X-List-Received-Date: Fri, 24 Sep 2010 08:30:13 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/9/24 Paul Menzel <paulepanter@users.sourceforge.net>:

>
> Adhering to the mantra of small changes, I would acknowledge this patch
> and get your concerns addressed in another patch. Frans, as one of the
> MythTV maintainers, your Acked-by would be appreciated too, I guess.
>
> Acked-by: Paul Menzel <paulepanter@users.sourceforge.net>

I have no problems with the patch, but it is already pushed, writing
ack messages afterwards seem a little bit useless.

BTW: I never really bothered about mythfront; also I'm not sure if
gmyth still has any significance.

Frans


