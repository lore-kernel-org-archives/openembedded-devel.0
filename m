Return-Path: <schnitzeltony@gmail.com>
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com
	[209.85.210.50])
	by mail.openembedded.org (Postfix) with ESMTP id A6FCE6BA9D
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Aug 2019 11:52:25 +0000 (UTC)
Received: by mail-ot1-f50.google.com with SMTP id o101so18329640ota.8
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Aug 2019 04:52:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=L/sf6uHRBtCT4RDH9JVTg01jQaVUq5o7pfjwiRbw+BM=;
	b=XAyzhG9u9iYqSZ8VZbbASYMugOysm20Wl4Y6kUj5Xd+TGxO4dvt8DSXexuI0wjg2Ov
	7I/AUWgIYS4bOcEizOLvffepYgLkz4ALq72mOqkQ3akKZzgT8+Vt/hloN2QhQk0cLZty
	aHB1vLxfcgUms2Hj5gzV2ymM37KN8xFTKD4eQdmR0jagBDJUpQt/PVLj30UGdMcKQk3X
	gsf2b4G9E56CgdZ/NdICSjqqT78dLDjt08P8wRkiT/EZKFZEaBKodf/UZwKmvzkJcmJ1
	tsn5w1KIJFbcRd5jxPryzs6bhovwdWeKjLToayoRM/p/tIzXkGfHN58+uN/eIB/wcgMv
	BB5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=L/sf6uHRBtCT4RDH9JVTg01jQaVUq5o7pfjwiRbw+BM=;
	b=agj0nSkg+VaDuKYvfP4eWxbXHZFn1/2Go5JrZE47ul21JgYTw04BMl9s7TKO4yJ4uI
	4WZc4BLAXwLXcM0reJIugXpzORiUC8lRuXd0+J+9Iv7TQ7DLYPoYDkblmuO7KEW/IdFm
	UMNlR5bnDzB7Xlcj0F7hk7f2Cou32x/4OPNHnzvoX9TutfVqc+g5A6NmohEBLuwmqCdx
	7PBsP54EPZFLqwhqm3iKXJuf8xrFwXIF7faMBa0LKybqQPweDB8EIatt+vI7sxku/RDO
	yPHk4PqXTIw2+5X7yPiBjMrhcbRgHhKMH8QkoPlEzPcIyyNvmstLv6NIhQxQL70HgOxZ
	tlOg==
X-Gm-Message-State: APjAAAV3lyb2jvUmetvdqyv4O0O4oA+695Ku7ZdRiP82M0QxMcZn+yEl
	x/8000MzHbggq9SHSNifgQpitO+xR2pjnGERmjw=
X-Google-Smtp-Source: APXvYqxAxiNVSQFI3X+9maTqKYAPXZOqIDincYgf092uiun6o32VH6KpivgETLErK2b9wpOHUewDdjRxn/mLOXQVr2s=
X-Received: by 2002:a02:1441:: with SMTP id 62mr44564749jag.21.1565697146480; 
	Tue, 13 Aug 2019 04:52:26 -0700 (PDT)
MIME-Version: 1.0
References: <20190813092118.113213-1-kai.kang@windriver.com>
	<20190813092118.113213-17-kai.kang@windriver.com>
In-Reply-To: <20190813092118.113213-17-kai.kang@windriver.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Tue, 13 Aug 2019 13:52:15 +0200
Message-ID: <CALbNGRRyDdcCN2HZkr7F_833ygNct2oGRbnw1pUhiBGvaaRtng@mail.gmail.com>
To: Kang Kai <kai.kang@windriver.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-xfce][Patch 16/16] xfwm4: 4.13.3 -> 4.14.0
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
X-List-Received-Date: Tue, 13 Aug 2019 11:52:25 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Aug 13, 2019 at 11:24 AM <kai.kang@windriver.com> wrote:
>
> From: Kai Kang <kai.kang@windriver.com>
>
> Signed-off-by: Kai Kang <kai.kang@windriver.com>
Thanks!

Just checked versions against announcements: looks good. If I am not
mistaken Xfce4-screensaver is part of core XFCE - recent update is
missing here

There is a bunch of panel-plugin updates - shall I prepare a series
for them - or are you already working on them?

Andreas

