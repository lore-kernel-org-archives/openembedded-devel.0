Return-Path: <chgans@gmail.com>
Received: from mail-qk0-f176.google.com (mail-qk0-f176.google.com
	[209.85.220.176])
	by mail.openembedded.org (Postfix) with ESMTP id EBEFC6FF73
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Oct 2017 12:11:43 +0000 (UTC)
Received: by mail-qk0-f176.google.com with SMTP id x82so9850374qkb.12
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Oct 2017 05:11:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=YdQKp0Ltmif3wEwBP/LOD59/CN8Qwv3AY07uqWYd3i8=;
	b=leAorp7Kl1ESsHp0VjZT5+maAPXM0ZM0gezV6JfkiugGg8cyC2/D/hVeV9AeoejY4E
	gSzo18QGkVpIGQf35ch8flZBOq5oFru+meG4YMx60nvbLoD+tIRBNn8y3pgpvBXuYkJZ
	cBDOsvVDhrg8z8aseeXN+KycDNhVDfxa0nOz95lQfMx0rrwwpH5lYe0+41M77wKI7yFk
	veD3ANPR6rxGZQSNR/Hkew/8cHIvhMNkqZ/1KySimXeecFGfsG6nmdvS0v5Hm2yqYd4W
	hekNKg5FOGOkRjc8+TbMTa0sMYk04SnhYCliI99uBUcJHNoPnzPTQpLYTklbVCm41zA5
	xq+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=YdQKp0Ltmif3wEwBP/LOD59/CN8Qwv3AY07uqWYd3i8=;
	b=jl4cIcGiDroS55SgeL5UE1PoLOkppuVKH9yCSl6BHfb5xJ6J9VPzD/IDCbcVXV1FNp
	k+AsRtvUuGraSJ64lQdGP1DbcfI2ChQNFi70AMcDhEBl5G1CritGkcitOCaMNXsjd+UL
	y3MTuo9mkMnupyWzgy86GKfmJIMM9M4c747V5e6OY+0zNvhoXPp/C3dCq4l44DGdWYF9
	H/J9xy3q1xE5NWJLtk0LfUZ09dz9CYO0DbRtlrreUW23tfHnE3txaBDHYARMKyyedq7G
	dRXJUNrAdWs60fpvh1AEawe/6uSWHe7gsDS9t77RInKp9pmBPL1NZs1h8q6cLTSVtIZb
	U7lw==
X-Gm-Message-State: AMCzsaUWNsb+pETKoVHRqqYZGBL0xTWSztG6qxMlHgACaac3Z6PpFh5j
	5ip2jp38HOY3DGfO8gCD3bz3MAlAVvD0AXIttrPEAw==
X-Google-Smtp-Source: AOwi7QBU2OoXeMUGCcnj3eDn3DjE7u7NETpGVei2scHAp8os1BvghCjbzXqDKIqZD6qQmKXQjHP6WorbVxD+yWIjKcQ=
X-Received: by 10.55.75.15 with SMTP id y15mr8829513qka.321.1508069504607;
	Sun, 15 Oct 2017 05:11:44 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.19.138 with HTTP; Sun, 15 Oct 2017 05:11:44 -0700 (PDT)
In-Reply-To: <HE1PR0202MB2491EF42CA7564345575961086660@HE1PR0202MB2491.eurprd02.prod.outlook.com>
References: <1505961647-21967-1-git-send-email-kwangsub.kim@qt.io>
	<CABxGUTixb-TtB0ZQh4k4oi1SCPzXsse9fhwroMh+3MujCqurmA@mail.gmail.com>
	<HE1PR0202MB2491EF42CA7564345575961086660@HE1PR0202MB2491.eurprd02.prod.outlook.com>
From: Christian Gagneraud <chgans@gmail.com>
Date: Mon, 16 Oct 2017 01:11:44 +1300
Message-ID: <CABxGUTgSUMy2y3OhCRbXJeVseti77DUc+-e+XsN61BjwW0jT+Q@mail.gmail.com>
To: Kwangsub Kim <kwangsub.kim@qt.io>
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5][PATCH] qt5: add missing commercial license
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
X-List-Received-Date: Sun, 15 Oct 2017 12:11:44 -0000
Content-Type: text/plain; charset="UTF-8"

On 22 September 2017 at 02:31, Kwangsub Kim <kwangsub.kim@qt.io> wrote:
> I agree on clearing up complex logical expressions of licenses. But
> I think it's another topic because it would need wider updates including
> the other packages unrelated to commercial license fix.
> What about discussing about it on new thread after this patch?

Yeah, maybe. Does Yocto care about license ambiguity? My understanding
was that yes it does.
The pitch is that it's one of the Yocto's strength: get a clear
picture about license issue, isn't it?

I've been following and using yocto/bitbake/oe/poky/angstrom/... for a
wee while now and i think that the current state of licensing is
out-of-control, yet Yocto/LF pretends to be in full-control.

Qt licensing is not an easy topic. The Linux Fundation needs to be
razor sharp about it.

What can i access from meta-qt5 in [L]GPLv(2|3) mode?
Is LF's meta-qt5 safer than Qt's own meta-qt5?

What i can access with a commercial Qt license as of October 2017 is
purely a "The Qt Company" business decision.

"Hackers" wan't to know, without ambiguity, what they have access to
given a "license" context (Open source or commercial).

My 2 cents.
Chris

