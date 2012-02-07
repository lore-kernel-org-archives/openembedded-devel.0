Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1Ruo8d-0001AJ-UK
	for openembedded-devel@lists.openembedded.org;
	Tue, 07 Feb 2012 17:43:27 +0100
Received: by lahc1 with SMTP id c1so4214565lah.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 07 Feb 2012 08:35:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=KeFlGQThF5u0zWfj2q1wtjjaSVAJRzNVNEyfz62JJbE=;
	b=LauMJRqnMCZ6mDYtbUSKoSEPk3C1A7Qr/eWIcFWDTCEuOy2Et2olZ1fxiCH62NhjoZ
	ImK1CtbHKrKmj/mDCS88khKXke/CCAvNkfBjR9JjsBlQEb4chX1UnvcT0Y+3vw1AHFgd
	nkXiyf60h2hEEWSEipPMLlhjNEy0JXSc5lDr8=
MIME-Version: 1.0
Received: by 10.112.8.41 with SMTP id o9mr3272641lba.9.1328632525584; Tue, 07
	Feb 2012 08:35:25 -0800 (PST)
Received: by 10.112.102.165 with HTTP; Tue, 7 Feb 2012 08:35:25 -0800 (PST)
In-Reply-To: <1328627573-5217-1-git-send-email-schnitzeltony@googlemail.com>
References: <1328627573-5217-1-git-send-email-schnitzeltony@googlemail.com>
Date: Tue, 7 Feb 2012 17:35:25 +0100
Message-ID: <CALbNGRSLWbSeg2+emALSf+t0T+9vfRhj5Mq1gFa3otQuO-z4-Q@mail.gmail.com>
From: =?ISO-8859-1?Q?Andreas_M=FCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][RFC 00/27] systemd / initmanager rework
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
X-List-Received-Date: Tue, 07 Feb 2012 16:43:28 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 7, 2012 at 4:12 PM, Andreas M=FCller
<schnitzeltony@googlemail.com> wrote:
>  What I have already
> =A0detected after a build from scatch is that /var/lib/opkg is missing in=
 the
> =A0image (although it can be found in libopkg.ipk).
Hmm Last night I had a build from scratch without these patches and
have the same - this seems a different issue...

Andreas


