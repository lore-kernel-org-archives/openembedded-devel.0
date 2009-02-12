Received: from [209.85.218.165] (helo=mail-bw0-f165.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1LXdW2-0000of-0k
	for openembedded-devel@lists.openembedded.org;
	Thu, 12 Feb 2009 16:30:15 +0100
Received: by bwz9 with SMTP id 9so1011058bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Feb 2009 07:28:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=79bgcp5XjAZstXTCHA2IJYDRUr6VCtISifnRDR6Rwfk=;
	b=IjrKr4D4zmSTBgiGeBdAsgoXdNJymm2raZDvNKxD8ROMS7e/AOevOINyhsm5tFF2sc
	304HOfkE+YKm9sppv8qPgN8XqT6vwSK0eAEfnceW2hms/0+29Zyk3tARR7QjPfars0Nj
	4A+C9BQiXz1oFUt3oIQwVK2e3Cj5z2Fa/P7SE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=Vz8UoYP+ekqLOVM2DXL3fAitxX4getQydcsGN0Q9FVXqQOCRyqRcmx5PTJjhOx2kX6
	Xqo7BqcHjwQM7LYbIa752LJRJWfTxKhxP0oQCecysZWgoNZn2Jzv9nTtuCX1xKZAsx6M
	5eyEw2slBFUdhb9hllRAYM0TmKlbsl5ejFZQk=
MIME-Version: 1.0
Received: by 10.180.204.10 with SMTP id b10mr335431bkg.201.1234452534671; Thu, 
	12 Feb 2009 07:28:54 -0800 (PST)
In-Reply-To: <200902121727.21796.roman@khimov.ru>
References: <200902121727.21796.roman@khimov.ru>
Date: Thu, 12 Feb 2009 16:28:54 +0100
Message-ID: <c384c5ea0902120728n459671f4y32957b212a8af0ed@mail.gmail.com>
From: Leon Woestenberg <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] icecc: base fix for cross and native builds
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
X-List-Received-Date: Thu, 12 Feb 2009 15:30:16 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hello,

On Thu, Feb 12, 2009 at 3:27 PM, Roman I Khimov <roman@khimov.ru> wrote:
> Hello all.
>
> There are severe problems with icecc builds currently in OE. Cross-compiler
> tarball created wrong, PATH set incorrectly, etc.
>
Excellent!

It's probably a little-used class, but if we get it to work more
robustly, we can make more noise about it.

I will try to do some tests here over the next few weeks with your
patch, time permitting.

Regards,
-- 
Leon


