Received: from mail-lb0-f175.google.com ([209.85.217.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SB6BM-0005jj-Ub
	for openembedded-devel@lists.openembedded.org;
	Fri, 23 Mar 2012 16:13:37 +0100
Received: by lbbgi4 with SMTP id gi4so2484724lbb.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Mar 2012 08:04:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=hc68Tbm4HjT0+nzofY0okY+bnnU1+bM+aANeIvwftaY=;
	b=ieAyTXeqAPy277anwTssRUPUOUeLdghJfeJK3IKTFkIA6e79QTLvh1o0CuBH+D54jR
	LjSUGgs1oLWtANobZ1x20O8Gzf4Nuw7KT//KA0p8MNoyj3Caia2iORsDoXY1k14fEaDY
	Wxdxn6a4m/MBVfuM1jkhH3awX7Y9y0mW20ycTEqDSLf6X4PiQfEaQ1cXcEKg+9pYzj3X
	JTRbLAsBoehNGIbuO8pOLwvI7D1F+IB+bzCSk0c3YM0QXP5UtbceJ7rRCtgggf29bw4v
	L/hWINVIYe1Vup1aRkFu4iAeRlMxl+CdT6AbKN2k41GwJrACFqP+YoV8jjusYYo2nYAk
	PnOg==
Received: by 10.112.37.73 with SMTP id w9mr4475958lbj.22.1332515080648; Fri,
	23 Mar 2012 08:04:40 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.152.2.71 with HTTP; Fri, 23 Mar 2012 08:04:10 -0700 (PDT)
In-Reply-To: <20120323140606.00eb484a@eb-e6520>
References: <1332487454-14897-1-git-send-email-koen@dominion.thruhere.net>
	<20120323140606.00eb484a@eb-e6520>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 23 Mar 2012 08:04:10 -0700
Message-ID: <CAMKF1sq742W527ubkcaqyOu5uQ_hDD4ijSHdKq8CeFZKFs5i_Q@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][toolchain-layer][PATCH] toolchain-layer: move binutils and gcc from meta-oe into here
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
X-List-Received-Date: Fri, 23 Mar 2012 15:13:37 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 23, 2012 at 6:06 AM, Eric B=C3=A9nard <eric@eukrea.com> wrote:
> Le Fri, 23 Mar 2012 08:24:14 +0100,
> Koen Kooi <koen@dominion.thruhere.net> a =C3=A9crit :
>
>> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> Acked-by: Eric B=C3=A9nard <eric@eukrea.com>
>

Looks good now

Acked-by: Khem Raj <raj.khem@gmail.com>


