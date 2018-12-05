Return-Path: <vincent.prince.fr@gmail.com>
Received: from mail-io1-f53.google.com (mail-io1-f53.google.com
	[209.85.166.53])
	by mail.openembedded.org (Postfix) with ESMTP id B7C3C6D44F
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  5 Dec 2018 08:09:13 +0000 (UTC)
Received: by mail-io1-f53.google.com with SMTP id r9so8500850ioa.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 05 Dec 2018 00:09:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=oNiXgAWwBFCNRy4kL+DDgcTGClp4hKnEyJVA9ZucUKc=;
	b=DCVwq4/doJkgv7369uidpaZ0NdU8NTAhfC0hDYfgZgSg4fx+oZrn8mE5qmCrUNht5T
	FF5RR6NMxtPjJoMU1BRyR6CHrasSVPAXe7VKLFDOGB7E52xUSj9zGjitbx1dBH2OVep8
	4CcRkdgtLMrcp7lunApHS/BayMr7IkSlRmOjTqwLXkAgK4tKohMZwCkHsO6YmSa7M23J
	dzBbOHpDHT1ygyJ1EAyL8cqD16nHyindQGQGnshqaTxP9yO3wUnnGk9HheydtTgjhpcQ
	oCR7bkAXD1EEiv0F1M8r98UqmhgpW57R48CuF30UhPq1XCEbQOULsZJuNMCbNnFWfcYT
	D2Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=oNiXgAWwBFCNRy4kL+DDgcTGClp4hKnEyJVA9ZucUKc=;
	b=RK46OkNBZZ4uvkjXAbKT8q53W0p54yF8Ml4/HU/xmp9U7jMt9k6uDiu43tuIvHeoFb
	JU3H4K6ykxeKdAyRjLTP+L81wmmOjX0WMzFPEacHr5RBL4gR2jirrEPDq0z65Zj2C10x
	wo+IfMZ/T+QWMH8E4UOBi5WX+FuPn34aD2HWSLm6zyaX522j8jEgXPlQPMz3xYbd1oSA
	0kgqwnnLlRSsde21IKkl426YZqMhY7BwVov1kJPR4+NH+G52/9pnq8MBjYMNo9lw1se3
	O3UFX5rLoAbeg+JkhHnC+ZxNgcBiW9eb+qxFrIe3oqNlXz/DWG/i2QMpUMLlQS6TyN4m
	MIHg==
X-Gm-Message-State: AA+aEWYZW7CGiv+WjfAXatuTgwkIVUK0DJDPB3TL1nnNqXciQ687lXp4
	lNUM9hq8O7AnDW9dgJR7g80BGzjHuMMwnAf2bOY=
X-Google-Smtp-Source: AFSGD/XNVtR8j+vJDLLqJp4WIyBDFVRDj/NEE1qkT3FnLyQkdyhMEmG+zHuSdzJVbkkc5W/mhJF1IKsWg/Njn+lxE7g=
X-Received: by 2002:a5d:954c:: with SMTP id a12mr11163577ios.176.1543997354776;
	Wed, 05 Dec 2018 00:09:14 -0800 (PST)
MIME-Version: 1.0
References: <18DB423D160957498153A71956CACF8222223254@EXCHSVR3.protedyne.protedyne.com>
In-Reply-To: <18DB423D160957498153A71956CACF8222223254@EXCHSVR3.protedyne.protedyne.com>
From: Vincent Prince <vincent.prince.fr@gmail.com>
Date: Wed, 5 Dec 2018 09:09:02 +0100
Message-ID: <CAB2nKc80sfF40PBS3vegh5_o0E7Gac0Z6z9=0bT_v_c27M-2OQ@mail.gmail.com>
To: dbuchwald@protedyne.com
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: Yocto-mailing-list <yocto@yoctoproject.org>,
	openembedded-devel@lists.openembedded.org
Subject: Re: Yocto and OpenJDK
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
X-List-Received-Date: Wed, 05 Dec 2018 08:09:13 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Dave,

I think this question belong to yocto ML as stated here:
http://git.yoctoproject.org/cgit/cgit.cgi/meta-oracle-java/about/

Best regards,
Vincent

Le lun. 3 d=C3=A9c. 2018 =C3=A0 22:38, Dave Buchwald <dbuchwald@protedyne.c=
om> a
=C3=A9crit :

> I have a question about Java versions for Yocto. As we know, starting in
> January 2019, Oracle will
> basically start crapping on the open source licensing availability for th=
e
> JDK and will start charging for
> updates starting with JDK11.  I build software and hardware using
> Yocto-built images for the imx7 using
> Java and various Java-based technologies.
>
>
> -        Will the Yocto project go to newer versions of OpenJDK? 9, 10, 1=
1?
>
> -        How will the Yocto project and meta-java go forward due to
> Oracle's actions?
>
> -        Will newer versions be tied to newer BSP's?
>
>
>
>
> thanks,
> Dave Buchwald
> Protedyne Corp.
> Windsor, CT
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

