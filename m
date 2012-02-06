Received: from mail-lpp01m020-f175.google.com ([209.85.217.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RuQYQ-0003Yd-Gq
	for openembedded-devel@lists.openembedded.org;
	Mon, 06 Feb 2012 16:32:30 +0100
Received: by lbol12 with SMTP id l12so1106340lbo.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 06 Feb 2012 07:24:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=HqdxWyALUufCAONBOt925UoEsEEEYt5+N1M5pdNNly0=;
	b=JazMccCarltI+9g1rsJYGApJe40JbR+TsYaPky/ybIZAMFcAk6BgY9WaS9V7M9Ewy5
	iA5rqzJgkCVCC/U9/k85B+JZCbZSNpRpMrzNqvaKoqFOOYPLf7FBsEJPhBhKwYUrMVsT
	mdaqTnTrYiJH/qzmZcUjL2OtQ5RQrNaeQa0tE=
Received: by 10.112.32.1 with SMTP id e1mr5057240lbi.3.1328541869243; Mon, 06
	Feb 2012 07:24:29 -0800 (PST)
MIME-Version: 1.0
Received: by 10.152.5.201 with HTTP; Mon, 6 Feb 2012 07:23:59 -0800 (PST)
In-Reply-To: <4F2F82D6.1@emagii.com>
References: <4F2F82D6.1@emagii.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 6 Feb 2012 07:23:59 -0800
Message-ID: <CAMKF1sp+rDreBJPo4fRToeEkSJQa0tRt_3yamyOcwhvfepz8Kg@mail.gmail.com>
To: Discussion of the angstrom distribution development
	<angstrom-distro-devel@linuxtogo.org>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [Angstrom-devel] Improving boot time of first boot (Precompling icon-theme.cache files).
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
X-List-Received-Date: Mon, 06 Feb 2012 15:32:30 -0000
Content-Type: text/plain; charset=UTF-8

On Sun, Feb 5, 2012 at 11:35 PM, Ulf Samuelsson <angstrom-dev@emagii.com> wrote:
> When I first load a system:
> * built using Angstrom on top of OE-Core
> * File system NFS mounted.
> it takes about 20 minutes before the boot completes.

hmm. How does it go from non nfs mounted rfs.
what is your system specification. what options do you
use to mount nfs ?


