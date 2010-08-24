Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OnnSY-0006HH-AT
	for openembedded-devel@lists.openembedded.org;
	Tue, 24 Aug 2010 08:58:15 +0200
Received: by iwn2 with SMTP id 2so3702732iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Aug 2010 23:57:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type;
	bh=4hxnl7AwKLEdyaGdumfwnR4ATWYbyyOhtWFTfMfDbgM=;
	b=VODEP1SJyY1m3zCUMXGmeSA8MKTb0KOieXEWxXJrB4i9Q6Qc30L6tR0VxFSnwLFD5/
	McYzKauBeSDQVir7mQYL1Z58PfJFOTaBkSQSb4twWPmhfmLIP6vBjHQHjMI2aIhfjELE
	8uoCsVdYX0p2Nd/X6gno2q0rKrvtabG9Ji8/4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=kWYEcxnmiQcP/mG+FqmJzzL6j2D7KJuDfWPMmLjdDmiD7oFfCZybHvtxnfo7YX6NoJ
	r0U5lyZCUjfaJV02HWhjZXIvCMH1UrxKrjoR40nojURmQZdnl9EYU27QxnNJFA+X+TIl
	l1CXl4luFoNYGV2GcWr5dfkh0BJwGyOpLCbYE=
MIME-Version: 1.0
Received: by 10.231.167.80 with SMTP id p16mr7691439iby.119.1282633070181;
	Mon, 23 Aug 2010 23:57:50 -0700 (PDT)
Received: by 10.231.205.138 with HTTP; Mon, 23 Aug 2010 23:57:50 -0700 (PDT)
Date: Tue, 24 Aug 2010 08:57:50 +0200
Message-ID: <AANLkTi=V=icH-HF-BqgO96jo0-9-PWgoJQQXvWYyE2oZ@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Rcpt-To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: revert policy
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
X-List-Received-Date: Tue, 24 Aug 2010 06:58:15 -0000
Content-Type: text/plain; charset=ISO-8859-1

Dear all,

I saw some reverts recently that did not have ack's.
My understanding of our policy is that a revert either can be done by
the person who did the commit (e.g. to withdraw a faulty patch), or
would require (if I recall correctly) two acks.

Is my understanding right?
If not, can someone explain our revert policy
If yes, can people please adhere the policy

In any case it seems good to add the revert policy to the wiki. I
could not find it there.

Frans.


