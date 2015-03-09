Return-Path: <frederico@cadete.eu>
Received: from mail-pa0-f45.google.com (mail-pa0-f45.google.com
	[209.85.220.45])
	by mail.openembedded.org (Postfix) with ESMTP id 5309E73941
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  9 Mar 2015 13:53:49 +0000 (UTC)
Received: by pablj1 with SMTP id lj1so66665280pab.8
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 09 Mar 2015 06:53:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type;
	bh=x3DpNQWHPrbrci877gd/Nc3gouz0pXOHwue30avr1MU=;
	b=aOEG0Mz0HbeFJBAUoyHCIWBisLL03iAIsBDWxusyanMrfWQl7mryZ/oGzTBZiqwHDi
	PUTs4q2cx3WwWNTflEV4rurLvJYWcuLd8Mr6u0yP/ZQFj2IEZ6VGXqSx1cNFv0cM5df8
	8viHUGdNw/LeKnoX3SNI+3T61gP+rln6w/cp2LjsFggPxBywm0wPCsnLSiaiMyBuh5YV
	YmuNmi69SJBks89buSp+Vo+Sd9d12xagEOtz2SpHoKDRVjbbTARRGc5oHqol8HcwUahV
	2RPlLlfuTZ2slcrQHkCWa/x1Ia+rxg+9e2ZQ14p9thBijG+F6o58+A9YZAvPB8fLcWiJ
	h3UQ==
X-Gm-Message-State: ALoCoQlp7gBIXYpqvyXtIDEyZkRdIY6u6UGyMZVAlMuj6U2mojN78dOPFgaSWRASYLkA2WFNn+EZ
X-Received: by 10.66.158.66 with SMTP id ws2mr53614318pab.37.1425909230681;
	Mon, 09 Mar 2015 06:53:50 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.66.139.198 with HTTP; Mon, 9 Mar 2015 06:53:30 -0700 (PDT)
X-Originating-IP: [212.166.56.147]
In-Reply-To: <CAL5ScNUOLrvKqKerezbgBrNmgHuvQr-b6ZrARU9wHqBa+43NiQ@mail.gmail.com>
References: <CAL5ScNULNnnK5NyZ9SN2q2fidHpDW8XR6DL_kkMujgTXDCogFw@mail.gmail.com>
	<CAP9ODKqqy9xU3NW=0LDzsVDokA5xiCnH49kY2Kw_wVSL9U1bQA@mail.gmail.com>
	<5940D1D9F240BA44AEF939055CF1358D05983328@xmb-aln-x12.cisco.com>
	<CAL5ScNUOLrvKqKerezbgBrNmgHuvQr-b6ZrARU9wHqBa+43NiQ@mail.gmail.com>
From: Frederico Cadete <frederico@cadete.eu>
Date: Mon, 9 Mar 2015 14:53:30 +0100
Message-ID: <CAL5ScNVr2nWU-M-9EsGT0Hhd++t=b16u4kS=TgLia2hunrS+5A@mail.gmail.com>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5][PATCH] qt5-git, qtbase, qt5everywheredemo: use https protocol for gitorious
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
X-List-Received-Date: Mon, 09 Mar 2015 13:53:50 -0000
Content-Type: text/plain; charset=UTF-8

The following changes since commit 936d70288fd30f4df42bc382fec886a6495ef582:

  qtwebengine: Fix build with accessibility enabled (2015-03-06 11:04:22 +0100)

are available in the git repository at:

  https://github.com/fredcadete/meta-qt5 master

for you to fetch changes up to 06cb6a48d52b8e2eefb53ccdf616a24ffa58df6e:

  qt5-git, *qtbase*, qt5everywheredemo: Fetch from code.qt.io
(2015-03-09 14:51:39 +0100)

----------------------------------------------------------------
Frederico Cadete (1):
      qt5-git, *qtbase*, qt5everywheredemo: Fetch from code.qt.io

 recipes-qt/examples/qt5everywheredemo_1.0.bb | 2 +-
 recipes-qt/qt5/nativesdk-qtbase_git.bb       | 2 +-
 recipes-qt/qt5/qt5-git.inc                   | 2 +-
 recipes-qt/qt5/qtbase-native_git.bb          | 2 +-
 recipes-qt/qt5/qtbase_git.bb                 | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

On Mon, Mar 9, 2015 at 2:50 PM, Frederico Cadete <frederico@cadete.eu> wrote:
> On Mon, Mar 9, 2015 at 2:01 PM, Julien Brianceau (jbriance)
> <jbriance@cisco.com> wrote:
>> Wouldn't be better to move to http://code.qt.io/ ? This is the new place where Qt repositories are hosted, and it supports git:// protocol.
>>
>> Julien
>>
>
> That sounds good and is working on my side.
>
> The remaining question is qt5everywheredemo. It has
>  HOMEPAGE = "https://qt.gitorious.org/qt-labs"
>
> This will have to change soon, but I don't know to where.
>
> Sorry for the "invisible" patch, the mailing list blocked it while I
> was not a subscriber.
> I will follow up with a PR.

