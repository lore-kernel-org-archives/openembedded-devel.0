Received: from koncepto.io (koncepto.io [195.154.119.111])
 by mx.groups.io with SMTP id smtpd.web12.15148.1594227184941734465
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Jul 2020 09:53:06 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@koncepto.io header.s=default header.b=MHS8h/KT;
 spf=pass (domain: koncepto.io, ip: 195.154.119.111, mailfrom: pjtexier@koncepto.io)
Received: from [192.168.1.17] (lfbn-bor-1-1339-171.w193-250.abo.wanadoo.fr [193.250.150.171])
	by koncepto.io (Postfix) with ESMTPSA id D2F9D601D7;
	Wed,  8 Jul 2020 18:53:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=koncepto.io;
	s=default; t=1594227181;
	bh=jOt4BbLy2VhvxmX0gDl3NJKmW0dtTs2TgPk010nQriA=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
	b=MHS8h/KTyEyo1xGS8UqqYJiuHV8COw+kDI9ilQVxD7XlhZU2ZDa55vjzmJEmgObeX
	 VqjvFr5JGXAnCH3prvfnD8CnwLZpTsJ2GPftLT+4HLw4FqctmBXVv/ACPxEFr8HhxW
	 FUaO8KitZNYHeKxexNQf4QP+iHB13Ptbb9aMA4zHjEvD0tELyOHqO7xP3tmQfmN2VW
	 LP9DnCOu4DoYzvthj1GVRPr49NN0J58rr5Iit2lMJ47ILcC4AGgJSmXkOKBhWW7qWM
	 XBBTf1vf2Jn9MAs9tHDrOUpsXhPkYPeiWZ3bwy3hOp0cjk1Pi/1S8PZgRDyzw7ht1O
	 zFdMb841ZHPGQ==
Subject: Re: [oe] [meta-oe][PATCH 1/2] zchunk: upgrade 1.1.5 -> 1.1.6
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
References: <1591012275-14454-1-git-send-email-pjtexier@koncepto.io>
 <1618663E8BD13912.1568@lists.openembedded.org>
 <CA+chaQecTj9VO2JPwFkDWivKRg2Q51ViFeaNDv1HD_BguhwNPQ@mail.gmail.com>
From: "Pierre-Jean Texier" <pjtexier@koncepto.io>
Message-ID: <926e2f31-b5bc-83d9-2b1d-af6f74102e31@koncepto.io>
Date: Wed, 8 Jul 2020 18:53:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <CA+chaQecTj9VO2JPwFkDWivKRg2Q51ViFeaNDv1HD_BguhwNPQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi Martin,

Le 08/07/2020 =C3=A0 09:53, Martin Jansa a =C3=A9crit=C2=A0:
> Now the same upgrade was merged to dunfell, are you going to fix it?

It seems I missed you're first e-mail, sorry about that.
On my side, I didn't see this failure during the upgrade.

I will check that.
--
Pierre-Jean Texier
Embedded Linux Engineer
https://koncepto.io
