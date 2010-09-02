Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Or3Yv-0006Kg-Fa
	for openembedded-devel@lists.openembedded.org;
	Thu, 02 Sep 2010 08:46:18 +0200
Received: by iwn2 with SMTP id 2so195839iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 Sep 2010 23:45:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=I71dif1alXTqf0EcA3uK5ph1yHYkGB0xNlQPnzVxuHw=;
	b=VzkoW7+vOYcR2jgEEuR9QpKePd6FUvm7Fiaba4t6ecO6FWvfCoAuUMaZ51ExWHq4jv
	6QLX0ccUpiwou+I4ZCbPSLmIiFJs3U8zdncuRFODqedDBDq2pFPOci8LTLupAfd1pK84
	GcSIHzh8SDNt/b+gdIawRsWDIarJ9elqxVa+8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=UQ5VZ8nm3kYKOA2Kxo2UqT2DqU1+jVe3NeIagh5evlYGMEeERwVLvVl4qtEGcy/IR0
	EwLqdjPiLwCqU7QS5o+iGV4fYz2nzYxUKLb5C9HzGkgR1jHpYBNZDN6TtYbnoc0GxugA
	dfESON0WJ6TldJKnvIUXZifEJX0628K39+WFs=
MIME-Version: 1.0
Received: by 10.231.167.80 with SMTP id p16mr10027621iby.119.1283409944042;
	Wed, 01 Sep 2010 23:45:44 -0700 (PDT)
Received: by 10.231.205.138 with HTTP; Wed, 1 Sep 2010 23:45:43 -0700 (PDT)
In-Reply-To: <AANLkTi=b+gi7YZj5ZfhErXFkUfR1qrp1VUCvW2UQC3R9@mail.gmail.com>
References: <AANLkTinuQnnOAh62GF+v0TzU8mRj1F+m1YGi6DdohNmr@mail.gmail.com>
	<AANLkTim=Bb_yWWuKOd=JMQ9GGL5aoxAyaO7oJnXO+zyK@mail.gmail.com>
	<i5m4sn$l1b$3@dough.gmane.org>
	<AANLkTimttxo+X6DaN8SatwXbKYJWoTJQ27D3bhW9FEq5@mail.gmail.com>
	<AANLkTikPjmgPn3d7xSwxFt8Po2+vJ8JsnG1nQ=Zms0Sz@mail.gmail.com>
	<AANLkTi=b+gi7YZj5ZfhErXFkUfR1qrp1VUCvW2UQC3R9@mail.gmail.com>
Date: Thu, 2 Sep 2010 08:45:43 +0200
Message-ID: <AANLkTik6Rdr4wMxLJpf1ijBeOctWaO+VEFja3ytnmPAx@mail.gmail.com>
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
X-List-Received-Date: Thu, 02 Sep 2010 06:46:18 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/9/1 Khem Raj <raj.khem@gmail.com>:
> On Wed, Sep 1, 2010 at 2:23 PM, Frans Meulenbroeks
> <fransmeulenbroeks@gmail.com> wrote:
>> For what it is worth.
>> I've gotten permission from my company to put a few builds on our
>> autobuilder provided there can be a small note on the wiki page
>> acknowledging that they donated the resources for that test.
>
> You can use your company name for tester in table just an idea unless
> you are looking for flashy logos

I'm not looking for a flashy logo. Just want to give some credit.
Appending the company name in the tester table is fine with me. I do
want my name here too as the testing is something that I do as a
private initiative, so the company is not involved in or responsible
for the results. They just donate the resources.

Frans

(and to Paul: I'll try to document the steps, but the tool itself has
already been setup, so it would only be on adding a testing project in
it)


