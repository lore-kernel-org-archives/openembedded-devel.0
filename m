Return-Path: <paul.betafive@gmail.com>
Received: from mail-qa0-f53.google.com (mail-qa0-f53.google.com
	[209.85.216.53])
	by mail.openembedded.org (Postfix) with ESMTP id 9829E65DAC
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 22 Nov 2014 11:53:11 +0000 (UTC)
Received: by mail-qa0-f53.google.com with SMTP id bm13so4488016qab.26
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 22 Nov 2014 03:53:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:content-type;
	bh=qH0LeRWhprhIepVVONj6O+LVoiazzuPymypWe7g/GR4=;
	b=Oo7vuk2IfkNAFQoZhJ/RZPFv5xKNc0MMe/PXHh3+lUNeLq3XF7HVnAF7f6LkYg2qyu
	DhKQiaQPf0L+WHIFhAPFLnDxjWd/2UK4cK655yxszvTJNzPd+a9YT9pNCRWqcd+URjV6
	XwZJawUAfK/ZMWTeTsqF1NktILV1CQLji0E6Oq0iaVwZz10P9qCTG5iy8hqgWPS36HNW
	GhCaN2+9DV76HA6PxkOr+kH+Sh0/Rif4KACQcjitYTfwwqUxRquZKyGnxmB4bPkqoDQ0
	k0Jgl3Hd/QrZwtpSmoegvciKSm0FaovBRwkkD6CO7C5wLD31LU1PiU1wYCrXMBRUJjoO
	6bWw==
X-Received: by 10.140.32.136 with SMTP id h8mr13448666qgh.13.1416657191664;
	Sat, 22 Nov 2014 03:53:11 -0800 (PST)
MIME-Version: 1.0
Sender: paul.betafive@gmail.com
Received: by 10.140.143.146 with HTTP; Sat, 22 Nov 2014 03:52:31 -0800 (PST)
In-Reply-To: <5470073C.5090706@gmail.com>
References: <5470073C.5090706@gmail.com>
From: Paul Barker <paul@paulbarker.me.uk>
Date: Sat, 22 Nov 2014 11:52:31 +0000
X-Google-Sender-Auth: 2GiphO1zBH_RdNEKHH7ki2U1ri4
Message-ID: <CANyK_8cO0k3Em27PPR_-OfexA2=jZ5WL9MeQPcawSfvEE6TQeg@mail.gmail.com>
To: OE Devel <openembedded-devel@lists.openembedded.org>, 
	Michael Halstead <michael@yoctoproject.org>
Subject: Re: meta-openembedded-contrib
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
X-List-Received-Date: Sat, 22 Nov 2014 11:53:15 -0000
Content-Type: text/plain; charset=UTF-8

On 22 November 2014 at 03:47, akuster808 <akuster808@gmail.com> wrote:
> Hello,
>
> Is meta-openembedded-contrib still active? if so, how can one get permission
> to create and submit changes via a contrib branch?
>
> - Armin

You need to talk to Michael Halstead about this. You'll need to send
an SSH public key and the prefix you want to use for your branches
(for example, mine is 'pbarker/').

Cheers,

-- 
Paul Barker

Email: paul@paulbarker.me.uk
http://www.paulbarker.me.uk

