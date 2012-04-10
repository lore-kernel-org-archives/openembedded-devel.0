Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1SHVc3-0000qd-Ke
	for openembedded-devel@lists.openembedded.org;
	Tue, 10 Apr 2012 09:35:39 +0200
Received: by iaag37 with SMTP id g37so7062379iaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Apr 2012 00:26:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=MDF2umSGQvBBOQXQbzSSSYnO0kLQgZEyfDl7HWpiqv8=;
	b=ylSeyvKSRs/BGMT9L6Y/+fx3DpilD8zyYG63tb0t6D4oJULrqJ0pAW/GGlnS2Fpyw6
	D6i5ENKSBXTKuh4mVDDXNrxBRGtHL9G8aAb38tiww0u+bWYHPSrVuq5GYO1zXW8eS7Da
	fzHJwWmmDqnC48xlyvnyLILsxG1LVjAUerLA0jMVBvDabggxs9ShF6qKzm8N2lvC9Ezo
	5/nqGTt4W7odDszxWquAXGCj0cJ/sTDIGIWjtcCb5M81HH3pW88ZjLuLxf0/7JQzkrJa
	88bII7lmaJ7fyG3c1JaS32nacRaYAoqudBDE+blgMoit423wUSUW2v5NFFccbImBDtBp
	JpxA==
MIME-Version: 1.0
Received: by 10.50.47.162 with SMTP id e2mr1337192ign.0.1334042781507; Tue, 10
	Apr 2012 00:26:21 -0700 (PDT)
Received: by 10.42.165.137 with HTTP; Tue, 10 Apr 2012 00:26:21 -0700 (PDT)
In-Reply-To: <CALbNGRRbDLWOWrfzfb+GNX6Wh6cNracvkCYj3B5yUkL4aKj3Ow@mail.gmail.com>
References: <1332360619-3060-1-git-send-email-schnitzeltony@googlemail.com>
	<CALbNGRRbDLWOWrfzfb+GNX6Wh6cNracvkCYj3B5yUkL4aKj3Ow@mail.gmail.com>
Date: Tue, 10 Apr 2012 09:26:21 +0200
Message-ID: <CALbNGRQ-+49e0uvCT-kBPx3phDyvaE842kwcyXZm_+EBzLrS0A@mail.gmail.com>
From: =?ISO-8859-1?Q?Andreas_M=FCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe 0/2] midori: cleanup
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
X-List-Received-Date: Tue, 10 Apr 2012 07:35:39 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 28, 2012 at 11:04 AM, Andreas M=FCller
<schnitzeltony@googlemail.com> wrote:
> On Wed, Mar 21, 2012 at 9:10 PM, Andreas M=FCller
> <schnitzeltony@googlemail.com> wrote:
>> v1 -> v2:
>> change order variables/functions as suggested in [1]
>>
>> v2 -> v3
>> change order variables/functions as suggested in [2]
>>
>> [1] http://lists.linuxtogo.org/pipermail/openembedded-devel/2012-March/0=
38650.html
>> [2] http://lists.linuxtogo.org/pipermail/openembedded-devel/2012-March/0=
38684.html
>>
>> Andreas M=FCller (2):
>> =A0midori: remove midori.inc and oe-stylize
>> =A0midori: add librsvg-native to DEPENDS
>>
>> =A0meta-oe/recipes-connectivity/midori/midori.inc =A0 =A0 | =A0 39 -----=
--------------
>> =A0.../recipes-connectivity/midori/midori_0.4.4.bb =A0 =A0| =A0 41 +++++=
++++++++++++++-
>> =A02 files changed, 39 insertions(+), 41 deletions(-)
>> =A0delete mode 100644 meta-oe/recipes-connectivity/midori/midori.inc
>>
>> --
>> 1.7.4.4
>>
> ping?
Something wrong with this series?

Andreas


