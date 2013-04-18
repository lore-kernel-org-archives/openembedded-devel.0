Received: from mail-vc0-f174.google.com ([209.85.220.174])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1USj4Y-0000is-2e
	for openembedded-devel@lists.openembedded.org;
	Thu, 18 Apr 2013 09:16:00 +0200
Received: by mail-vc0-f174.google.com with SMTP id kw10so2086641vcb.5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Apr 2013 23:58:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:content-type:content-transfer-encoding;
	bh=2U7vSOaoM/zJn+D7p7kZxGhOSVy40z1hgFaf3wcaxHs=;
	b=yTR7Mu7Y/BhdnOeOI4gbnATn4I6OMUSJr0Vmb8NYMPiXNUOLhYWW5629TPlODA2KrM
	xxSj+Cw28d30DKTuJ4z77GGAHQ8qjvrr458R2HCsP29LZg4q9rQJKYwef0E5vkuntU21
	svmcjQauWcd96ONBbT5qEGP4PPNntF7AeeGHLeS7+/G2xSdzTNJlsiECxVSrK+SH1WQ6
	/LmSNwDd3oGBRucnzymrQiCh0WQeMtuK27q2qU+skXP7lXED8B/5Hn063+a/PgmBTuzn
	X9AC6msFUFd69K/VIByhgLTOZecS3ONhnUrCAOm+N55mfJ5Nch0IANZEdTzd8F7D43NZ
	V5Ew==
MIME-Version: 1.0
X-Received: by 10.52.34.168 with SMTP id a8mr6228132vdj.75.1366268304582; Wed,
	17 Apr 2013 23:58:24 -0700 (PDT)
Received: by 10.52.185.168 with HTTP; Wed, 17 Apr 2013 23:58:24 -0700 (PDT)
In-Reply-To: <kkm9v0$mrc$1@ger.gmane.org>
References: <1366206552-14452-1-git-send-email-schnitzeltony@googlemail.com>
	<1366206552-14452-2-git-send-email-schnitzeltony@googlemail.com>
	<kkm9v0$mrc$1@ger.gmane.org>
Date: Thu, 18 Apr 2013 08:58:24 +0200
Message-ID: <CALbNGRRXN5L-TmjUW9e4MxKi-a_jgX=2p17xXPzS+-nt5Q4HUQ@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-gnome 2/2] libnotify: update to 0.7.5 and drop libnotify3
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
X-List-Received-Date: Thu, 18 Apr 2013 07:16:11 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 17, 2013 at 4:01 PM, Koen Kooi <koen@dominion.thruhere.net> wro=
te:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Op 17-04-13 15:49, Andreas M=C3=BCller schreef:
>> removing tests drops dependencies on gtk
>>
>> Tested by:
>>
>> * building nautilus3 (the only recipe found depending on libnotify3) *
>> running xfce-based image and checked notififations
>
> The problem with libnotify was (is?) that it removed some API that GNOME =
2.x
> depends on and later introduced API that GNOME 3.x depends on, hence the =
2
> recipes. Do all the GNOME 2.x bits build against this new libnotify? The
> error was a build break, so it things build, they are likely to work :)
>
> regards,
>
> Koen
>
Martin's world shall let us know

Andreas


