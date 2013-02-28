Received: from mail-vb0-f52.google.com ([209.85.212.52])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UB2ca-0004pH-St
	for openembedded-devel@lists.openembedded.org;
	Thu, 28 Feb 2013 13:30:05 +0100
Received: by mail-vb0-f52.google.com with SMTP id fa15so171220vbb.39
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Feb 2013 04:13:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:content-type:x-gm-message-state;
	bh=yLyKyDJp8RgWo/n5Ue78dkn8cqdl1sGUp4qXt+CuDKo=;
	b=FhJKV0i2efqK5fl1F/jSqh4MSAeLVy04ZXSGojIawOrUYKqEYmuHpt8ZPQMNIRb+QK
	GJydF9cr1uCXmhpgfzLENvZEtZLp1BsyJ02xsdkZM7i5dxtRraxZlc3Ej4ljyHY3SuqB
	F/0fBNFi83umY59a6rbMjh1XkrCqo45niRlflavNk3UBegBqkkjHkWI/FXuGG7Wo/5Io
	67RRuO41Qmz2qKe4821H4yrNoBKnOEo5lPBzl4RIl/cSWZPwPLUv0bNr6pWZ7vGhcbMq
	BTFq1UOHqFy4/b9318vZfLoqnxOk1JDo8QXpQ4VYlz/h1F7ZFoDIwNZeObZ/Us38QEFn
	KQFA==
X-Received: by 10.220.215.73 with SMTP id hd9mr2450514vcb.19.1362053618505;
	Thu, 28 Feb 2013 04:13:38 -0800 (PST)
MIME-Version: 1.0
Received: by 10.58.219.195 with HTTP; Thu, 28 Feb 2013 04:13:18 -0800 (PST)
In-Reply-To: <CA+YB3raWk13+Yxj3=8c34Lbm3svv6apkp9BeYgjRgBnt_4JbUA@mail.gmail.com>
References: <CA+YB3raWk13+Yxj3=8c34Lbm3svv6apkp9BeYgjRgBnt_4JbUA@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 28 Feb 2013 12:13:18 +0000
Message-ID: <CAJTo0LaiKyUHD4C6KhdyOjuPLtMb+BvpaRwcEXALY7cPd2tNLw@mail.gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>, 
	OE-devel <openembedded-devel@lists.openembedded.org>
X-Gm-Message-State: ALoCoQmm8NhMDtTAia3maxwbQKb670Grbji3193a2MGZbObuFRkKr67nakhPbCVwxXvEz3PdDzfE
Subject: Re: [OE-core] OE TSC minutes 12 February 2013
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
X-List-Received-Date: Thu, 28 Feb 2013 12:30:08 -0000
Content-Type: text/plain; charset=UTF-8

On 28 February 2013 06:28, Jeff Osier-Mixon <jefro@jefro.net> wrote:
> (9:51:16 AM) RP: bluelightning: Beat up Ross?

In an attempt to avoid TSC-sanctioned beatings, I've just sent a
series that adds libgdata, clutter-box2d, and gthumb to meta-oe.

Ross


