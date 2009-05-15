Received: from [74.125.44.155] (helo=yx-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1M4wM5-0002Sa-Oi
	for openembedded-devel@lists.openembedded.org;
	Fri, 15 May 2009 14:17:37 +0200
Received: by yx-out-1718.google.com with SMTP id 36so1066990yxh.42
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 May 2009 05:10:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=xaFRBzkKgmhOkpsL/tKrIpumDT4NoG0kmuotPh/EFYk=;
	b=mvJLi9JzbMTO7whlnIKDwa9gwWkiYgTgmErBHu44b2sOJT6sOyGJbODmaOXT5Ecowv
	Q9XNLrMmKHwspZoTHXLglN/1f+rujAdHpJ8f0l4LNHbbwfp+mgtWQUaN1p46ic1CPId4
	085twFO3yaegfj178wDvoc1yNJed0QL7IOjI8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=WcGT98BV+0INepCbUHHWzZ9SJyKXltghffe2/KO2ptX7kGUvrkhdWDDHuUWjTXRhTo
	fLPep/jofSlL0mBBD+fCSYgdDqvl/gStLpCebaa1u3aWM5MKqI1CIWqXeUqeP/i2K4VY
	BgQeO5Lu0MYjrITovpG/1dnTWdUQjS/wP0snw=
MIME-Version: 1.0
Received: by 10.150.191.13 with SMTP id o13mr5846243ybf.303.1242389441145; 
	Fri, 15 May 2009 05:10:41 -0700 (PDT)
In-Reply-To: <4A0D5434.9070308@balister.org>
References: <f96d234e0905131216o2111c9d8medac9b4450d5aaa@mail.gmail.com>
	<4A0B21AB.70602@balister.org>
	<f96d234e0905141437g211d48ffgc598c0f9e69beabe@mail.gmail.com>
	<69E6C70090A0A14498CC98FAE5E06B6E3CF7D6@hiob.intern.dresearch.de>
	<4A0D5434.9070308@balister.org>
Date: Fri, 15 May 2009 08:10:41 -0400
Message-ID: <f96d234e0905150510w3cbfe942vf039bece2776b042@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: OE git move to OSUOSL
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
X-List-Received-Date: Fri, 15 May 2009 12:17:38 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, May 15, 2009 at 7:38 AM, Philip Balister <philip@balister.org> wrot=
e:
> Sledz, Steffen wrote:
>>>
>>> Please change your git workspaces to point to .org instead of .net.
>>> One way to do this, is edit .git/config and change the URI. =A0There is
>>> probably a "proper" way to do this.
>>>
>>> Also, if you have any autobuilders, etc, please change those.
>>
>> In the OE wiki there are also some references to openembedded.net. Shoul=
d
>> they all changed to openembedded.org?
>
> Yes, we need to start changing all the .net stuff to .org. Any help would=
 be
> great.
>
> Thanks for noticing :)

I just changed a few of the obvious wiki pages, and the User Manual.
Appreciate any help in tracking down any remaining references.

I think everything at this point should point to *.org at this point
with the exception of wiki.oe.* -- we're still working on that.

Thanks,
Cliff

--=20
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Cliff Brake
http://bec-systems.com


