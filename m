Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1PXfVr-0007n0-Bu
	for openembedded-devel@lists.openembedded.org;
	Tue, 28 Dec 2010 20:47:15 +0100
Received: by iyj18 with SMTP id 18so8842704iyj.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Dec 2010 11:47:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=ar+f/7uXcDLCgoNR8VuoBfrGiIOKGTNigJ1e7H9eB/0=;
	b=EzMc26yrctWOqOHVNJPGRi+cwlzl6lcH6rOweVjd4c7kMmdMm0+eDEhJSanrifT97O
	E2ewwE0iWmmI99hl9nxFDbjgTmDygzoNBXG40LXswzK6V/TYQ1GxlwSlnCg9RzkpdPAG
	aoEv/z6Tg9XY6mZ6XkORNlEEjE/2bR5LV43IE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=XLqdmf7BdhiRGhu/qprDW0PnWSvtECCXT2bA4JAgPyNM2pzHtyD1A23moxgBZUB45s
	0+d2XWp5+g6i1ytRuqO05696bFjCzt26v3DzXtXpGg+SgiqUkaikTtdjIxNjm7ix99JW
	NXfZzftqIcVtUEqdOtIzAreC6ZrRCJ/i4eLAE=
MIME-Version: 1.0
Received: by 10.231.149.194 with SMTP id u2mr13772662ibv.32.1293565620001;
	Tue, 28 Dec 2010 11:47:00 -0800 (PST)
Received: by 10.231.200.140 with HTTP; Tue, 28 Dec 2010 11:46:59 -0800 (PST)
In-Reply-To: <AANLkTikkEQF90jW6NvzsC8zBg5O2bo-FH4UAaubcJAKX@mail.gmail.com>
References: <1293476385-7289-1-git-send-email-bgamari.foss@gmail.com>
	<1293476385-7289-2-git-send-email-bgamari.foss@gmail.com>
	<1293499083.2173.26.camel@saphir>
	<AANLkTimmk7wnCS66EUFu6=A+c9ckgse8ECRGLz+RD-mx@mail.gmail.com>
	<AANLkTikkEQF90jW6NvzsC8zBg5O2bo-FH4UAaubcJAKX@mail.gmail.com>
Date: Tue, 28 Dec 2010 20:46:59 +0100
Message-ID: <AANLkTi==aSYQsXfC6pjMucxo6WDd1eWRD97F2GxLfghg@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] python: Initial commit of python 2.7.1
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
X-List-Received-Date: Tue, 28 Dec 2010 19:47:16 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/12/28 Khem Raj <raj.khem@gmail.com>:
> On Tue, Dec 28, 2010 at 3:11 AM, Frans Meulenbroeks
> <fransmeulenbroeks@gmail.com> wrote:
>> Strange.
>> I see the patch on gmane, but it never made it into my mailbox (not
>> even the spam folder, also re-checked the trash).
>>
>
> somehow it did not get caught in patchwork as well. Please resend the
> the patch probably use git format-patch and git send-email
> as described in
> http://wiki.openembedded.org/index.php/How_to_submit_a_patch_to_OpenEmbedded
>

It is in patchwork now:
http://patches.openembedded.org/patch/138/

Apparently long messages take longer in transit.

Frans


