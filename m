Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1P6r4o-000656-BP
	for openembedded-devel@lists.openembedded.org;
	Fri, 15 Oct 2010 22:40:30 +0200
Received: by wwe15 with SMTP id 15so1326729wwe.24
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Oct 2010 13:39:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:sender:received
	:in-reply-to:references:from:date:x-google-sender-auth:message-id
	:subject:to:cc:content-type;
	bh=nnLA9yHFn3AmuXfKTuA9i36SSjqjiLgEjtllbs24oqo=;
	b=cyXkjuYHlc/FTe1FDCUjJ8ubKdkRFPENcNC2mLWjxrPsz/N825c/EL4JZv7yxIzHOY
	T12it8MK6OqIXun5+z9Q9IH6JoEhsDsG6eCozSwCCZhR2yV7GlSEg+axwY5PnIbF06oT
	Jd9KE0Pgl02RmknrU2ay5K6HtDGp5pH1qQR6M=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type;
	b=mPLBQcCOh/kLEgz7k98XXa7NxzANpKrJ3cqkM/B8tqg5wNd2MqjE1G8lMJVEiQopkS
	Y0pZPnylHeh6I0W1NK8FPzQit7ujgCg0VN8wwcR1UE/6aKLcoFCC03Tz2+oy6JwOkMfi
	WNPVcgMKCeJgw627fcnoq7eQA7Az1o7c/UU9U=
Received: by 10.216.145.199 with SMTP id p49mr2122223wej.18.1287175197953;
	Fri, 15 Oct 2010 13:39:57 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.216.0.142 with HTTP; Fri, 15 Oct 2010 13:35:46 -0700 (PDT)
In-Reply-To: <1287174748-29216-2-git-send-email-Chase.Maupin@ti.com>
References: <1287174748-29216-1-git-send-email-Chase.Maupin@ti.com>
	<1287174748-29216-2-git-send-email-Chase.Maupin@ti.com>
From: Chris Larson <clarson@kergoth.com>
Date: Fri, 15 Oct 2010 13:35:46 -0700
X-Google-Sender-Auth: CnS8x5MLNwMzi1muSlOzMSnRFOU
Message-ID: <AANLkTi=x5PQ6HnGix6uOik=HG9VJEjbGCKZv-sQ_=ae9@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.43
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Cc: Chase Maupin <Chase.Maupin@ti.com>
Subject: Re: [PATCH 2/2] Fix class OVERRIDES order
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
X-List-Received-Date: Fri, 15 Oct 2010 20:40:31 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Oct 15, 2010 at 1:32 PM, Chase Maupin <chasemaupin03@gmail.com>wrote:

> * Changed the OVERRIDES settings in the classes to use the new
>  ordering.
>
> Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
>


Acked-by: Chris Larson <chris_larson@mentor.com>
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

