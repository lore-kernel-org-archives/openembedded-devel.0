Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OgDcj-0006E1-Hq
	for openembedded-devel@lists.openembedded.org;
	Tue, 03 Aug 2010 11:17:30 +0200
Received: by bwz10 with SMTP id 10so2224222bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 03 Aug 2010 02:17:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=JAKvvtlKO3neWy2DvXO7Yg95s+2wgsTemNcstbExds8=;
	b=kMZhofODX8qeJrBRHJXsNWJXzVPOzLfWnCPX2lFXQltEpY9GubUw7aQZ1eZq+O+/CX
	Kwll+ioPnER3YrJuo2Wzbqs1aOCb/ooFMscmu4eC5mhIyC9wPqK+yqPv618QvJNi9RlG
	oVZfo0Rw5TVUp8UMPf5S9A9acHVYKV3TCW6S0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=B92hsbPaEnKtiQwEueHJvmeWg/UUlkYVYEf7P8MW1w+8izIjdGlKy/rss/9pB5h9Yw
	9yr9aQ43JJ6HsiVjH1XGofNPQqrw2+9L+UDXrDSKk0LvfFtKaMnwEWUo+8x3xuJOVsu6
	eR8UZfb80zKz1ArC2ujQdQL0op4KnWno+EwQU=
MIME-Version: 1.0
Received: by 10.204.82.200 with SMTP id c8mr5024697bkl.102.1280827041066; Tue, 
	03 Aug 2010 02:17:21 -0700 (PDT)
Received: by 10.204.60.208 with HTTP; Tue, 3 Aug 2010 02:17:21 -0700 (PDT)
In-Reply-To: <A6DDF661-1A0C-444D-BA84-9E7116031A3E@vanille-media.de>
References: <AANLkTim8npBMFS-5-u+iT6XPUJDkZ+ueqjwc0==WVubd@mail.gmail.com>
	<A6DDF661-1A0C-444D-BA84-9E7116031A3E@vanille-media.de>
Date: Tue, 3 Aug 2010 11:17:21 +0200
Message-ID: <AANLkTimDq2q4hwUpbLSBgtyX=fmdnQn9syFBnW5br8qU@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.47
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: CALL FOR ACTION: get rid of native recipes
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
X-List-Received-Date: Tue, 03 Aug 2010 09:17:41 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/8/3 Dr. Michael Lauer <mickey@vanille-media.de>

> Hi Frans,
>
> that's pretty cool, however I think we should restrict this list
> to those recipes which also have a non-native variant.
>
> E.g. the 2nd entry in this list is android-image-utils-native for
> which a non-native variant makes little sense.
>

Of course.
That is what I wanted to say with "if it is only a native recipe" when I
wrote:
 - in some cases: leave as is (e.g. if it is only a native recipe, or if it
is very difficult to convert)

Maybe I expressed myself wrong. English is not my native language, so you'll
have to suffer with me :-)

If there is a recipe that has no non-native variant, no work is needed.

Frans

