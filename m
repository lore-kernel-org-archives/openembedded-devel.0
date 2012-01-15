Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <pabigot@gmail.com>) id 1RmSyA-0000dv-T0
	for openembedded-devel@lists.openembedded.org;
	Sun, 15 Jan 2012 17:30:12 +0100
Received: by werf1 with SMTP id f1so485309wer.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Jan 2012 08:22:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=2V47yAPlsld42MSF1ZFsxrO0Iknxq3zOYJApiDN4tpQ=;
	b=tmONb8AMqUsM9QEACYixUBi8xzWKGYul/u4Pia1SzQkRuW8fXR2YbUupwSSRR40EGW
	eDCYqfSAw/kET6uVLreCfRJJKa26P0lvGM1a2/hfVzLH1zoKJTvLBB33Ymyz0j7E21kP
	xMETr8isQBMCOOnoOTNyWHYuntsnzL8yJ1208=
MIME-Version: 1.0
Received: by 10.216.132.141 with SMTP id o13mr3448743wei.58.1326644555890;
	Sun, 15 Jan 2012 08:22:35 -0800 (PST)
Sender: pabigot@gmail.com
Received: by 10.216.90.204 with HTTP; Sun, 15 Jan 2012 08:22:35 -0800 (PST)
In-Reply-To: <CABcZANmFa5CwuT0CY5pa8BE0wt70aGfZA3M4PJHPW_Rd3WA8bQ@mail.gmail.com>
References: <CAPOJ94OspH5H4G-=wQNqb=DdHratNwV3LHYnYo2BW43sbavk+g@mail.gmail.com>
	<CABcZANmFa5CwuT0CY5pa8BE0wt70aGfZA3M4PJHPW_Rd3WA8bQ@mail.gmail.com>
Date: Sun, 15 Jan 2012 10:22:35 -0600
X-Google-Sender-Auth: Z5UyvOoUH6OyjicMCNPG4E_SDHg
Message-ID: <CAPOJ94M5dbY68WWm0QU_sLwvbr+Na7sJ6ht_zjD7_WPOfCa=4g@mail.gmail.com>
From: Peter Bigot <bigotp@acm.org>
To: openembedded-devel@lists.openembedded.org
Subject: Re: oe-core license description practices
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
X-List-Received-Date: Sun, 15 Jan 2012 16:30:12 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 15, 2012 at 10:05 AM, Chris Larson <clarson@kergoth.com> wrote:
> On Sun, Jan 15, 2012 at 8:15 AM, Peter Bigot <bigotp@acm.org> wrote:
>> http://www.openembedded.org/wiki/OpenEmbedded-Core states that the
>> LICENSE field should be "as correct as possible (e.g. 'GPLv2', not
>> just 'GPL')". =A0If the upstream package self-describes as "GPL", is it
>> necessary that this be refined to a more specific version?
>
> Generally they may say they're GPL, but are actually GPLv2+ or
> similar. Read the actual license text included in the source tree, and
> the headers of the files.

I have done that.  Please see the material I quoted below my question,
and let me know how to proceed based on my description of what I found
in the package.  Perhaps I'm being too careful, but I didn't find it
clear enough to warrant unilaterally re-characterizing the licensing.
Thanks.

Peter

> --
> Christopher Larson
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


