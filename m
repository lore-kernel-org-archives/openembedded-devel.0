Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 913A5EB64D7
	for <webhook@archiver.kernel.org>; Mon, 26 Jun 2023 12:12:23 +0000 (UTC)
Received: from mx.walter.deinstapel.de (mx.walter.deinstapel.de [62.176.232.99])
 by mx.groups.io with SMTP id smtpd.web11.6210.1687781485935969991
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 26 Jun 2023 05:11:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fancydomain.eu header.s=mail header.b=VnpctMvw;
 spf=pass (domain: fancydomain.eu, ip: 62.176.232.99, mailfrom: jasper@fancydomain.eu)
Date: Mon, 26 Jun 2023 14:11:22 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fancydomain.eu;
	s=mail; t=1687781484;
	bh=xVLU/TeEGoIkuQxyribU9Inux09tSb7NF+Nuj4xIeYc=;
	h=From:To:Subject:In-Reply-To:References;
	b=VnpctMvwfuZtPnQq+ld33ryG794c2otIBSfHmMsU8Fq8KGdAiD4g61HiF3ZLR9Qgz
	 ZfWzEMt6gNZkIs/AkqwBJqiRsCxapcpt5jVYH3Y09yWg+N5T/33Dq96SmmN3w3jcda
	 3lrvMlE214GXuXemcc+u1vYRmtIegYzWQuxNLNIEJY5SnYTwMFMi9Os+bJ2fEHRjrM
	 bIpY2vwQRMOcqPnAX4THU8NvZBqQKhtZY1rZle4qLTaDifjmqGSpS29sxYsZqCS2yR
	 aptLZ76jq5gj3cegNGBU6Sr36zbeZRMhqqe+cJWHLd9QJih2ZGAUBWUve1DFJs3Jyd
	 ozSg7YEjFifbw==
From: "Jasper Orschulko" <jasper@fancydomain.eu>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-python][PATCH 3/3] python3-platformdirs: Fix recipe version 3.6.0
In-Reply-To: <20230625213959.2791472-3-jasper@fancydomain.eu>
References: <20230625213959.2791472-1-jasper@fancydomain.eu> <20230625213959.2791472-3-jasper@fancydomain.eu>
Message-ID: <D951DCE1-FC91-43E9-A2FD-FB0BF44DDEA0@fancydomain.eu>
Mime-Version: 1.0
Content-Type: multipart/alternative;
 boundary=----L2ZYU595FK7TQ6YPLKP6J0RA4P06RH
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 26 Jun 2023 12:12:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103584

------L2ZYU595FK7TQ6YPLKP6J0RA4P06RH
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

Recreated as v2 due to missing sign-off=2E

------L2ZYU595FK7TQ6YPLKP6J0RA4P06RH
Content-Type: text/html;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE html><html><body><div dir=3D"auto">Recreated as v2 due to missing=
 sign-off=2E</div></body></html>

------L2ZYU595FK7TQ6YPLKP6J0RA4P06RH--

