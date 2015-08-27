Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 99B0660043
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Aug 2015 15:28:15 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga102.jf.intel.com with ESMTP; 27 Aug 2015 08:28:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,422,1437462000"; d="scan'208";a="792128329"
Received: from djcarton-mobl2.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.20.50])
	by fmsmga002.fm.intel.com with ESMTP; 27 Aug 2015 08:28:14 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Andreas =?ISO-8859-1?Q?M=FCller?= <schnitzeltony@googlemail.com>
Date: Thu, 27 Aug 2015 16:28:13 +0100
Message-ID: <1858940.qR1UtCzzK3@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.9 (Linux/4.1.5-100.fc21.x86_64; KDE/4.14.9; x86_64; ; )
In-Reply-To: <CALbNGRTpF_HNK5wzOBQfjwUfXqguciU+9yCfcjOHmonjAc_hZg@mail.gmail.com>
References: <1440687197-26742-1-git-send-email-schnitzeltony@googlemail.com>
	<55DF25BF.4080304@linux.intel.com>
	<CALbNGRTpF_HNK5wzOBQfjwUfXqguciU+9yCfcjOHmonjAc_hZg@mail.gmail.com>
MIME-Version: 1.0
Cc: Alexander Kanavin <alexander.kanavin@intel.com>,
	openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 1/5] fontforge: update to 20150824
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
X-List-Received-Date: Thu, 27 Aug 2015 15:28:16 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

On Thursday 27 August 2015 17:10:21 Andreas M=FCller wrote:
> On Thu, Aug 27, 2015 at 4:59 PM, Alexander Kanavin
>=20
> <alexander.kanavin@linux.intel.com> wrote:
> > On 08/27/2015 05:53 PM, Andreas M=FCller wrote:
> >> --- a/meta-oe/recipes-graphics/fontforge/fontforge_20141126.bb
> >> +++ b/meta-oe/recipes-graphics/fontforge/fontforge_20150824.bb
> >> @@ -1,9 +1,9 @@
> >>=20
> >>   SUMMARY =3D "A font editor"
> >>   HOMEPAGE =3D "http://fontforge.github.io/en-US/"
> >=20
> > Oe-core has liberation-fonts package which apparently can not be up=
dated
> > because newer versions depend on fontforge. Would you be interested=
 in
> > moving fontforge to oe-core and updating liberation-fonts?
>=20
> LOL: I've tried that long time ago - maybe you should try with your
> magic @intel.com

A different person asking doesn't make the idea any more palatable (not=
 to me,=20
at least...)

Since this wasn't explored earlier though, if we absolutely must upgrad=
e=20
liberation-fonts and there really is no alternative to distributing thi=
s font=20
other than to build it from source then we're left with little choice, =
but are=20
both of those things true?

Cheers,
Paul

--=20

Paul Eggleton
Intel Open Source Technology Centre

