Received: from [209.85.218.219] (helo=mail-bw0-f219.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ihar.hrachyshka@gmail.com>) id 1MCDzZ-0006X6-3W
	for openembedded-devel@lists.openembedded.org;
	Thu, 04 Jun 2009 16:32:29 +0200
Received: by bwz19 with SMTP id 19so789082bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 04 Jun 2009 07:23:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=SyEX07A3aDt7qwqXBSH4fmXvjuguE1yo2X7ulNmW/MQ=;
	b=D4qCM/wl8bSaFu/elenHwAg+4d1J0kUJUb+8OJhojA88FDU3Kmf2x0+kPyGiho3/Ny
	nE4iCzRUqzIIsfYYMeLrrGuG4IvLwCNYlC0I0byk4pWRkNkDRRaDWQEqqxmZzQ/PkYGX
	d6QHKETbr9gXpVrkZZv2LlT+LJR9/7Ns7Hkn0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=pfWPSRDhyw9Zq3PgGy1RBQ63lrMn08ZlNwkJ06yV+Wj5wFri5+Y+7lZEaCgtxTIfjh
	zQvOh5lrZVl3Nm8NHFa+MoydMxquJXq3JvXHwqk10gcmZ/fRijNAi7+nii25/oQs9+7k
	Hh17X6JEz+HocthOJGxESJwX9hUiu7GEeKCuA=
MIME-Version: 1.0
Received: by 10.103.169.18 with SMTP id w18mr1433138muo.101.1244125403360; 
	Thu, 04 Jun 2009 07:23:23 -0700 (PDT)
In-Reply-To: <fce2a370902161502y2ebd80f7pb0214434b5888404@mail.gmail.com>
References: <1234795059.5643.2.camel@EPBYMINW0568>
	<87ljs6fgjx.fsf@neumann.lab.ossystems.com.br>
	<gncne6$i0f$1@ger.gmane.org>
	<fce2a370902161502y2ebd80f7pb0214434b5888404@mail.gmail.com>
Date: Thu, 4 Jun 2009 17:23:23 +0300
Message-ID: <fce2a370906040723l4991adb9gaf90dd35a543ef4d@mail.gmail.com>
From: Ihar Hrachyshka <ihar.hrachyshka@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] neon: bump version to 0.28.3
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
X-List-Received-Date: Thu, 04 Jun 2009 14:32:29 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

So what's the status of the patch? Can you update neon library?

On Tue, Feb 17, 2009 at 2:02 AM, Ihar Hrachyshka
<ihar.hrachyshka@gmail.com> wrote:
> How can I help to update neon version? testing some packages? Please
> provide me with the list of them, I'll try to build it.
> Anyway, I propose to update 'org.openembedded.dev' branch not stable
> one so it's not a big problem for those who really care stability
> issues I think.
>
> On Mon, Feb 16, 2009 at 11:56 PM, Vitus Jensen <vjensen@gmx.de> wrote:
>> Am Mon, 16 Feb 2009 14:16:34 -0300 schrieb Otavio Salvador:
>>
>>> Ihar Hrachyshka <ihar.hrachyshka@gmail.com> writes:
>>>
>>>> Seems that current neon versions doesn't work with gnutls 2.x
>>>
>>> In this case I belive it could be droped; what others think?
>>
>> Bad idea as "Please note: The neon API is subject to backwards-
>> incompatible change over minor versions (0.24.x -> 0.25.x) but is stable
>> across patch releases (0.24.0 -> 0.24.x)." (http://www.webdav.org/neon/)
>> and current recipes may rely on a specific minor version. =C2=A0As least
>> subversion and devfs2 tests neon versions. =C2=A0I haven't checked the o=
thers.
>>
>> Bye,
>> =C2=A0 Vitus
>>
>> --
>> Vitus Jensen, Hannover, Germany, Earth, Milky Way, Universe (current)
>>
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>
>


