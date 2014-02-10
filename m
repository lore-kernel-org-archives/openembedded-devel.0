Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ve0-f169.google.com (mail-ve0-f169.google.com
	[209.85.128.169])
	by mail.openembedded.org (Postfix) with ESMTP id D05656E746
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Feb 2014 08:36:28 +0000 (UTC)
Received: by mail-ve0-f169.google.com with SMTP id oy12so4814994veb.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Feb 2014 00:36:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=mT7IbRrU7CWHDwpOCJIH7MaE0mE3oF43YsRPv1RRcEc=;
	b=bjabubYoRbhup7WOKOvXbXP0kr/+Pq+ey40jwvZ5UxehcVOVgF1JAseZe5D8rogRRh
	qR8xiOOGQ+o/EWFYshkyFIeTlTu9ND2fHQbkZIuBwLhX2PKlXIe4O9/YrGBpTB7fJkUM
	38n0Vu0585j5YgrqYOHD1llevmo+JaBtm5le4xNiip87M2Hy9OCfFeE/q7J/Z47bXsSO
	N63KKkk27zknaSGcH4dSl59hlPKnLilw0P1na4QcgDFPBOLJHZ+IBL/d2EkyvkpYCMKZ
	Ke7LYq/OVQ7I/sszsH7Pb26nQknPhN/jz03M3FAD9THkJ0TKJAqSPf9XNEiJgXnk6icg
	DWiQ==
MIME-Version: 1.0
X-Received: by 10.58.69.111 with SMTP id d15mr22665449veu.3.1392021388911;
	Mon, 10 Feb 2014 00:36:28 -0800 (PST)
Received: by 10.52.28.41 with HTTP; Mon, 10 Feb 2014 00:36:28 -0800 (PST)
In-Reply-To: <20140208184629.GP3698@jama>
References: <1391628912-17880-1-git-send-email-schnitzeltony@googlemail.com>
	<1391628912-17880-2-git-send-email-schnitzeltony@googlemail.com>
	<20140208184629.GP3698@jama>
Date: Mon, 10 Feb 2014 09:36:28 +0100
Message-ID: <CALbNGRRv-qj5_=ra2seGoymzZPGL+cBX6cUQyqMMpRiY-=vyjw@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH][meta-qt5 2/2] qtwayland: fix qml-compositor shader
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
X-List-Received-Date: Mon, 10 Feb 2014 08:36:29 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 8, 2014 at 7:46 PM, Martin Jansa <martin.jansa@gmail.com> wrote=
:
>> +Change-Id: I055fe47e1073403dc981274236fa82e091e0eca4
>> +Reviewed-by: J=C3=B8rgen Lind <jorgen.lind@digia.com>
>> +Reviewed-by: Andy Nichols <andy.nichols@digia.com>
>> +Upstream-status: applied
>
> This one should be Backport, but please check jansa/qt5-5.2.1 branch,
> I've updated all recipes for 5.2.1 release and newer qtwayland revision
> used there includes this patch already.
>
> Your qtbase patch still does apply, I'll add that to branch now.
>
Will give 5.2.1 a test this week

Andreas

