Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <coolaj86@gmail.com>) id 1On15N-0005t6-OM
	for openembedded-devel@lists.openembedded.org;
	Sun, 22 Aug 2010 05:19:06 +0200
Received: by fxm6 with SMTP id 6so2565891fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 21 Aug 2010 20:18:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:from:date
	:message-id:subject:to:content-type;
	bh=ViQtvCgEp35FQkQuiKTEm4fmN18p9OqPoy10+oJIrSA=;
	b=Mu0WfsvIUBrdU4munyCnkw/BWM+Jni3Byr9hLQmQrk7+NEXkyM9WEuG0v2cLqItvPI
	GIpjUTm6WfxR0j1eh7Sfvh2RiTEEYAQKjSPCOFt+mheQquGCY1jFjERSi+CuAmKEjmcX
	Rsbn22CI52qCOpcTFTusaDUNPCnmMYLEyO9EI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:from:date:message-id:subject:to:content-type;
	b=BNTdJ5WTg2bBhL+jCtoJz6aidjmoIR23jUjmizKdYaPS9pxonbUpUOH3K4tl31dWY1
	1s3h07J0cu1l8YdSfpl7j4uvY1OsgB/O4zvmFKj5pUNm672UtVdzw6e15DC4D5cDGk5Y
	n5Sb6hVdR+3k2xQ3AGoMjEJZO05wS5KMMpbOM=
Received: by 10.223.121.147 with SMTP id h19mr2659188far.76.1282447123075;
	Sat, 21 Aug 2010 20:18:43 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.125.209 with HTTP; Sat, 21 Aug 2010 20:18:23 -0700 (PDT)
From: AJ ONeal <coolaj86@gmail.com>
Date: Sat, 21 Aug 2010 21:18:23 -0600
Message-ID: <AANLkTinS5vKrq8vunasV2KCgoD9rgDV5hS6vt69Uu26M@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: coolaj86@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Getting Started with bitbake as a developer?
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
X-List-Received-Date: Sun, 22 Aug 2010 03:19:07 -0000
Content-Type: text/plain; charset=ISO-8859-1

http://www.google.com/search?q=openembedded+bitbake
http://www.google.com/search?q=bitbake+getting+started

Notice that the only useful information for a dev on there is the gumstix
link, which is apparently not up to par with the oe standards.
http://www.gumstix.net/Setup-and-Programming/view/Build-system-overview/Hello-world-tutorial/111.html

May I suggest that someone put up a doc on the oe wiki for this? or if there
is one, put keywords on it so it gets a ranking?

I would be happy to write one, but I don't know enough yet.

AJ ONeal

