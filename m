Received: from [209.85.211.177] (helo=mail-yw0-f177.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1N3WDG-0006A4-3s
	for openembedded-devel@lists.openembedded.org;
	Thu, 29 Oct 2009 15:42:57 +0100
Received: by ywh7 with SMTP id 7so1748753ywh.24
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Oct 2009 07:41:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=2dOY6aomNW0CYUjIAADI5RTxmgZQxv4IhY7wto+NIbQ=;
	b=oGrcg6EFi5w/U61aXdoIMk50Fw8IkphdlKkaHwrKSUFPpHJznBdakorhAOW0r8+y7J
	xUZg99pzfK9r0l3o+woU4rZdXMVPeQcGm2oODOEKP113xcHy0CKDaV+TnaGlUgLdByB7
	roUrRjyIL5h2AqFPxUdr994telbo5O2/wYU6Y=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=nS5t7iwWwwZgCICY4uikifOw9VGBdIFxMFOUhWj/ur4Ti7dcQx2noz428CGfVJg876
	R/Wa54C8bQEnbi+C2Yepi3k3pqmXFNtVqnUDHb3mWPEdUz5I8BXpYLhEMfFhvwRXodp9
	XVnTRShljnAKippYjdX32mOT8DGhhwFVjfbjI=
MIME-Version: 1.0
Received: by 10.150.88.3 with SMTP id l3mr509642ybb.92.1256827305640; Thu, 29 
	Oct 2009 07:41:45 -0700 (PDT)
In-Reply-To: <20091029094226.GA3699@jama>
References: <20091029094226.GA3699@jama>
Date: Thu, 29 Oct 2009 10:41:45 -0400
Message-ID: <f96d234e0910290741g3fca4a45red7bbc9a421212aa@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org, 
	Martin Jansa <martin.jansa@gmail.com>
X-SA-Exim-Connect-IP: 209.85.211.177
X-SA-Exim-Mail-From: cliff.brake@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Commit access
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
X-List-Received-Date: Thu, 29 Oct 2009 14:42:57 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Oct 29, 2009 at 5:42 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> Hi all OE developers,
> I am politely asking if would be possible to allow me OE commit access.
>
> I already promised to commit this stuff:
> 1) xorg-7.5
> 2) scripts for easier updating of checksums.ini
> 3) SRCPV support
> 4) shr distribution merge from shr/merge
>
> My previous commits went usually to shr/merge or shr/import through shr
> patchwork, but sometimes it would easier/faster to commit it directly.

If you an send me your ssh key, I'll get you added. Please read:

http://wiki.openembedded.net/index.php/New_Dev

Thanks,
Cliff


