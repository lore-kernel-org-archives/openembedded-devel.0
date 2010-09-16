Received: from mail-ew0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <coolaj86@gmail.com>) id 1OwHLs-0008Uf-Rl
	for openembedded-devel@lists.openembedded.org;
	Thu, 16 Sep 2010 18:30:27 +0200
Received: by ewy7 with SMTP id 7so722669ewy.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Sep 2010 09:29:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type;
	bh=pD4nd9CfcIXlQTOlnfUV9Tj+5vpoTciaVT48Cngylao=;
	b=AUblTSRLCmUONbfKUuoAttnGdWseN8uWW3Ju81p2VfNJjY9BX0Fp0gR7zoEfo7fqxo
	knQYs732zoQ5vcy+qkcRlzscaox6NVALPjjo9T4wjzZPWpETjhp7qktijWf86azTik7T
	euMOINBplESi6Fez7NjROaD3sxUiHGLgvyj6I=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type;
	b=T0wOcwPTc9FDr5fbWo8mfAuvRMqCAgedaJ9PjbFjt03QgJ/hm9Gq7NVH77ZaFP4Y2t
	r0xUQqNqcBYdVBPFfHZvQep7YRJopg9mfLjl6Qm0QLg+f1KC8tcvXEoETCqnA/nQa2BA
	duUghqXwyKVgHxAlPT16nRNTFjr9KFlEFbLrg=
Received: by 10.223.116.19 with SMTP id k19mr1606087faq.48.1284654576105; Thu,
	16 Sep 2010 09:29:36 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.121.5 with HTTP; Thu, 16 Sep 2010 09:29:16 -0700 (PDT)
In-Reply-To: <i6sflf$qq$3@dough.gmane.org>
References: <1284570332-6484-1-git-send-email-coolaj86@gmail.com>
	<AANLkTimiUfDtop++PS6YhwtYh3b_e7pMpEN7GuE2LLYc@mail.gmail.com>
	<i6sflf$qq$3@dough.gmane.org>
From: AJ ONeal <coolaj86@gmail.com>
Date: Thu, 16 Sep 2010 10:29:16 -0600
Message-ID: <AANLkTikuQ0nTe5GaHGe_muyqJYUpJx0o2JJPf5SZAnvT@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.215.47
X-SA-Exim-Mail-From: coolaj86@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [PATCH] nodejs: replaced v0.2.0 with v0.2.1
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
X-List-Received-Date: Thu, 16 Sep 2010 16:30:27 -0000
Content-Type: text/plain; charset=ISO-8859-1

>
> Could please pay more attention next time? This introduces 2 big
> regressions that were previously fixed by:
>
> http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=3967caeb51d7427980e06fd8b6e23c8fdc75e791
>

I'd like to make note of a few things

   - From the feedback I got - "please correct and submit again" - I was
   unaware that my prior submission been accepted.
   (I created this patch on a different machine with a fresh copy of oe and
   I just copied my old recipe over, not noticing it was in - my mistake)

   - Who is the maintainer of this recipe? I assumed that I was since I
   submitted it.
   I thought the policy was something along the lines of letting the
   maintainer know of changes made.
   Granted, had I noticed earlier that it was in the tree I would have I
   would have modified the files in the tree rather blindly copying my stuff
   in.

   - I posted to the list about the oe_runmake install issue and didn't get
   a response, yet the correction was made and submitted.


That said, thanks for the help; I appreciate it. I'll figure out how OE
policy and such works as time goes on. Forgive me of my ignorance as I
learn.

