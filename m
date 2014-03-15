Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f177.google.com (mail-ig0-f177.google.com
	[209.85.213.177])
	by mail.openembedded.org (Postfix) with ESMTP id D56886EE30
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 15 Mar 2014 15:56:00 +0000 (UTC)
Received: by mail-ig0-f177.google.com with SMTP id ur14so1757445igb.4
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 15 Mar 2014 08:56:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=PBRHsGzBEjRpBcsT5p8CuPl93v1L7wLoq2VMYhc929Q=;
	b=mO2tuIY7YJEvaRPNRdSHkxmGePxTp8YBrJisvxgyAZp6za+vTYHycGYBusulN83yw8
	vUOceLl9/5ORJDZIK4HxXekYOTLknIh96tRZs8/pbR7UjWiHxRHyXd+EOfTRlv+lILR8
	nFnwaEFQw4ZL0+xIUYhMcvKSLMPgXGOdwpV2TPTJ/htGPw+NeGpzW/CLbcGdwZpApVNV
	UCg2Wfd7X4mkmrJqkVBfXWlO3X2YKmFVpA1txLjXQA0y8MaA0kXHJW3LenKnAc10C+Yl
	UwCO+EYydaJGFwtHo1jXFQJpKVPcHUAQ/Rmx6pQ60hcU7WkoD5DNp4ZZhSzMRNFiG2bQ
	5GQA==
X-Received: by 10.50.35.129 with SMTP id h1mr3747993igj.17.1394898961038; Sat,
	15 Mar 2014 08:56:01 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.224.136 with HTTP; Sat, 15 Mar 2014 08:55:30 -0700 (PDT)
In-Reply-To: <20140315152744.GL3759@jama>
References: <1394895279-7276-1-git-send-email-net147@gmail.com>
	<64904C75-41B7-43D4-9ED0-16AB64F12285@gmail.com>
	<20140315152003.GK3759@jama>
	<2D16971D-4F6B-4162-8CD6-E28C34160B11@gmail.com>
	<20140315152744.GL3759@jama>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 15 Mar 2014 08:55:30 -0700
Message-ID: <CAMKF1soRTANjW7rnHkAQJjEDEeWQsT_LDJjgMLXBGypepjMuqA@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5][PATCH] licenses: rename NOKIA-TPLA-2.4 to DIGIA-TPLA-2.4
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
X-List-Received-Date: Sat, 15 Mar 2014 15:56:02 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 15, 2014 at 8:27 AM, Martin Jansa <martin.jansa@gmail.com> wrot=
e:
> On Sat, Mar 15, 2014 at 08:22:33AM -0700, Khem Raj wrote:
>>
>> On Mar 15, 2014, at 8:20 AM, Martin Jansa <martin.jansa@gmail.com> wrote=
:
>>
>> > On Sat, Mar 15, 2014 at 08:04:14AM -0700, Khem Raj wrote:
>> >>
>> >> On Mar 15, 2014, at 7:54 AM, Jonathan Liu <net147@gmail.com> wrote:
>> >>
>> >>> The license agreement doesn't mention Nokia anymore after Qt was
>> >>> acquired by Digia.
>> >>>
>> >>> Signed-off-by: Jonathan Liu <net147@gmail.com>
>> >>> ---
>> >>> licenses/{NOKIA-TPLA-2.4 =3D> DIGIA-TPLA-2.4} | 0
>> >>> recipes-qt/qt5/qt3d.inc                     | 2 +-
>> >>> 2 files changed, 1 insertion(+), 1 deletion(-)
>> >>> rename licenses/{NOKIA-TPLA-2.4 =3D> DIGIA-TPLA-2.4} (100%)
>> >>>
>> >>> diff --git a/licenses/NOKIA-TPLA-2.4 b/licenses/DIGIA-TPLA-2.4
>> >>> similarity index 100%
>> >>> rename from licenses/NOKIA-TPLA-2.4
>> >>> rename to licenses/DIGIA-TPLA-2.4
>> >>> diff --git a/recipes-qt/qt5/qt3d.inc b/recipes-qt/qt5/qt3d.inc
>> >>> index 78b9ecc..74c4cad 100644
>> >>> --- a/recipes-qt/qt5/qt3d.inc
>> >>> +++ b/recipes-qt/qt5/qt3d.inc
>> >>> @@ -2,7 +2,7 @@ require qt5.inc
>> >>>
>> >>> DEPENDS +=3D "qtdeclarative"
>> >>>
>> >>> -LICENSE =3D "GFDL-1.3 & LGPL-2.1 & NOKIA-TPLA-2.4 | GPL-3.0"
>> >>> +LICENSE =3D "GFDL-1.3 & LGPL-2.1 & DIGIA-TPLA-2.4 | GPL-3.0=E2=80=
=9D
>> >>
>> >> you need to rename the license file too
>> >
>> > he did :)
>> >
>> > sorry it's my mistake, when I was updating license text from newer qt3=
d
>> > repo I haven't noticed nokia->digia change between whitespace changes
>> >
>> > should we use the same text for dylan,dora,master even when older qt3d
>> > revisions have older text? I think it would be better to have
>> > DIGIA-TPLA-2.4 everywhere.
>>
>>
>> I think call it QT-TPLA-2.4 and then the name becomes universal
>
> name yes, but still the text would be different in qt3d repo and our
> text before this qt3d commit which changed it to digia:
> https://qt.gitorious.org/qt/qt3d/commit/06eb6c1060743b7dbd61bfa9a169f2a1c=
d44af39#LICENSE.PREVIEW.COMMERCIAL
>
> alternatively we can keep both texts (remove my update of license text
> from NOKIA-TPLA-2.4 and keep separate DIGIA-TPLA-2.4 and use the right
> one based on SRCREV used in recipe.

yeh probably have 2 copied is better

>
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

