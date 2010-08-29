Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OpcN9-00006y-HQ
	for openembedded-devel@lists.openembedded.org;
	Sun, 29 Aug 2010 09:32:12 +0200
Received: by iwn2 with SMTP id 2so3833292iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 Aug 2010 00:31:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=lNgriueDmHOnbSyPYgpHhEkbP5icpmz+rpYIkRlMkDE=;
	b=wCGqh15LBY5744B5a1VDTRe7wKSO7z3Re8HSFQngD7PaDEw/7PZpqTDOHI9imeXXjh
	QtsBcEEkGQOnso7ACQAqkwUJ5JF+znfs+RLmvIKtssIO/iaoP+zN5lPKRCfHdT48a4Pd
	q6SJRWmANFQXVww4Nd6H/uTzs+O/8FxQwOH+U=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=b8TUxmsCG5LwiZYFODN3Mi0x+lbMguIgNhSEGniNgLOBY8zrDXVTCQgSbNAQi0IAuH
	OtPGQPgGyQM6mIe8FUpJJ0c5xDIyx+0FhexwlzbUuSJUWoex6WfeMq5uRDxx6B3vthEE
	b3vA8LtOKL4FptOu+Jk1ha11UFVMZNCIghDhU=
MIME-Version: 1.0
Received: by 10.231.13.130 with SMTP id c2mr3507672iba.24.1283067102203; Sun,
	29 Aug 2010 00:31:42 -0700 (PDT)
Received: by 10.231.205.138 with HTTP; Sun, 29 Aug 2010 00:31:42 -0700 (PDT)
In-Reply-To: <1283027073-12308-1-git-send-email-raj.khem@gmail.com>
References: <1283027073-12308-1-git-send-email-raj.khem@gmail.com>
Date: Sun, 29 Aug 2010 09:31:42 +0200
Message-ID: <AANLkTimveda0XjTz9fF-VE6Va81H1M4Rac9EAfc4gNKy@mail.gmail.com>
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
Subject: Re: [PATCH 01/23] getting to bitbake world.
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
X-List-Received-Date: Sun, 29 Aug 2010 07:32:12 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/8/28 Khem Raj <raj.khem@gmail.com>:
> Hi
>
> I have revised the giant patch and divided it into small patches ( as
> Koen's suggested)
>
> if these patches look ok please ack
>
> Thanks
>
> -Khem

Reviewed all of them. Thanks for the good work!
acks and remarks are in the indidual messages.
And apologies for top posting on those, but in gmail it is much more convenient.
(and made a mistake in a few ack messages, apparently was two lines
short in my paste buffer)

Frans.


