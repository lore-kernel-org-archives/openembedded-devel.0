Return-Path: <armccurdy@gmail.com>
Received: from mail-qa0-f51.google.com (mail-qa0-f51.google.com
	[209.85.216.51])
	by mail.openembedded.org (Postfix) with ESMTP id 45F6A6E3BB
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 22 Feb 2014 10:06:26 +0000 (UTC)
Received: by mail-qa0-f51.google.com with SMTP id f11so4409003qae.24
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 22 Feb 2014 02:06:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=w0maPPcUc5F+w9qV7tNhZwiE3Y/fS6HX2RAy8Y0LwWM=;
	b=KXhgiq4owDYvVYFrKrRcYe7Osmo6tMdjIgozhhh0OHlBOO0kcTJ7x53rlFHUP+RRTG
	WneG6bHE8yNCXIUNwVK0g8O+v3nQ0Xv8jkw6Ytqdk2GI6KUUIgPpTYjvc7I+b58US97R
	yj8F5Q1VyNFdOw3uuR4JFmrqDMTlgPZN2/zlvjmGDyC0vI4/XkMnehgJSj5vGh9rLsZx
	eo2nHBeANBVD5B/xSb8JHDZvCayiTP7MlizabjlJnfBYxS9cRlVzxUkqGiIWeQUvy19G
	Dj0B9C9UBq0nMqW5Z/lY6EmrgcVc4vsCp7S7TjK/7pvVGRII57OUXkR2pwVdCdkp8zs/
	LC6Q==
MIME-Version: 1.0
X-Received: by 10.140.107.53 with SMTP id g50mr15524344qgf.63.1393063586697;
	Sat, 22 Feb 2014 02:06:26 -0800 (PST)
Received: by 10.96.5.70 with HTTP; Sat, 22 Feb 2014 02:06:26 -0800 (PST)
In-Reply-To: <20140222082502.GL3854@jama>
References: <1393047007-20507-1-git-send-email-armccurdy@gmail.com>
	<1393047007-20507-2-git-send-email-armccurdy@gmail.com>
	<20140222063919.GJ3854@jama> <20140222082502.GL3854@jama>
Date: Sat, 22 Feb 2014 02:06:26 -0800
Message-ID: <CAJ86T=X-_W7f0b_ETddH3qJubAfGULBNVZqzKuxtMQP0xUBtaw@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-qt5][PATCH v2 2/2] qtwebkit-examples: add RDEPENDS for ca-certificates
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
X-List-Received-Date: Sat, 22 Feb 2014 10:06:28 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Sat, Feb 22, 2014 at 12:25 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
>
> I've added comment in qtbase.inc and integrated this to master-next.
>

Great! Thank-you Martin and Khem.

Andre
--

