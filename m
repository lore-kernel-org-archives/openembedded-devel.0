Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <nazgee@gmail.com>) id 1NpTWo-0001Vy-MK
	for openembedded-devel@lists.openembedded.org;
	Wed, 10 Mar 2010 22:33:19 +0100
Received: by wyb28 with SMTP id 28so780810wyb.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Mar 2010 13:30:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=4mze92h9S8vCrjCfzQgIrBv9hc3qwiGxivzSXSnUfwY=;
	b=QwnIDJv5dtKHbaJa3duqW8p8+yXBTlEHAcxyWiZCPyZ/e+Q3aOHj87KB8yCCPfOfiG
	igh7qrqjptOvaeckaYu/RN4FNxp0qmsaDfS2KKmAaqcRpF1jpD2L3Z4ed/qxVYiAJt4g
	qTB455RAHBEeyoOixlbeyw/oMgoNPFIT4plIU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=vWBb6LrY6mkrAMYzqsAMhUU/FJoknISR4DMVMb6R+8PdJXTawnf0Oj4x92jtx5/zX/
	3c2xIk+EE2BhnArQ6mEIZ69zrDWErWGSJZEX6WcC2w1zAE1yhCYLiB3PprTZTnfRpV46
	wM/UxXnVqNx5pvYT5QOeF1sHi4vRX0sXtSjAk=
MIME-Version: 1.0
Received: by 10.216.89.200 with SMTP id c50mr1357994wef.164.1268256621013; 
	Wed, 10 Mar 2010 13:30:21 -0800 (PST)
In-Reply-To: <1268212334.3843.28.camel@mattotaupa>
References: <13c1beb11002250321g6099bc44oebd182fa8c4f8d1c@mail.gmail.com>
	<13c1beb11003100010l6d97c26bs51faaa0dfa74d118@mail.gmail.com>
	<1268212334.3843.28.camel@mattotaupa>
Date: Wed, 10 Mar 2010 22:30:20 +0100
Message-ID: <13c1beb11003101330n75cc6edbna2d8888be98427b5@mail.gmail.com>
From: Michal Stawinski <nazgee@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.175
X-SA-Exim-Mail-From: nazgee@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.7 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [PATCH][mtd-utils][how to] Numonyx chip support
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
X-List-Received-Date: Wed, 10 Mar 2010 21:33:19 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

2010/3/10 Paul Menzel <paulepanter@users.sourceforge.net>

> Dear Michal,
> please do not top post.
>

It will never happen again

>
> [...]
> So I suggest
>
1. you to create the patch for mtd-utils in its source directory (get
> the source, for example [5] in a seperate directory outside the OE tree,
> adapt it and create a patch).
> 2. Copy the patch to `recipes/mtd/mtd-utils/`.
> 3. Add a file line to SRC_URI.
> 4. If this works, add the patch to the OE Git tree (`git add =85`) and
> proceed as you did before.
> [=85]


Thank you for your comprehensive explanation. I thinked Ive grasped it all.

BR, Michal

