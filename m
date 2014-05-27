Return-Path: <schnitzeltony@googlemail.com>
X-Greylist: delayed 330 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 27 May 2014 07:30:11 UTC
Received: from mail-vc0-f178.google.com (unknown [209.85.220.178])
	by mail.openembedded.org (Postfix) with ESMTP id 6DEAD6FA7E
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 May 2014 07:30:11 +0000 (UTC)
Received: by mail-vc0-f178.google.com with SMTP id ij19so6883011vcb.9
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 May 2014 00:30:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=J9629EdKc+MKrrZvmYND6WjryTiAb/WnngjE18ARrq4=;
	b=nxYKwOHa4B/Cn/hvYCFrvPxdSGWRBywKTVuGn6kEJVriBXlr5uWirf9uEAIOf87HAh
	9sHM99Fua7cIksQinbzlI6cwUcDftvGI/WH2gEvWxcBb/WaL60SsZEQ+Z607TMEh0Ma4
	TrlJTOu3QQb1XnYderNAHisaYI4cZYJ57XRLJ38cPkalqUdvlnsKtLE6s5xBkIQ7oINU
	kiHjtVlgf+rWWpkIZ+ZTbjrzT92UcU0Roqc/YAkhJojK71wHtLnlqNwHzYFzhVcNHoAT
	oD/QeaKMAFlD6RynumGt2qhbTp3/G4IYHl9/I3+9bY4DztQLThiq1STxafudDp0QIFlO
	BcBw==
MIME-Version: 1.0
X-Received: by 10.58.23.6 with SMTP id i6mr25498257vef.12.1401175482219; Tue,
	27 May 2014 00:24:42 -0700 (PDT)
Received: by 10.52.167.201 with HTTP; Tue, 27 May 2014 00:24:42 -0700 (PDT)
In-Reply-To: <1399992528-10108-1-git-send-email-schnitzeltony@googlemail.com>
References: <1399992528-10108-1-git-send-email-schnitzeltony@googlemail.com>
Date: Tue, 27 May 2014 09:24:42 +0200
Message-ID: <CALbNGRR1s5Koi3+YWZEkZ-HvdQEuW=_OvJyQXkr2Q4Srqe5XXg@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH,V2][meta-qt5 0/3] qtwayland updates for hawaii
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
X-List-Received-Date: Tue, 27 May 2014 07:30:13 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, May 13, 2014 at 4:48 PM, Andreas M=C3=BCller
<schnitzeltony@googlemail.com> wrote:
> V1->V2:
>
> * replace tabs by spaces in do_install
> * fix wrong version location in do_install
>
> Andreas M=C3=BCller (3):
>   qtwayland: move to latest revision
>   qtwayland-native: make qtwayland find qtwaylandscanner
>   qtwayland: install created private headers
>
>  recipes-qt/qt5/qtwayland-native_git.bb             |  5 ++
>  ...0001-xcomposite-glx-Fix-build-on-Qt-5.2.1.patch | 91 ----------------=
------
>  recipes-qt/qt5/qtwayland_git.bb                    |  8 +-
>  3 files changed, 11 insertions(+), 93 deletions(-)
>  delete mode 100644 recipes-qt/qt5/qtwayland/0001-xcomposite-glx-Fix-buil=
d-on-Qt-5.2.1.patch
>
> --
> 1.8.3.1
>
ping?

Andreas

