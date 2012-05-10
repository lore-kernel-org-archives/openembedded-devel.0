Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SSLhN-0006DW-NY
	for openembedded-devel@lists.openembedded.org;
	Thu, 10 May 2012 07:13:57 +0200
Received: by eaal1 with SMTP id l1so318198eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 09 May 2012 22:04:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=qyFoxJVv86jqrz7whflqsOzR7vXda7gN8EQXU/9J5/Q=;
	b=cq/73ZChksFME7+BQfZk7jZP7R5tY4XACoa0nqpVXEw8D+EyA6Wj4zlE7bdHEERZTw
	72VSceUKBB55XoM41Qe7R4/KmUsfPQyZJgypqaQQfvDhSnO06qKMqKCoSIKVeyr2h/m8
	rAM8IJR4dcA/B6JnLK93/dHY/9GOtg/MvwA6ppsiG0/Xpng5qQbENanJYNUY7Byy2Qxc
	edyM9oBdF32tkWwEusRE5MMSq0+lzmWioXf9eVDVLYobi0ryBjvTXgPtMkyDEbHtLYiY
	jqhmPqHPw8OxK3AlNstYsNGnu33moSpUi6saEv4pgOkW+KiaTQV1hGeEVcd9vOo0hNoi
	z6dg==
Received: by 10.213.105.78 with SMTP id s14mr1123529ebo.84.1336626244254; Wed,
	09 May 2012 22:04:04 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.2.132 with HTTP; Wed, 9 May 2012 22:03:34 -0700 (PDT)
In-Reply-To: <CAKbR+sx-4vD69rHekVvwbDeVT5=0-Ouk0AmS6G_3JzZg_Hqa-A@mail.gmail.com>
References: <CAKbR+sx-4vD69rHekVvwbDeVT5=0-Ouk0AmS6G_3JzZg_Hqa-A@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 9 May 2012 22:03:34 -0700
Message-ID: <CAMKF1soiguyAXwmYo9LhHPnmQkbW7KTipDTEYXpazOFKn+dYLA@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: oe-made-easy and Getting Started
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
X-List-Received-Date: Thu, 10 May 2012 05:13:57 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, May 9, 2012 at 2:02 PM, Lloyd Chang <lloydchang@gmail.com> wrote:
> Hello fellow openembedded-devel members!
>
>
> I'm sharing because you may find this useful -- especially newcomers
> to our OE-Core. =C2=A0In my personal efforts in condensing our Getting
> Started documentation succinctly, I codified it into one line:
>
>
> =C2=A0 =C2=A0git clone git://github.com/lloydchang/oe-made-easy.git;
> ./oe-made-easy/core-image-minimal
>
>
> User interface design wise, my intent of this one liner is to allow
> everyone getting started to easily bootstrap core-image-minimal onto
> various computers (before diving into details). =C2=A0If our community
> consensus finds oe-made-easy useful, please let me know and I'll start
> updating our openembedded.org wiki pages to reference this one liner
> or equivalent.
>
>
> And if you personally find oe-made-easy useful, feel free to test it
> further, fork it and/or send me pull requests via
> https://github.com/lloydchang/oe-made-easy
>
> (for now, oe-made-easy is defaulting to qemux86_64, qemux86 and qemuarm t=
argets)
>
>
> Your feedback is greatly appreciated!

you can add this to OE wiki in some form.

>
>
> Thanks :-)
>
> Lloyd
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


