Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SylnW-0006GX-IA
	for openembedded-devel@lists.openembedded.org;
	Tue, 07 Aug 2012 17:34:18 +0200
Received: by eaad12 with SMTP id d12so1279672eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 07 Aug 2012 08:22:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=OPm/SSTRM/Gpg3vHUo8tvanZYT7aZ7SEq3ZGi4IPouw=;
	b=m/0N2CslArdohAU/F6UlBEYlysw6WQu0XLTHpu3aVfaU2LpwagXvP8/JEXMHIcwO0N
	+a2FjdB8kqT2b7i9DWlw9R3EQHI6zqJdMz5r2jt/crhJ2jQku14VSMzO9HyqCIeuvbzu
	s0zW+1ZlAAxd9GFIlzkECZtFUUGWyd56pZUGhv9vl18SKO8nClKu9w0eHvfS4umri4Ob
	qhZr37A07pUqbYgP5dMwP9AlxsmTlJf2ECod2hvmW0sofOEoHrS1tA7zul5TR/lNQ6il
	j1txNWn1bPmTcKHwHHR9LJorw2Vaa4kiYmV/RwObvqgazILazgBeQB97oloPe/EC9LUY
	pIVw==
Received: by 10.14.213.137 with SMTP id a9mr18091531eep.38.1344352952667; Tue,
	07 Aug 2012 08:22:32 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.97.141 with HTTP; Tue, 7 Aug 2012 08:22:02 -0700 (PDT)
In-Reply-To: <1344346096-29219-1-git-send-email-koen@dominion.thruhere.net>
References: <1344346096-29219-1-git-send-email-koen@dominion.thruhere.net>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 7 Aug 2012 08:22:02 -0700
Message-ID: <CAMKF1srqswBKs0pED8XHA55FhAWN5SZ28iO4V_UiqJQSWek_gw@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [meta-oe][PATCH] fuse: update to 2.9.1
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
X-List-Received-Date: Tue, 07 Aug 2012 15:34:18 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Aug 7, 2012 at 6:28 AM, Koen Kooi <koen@dominion.thruhere.net> wrote:
> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> ---

Koen

I get

WARNING: QA Issue: fuse: Files/directories were installed but not shipped
  /dev
  /dev/fuse

it builds ok otherwise


