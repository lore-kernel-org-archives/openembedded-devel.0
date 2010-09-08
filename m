Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OtDgp-0007qZ-UJ
	for openembedded-devel@lists.openembedded.org;
	Wed, 08 Sep 2010 07:59:27 +0200
Received: by iwn2 with SMTP id 2so5954611iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 07 Sep 2010 22:58:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=kndErKG34grnp+xQ6v9LpVpEiPOvfhE46srzhdx7r4U=;
	b=GUxI467K6vPIGKqW8/2fWZHBAFYpAJmaA3hiLeHaHpJl7VUyNNTRa+X2fl1ChgMmYu
	uaH+b3FDAjjTb/9wL4wTfflodcFvhVIq/agW39tjRd5m2Iw5O6AoA5NayDvJg9cSvLY7
	g5JrNTcNVJMCbsQlFqEFqCpUQ7sIrFn+q5fao=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=UqRezuyU4TLhy5gj6XWylT56ZhQ69IlNq64Fvi6cXnbMxj+U5oXSI1uh4nM9+nj72l
	Gw5fyzFZJxwtGve7N13up/nU/8zpHxE5WufyfqvOnyBW9axn+wh/nrcSs1BXymcRjdZj
	3o9SIcXm6HUNODxgsUz329ZWii4mNSd3FBGRs=
MIME-Version: 1.0
Received: by 10.231.162.2 with SMTP id t2mr3446085ibx.57.1283925520067; Tue,
	07 Sep 2010 22:58:40 -0700 (PDT)
Received: by 10.231.208.17 with HTTP; Tue, 7 Sep 2010 22:58:39 -0700 (PDT)
In-Reply-To: <131E5DFBE7373E4C8D813795A6AA7F080310BFA4A2@dlee06.ent.ti.com>
References: <20100903111210.GA17702@game.jcrosoft.org>
	<1283570085-11968-1-git-send-email-plagnioj@jcrosoft.com>
	<AANLkTim57opnM=fn47pQ-GeNsNbSyydHd3TKSWhdD5z5@mail.gmail.com>
	<AANLkTikyFRQskds_P9AH+=_km46KEf1cPm-Vq1+MhdhC@mail.gmail.com>
	<131E5DFBE7373E4C8D813795A6AA7F080310BFA4A2@dlee06.ent.ti.com>
Date: Wed, 8 Sep 2010 07:58:39 +0200
Message-ID: <AANLkTik599XZfY1Abq+gdDqGSOOLnqHUiqL1VVK9Rh87@mail.gmail.com>
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
Subject: Re: [PATCH] rename SOC_FAMILY to TARGET_SOC_FAMILY and make it global
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
X-List-Received-Date: Wed, 08 Sep 2010 05:59:29 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/9/7 Maupin, Chase <chase.maupin@ti.com>:

>> Forgot about this, but a variable should go with documentation.
>> This already has been raised with the orginal patch, but was ignored
>> by the submitters.
>
> Frans, Are you counting me as one of the original submitters? =A0I mainly=
 use the SOC_FAMILY, I didn't create it. =A0That being said, if you have a =
recommended section of the usermanual that this should be documented in I'l=
l try to add something.
>

Hi Chase,
I see you indeed as the submitter. The commit carries your name and
there is no reference in the commit message of another author.

Wrt the manual: actually I thought we had a section for this, but as
it stands i cannot find it. Guess I saw it somewhere else.
I'm not really sure where it would fit. I guess there are others who
have a better view on the manual and its structure.

Frans


