Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SWcqT-0000ho-5R
	for openembedded-devel@lists.openembedded.org;
	Tue, 22 May 2012 02:21:01 +0200
Received: by eaal1 with SMTP id l1so1711826eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 May 2012 17:10:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=J53O7xopPZo/On5jVXRQvVGHFW1qgfiJ53t0xA4E8VI=;
	b=DT3z+GDLuByIfoRVHiC6+pvb8xTTdFHzq8WRJ5XDUOMdQPB9aDfgwZyB8hTqW1kd6h
	kK2KFJKxt9eL/iqb0uTJoPN47Upa2Oy6TdV2CTSDsOcfuWoalDZaGCrJsaPJFqiEvA2O
	q89tg4V0HwcL/4kRqvTuJTIqQV7yzA2+nWukr4LDZYV5yPTLrFc4YzLYEBJmlJbKXi3y
	KJPh3dpJGqQ3LvjKBYl9CwDvF9uw3XtqRiqElno45WmmbjhyLq0XSKWtDrx0ANzmgp3t
	Gf27lC67pkOaFL1xHTNED8KbiYUMPHT1MRpVNSbu8445Se6/q0cwdq5vno0tbj1HHr3J
	6tTg==
Received: by 10.14.127.201 with SMTP id d49mr3928993eei.52.1337645452790; Mon,
	21 May 2012 17:10:52 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.188.11 with HTTP; Mon, 21 May 2012 17:10:22 -0700 (PDT)
In-Reply-To: <CAAQYJAuDLh1T6eqhWZG67ugrmBbTCBrdQq7T90Vydv-1XP-5OA@mail.gmail.com>
References: <1337549842-1438-1-git-send-email-andrea.adami@gmail.com>
	<CAMKF1so+__G_LDzj5DDZgQpae63EytLbaZNR5dnwTUAD+3r-3g@mail.gmail.com>
	<CAAQYJAuDLh1T6eqhWZG67ugrmBbTCBrdQq7T90Vydv-1XP-5OA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 21 May 2012 17:10:22 -0700
Message-ID: <CAMKF1soFNVg48R_i-jBaNpS5OtmzkiyP9op7pcQCsDCxde4nFA@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][meta-initramfs][PATCH 1/3] klibc.bbclass: use klcc as CPP
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
X-List-Received-Date: Tue, 22 May 2012 00:21:01 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, May 21, 2012 at 2:33 PM, Andrea Adami <andrea.adami@gmail.com> wrote:
>
> This one seems already there (see full recipe below). Anything missing?

nice. I dont see anything else. Looks good.


