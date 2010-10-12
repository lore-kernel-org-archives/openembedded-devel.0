Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1P5e0M-00030y-QF
	for openembedded-devel@lists.openembedded.org;
	Tue, 12 Oct 2010 14:30:58 +0200
Received: by wyb40 with SMTP id 40so159829wyb.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Oct 2010 05:30:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=hAekpKQpeMC5mvTXvUAEpYkRLLpJItD/gV1AHtsiskA=;
	b=lPzdlfoxDAtpgtCNpDaY8O1TkNopoqWiNrKnZm2rqSxk11befPqGc4PegmFQPOQkzJ
	JkoTv4IWsjCPssIdSxHZbEgEgzo6LmpjSEJLeqcGEcQ5XcRUbDXE3jDoliET5h3C2x9e
	g9UNSJEXFMnAFeCkh09BH9GRjN9AfpVn1jUxU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=ilSo3aSvWO8wz1KCtdrmG4H+MK9ZquMeWZo/nm4ZzZiZmIiDG6hm+PL4K/d9Cd+BHm
	kzkFLFL25QK3CuJ30NIzdugufWMu1QAgba2BOLv/eGoCGODd7icFXMpN6Tljzx0zcsmT
	GR1/qA91eKCrDkpyC5uAQdb7X+V9KuTRc9US8=
MIME-Version: 1.0
Received: by 10.216.231.26 with SMTP id k26mr16697weq.3.1286886626170; Tue, 12
	Oct 2010 05:30:26 -0700 (PDT)
Received: by 10.216.45.149 with HTTP; Tue, 12 Oct 2010 05:30:26 -0700 (PDT)
In-Reply-To: <1286740257.3808.127.camel@mattotaupa>
References: <AANLkTik90dJxAJ_+GLQy+3MqP3oRFV9bYO6+BjSwZNkN@mail.gmail.com>
	<AANLkTimS+bg0XpWvAav0JX4qaf0b=CydG6_HQ0XHMo-h@mail.gmail.com>
	<AANLkTinQ4uW=o43O5Bv6FijfoicU2CL5j3Zn8zWf5Snm@mail.gmail.com>
	<1286664909.15886.13.camel@saphir>
	<1286698831.3808.2.camel@mattotaupa>
	<AANLkTimXU=NzmwqCpnho5ukCVoXnF5qR_4D6XWN4RaWr@mail.gmail.com>
	<1286703485.3808.10.camel@mattotaupa>
	<AANLkTimhsRw9ooC=zQqrfSgtRhCV0C=_O_gqsd=7N2kF@mail.gmail.com>
	<1286740257.3808.127.camel@mattotaupa>
Date: Tue, 12 Oct 2010 08:30:26 -0400
Message-ID: <AANLkTimEau8aYpeyLQOR9LwG6xZA+Sji3RcD3FXpKwfj@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.175
X-SA-Exim-Mail-From: cliff.brake@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: commit messages (was: testing branch 2010-10-08)
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
X-List-Received-Date: Tue, 12 Oct 2010 12:30:59 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Sun, Oct 10, 2010 at 3:50 PM, Paul Menzel
<paulepanter@users.sourceforge.net> wrote:
> I would even require that everyone has to build test a change at least
> once in a clean environment and document what distribution and what
> machine it was built for.

Concerning the suggestion that "changes must be built once in a clean
environment," I'm hoping the testing effort will help catch things
like this.  My thought is not to put too much burden on people making
constructive changes, but yet have a way that problems get found in a
reasonable time frame.

Cliff

-- 
=================
http://bec-systems.com


