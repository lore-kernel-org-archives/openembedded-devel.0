Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Rtinp-0003LF-6Q
	for openembedded-devel@lists.openembedded.org;
	Sat, 04 Feb 2012 17:49:29 +0100
Received: by lahc1 with SMTP id c1so2294099lah.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 04 Feb 2012 08:41:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=GhfVrSGhOkeUoWw/jBQUmyxK3VZc3XVjS2y1rlD+53Y=;
	b=fv6Emer1jHq06I8/t8jZP/DIZfCeq2m+aaryM6J0g5n6mVhx3EDSCr3OOcYXiPgL7I
	R5sz6zy4WWeDMwmpVUvWqhWm13YohQ1fwV8mwW4oFPVnGD01eAbq6Ang9S4Ppeem4CI5
	ddoeh+XPg3OAKZv13UP/0kJKTQiaWY//HVRNk=
Received: by 10.152.123.68 with SMTP id ly4mr580039lab.13.1328373690263; Sat,
	04 Feb 2012 08:41:30 -0800 (PST)
MIME-Version: 1.0
Received: by 10.152.5.201 with HTTP; Sat, 4 Feb 2012 08:41:00 -0800 (PST)
In-Reply-To: <4F2D0090.2040300@gmail.com>
References: <1328132338-15939-1-git-send-email-tworaz666@gmail.com>
	<1328310612-2098-1-git-send-email-tworaz666@gmail.com>
	<20120204021443.GA26306@sakrah.homelinux.org>
	<4F2D0090.2040300@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 4 Feb 2012 08:41:00 -0800
Message-ID: <CAMKF1spV8HwkSNbxC6AvL9OVMtuhF4u=pBS8qKEtdrwd+PZDPg@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH v3] tmux: Add initial recipe for version 1.6.
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
X-List-Received-Date: Sat, 04 Feb 2012 16:49:29 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 4, 2012 at 1:55 AM, Peter Tworek <tworaz666@gmail.com> wrote:
> On 02/04/2012 03:14 AM, Khem Raj wrote:
>>
>> On (04/02/12 00:10), Peter Tworek wrote:
>>>
>>> Run tested on netbook pro.
>>>
>>> Signed-off-by: Peter Tworek<tworaz666@gmail.com>
>>> Acked-by: Paul Menzel<paulepanter@users.sourceforge.net>
>>> ---
>>> =C2=A0meta-oe/recipes-extended/tmux/tmux_1.6.bb | =C2=A0 18 +++++++++++=
+++++++
>>> =C2=A01 files changed, 18 insertions(+), 0 deletions(-)
>>> =C2=A0create mode 100644 meta-oe/recipes-extended/tmux/tmux_1.6.bb
>>>
>>> diff --git a/meta-oe/recipes-extended/tmux/tmux_1.6.bb
>>> b/meta-oe/recipes-extended/tmux/tmux_1.6.bb
>>> new file mode 100644
>>> index 0000000..fa58065
>>> --- /dev/null
>>> +++ b/meta-oe/recipes-extended/tmux/tmux_1.6.bb
>>> @@ -0,0 +1,18 @@
>>> +DESCRIPTION =3D "Terminal multiplexer"
>>> +HOMEPAGE =3D "http://tmux.sourceforge.net"
>>> +SECTION =3D "console/utils"
>>> +
>>> +LICENSE =3D "ISC"
>>
>> what is ISC license ? I thought tmux is more like BSD license here is
>> what I read in NOTES files
>>
>> tmux is intended to be a simple, modern, BSD-licensed alternative....
>
>
> Technically ISC is a BSD license [1]. Looking at the actual license text =
in
> tmux [2] it seems that it uses exactly this license. OE-core seems to als=
o
> distinguish between BSD and ISC (meta/files/common-licenses/ISC), so I
> decided to use it.
>
> [1] http://en.wikipedia.org/wiki/ISC_license
> [2]
> http://tmux.svn.sourceforge.net/viewvc/tmux/trunk/tmux.c?revision=3D2697&=
view=3Dmarkup

thanks looks fine
>
> /ptw
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


