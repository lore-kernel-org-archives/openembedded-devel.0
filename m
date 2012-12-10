Received: from mail-vb0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1Ti8Yx-0005g0-Pi
	for openembedded-devel@lists.openembedded.org;
	Mon, 10 Dec 2012 19:58:47 +0100
Received: by mail-vb0-f47.google.com with SMTP id e21so2761217vbm.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Dec 2012 10:44:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:x-originating-ip:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:x-gm-message-state;
	bh=IGBFuTdz3UzD4NRfa01XiPh+51jCHE/uPcIDuwudQjY=;
	b=M74myZo5c5amRL5TqHXAd2Cu8YCyBIq9SqyQnF7Hm/v6qqGYMM61ZWAH8k79gjqDoy
	GMzLDYwT43tmnBX7+2uPw6I1/EiCsgGv1cPc9czkn3Qr5ujZFaY3siJhNRaJ3HjYqWrs
	mC+x6TzxrO9e/FAEzu0MLz77MPmt/lM1W9NHGge4/NnP62QfO6L2vnv1v6UIAbzKjlKq
	2n6zR6B1G6SzHyGjUvkPgozpXCyKZgoIeegTwCRuJZOngo6WyQj0JczoZPHAf7KS4w78
	czL3qeiIrd2l7ZtmNagFqgktvHJEXlbjJS5MlpxyZhMWDCAvvnhiKl8Fgd1RNaWnGvRw
	INfg==
Received: by 10.52.26.115 with SMTP id k19mr8343999vdg.67.1355165056396; Mon,
	10 Dec 2012 10:44:16 -0800 (PST)
MIME-Version: 1.0
Received: by 10.58.102.132 with HTTP; Mon, 10 Dec 2012 10:43:56 -0800 (PST)
X-Originating-IP: [82.137.10.190]
In-Reply-To: <20121210183031.GA3331@jama.jama.net>
References: <20121210105047.B3BC61033D@opal>
	<CAK18fxE0L2riJGvnK9LkZPF=Q7JUxPkKykKFZXwbsm0mnD_G2Q@mail.gmail.com>
	<20121210183031.GA3331@jama.jama.net>
From: Andrei Gherzan <andrei@gherzan.ro>
Date: Mon, 10 Dec 2012 20:43:56 +0200
Message-ID: <CAK18fxHemq=p574Vie7cteofZkUzU0KkUqxTXGvwKdipB+u0Eg@mail.gmail.com>
To: openembedded <openembedded-devel@lists.openembedded.org>
X-Gm-Message-State: ALoCoQkVk6ts66ZPNi+XDfQshBwL+W7zxZE+nmA7UMrKKdhPFpCLupV52z+wZvGraToSW6zfBMFc
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] Koen Kooi : Revert "qt4: rename bbappends to match new 4.8. 4 version from oe-core"
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
X-List-Received-Date: Mon, 10 Dec 2012 18:58:48 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Dec 10, 2012 at 8:30 PM, Martin Jansa <martin.jansa@gmail.com>wrote:

> On Mon, Dec 10, 2012 at 12:51:15PM +0200, Andrei Gherzan wrote:
> > Any chance to have this merged soon?
>
> Are you asking about oe-core patch? Because asking about merging
> something on oe-commits ML does not make much sense.
>
>
Aaaaaa... silly me. Thanks.

Andrei

