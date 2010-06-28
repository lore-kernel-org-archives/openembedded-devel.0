Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <andrea.adami@gmail.com>) id 1OTLvr-0004ZU-7Y
	for openembedded-devel@lists.openembedded.org;
	Mon, 28 Jun 2010 23:32:00 +0200
Received: by yxt3 with SMTP id 3so114122yxt.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Jun 2010 14:27:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=4ePYMg1mghZIUbc81fQG8IqUK+zC9d9hEW6BS/FWuwI=;
	b=nfr6LkqR0fv47cAgf3A3sZBcl5SPU8iyV+cAUDgLCXwaCrqtMx3ZBRId2qQXkwhi1M
	GleeupjpZbe28wu4PDC45itVpNrG0VcjH9kBC6ZCOLea4bKsKkh1JYy9A4K38qvbtERe
	0cpgRNvcQejGgVRt272Q4fbe1kBI5szwaY8A8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=rr3NQCvR8ItXj1SdBFp+civnwcREc+pguBZJ+Twt6AK0EfDPGnkMaX4sqrjZPBJIBv
	p5EI7wfndVFn7wVbwj78v0tjQcswcjguN6CAX6VvQK+flA5ooKGSPONHCgW1rKoqvLHf
	MEQK03BfJSILbebVBqxMaVjdXUOK3PU5zWk2k=
MIME-Version: 1.0
Received: by 10.101.182.11 with SMTP id j11mr7152012anp.171.1277760436196; 
	Mon, 28 Jun 2010 14:27:16 -0700 (PDT)
Received: by 10.100.243.32 with HTTP; Mon, 28 Jun 2010 14:27:16 -0700 (PDT)
In-Reply-To: <1277677032-20016-2-git-send-email-Martin.Jansa@gmail.com>
References: <1277675827.4745.311.camel@lenovo.internal.reciva.com>
	<1277677032-20016-2-git-send-email-Martin.Jansa@gmail.com>
Date: Mon, 28 Jun 2010 23:27:16 +0200
Message-ID: <AANLkTikZK0MDF6ouJ28IODcU9x2vG621xleEd-3nbMUz@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.213.175
X-SA-Exim-Mail-From: andrea.adami@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] opie-taskbar-images: fix RPROVIDES
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
X-List-Received-Date: Mon, 28 Jun 2010 21:32:00 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 28, 2010 at 12:17 AM, Martin Jansa <martin.jansa@gmail.com> wro=
te:
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
> =A0recipes/opie-taskbar/opie-taskbar-images.inc | =A0 10 +++++++++-
> =A01 files changed, 9 insertions(+), 1 deletions(-)
>
[cut]

Acked-by: Andrea Adami <andrea.adami@gmail.com>


