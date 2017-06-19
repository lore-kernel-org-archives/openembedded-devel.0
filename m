Return-Path: <maryan.pricak@gmail.com>
Received: from mail-qk0-f177.google.com (mail-qk0-f177.google.com
	[209.85.220.177])
	by mail.openembedded.org (Postfix) with ESMTP id B5DD6780AA
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Jun 2017 14:58:05 +0000 (UTC)
Received: by mail-qk0-f177.google.com with SMTP id d14so35389528qkb.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Jun 2017 07:58:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=mGxchgUDxQCPZ6M5ftAnZZQD5k7U6bOPVnQHktO0xso=;
	b=H63uFdgvTscKc2AQB39og1mY/ZjTVp71DJuxPl+DmnTqR59FHaNpP/k2J2oGRh90DB
	V66ztdkSerAzmGqcyjeIYgVd4a4i5zk2JuG9vUVhmvm+ZNXShG8nEt70Kvv0boa/Yd4s
	q+8tC4Ke3zRIfwnZ4wKPbaBJreXRycdUkJHnq75ENU4a8Es3o7vt6FB4LAfZVvRzZpkV
	AhRdb+ToJnL15kaSRtEH+JcnhyTPoO7seGktY2LMg9GclwI69UaIV4abL9CrSwHk0YSX
	l4XJl3rKgMktuYMPVIB+7ZXfBRcEM1Zm7yFoQ2zyoMwdQDBovS1gM+3OOidfOuR0dV71
	VGmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=mGxchgUDxQCPZ6M5ftAnZZQD5k7U6bOPVnQHktO0xso=;
	b=DOsndG7FJY2fsUkMFwScUgP3qRunZsqnbtenOKZoVuCtJ8BHR0kA03N4l+aFYntHW8
	TtH5DIDmqG1pN+qi9bs3l3rvUXiPzuDrFvHgsyAq3DWXQad412OJRnoJKVGDlk3XXEM5
	On4JnNYX8pPlGPKodpf5zHx0NBGxCx6Q8+o/DUXSVp19FsDprxZy+qSami6oM+k7u2h8
	mstqJkjRgYpHzCh3B0aW6//uqdcjBdPkYzevoRoFSGoR641ucodu78nLmU4GK+e9b1uh
	iOJy+YJrkEFQxH88LUgEQuc+vhv0fmvp8rE0iekAfZTQ2Dh3Bf/2G6H+9dOJVtJRal6Y
	XSjw==
X-Gm-Message-State: AKS2vOwlHIJItzhPJ+ucfMxS1AnPIojBbO6qnjbktqg7QQQgFtvG+383
	fOuvojWq7Xkz26Pa4M8zBIme2xMwWE1+
X-Received: by 10.55.192.197 with SMTP id v66mr27711582qkv.175.1497884286390; 
	Mon, 19 Jun 2017 07:58:06 -0700 (PDT)
MIME-Version: 1.0
From: =?UTF-8?B?0JzQsNGAJ9GP0L0g0J/RgNGW0YbQsNC6?= <maryan.pricak@gmail.com>
Date: Mon, 19 Jun 2017 14:57:55 +0000
Message-ID: <CAGyDALnwxEvX3AFfbB5thjQy91+9BNmzgyR5RPQetLseZD7hJw@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: (No subject)
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
X-List-Received-Date: Mon, 19 Jun 2017 14:58:06 -0000
Content-Type: text/plain; charset="UTF-8"

Hi all,

I'm trying to build an image that's supposed to be used as rootfs for
container.
Is there a way to build image rootfs without Linux kernel and modules?

BR,
Marian

