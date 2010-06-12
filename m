Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1ONPm0-0004Mx-Mb
	for openembedded-devel@lists.openembedded.org;
	Sat, 12 Jun 2010 14:25:17 +0200
Received: by bwz14 with SMTP id 14so1054435bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 12 Jun 2010 05:20:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=gnxHhHslGEfA8eXV2sL1Nfi0mQe6rD5tRhFkKgUH8iM=;
	b=P5KhpXp7Ilp9vJyWFisEcCnsoIfef/Fea0KJkeTTXhIpun7x1+qJ3Sm8F10sfqe2rO
	gwDhtG/PdTxTXQCDN/eZ13q++uM+xW52hiAADyQ5TJpkH7rrHbPtKMC7u3LjlrJMbKxY
	TkTGx0JCxiwSYq/Gjvo6Ownz7Qniz9uR9eCqc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=FEiLLwSjEA+lKJn1zLdTYQnHYPyR2/34cNZPH0VXYFR6TIcZrqBk3NOwRM5fmWfPAB
	LPuORfvtZ2JDbdbkBlLC7xW8Hhpmmfd5wa11iE1fhDuDu4RS6w7z2gb2QTmka/of8oT4
	J6iTsOEgzPiKsxq45QIWEOrXXx8dq//UZTBBM=
MIME-Version: 1.0
Received: by 10.204.81.77 with SMTP id w13mr2322359bkk.38.1276345253776; Sat, 
	12 Jun 2010 05:20:53 -0700 (PDT)
Received: by 10.204.119.12 with HTTP; Sat, 12 Jun 2010 05:20:53 -0700 (PDT)
In-Reply-To: <20100612124748.03c3f00e@xora-desktop.xora.org.uk>
References: <4C0F9119.3000909@freyther.de>
	<AANLkTikJJyDSd62eVkxlmfpjI7MgxhElzou8Kec2zcqQ@mail.gmail.com>
	<hutv9r$ekh$1@dough.gmane.org> <1276292268.29314.2660.camel@rex>
	<AANLkTile7PE4T0U7yeW73jGm2nlpMrAg4Dn4bqmyClbF@mail.gmail.com>
	<20100612124748.03c3f00e@xora-desktop.xora.org.uk>
Date: Sat, 12 Jun 2010 14:20:53 +0200
Message-ID: <AANLkTinrBspzgOmao-pJEfFkdfzOZcd9lQdnIEhLepts@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.47
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: TSC Meetings for the meeting of June
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
X-List-Received-Date: Sat, 12 Jun 2010 12:25:17 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/6/12 Graeme Gregory <dp@xora.org.uk>:
> On Sat, 12 Jun 2010 13:12:18 +0200
> Frans Meulenbroeks <fransmeulenbroeks@gmail.com> wrote:
>> If people pick up actions (like removing old minor versions of
>> recipes, someone will complain that they are touching other peoples'
>> recipes without consent, RFC or whatever.
>> It would be nice if =A0owners/maintainers of recipes would start to
>> implement the policies as outlined =A0by the TSC, instead of bashing
>> others. But no, instead of having 8 abiword recies (when I tables this
>> issue) we now have 10.
>
> This is one of the issues we still have in our way of thinking, you see
> having 10 recipes as a huge issue that has to be fixed. Some of us
> don't see any need to delete recipes that are not broken. I would
> expect (as one of the abiword maintainers) if I went in and do some
> major change to packaging and couldnt be bothered to backport it I
> would delete some of those recipes.

Actually I just picked  abiword as an example (because it is one of
the first things that shows up, alphabetically speaking).
Actually the opie recipes that have versions 1.2.2, 1.2.3 and 1.2.4
for which the .4 fis already quite old and the others seen obsolete
bother me just as much

Rationale of getting rid of the old recipes is that it decreases parsing ti=
me.
And note that it is a git, so the old data remains available in the
git for those who want to access it. (actually that *is* one of the
purposes of a version control system)

Frans.


