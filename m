Received: from [209.85.198.251] (helo=rv-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1L9pna-00077O-Sd
	for openembedded-devel@lists.openembedded.org;
	Tue, 09 Dec 2008 00:45:59 +0100
Received: by rv-out-0708.google.com with SMTP id f25so1469979rvb.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 08 Dec 2008 15:42:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to
	:subject:cc:in-reply-to:mime-version:content-type
	:content-transfer-encoding:content-disposition:references;
	bh=FqGcIJc+qO0n6Xz6GvtBlEA6emfAav2AGQPihciG8ic=;
	b=E+JRxfu6yq1zpwrGNCeAqZfR706JzEhMFioRaIDFaZNwO68UYskfjIeFChA0MSw9VA
	kG+0m6Q5GC7etlj58JfcbsuNLMnuQMsaCflDOOXT8VTEjk4iAsvR+9ZzmSJbKGM5lqQi
	D6RzGDVIziHtr6jVPSNZzvUcJY4dn8axTJiKA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:cc:in-reply-to:mime-version
	:content-type:content-transfer-encoding:content-disposition
	:references;
	b=DC5yJlQ/ZHtAYUXzBWovtP9L9uBZFFuvmskM7oRiOmtDH0NmHWkCqODJlFdkyACSzX
	szp1eJTMKvA/gWAbYgWXFKwLCSRdZdYf4jHqlw0qulhwiT30ofXs6esP91VJnWBOtKA3
	lF51i72iQZo61Aiw5AnqMorV+grn4KKB6Zd58=
Received: by 10.141.132.1 with SMTP id j1mr1899597rvn.282.1228779724639;
	Mon, 08 Dec 2008 15:42:04 -0800 (PST)
Received: by 10.141.171.13 with HTTP; Mon, 8 Dec 2008 15:42:04 -0800 (PST)
Message-ID: <19c1b8a90812081542m1a1bdceah331d1c9b4f61ff5c@mail.gmail.com>
Date: Mon, 8 Dec 2008 15:42:04 -0800
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <19c1b8a90812081537j39e098d6w9e8f0a8c1b9c2b7@mail.gmail.com>
MIME-Version: 1.0
References: <ghithj$qk7$2@ger.gmane.org>
	<19c1b8a90812081537j39e098d6w9e8f0a8c1b9c2b7@mail.gmail.com>
Cc: openembedded-devel@openembedded.org, angstrom-distro-devel@linuxtogo.org
Subject: Re: ANGSTROM_MODE renamed to ANGSTROMLIBC
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
X-List-Received-Date: Mon, 08 Dec 2008 23:45:59 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Mon, Dec 8, 2008 at 3:37 PM, Khem Raj <raj.khem@gmail.com> wrote:
> On Mon, Dec 8, 2008 at 2:39 AM, Koen Kooi <k.kooi@student.utwente.nl> wrote:
>> Hi,
>>
>> Due to changes in how bitbake handles environment vars ANGSTROM_MODE has
>> been renamed to ANGSTROMLIBC:
>>
>> http://cgit.openembedded.net/cgit.cgi?url=openembedded/commit/&id=325476d19b821623dbe151d7026c20dfd3754432
>>
>
> For me ANGSTROM_LIBC would have been more readable. but I can live
> with whatever is there

nevermind I read the bitbake related post. I wonder why '_' character
is now banned in var names.

>
> -Khem
>


