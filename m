Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-vb0-f41.google.com (mail-vb0-f41.google.com
	[209.85.212.41])
	by mail.openembedded.org (Postfix) with ESMTP id EC9856AE73
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Jan 2014 15:46:27 +0000 (UTC)
Received: by mail-vb0-f41.google.com with SMTP id g10so1663169vbg.28
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Jan 2014 07:46:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=tYEByWfzK3Ir1pE9s+U8eMaxFbHhPwlt74Ueypx6LU8=;
	b=sA9k6vv+1WFLxMOwUMQ+Q6atpkprH+X7zJB+xxrrZI4YnG1d8V2VE4b98PChHVi0go
	3Fwrnq+ANJo8HQ2nM5vmhS2C3PS4hH6Y1g6eJZR+4Yo/ruKAI5l+iDYvcgEkxmCH8qh0
	f9Khphw8QcR/+dNvrzbM6ATVRTHA+x864e0y2dTksQ0jw9o4QrpqBzirHSpiVLvsn9PA
	Hi0Le2OyrhRpqCelTR9KMD8ErEuiyQetBgbD+Myb5028q3yxxNlPkByeRT9nuCRsMrLS
	DAKp3I4n9QqsMYGJPAp4vmNm8gU1/d9K+dg0mTAbDwU0F1niL+02q0Xfc5Kxsm/b4ISu
	Xqgw==
MIME-Version: 1.0
X-Received: by 10.221.54.65 with SMTP id vt1mr521619vcb.46.1389973588597; Fri,
	17 Jan 2014 07:46:28 -0800 (PST)
Received: by 10.58.59.35 with HTTP; Fri, 17 Jan 2014 07:46:28 -0800 (PST)
In-Reply-To: <20140117153310.GM3742@jama>
References: <1389970758-23207-1-git-send-email-schnitzeltony@googlemail.com>
	<20140117153310.GM3742@jama>
Date: Fri, 17 Jan 2014 16:46:28 +0100
Message-ID: <CALbNGRQm94B3qOBiJqPWmaMCoHxsv8KreB-7E5KZ0tLyROEzfA@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH][meta-qt5][jansa/qt5-5.2.0]] qttools: add target build
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
X-List-Received-Date: Fri, 17 Jan 2014 15:46:28 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 17, 2014 at 4:33 PM, Martin Jansa <martin.jansa@gmail.com> wrot=
e:
> On Fri, Jan 17, 2014 at 03:59:18PM +0100, Andreas M=C3=BCller wrote:
>> this does not build much yet but I was looking for qdbus
>
> Do you want me to merge it now or should I wait a bit more?
For me 5.2 is building everything I need so far. With a little
PACKAGECONFIG-appends here and there I was able to build all the stuff
coming from hawaii-desktop (wayland-based). By merging we get out of
secret corner and have a wider community - hopefully.

> "build much" means that it builds OK, but only some tools, right?
yes - only few console tools (lconvert / lrelease / lupdate / qdbus /
qdbusviewer / qtpaths)

Andreas

