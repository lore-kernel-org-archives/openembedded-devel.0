Received: from [209.85.218.217] (helo=mail-bw0-f217.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1N9mLk-0005Eo-TC
	for openembedded-devel@lists.openembedded.org;
	Sun, 15 Nov 2009 22:09:35 +0100
Received: by bwz9 with SMTP id 9so4774072bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Nov 2009 13:08:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=rLx/SXT+mjMenciMk0tCcoT+cLvRf6Z/UOoebVDXZpI=;
	b=pVVgHjIqLrRrLVqWIIvbKsxe1GBuOh033QlYazC090NcjSKSZcAKWyOIijQqTQ9DsI
	5f+LDAMtx4ZpHApm1b6HyhscC+UeqdcZkcVwSI2qgtI+WjA9Mz40HcGtF3BAf5+08YCX
	UVmooze9Bkc033ux3yPVZ/nSu6He9DIAllzNc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=ZN9Q7Cci9dboRYS7GD4mwVfOfYhgoSkZKp6mRYXgprwzy02JL3DUwdUBcdgc8hB/K7
	ClZHFD6g+xUvXJtofqMLgUKg7vlRnVxeZYnCKS3hof+/W+puwrezD0V7PVEcQ+deOIZK
	6pL34V5e95Jkr9ejGtUpJ3tsi6C+86CFtFB5U=
MIME-Version: 1.0
Received: by 10.239.145.148 with SMTP id s20mr681482hba.142.1258319290763; 
	Sun, 15 Nov 2009 13:08:10 -0800 (PST)
In-Reply-To: <4B00654D.3010507@balister.org>
References: <4B00654D.3010507@balister.org>
Date: Sun, 15 Nov 2009 22:08:10 +0100
Message-ID: <c384c5ea0911151308r5c745d56h63b7fa62e1ef74f8@mail.gmail.com>
From: Leon Woestenberg <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.218.217
X-SA-Exim-Mail-From: leon.woestenberg@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: New parse error in dev
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
X-List-Received-Date: Sun, 15 Nov 2009 21:09:36 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello Philip,

On Sun, Nov 15, 2009 at 9:32 PM, Philip Balister <philip@balister.org> wrote:
> Commit:
>
> http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=f18414059f60ec5924a702a227069aac09f19a0b
>
> introduces the following parse error:
>
> NOTE: Handling BitBake files: / (3129/7521) [41 %]ERROR: Could not inherit
> file classes/girepository.bbclass while parsing
>
typo maybe?

gitrepository.bbclass vs. girepository.bbclass

Regards,
-- 
Leon


