Received: from mail-ew0-f212.google.com ([209.85.219.212])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <andrea.adami@gmail.com>) id 1Nduts-0001cr-2i
	for openembedded-devel@lists.openembedded.org;
	Sun, 07 Feb 2010 01:21:23 +0100
Received: by ewy4 with SMTP id 4so117958ewy.27
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 06 Feb 2010 16:18:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=uYvyVqdXyR/YXc3Q9Kh2194CjO6PuX0qe8P8s9f+z3E=;
	b=FpFR6K/NeU/YuwPlI5HYESVKxIyLZTTJbqAhmeOy+EYqi8T+XNboMgHZGN0FjoFwOM
	zDTo211hZokSdOpIUxEib0i7soHbvq/dVcAcueJ/S4aJA5ejQZCXAPIzevtllQ8yra4i
	Wl8Xg5VphT6KZcaFQ6koqZgjl1BRITP/F3o0M=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=FbXw+IiKX8DJO0ZGztSWFHimUfPDBqzTqHBcKO3ebgCHkqtpLoGnOihOvHJhGPDmxp
	Eea7uML/+TbDKqiO3cYfjp9FU/6gNH0hR6LejwyR8aSBPAvdO7SjahLk/OEs3Xmyrs2T
	lUicrkH7Fd9B7HhgR0CZJBdA6QR4VM6UBH9sM=
MIME-Version: 1.0
Received: by 10.213.0.212 with SMTP id 20mr2288835ebc.41.1265501929269; Sat, 
	06 Feb 2010 16:18:49 -0800 (PST)
In-Reply-To: <d1b08f941002061509y424103c3sa00e993c0deb485e@mail.gmail.com>
References: <d1b08f941001170606w13dcfc0ey341da93deb94c7b8@mail.gmail.com>
	<d1b08f941001171559w5ae011a6u61715d0fd236046@mail.gmail.com>
	<d1b08f941001220212v588c5f9bvbf2a149660a86898@mail.gmail.com>
	<hjceds$nsr$2@ger.gmane.org>
	<d1b08f941001281450o3dc53131je7168dbfbca9c1c8@mail.gmail.com>
	<d1b08f941002011024p60f08708xbb56a3293fe73dba@mail.gmail.com>
	<d1b08f941002011357y4285709w44dbed0b4e2c4b87@mail.gmail.com>
	<hk7nl6$rik$1@ger.gmane.org>
	<20100201234729.GB2493@xora-build.xora.org.uk>
	<d1b08f941002061509y424103c3sa00e993c0deb485e@mail.gmail.com>
Date: Sun, 7 Feb 2010 01:18:49 +0100
Message-ID: <d1b08f941002061618i53d87452r826beee6da0b4a08@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org, 
	zaurus-devel@lists.linuxtogo.com
X-SA-Exim-Connect-IP: 209.85.219.212
X-SA-Exim-Mail-From: andrea.adami@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [RFC] Zaurus: make updater.sh obsolete for poodle, clamshells and tosa
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
X-List-Received-Date: Sun, 07 Feb 2010 00:21:23 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Sun, Feb 7, 2010 at 12:09 AM, Andrea Adami <andrea.adami@gmail.com> wrote:
> Ok, I committed the fix to updater.sh, now bumped to r24.

I forgot to say, this change only affects c7x0 models. Akita and Spitz
have own nandlogical routines.

Andrea


