Return-Path: <lpapp@archlinux.us>
Received: from mail-pa0-f47.google.com (mail-pa0-f47.google.com
	[209.85.220.47])
	by mail.openembedded.org (Postfix) with ESMTP id 41ED86A961
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  3 Aug 2013 18:11:21 +0000 (UTC)
Received: by mail-pa0-f47.google.com with SMTP id kl13so1783845pab.20
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 03 Aug 2013 11:11:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:x-gm-message-state;
	bh=qQ0EodpFZETDNCwV7j1z7pDtA5jQptRiiHsnjddvRhs=;
	b=WehyfWZNzBS4MXAVp8VZaFghZo9XwDbfGhQPl4/et24Qpw+HNGySqOmkeawaFC+xUV
	BcIv9mg7BwEjqiC4A7WBFomzCJOfJzHsDBE2KcuuP1Bhae7KWBfk3W8wK/AInLz4H/Pc
	lGE+H1qsxc8FLq8MIfVN3U5m6u0CI6HI3UsgICX5aBhXdB4L7l68/kd+Bhe8JKGO44Jq
	hQuHVBt3zCxkK5CqZR/Kv76uj/J8rvJ639JWqbuKJ65weN+0FeRom6GMmvy750vV/dyQ
	s+59Du85sR12lr94jP0rDn/ICZWLyDJkh8nsg5nBKYEY76WVIyBn33MrpXN/xXddoxjY
	+IJw==
MIME-Version: 1.0
X-Received: by 10.68.172.34 with SMTP id az2mr9933631pbc.201.1375553481959;
	Sat, 03 Aug 2013 11:11:21 -0700 (PDT)
Sender: lpapp@archlinux.us
Received: by 10.70.37.237 with HTTP; Sat, 3 Aug 2013 11:11:21 -0700 (PDT)
In-Reply-To: <CAP9ODKrrK9w93N76hc3G9yw_6YkeaGKLy2iK-Z=V7smCRM=rWg@mail.gmail.com>
References: <1375526327-16139-1-git-send-email-lpapp@kde.org>
	<CAP9ODKrrK9w93N76hc3G9yw_6YkeaGKLy2iK-Z=V7smCRM=rWg@mail.gmail.com>
Date: Sat, 3 Aug 2013 19:11:21 +0100
X-Google-Sender-Auth: wEarprGHCr_ecL-dGaVlJ3iP77U
Message-ID: <CAOMwXhNkgFxS+sqEZy6B0Y9+UvK3PBBu6atf1fEn_jyoeH7d2g@mail.gmail.com>
From: Laszlo Papp <lpapp@kde.org>
To: openembedded-devel@lists.openembedded.org
X-Gm-Message-State: ALoCoQnZ1V6nRd10ISyJptEuLV5uszLfErat7OotyOoAipJIwxC7+WHFJmEUU3Kqc51Qzcxxa0NZ
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [PATCH] Add QtSerialPort
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 03 Aug 2013 18:11:21 -0000
Content-Type: text/plain; charset=ISO-8859-1

If you check the second email carefully, it already contains the right
subject...


On Sat, Aug 3, 2013 at 6:50 PM, Otavio Salvador <otavio@ossystems.com.br>wrote:

> On Sat, Aug 3, 2013 at 7:38 AM, Laszlo Papp <lpapp@kde.org> wrote:
> > Signed-off-by: Laszlo Papp <lpapp@kde.org>
>
> Please use the meta-qt5 prefix and rewrite the commit log as:
>
> qtserialport: Add 5.1.0 version
>
> We always put the recipe in question as this makes easier to find it later.
>
> --
> Otavio Salvador                             O.S. Systems
> http://www.ossystems.com.br        http://projetos.ossystems.com.br
> Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

