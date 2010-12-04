Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1POqG6-0001tW-PL
	for openembedded-devel@lists.openembedded.org;
	Sat, 04 Dec 2010 12:26:40 +0100
Received: by iwn8 with SMTP id 8so9576610iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 04 Dec 2010 03:25:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=0bucv0j5NfvnWr97LC2fz2wSw2nlw6qKkuVcJiK5PSE=;
	b=VcKsj3UpfwWN6NKG4aE+6WOew17HhhKxIbsPRjCfxa9xAR4LMpuWmJsQ4A0g6MJ6Jn
	x1fzaa8cB3BTPGs9Ba2WXqzVW9fFvZ2dNnbtqI5qeQh6LJ7d/ga9PMk1IJAHtlO0CR/4
	+odvjVsLWHh76xBKOci+9mO1heZJ6O1SpmyZk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=aSsU3ly7wejyZPmIC31qOXMPykBYblweLRyWOsoX5TRdp8G+6ifQ+VgXkN3ihy7v/+
	hwqhgw9FfkzVapsLdJAxuFnDkDAhTSJhHW+OPj2L6JsjqbIBqPAl0cUgaF+I8NejrJeQ
	3a3+zPHleLhTzPeUt4aakr4Eqjj5xe2XVJxHU=
MIME-Version: 1.0
Received: by 10.231.20.65 with SMTP id e1mr3132231ibb.32.1291461904216; Sat,
	04 Dec 2010 03:25:04 -0800 (PST)
Received: by 10.231.200.140 with HTTP; Sat, 4 Dec 2010 03:25:04 -0800 (PST)
In-Reply-To: <AANLkTik0zjtfygu8taBf_bUAdgu_yCtkH_1ZaKb5WX0+@mail.gmail.com>
References: <AANLkTik0zjtfygu8taBf_bUAdgu_yCtkH_1ZaKb5WX0+@mail.gmail.com>
Date: Sat, 4 Dec 2010 12:25:04 +0100
Message-ID: <AANLkTikZg5fKLGiOQZ488noo0ahaLSAfaSZMq3Xwr=7O@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW,SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [ANNOUNCE]: OpenEmbedded 2010.12 released
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
X-List-Received-Date: Sat, 04 Dec 2010 11:26:40 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/12/4 Khem Raj <raj.khem@gmail.com>
>
> On behalf of OpenEmbedded Commmunity, I am excited to announce 2010.12
> release of OpenEmbedded.
> This release was focussed on stabilizing the metadata and getting
> various distro/machine/image
> combinations to work. A lot of effort was put by community to make
> this happen and a table of tested combination is available at
>
> http://www.openembedded.org/index.php/Release-2010.12
>
> In order to get the release using git
>
> $ git clone git://git.openembedded.org/openembedded
>
> $ cd openembedded
>
> $ git checkout -b release-2010.12 release-2010.12
>
> To download the release in form of tarballs
>
> http://git.openembedded.org/cgit.cgi/openembedded/snapshot/release-2010.12.tar.bz2
> http://git.openembedded.org/cgit.cgi/openembedded/snapshot/release-2010.12.tar.gz
>
> BIG thanks to everyone who tested different combinations, took part in
> stabilization effort, provided patches
> and provided feedback for the release to make it happen
>
> Enjoy !
>
> -Khem
>

Khem, thanks alot on making this happen!
I know you spent quite some time on this.
Greatly appreciated!

Frans


