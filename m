Return-Path: <paul.betafive@gmail.com>
Received: from mail-vc0-f181.google.com (mail-vc0-f181.google.com
	[209.85.220.181])
	by mail.openembedded.org (Postfix) with ESMTP id 94A3B6E89A
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  1 Apr 2014 23:21:21 +0000 (UTC)
Received: by mail-vc0-f181.google.com with SMTP id id10so10988538vcb.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 Apr 2014 16:21:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=aH7vuy/IOkNd98M9wCF4plBmQ7Q86ZF5pCHLrDTVFSQ=;
	b=NUUZKO6UreASUUsMT4l+++ZIy5kTpsT3mKJ5Lamy6sHkIC4vD7rltpWEtj6M3v4718
	IOLsAXC5Obb52frnHfvq3/mKzGEiWeb5M+KQ7ocnQAQecQ2FeP0DQZIGQUFgAdbfrA+m
	9qAYMZ5vrbVL9XliwVj6LDyS69+lUVi1WgybTP7FIbOgCtGq8rvwOoA9O03zh2i8tDBe
	4/XTA8HP6scPoUOd8xbVqptXH/2rC3QKp1+xeCRP5br18g+u9HPUB/hWNwHXwj1SHVUb
	viASOBIPMb8F0WjmR+ZtJBgSomXFMujY9yRNMhijGqh51IOr1F5lP6jX5Dgc3q5E/pN0
	7Lbg==
X-Received: by 10.52.0.193 with SMTP id 1mr545177vdg.0.1396394482827; Tue, 01
	Apr 2014 16:21:22 -0700 (PDT)
MIME-Version: 1.0
Sender: paul.betafive@gmail.com
Received: by 10.220.239.135 with HTTP; Tue, 1 Apr 2014 16:20:42 -0700 (PDT)
In-Reply-To: <CAOLEWZVrMoMSNESP4pm1wmdhSLCruRa6Fd-V5joF-fY2sf+kGw@mail.gmail.com>
References: <1395010717-15721-1-git-send-email-stephen.arnold42@gmail.com>
	<CAOLEWZVrMoMSNESP4pm1wmdhSLCruRa6Fd-V5joF-fY2sf+kGw@mail.gmail.com>
From: Paul Barker <paul@paulbarker.me.uk>
Date: Wed, 2 Apr 2014 00:20:42 +0100
X-Google-Sender-Auth: ZkyL1_l5Sf7zp-8SdLqFClU6Hys
Message-ID: <CANyK_8cUquHkw1cWe7KK72BZ8Bo5cP94-iNfSc-6T-KLvaQq=A@mail.gmail.com>
To: Openembedded Discussion <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] updated lxdm recipe depends and build config
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
X-List-Received-Date: Tue, 01 Apr 2014 23:21:25 -0000
Content-Type: text/plain; charset=ISO-8859-1

On 16 March 2014 23:00, Stephen Arnold <stephen.arnold42@gmail.com> wrote:
> Okay, apparently git-send-email doesn't suck any from info from the file in
> outgoing/.  Good to know...
>

'git send-email outgoing/*' is probably what you want. If you pass
file names as arguments, it should send those files pretty much as
they are.

Thanks,

-- 
Paul Barker

Email: paul@paulbarker.me.uk
http://www.paulbarker.me.uk

