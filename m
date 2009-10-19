Received: from [209.85.221.176] (helo=mail-qy0-f176.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1MzwQG-00049z-9q
	for openembedded-devel@lists.openembedded.org;
	Mon, 19 Oct 2009 19:53:35 +0200
Received: by qyk6 with SMTP id 6so1402240qyk.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Oct 2009 10:52:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=KiD6lkzGuBcMJ8Z3x3HnEIi24K6lAvpc58Gg6/b6CH8=;
	b=ZW4AQ5JwssncwSpjyIYras3gPqaOMFy9hix2FP4SCBVJElGrY/A5D6QveN+TOiE7MO
	AwhfNU/tcVMX7OPiP8nZ/lwDDq2tz1gwbZ6C2Q+kNy3SuOZemoSJuyf7mArA6HurMMG+
	VMu4XKxy8mDlZE9No4u0bZC5qfbnATcUEhBWg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=MxGwAFGjR0HhiRiCZm7BgIpxXGLUrKZF/ONLLJxn1UcPtDz8ez9Ulb0xddJWtL3a0a
	86R3p+yona7b21fFD4JHCmpI3j18LEEh0+uRKJA2ooq+3t2O1vD9o3Rzn5Uu9mbsK3AK
	FRYtpFa5qeKKcMdirL/XwznNLK5Vu56g+eLmg=
MIME-Version: 1.0
Received: by 10.229.2.19 with SMTP id 19mr719495qch.94.1255974752448; Mon, 19 
	Oct 2009 10:52:32 -0700 (PDT)
In-Reply-To: <1255966150-1854-1-git-send-email-marcin@juszkiewicz.com.pl>
References: <1255966150-1854-1-git-send-email-marcin@juszkiewicz.com.pl>
Date: Mon, 19 Oct 2009 10:52:32 -0700
Message-ID: <19c1b8a90910191052i25ebec10q20e2f045cab3914a@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.221.176
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Updating kernels to latest stable versions
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
X-List-Received-Date: Mon, 19 Oct 2009 17:53:35 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Oct 19, 2009 at 8:28 AM, Marcin Juszkiewicz
<marcin@juszkiewicz.com.pl> wrote:
> Some time ago I asked about updating kernels to recent stable patch.
> There was nearly no discussion on it so this time I am sending mails for
> review. Did not build checked those patches yet.

You might have to try builds because there could be some backported
patches already applied which now are in the new minor release. (I
haven't looked myself if there is such a case.)

>
>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


