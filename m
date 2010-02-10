Received: from mail-iw0-f197.google.com ([209.85.223.197])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1NfLeD-0005FS-So
	for openembedded-devel@lists.openembedded.org;
	Thu, 11 Feb 2010 00:07:09 +0100
Received: by iwn35 with SMTP id 35so631426iwn.4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Feb 2010 15:04:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=lqR0FJoGlkWSACpL1B+pyMPPf7JKobhNEEy8DPLshLo=;
	b=Z4yLlBq85fPKGp6tFQrWiYBucAkK1e9/kZ/FY9j09QkMK6Khl7KZMVNXi4Y3ZtOaQ7
	nisXQsKG2rjRcAgxOZgtlLvo3kjNHt2zy2cRWX8BG0U63KIs2EqjQEHCxymQN7rwg4eR
	0p6ow0BIQMNhA39h1W/Re6E5C1kOLTm6AZZtE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=FoNwyqGS5A0SCDWrlLL2cQ8JdB9zybY0GJVq6xukQe5zNwYZBJkXOrbKw6oEx4dkYb
	iHC00TjHlP3CW4Cqpog5HCiK7c7CKXHmDGQZMKUEiBw6ne76n+2PjRZ/JWQWuRORMmcb
	eCChEaKAY22ittOhiS2hbFqcsL9AltIs9id84=
MIME-Version: 1.0
Received: by 10.231.168.133 with SMTP id u5mr1620708iby.29.1265843071216; Wed, 
	10 Feb 2010 15:04:31 -0800 (PST)
In-Reply-To: <alpine.LFD.2.00.1002101712580.4390@localhost>
References: <alpine.LFD.2.00.1002101712580.4390@localhost>
Date: Wed, 10 Feb 2010 15:04:31 -0800
Message-ID: <19c1b8a91002101504g4a35ef13w50eb66548d8188b@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.223.197
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: freshly updated u-boot has malformed patch
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
X-List-Received-Date: Wed, 10 Feb 2010 23:07:09 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 10, 2010 at 2:22 PM, Robert P. J. Day <rpjday@crashcourse.ca> w=
rote:
>
> =A0beagleboard image as usual:
>
> Applying patch u-boot-remove-inline-of-weak-functions.patch
> patching file lib_arm/board.c
> Hunk #1 FAILED at 123.
> 1 out of 1 hunk FAILED -- rejects in file lib_arm/board.c
> patching file common/main.c
> Hunk #1 FAILED at 48.
> 1 out of 1 hunk FAILED -- rejects in file common/main.c
> Patch u-boot-remove-inline-of-weak-functions.patch does not apply
> (enforce with -f)
> ERROR: Task 151
> (/home/rpjday/oe/openembedded/recipes/u-boot/u-boot_git.bb, do_patch)
> failed
> NOTE: Tasks Summary: Attempted 10399 tasks of which 10399 didn't need
> to be rerun and 1 failed.
> ERROR: '/home/rpjday/oe/openembedded/recipes/u-boot/u-boot_git.bb'
> failed
>
> =A0i'd be more informative but i'm massively sick at the moment.

which machine ?


