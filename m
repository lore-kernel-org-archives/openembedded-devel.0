Received: from mail-vx0-f175.google.com ([209.85.220.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1RUi9g-00056y-IA
	for openembedded-devel@lists.openembedded.org;
	Sun, 27 Nov 2011 18:04:40 +0100
Received: by vcbfo13 with SMTP id fo13so1289363vcb.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 27 Nov 2011 08:58:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=1V8unqDZDaL6/tJK/J/z3WxEqZs0IDd1GH3RU82+3tE=;
	b=wY1QjggVH9WHUBKWnwVpxZlLg2nPd46TKwsrjdFDMN1uzZFIEN1zJJQvHb31YCWHgM
	vG1YrF4SIppViZwrqkIQBf0ECXth4A4f7qwxkP93IHyvGIaaYH0hz+ULquRgNyTkVomc
	3n/35iUBksFiYdv6z936+/9DQ3mJuJw7CfQro=
MIME-Version: 1.0
Received: by 10.220.205.130 with SMTP id fq2mr4409429vcb.88.1322413080334;
	Sun, 27 Nov 2011 08:58:00 -0800 (PST)
Received: by 10.52.28.238 with HTTP; Sun, 27 Nov 2011 08:58:00 -0800 (PST)
In-Reply-To: <CABcZANkBYxz8f3WE4VTJoKc3aThdLVY4WWN80UHGRKHi=r0wkw@mail.gmail.com>
References: <CA+M6bX=PYZ+2vb32ZmT3SirqHdKpCtD90QqtHhQiWSp38f1kVA@mail.gmail.com>
	<1585839.h8q1bxhDN3@helios>
	<CABcZANkBYxz8f3WE4VTJoKc3aThdLVY4WWN80UHGRKHi=r0wkw@mail.gmail.com>
Date: Sun, 27 Nov 2011 17:58:00 +0100
Message-ID: <CACW_hTay+0OU8PcgSJnELiDpDWTT_CeP-ahKf6HCxwtgydG97Q@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: Documentation problems
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
X-List-Received-Date: Sun, 27 Nov 2011 17:04:40 -0000
Content-Type: text/plain; charset=ISO-8859-1

What is the problem with being it a wiki (probably with authorized users to
avoid spam).

I'd say let everyone who wants to contribute.
If someone makes a mistake it can easily be corrected and/or reverted, and
if someone messes things up on purpose and/or creates more bad than good
such a (non)contributor can be banned.

Disadvantage of a pull model is:
- more difficult to make changes (e.g. if I see a typo in a wiki and I have
write permission, I'll fix it; however if it invokes checking out a file,
make the edit, commit it, mail a pull request, most likely I'll decide it
is not worth the effort
- more administrative workload (that is probably better spent on actually
doing things).
- It sends out a message of distrust. Not really a good way to create
involvement.

One might feel that it improves quality; then again also in a wiki one can
review and improve (or revert) changes.

As far as I see it we are all adults (at least I think so) all interested
in improving OE so no unnecessary barriers should be raised.

Frans.

PS: it is quite possible to backup a wiki (and I hope this is done at
regular intervals with our wiki). Also all edits are recorded so they can
always be tracked back and (if needed) undone.

