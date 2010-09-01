Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Oqumr-0002nP-61
	for openembedded-devel@lists.openembedded.org;
	Wed, 01 Sep 2010 23:24:05 +0200
Received: by ywa8 with SMTP id 8so3432667ywa.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 Sep 2010 14:23:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=aArsKRVbAaFEWh2xjlHX2hSpEXPgyvic2UwavYwWs44=;
	b=Ey8XavTHrxjK02GbPDHistxtWb5KNp2JKrz9CRGUng5joZm8iieX9tiW9RaYEDUBfo
	spVB22E8fEALsF5iFYWtJOQ7y5iAgGRICOky+jRHdhy/Wo//M/bZ+y/WvIPNrN0W8KH6
	b18Sa64FrkyK8YRsGBVRJI74y+xPlDBRBWY3w=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=xd/cQenVakUXtOGhFpHL7fCSjM+L+8JNUuHUe7zoXpnjzPwBmQhPTfW2GLV7PbTV9E
	F5QFu2K6oY3ua3vcvICyyr/jXXvM+d+rY4kaoONbpCq61C+2YhyGUY9sYeyZoSjU1VGO
	h0blkLS177BtXgwBOcMjrXDIks22FhKmuqN5g=
MIME-Version: 1.0
Received: by 10.150.52.12 with SMTP id z12mr6435335ybz.112.1283376209949; Wed,
	01 Sep 2010 14:23:29 -0700 (PDT)
Received: by 10.231.205.138 with HTTP; Wed, 1 Sep 2010 14:23:29 -0700 (PDT)
In-Reply-To: <AANLkTimttxo+X6DaN8SatwXbKYJWoTJQ27D3bhW9FEq5@mail.gmail.com>
References: <AANLkTinuQnnOAh62GF+v0TzU8mRj1F+m1YGi6DdohNmr@mail.gmail.com>
	<AANLkTim=Bb_yWWuKOd=JMQ9GGL5aoxAyaO7oJnXO+zyK@mail.gmail.com>
	<i5m4sn$l1b$3@dough.gmane.org>
	<AANLkTimttxo+X6DaN8SatwXbKYJWoTJQ27D3bhW9FEq5@mail.gmail.com>
Date: Wed, 1 Sep 2010 23:23:29 +0200
Message-ID: <AANLkTikPjmgPn3d7xSwxFt8Po2+vJ8JsnG1nQ=Zms0Sz@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.213.47
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: testing branch 2010-08-30
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
X-List-Received-Date: Wed, 01 Sep 2010 21:24:05 -0000
Content-Type: text/plain; charset=ISO-8859-1

For what it is worth.
I've gotten permission from my company to put a few builds on our
autobuilder provided there can be a small note on the wiki page
acknowledging that they donated the resources for that test.
Guess that is ok.

I still need to set things up, maybe tomorrow. I'll probably start
with a single machine/distro, and probably it will be combo's that the
company has interest in.

Frans.

PS: for building we use http://hudson-ci.org/
Great tool (probably could also be mentioned on the page)


