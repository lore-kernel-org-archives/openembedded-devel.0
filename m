Return-Path: <peter.hoyes@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29AE6C25B78
	for <webhook@archiver.kernel.org>; Tue,  4 Jun 2024 09:21:00 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.16906.1717492855496584393
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 04 Jun 2024 02:20:55 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: peter.hoyes@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 741F21042;
	Tue,  4 Jun 2024 02:21:19 -0700 (PDT)
Received: from [10.1.198.41] (e133390.arm.com [10.1.198.41])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C61E03F762;
	Tue,  4 Jun 2024 02:20:54 -0700 (PDT)
Message-ID: <39f014bb-e857-4d3e-82b2-503f5697ac16@arm.com>
Date: Tue, 4 Jun 2024 10:20:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-python][scarthgap][PATCH 2/2] python3-twisted: prepend
 split PACKAGES
To: openembedded-devel@lists.openembedded.org
References: <20240506185443.3715-2-gudnimar@noxmedical.com>
 <14642.1717435562189529921@lists.openembedded.org>
Content-Language: en-US
Cc: ross.burton@arm.com
From: Peter Hoyes <peter.hoyes@arm.com>
In-Reply-To: <14642.1717435562189529921@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 04 Jun 2024 09:21:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110686

Thanks Gu=C3=B0ni for preparing this fix - this bug is affecting our team=
 at=20
Arm too. An update on when this is likely to be merged into scarthgap=20
would be appreciated :)

Peter

On 6/3/24 18:26, Gu=C3=B0ni M=C3=A1r Gilbert via lists.openembedded.org w=
rote:
> I see this patch was not included in the current scarthgap-next=20
> branch... friendly reminder in case this was forgotten :)
>
> If there is something wrong with this patch let me know.
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#110673): https://lists.openembedded.org/g/openembed=
ded-devel/message/110673
> Mute This Topic: https://lists.openembedded.org/mt/105945947/5715260
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[peter.hoyes@arm.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

