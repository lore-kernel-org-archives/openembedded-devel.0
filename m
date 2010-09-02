Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <coolaj86@gmail.com>) id 1OrC0H-0005Iv-Bk
	for openembedded-devel@lists.openembedded.org;
	Thu, 02 Sep 2010 17:47:08 +0200
Received: by fxm6 with SMTP id 6so382139fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 02 Sep 2010 08:46:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:from:date
	:message-id:subject:to:content-type;
	bh=0v4qCdJ/4pnB+sAmw0eULziFG5rsxa4K2wIAJLZBeSo=;
	b=VX4ZTYv+J02WZLlUaIW/9EMXKlMV/BTzzmLAn0zdzQgbk150Pf/YxOvAg/yTy36q18
	6tPkpY+Kc5xRbDnpcT6iK1W5R1dWvay2VSOaSlYKd9C8NniHbwHV9odwPCpqtyp6Mgo6
	o8l8nOHbzbNky6LvVE2S1V12JW9WAtB+xjWfg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:from:date:message-id:subject:to:content-type;
	b=d5aZXmGevom6LlOMd+Kf26LaY+hwQMdzVrDxL/gb1+bhtVovXoW2spk+XwqHTlLgnd
	iSeGThsUDSsudzHb4uD2F4TB9igVvsCC6vRlyZtDejKvXWdWWJBSZwnv9098RDMh8NN6
	DzXf2KgMe6rDVgwCPP/ygQ96mNSZ6UIqruXwM=
Received: by 10.223.123.129 with SMTP id p1mr5251139far.94.1283442389379; Thu,
	02 Sep 2010 08:46:29 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.112.81 with HTTP; Thu, 2 Sep 2010 08:46:09 -0700 (PDT)
From: AJ ONeal <coolaj86@gmail.com>
Date: Thu, 2 Sep 2010 09:46:09 -0600
Message-ID: <AANLkTimsOCL0xo1Y+KL6FdmXWRcXpNf=DN2PR14tmDz0@mail.gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: coolaj86@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Does the OS make a difference?
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
X-List-Received-Date: Thu, 02 Sep 2010 15:47:09 -0000
Content-Type: text/plain; charset=ISO-8859-1

The way that I understand it, OE natively compiles everything it needs for
cross-compiling everything the target needs - perl, python, etc.

However, I hear people using Ubuntu 10.04 say that they don't have problems
building the same thing that I'm building.

Is that just random happenstance or is there something about the OS that
would make successful builds more likely?

It would be worth it to upgrade from Ubuntu 8.10 to 10.04 if it really makes
a difference... but it would take time and disrupt workflow and otherwise
provide little advantage.

AJ ONeal

