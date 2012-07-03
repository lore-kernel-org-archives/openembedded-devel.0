Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1SlxgN-0003Pm-6j
	for openembedded-devel@lists.openembedded.org;
	Tue, 03 Jul 2012 09:37:59 +0200
Received: by yenl13 with SMTP id l13so4690964yen.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 03 Jul 2012 00:26:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=2hbYM/HLTw2MnP9LsVVpHgF3lEP69fD1vn8Jb+1rtLk=;
	b=xmfUO3xnRgkVnZrWS8EY2BuW86iLvI09oshP3e50bt1JE8cOT1TjJ+RLZLL47Uk6eQ
	aQqfjlYW2m5XUiJOikafOID5CfPaseBFdU8+PMvxPWcbLCEAt+I6lGVV9Kds/PEC/Xwk
	G/GZbKx76eWE7wZu+JaqQHkijvMWqGSk413a+JwLh05Xz+iVwR5OB3ciuYyyNaG2VmQl
	FUE6XGuGGFEYYWLOQ6O+9z3wkEePxUE7UDHEkKgxmNm9YaMqzbXEs7CBqJwYWk2uH58m
	BM7w4Rbo4NY1+I1NeuyaqFcrJUwjaiQRT82H+PSuVsEuR8gDI2qAIsP7XxCr6G1+jMnW
	xk8A==
MIME-Version: 1.0
Received: by 10.50.180.138 with SMTP id do10mr7565810igc.36.1341300417016;
	Tue, 03 Jul 2012 00:26:57 -0700 (PDT)
Received: by 10.64.9.165 with HTTP; Tue, 3 Jul 2012 00:26:56 -0700 (PDT)
In-Reply-To: <1340210721-21548-2-git-send-email-schnitzeltony@googlemail.com>
References: <1340210721-21548-1-git-send-email-schnitzeltony@googlemail.com>
	<1340210721-21548-2-git-send-email-schnitzeltony@googlemail.com>
Date: Tue, 3 Jul 2012 09:26:56 +0200
Message-ID: <CALbNGRRCX7Sc=t=LrsN3zpfPf_n8XL79Dvb0N1AjtscXVzsr9Q@mail.gmail.com>
From: =?ISO-8859-1?Q?Andreas_M=FCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-xfce 2/2] task-xfce-extended: remove xfce4-icon-theme
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
X-List-Received-Date: Tue, 03 Jul 2012 07:37:59 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 20, 2012 at 6:45 PM, Andreas M=FCller
<schnitzeltony@googlemail.com> wrote:
> xfce4-icon-theme is not required by default since xfce4-settings initiall=
y
> works with gnome-icon-theme and gnome-icon-theme is pulled in by many oth=
er
> recipes anyway.
> To reduce rootfs size - especially after gtk-update-icon-cache -
> xfce4-icon-theme is removed.
>
> Signed-off-by: Andreas M=FCller <schnitzeltony@googlemail.com>
> ---
ping


