Return-Path: <raj.khem@gmail.com>
Received: from mail-qt0-f196.google.com (mail-qt0-f196.google.com
	[209.85.216.196])
	by mail.openembedded.org (Postfix) with ESMTP id 7936B60102
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 May 2018 17:06:59 +0000 (UTC)
Received: by mail-qt0-f196.google.com with SMTP id h5-v6so11545193qtm.13
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 May 2018 10:07:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=eQyBGC+kJEoU7QY4K9EZLeTTz7XDh2LWVBhBNbQT5nM=;
	b=oT1Pai6pBStTqmUq1mIHQT4CrbxuZjBbOdGB+pM6285rxQ94i8j+zZjSHDMIUw/MSw
	ICDZAxlGQTBSWTbJhZ+7CBIwr1ZvyYlMQVeBr4cLMUTm3Msot6kJngpzTIihfvexkB1H
	haT+RsZEdSiq+ohUaqO91okvIPBs5Yd/jRA2NVYFbSYgfOhAUvYukaCyMDWSptJw5d8U
	mNKAP8RU04GHPm8117Y139fGFaDw3hD31IijXwzEd15g/RBQudhmX8vSmk+qg4hxh7wV
	11E5Vq5ETHwZRSioJsNh0HoUhzeKlU+U5uDXRgd3FXE50o7TzN3a+6yQITCAvLBG33pO
	RRwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=eQyBGC+kJEoU7QY4K9EZLeTTz7XDh2LWVBhBNbQT5nM=;
	b=pdqWRkxqNhqqBRvh3usOCm7QoDYU2ifBhdvRRcd1bx9kIlqNqPAHh6kGAuYbmQF/W8
	rMAuE0/Y7jiBErDfINMtIaQuyVbgNHos1a9u6IYNYyagCLFI6gAQ2Ti07nQ0M9HvOHwk
	q+pr4uyreEKtx6qbyYRsJ4idZFso5VIg2oOrP3OGrc5/EBolEfx0MXRt9xut9jTbNwnj
	zhHJI+BxI+TG0p6CXh2RoynrjSxwMRwhQ5WwDig/TGeZqMUHHu/FwxNUPqQYirb/uvo8
	PQO4EzBMzhqdr7C6ye+W6zaAWOl3nBvnKpQFGBqYiBBBPLYylzt61+WcoX/9x/sMrPUH
	U2ww==
X-Gm-Message-State: ALKqPwe6VFTaQsRyfE649cut4759ACbRDXm86tLT8sub4uBaNjPyhntf
	fXZW3xCqqjDjwe3oMMxxkW1xlVYioig7OoHoJ3bQBQ==
X-Google-Smtp-Source: ADUXVKK1SzqfShrHRJIyTFv3DksDcafCcTEUCeiDoMjqNNqA+4IUbvidP6NXjaNGkjtNwxXaAxMV64UdWUcRKf85SaU=
X-Received: by 2002:ac8:290d:: with SMTP id
	y13-v6mr17333110qty.376.1527613620462; 
	Tue, 29 May 2018 10:07:00 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a0c:9a0f:0:0:0:0:0 with HTTP; Tue, 29 May 2018 10:06:30
	-0700 (PDT)
In-Reply-To: <CAGKTrWL29mq4rugJ0zn4oN7__jqJDTii=XcEoZgmj8YvRF0E8Q@mail.gmail.com>
References: <CAGKTrWL29mq4rugJ0zn4oN7__jqJDTii=XcEoZgmj8YvRF0E8Q@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 29 May 2018 10:06:30 -0700
Message-ID: <CAMKF1spApD_SvVPcHmqTnpyjcTdyaYOeYHez_H9tts88qZz60Q@mail.gmail.com>
To: Franz Forstmayr <f.forstmayr@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-python] Added python modules periphery and Flask-Sijax
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 29 May 2018 17:06:59 -0000
Content-Type: text/plain; charset="UTF-8"

Hi Franz

On Mon, May 28, 2018 at 11:27 PM, Franz Forstmayr <f.forstmayr@gmail.com> wrote:
> Hi,
> I created a pull request on Github where i added recipes for python
> modules periphery and Flask-Sijax.
> https://github.com/openembedded/meta-openembedded/pull/80
>
> Can someone check, if everything is ok?

We do not use github workflow for patches, please send the patches or
pulls to oe-devel mailing list.

https://www.openembedded.org/wiki/How_to_submit_a_patch_to_OpenEmbedded

