Return-Path: <changhyeok.bae@gmail.com>
Received: from mail-ua0-f173.google.com (mail-ua0-f173.google.com
	[209.85.217.173])
	by mail.openembedded.org (Postfix) with ESMTP id A743D77BC1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Oct 2017 01:03:00 +0000 (UTC)
Received: by mail-ua0-f173.google.com with SMTP id l40so2157627uah.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Oct 2017 18:03:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to:cc;
	bh=7jcDb5dQV4dyHMkTbRbNgEWBCV0gmEahcfWvSMWafEI=;
	b=Wh+JgRZj5z/MsG74rlW6Z85wWJvmO3Q5LWcrQIzgFJI6s6ZAhMtWGNBYtNpvLcg5L7
	bHM9Ght3J1G5V0I51MJpZm0ZyFCI3k5D+Uj5BDX92iKbiGEbpkM0xNjO2KgeQex4fj6y
	COCY827vrDx5pxwLqiiZKvUHlJ8lgPfnzL1tRHCSTdADXLag5NcTFHsSCHGpTx3uNccD
	7bMlklthovsucYkslTJ3s2YhXvsVceJlsKZc+bFG+KDGguIV2BA2WUhrJmkVsNWXycEj
	VbgT08Kn/00NjRUdEdg6UvB2idJj+vwQ25ADAAcD7iLdsD2UkoncYC0bHKuv91mwhR7m
	sr3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
	bh=7jcDb5dQV4dyHMkTbRbNgEWBCV0gmEahcfWvSMWafEI=;
	b=jz2G8Xw04VsrzBj5OCUMeDLe6aIo0b5RyFbDcZ3SinBMiVuhfelA3pvUjRAUmciWT6
	AFLqBWL/n1myoC+ukyJVk9nWL2tjJHGTwBxyBfXMXih3vmQPSZv9ruJW93RFJm163tOA
	Vq542VicxKoemtvfxT8yUhC/Nh7bg0yXJOikrpQQ/xn28CKNLSNAXscCawFcYcZ1UKFo
	T+IapTLYUA+usTNC2S7kImRA86BHvCvirMqxtsU77C6t5uv4j1iiVyqKHEGoOOeZ3c0I
	qHvNdJvey4fiXzdWizQ97cSdErNS9vJV08mkgCnIdQUWzwytvEOcRYH6QikolgElQvDr
	SOuA==
X-Gm-Message-State: AMCzsaWA4uQ2QYzRKrxbWIBwfip14cBnXpIhCIWXLjm9dNU8lTxyHyHF
	Wroc0aA/Lw88gseDcjVpClYEk4ip6Avw/jv5fOw=
X-Google-Smtp-Source: AOwi7QBpaeYIWjZ1ZhGVxgY5cR85THVxEdBkaqQ38hWBczzoxQhE4f3HCwQMxffW1cp3YzS4b0akoyZCxQw4FfiEdzg=
X-Received: by 10.159.63.15 with SMTP id h15mr761853uaj.156.1507770181654;
	Wed, 11 Oct 2017 18:03:01 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.76.69 with HTTP; Wed, 11 Oct 2017 18:03:01 -0700 (PDT)
From: Changhyeok Bae <changhyeok.bae@gmail.com>
Date: Thu, 12 Oct 2017 10:03:01 +0900
Message-ID: <CACrLJgCiTiQyCjtfzSkhHzMtBTtxF6j2=cdjxQ2byb0Cihg1uQ@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>, otavio@ossystems.com.br
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: Stephen Lawrence <stephen.lawrence@renesas.com>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: [meta-qt5] Keep Qt 5.6.x
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
X-List-Received-Date: Thu, 12 Oct 2017 01:03:00 -0000
Content-Type: text/plain; charset="UTF-8"

Hi maintainers

Qt 5.6 is LTS version and not GPL3 license.
So why don't you keep v5.6.x in master branch?
Many companies, opensource projects and developers would like to use Qt
v5.6 in master branch to use it with latest yocto release.

Thanks
Changhyeok

