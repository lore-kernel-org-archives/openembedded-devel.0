Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f45.google.com (mail-yh0-f45.google.com
	[209.85.213.45])
	by mail.openembedded.org (Postfix) with ESMTP id D6E0466078
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  2 Jun 2014 13:28:03 +0000 (UTC)
Received: by mail-yh0-f45.google.com with SMTP id b6so3755520yha.18
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 02 Jun 2014 06:28:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:content-type;
	bh=+akfzhHIDfCm/p0GRRVKMh5hl1jN38BfKpDDgjiB7ys=;
	b=WIEB/rwNHl270sDNAtYj4TARsl7MxkCzVOrb/84IxYYz3JiJcF6hjgbFW4NkMG+PjU
	/ib62siO0H2f0LX9sdogawa3l9l6RR89b41tDjxKFs806bjImdI+sOt7tyzDCuDnEDGo
	U/gK1GnuS+fjyA1r2Dw62EBaihu+2yWnyGPVhzsKeoYvy8rTNt+3jPSKfo9pxDHZNTPd
	WA35duRPSvAh8Lrjn22gDQXBUCsOu8V9RuyYhB0V9UBAe/L1cDN8IYLus0rsvTROwTvg
	1k0rKZCCZIlg912koggk0ZBnqtAHoW47CTpJtU3cfzH+Yvk1xX+GqOB0Rg4eFKmSvzRw
	QzgA==
MIME-Version: 1.0
X-Received: by 10.236.162.130 with SMTP id y2mr52481812yhk.78.1401715684433;
	Mon, 02 Jun 2014 06:28:04 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.170.166.213 with HTTP; Mon, 2 Jun 2014 06:28:04 -0700 (PDT)
In-Reply-To: <CAAPegz1J+4vrvOF3F9Rj11_0-Lhd0ybFFci-_UXgLtVBhxreYg@mail.gmail.com>
References: <CAAPegz1J+4vrvOF3F9Rj11_0-Lhd0ybFFci-_UXgLtVBhxreYg@mail.gmail.com>
Date: Mon, 2 Jun 2014 10:28:04 -0300
X-Google-Sender-Auth: A9YW7JuWqCT544jndRYGKa-PQtA
Message-ID: <CAP9ODKqH3W5VKVWmriVeCTn1Yw5tZCWSSeLoHQJReDEDW2d=BA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] dfu-util 0.7 recipe, remove old 0.1 recipe
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
X-List-Received-Date: Mon, 02 Jun 2014 13:28:06 -0000
Content-Type: text/plain; charset=UTF-8

On Sun, Jun 1, 2014 at 2:42 PM, Chris Morgan <chmorgan@gmail.com> wrote:
> dfu-util 0.7 is the latest release of dfu-util
>
> Remove old dfu-util 0.1 recipe
>
> Signed-off-by: Chris Morgan <chmorgan@gmail.com>

From the previous discussion it seems there is not reason to keep 0.4
around. So maybe it'd be good to remove it as well here?

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

