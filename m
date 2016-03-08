Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f43.google.com (mail-wm0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id 41DC165CBC
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  8 Mar 2016 09:14:05 +0000 (UTC)
Received: by mail-wm0-f43.google.com with SMTP id n186so121681156wmn.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 08 Mar 2016 01:14:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=YDm7KZkEMH6Xs0hGKHiJVPMyEy6fJDgl9qRsLYverIE=;
	b=MSR1rYA2MV2iwbc+G5d1V3qzPQr4z5Cz7L2/lJupngI8Ew0PWTrSBBp1ywCC4WqoAB
	XCCzBhcoCTOFY4iGEBtgqCUsMdoMn5hPmDVqEaaKelkT+L82magEls+FFzcc5RqtfZT3
	/Fg0u0gM5GZW6TNsMxQzYfcbLwuFl8tAfa4sJDo8wCOGOGnqTNmHfPHUX2zA3Paw6oDj
	G9Zfw0Ml1WPcQ0Y84VtA0/ByzWbU4ukf8vAAZy3Mj+SHIw510Wqt0h0csC7qzjjTX2OG
	l4DaVVA5cb/VDeRxuMo1gJwPsiScbTPL+dpikxHVa3bum4lucofyrMsYPVQ26Q5B+Kkx
	pp5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=YDm7KZkEMH6Xs0hGKHiJVPMyEy6fJDgl9qRsLYverIE=;
	b=ZfOqM12sK4HS3Etr7+yh/ahZCUYUN3kBHEpcMGgWE0QvZMci2vrYNjFTrVcIeLVCH6
	uX38xlibgqD1kb5SylY8gv+/FenbWno8wDydUm7TXiT0miX+DvcXA2XYRqHYnPmuyRuB
	iWjeZYIcwJ2M+jLrKhiSHb29rr3d4wmQuPR8MoeIefEZYlu5sr7xqQJ5TsxvXIj3Qi4J
	bzvPDtbN75Qf1rdcOWPovUU75EC8Gz0XNTRnqNn5klVvWYfsi29fQ4jdq5rwn+/GVoWy
	QWn3Lzc9ayGFf2fQnoI1iccCpnDwTBPfan83jz8eTcs2uf8oDQMgqbDdwVZf75q+o7Cm
	jljg==
X-Gm-Message-State: AD7BkJKAKXvtSuXMqINKR6xx8AJkE0FswaEAXehiuRbbuBwpQ4uogYWAjoKK3vivjnt7DRb7EbCjO718D66VQg==
MIME-Version: 1.0
X-Received: by 10.28.60.84 with SMTP id j81mr18239204wma.91.1457428446076;
	Tue, 08 Mar 2016 01:14:06 -0800 (PST)
Received: by 10.194.31.71 with HTTP; Tue, 8 Mar 2016 01:14:06 -0800 (PST)
In-Reply-To: <DB5PR02MB117525C57FE240091B542E5190A90@DB5PR02MB1175.eurprd02.prod.outlook.com>
References: <EC3D8C09-AC4A-40D6-A828-6B6E0CC34678@staylor.ca>
	<DB5PR02MB117525C57FE240091B542E5190A90@DB5PR02MB1175.eurprd02.prod.outlook.com>
Date: Tue, 8 Mar 2016 10:14:06 +0100
Message-ID: <CA+chaQdC7NUAkHpe9VfkZ_-T5ZixoKM4CPeJfdDVux5KVifj3g@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: RIDET Aurelien <aurelien.ridet@preciamolen.fr>
Subject: Re: [meta-qt5] Commercial License
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
X-List-Received-Date: Tue, 08 Mar 2016 09:14:09 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

There is 5.7 version in jansa/master-5.7 branch.

If you have the recipes ready, you can submit them there.

On Fri, Feb 12, 2016 at 5:23 PM, Piippo Samuli <
samuli.piippo@theqtcompany.com> wrote:

> Hi,
>
> We have recipes available for Qt Charts, Qt Data Visualization, Qt Virtua=
l
> Keyboard and Qt Quick 2D Renderer, all modules that are open sourced unde=
r
> GPL3 with Qt 5.7. Currently the recipes are available on the commercial Q=
t
> for Device Creation layer, but plan is to contribute these recipes to
> meta-qt5 once it switches to Qt 5.7.
>
> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org [mailto:
> openembedded-devel-bounces@lists.openembedded.org] On Behalf Of S=C3=A9ba=
stien
> Taylor
> Sent: 9. helmikuuta 2016 19:31
> To: openembedded-devel@lists.openembedded.org
> Subject: [oe] [meta-qt5] Commercial License
>
> I am looking to update the qt5 build to build the commercial version (as
> opposed to the open source) as well as adding the QtCharts and
> Visualization modules which are part of the commercial release.
>
> I was hoping for some feedback as to whether this has already been looked
> at and opinions on how to best handle toggling the license in the
> configuration in a way that can be submitted back into meta-qt5.
>
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

