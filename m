Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1Q0hGK-0005Sl-8E
	for openembedded-devel@lists.openembedded.org;
	Fri, 18 Mar 2011 22:31:12 +0100
Received: by iwn10 with SMTP id 10so4526330iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Mar 2011 14:29:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:in-reply-to:references:from
	:date:x-google-sender-auth:message-id:subject:to:cc:content-type;
	bh=a6mIIK7RWtspk3F1DTJW1Uu6xCC0B/NagzrHDNQFQxk=;
	b=gN2f/wU2p4DqNQtFwZkEwjHEZ6rXQ2D5VL3KwuHgnV8yxzhg79c23+HawTUPx8FFQj
	xCLTELXyF+8B5zFYGrb7MGG37oX4WEO7nzmwDbQzNw3CdiAAislzgvoOlDc77gqoWfuU
	+5GCpm5swBE9RWOFxU3r67Iw+aAKDuI3e7Tts=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type;
	b=StnOpIvRNvPszNl7zeKSrS/K/B5XmbSUAvMsa3hP87oJ3m3exet7ChOsSaqEJOq9oo
	WSM2jhP+x2Dci/3WlotpiesWLx/NWBfvC6PuYf8Q+teXoFE6xLqnrqui2yb9VRrZLHj7
	3Ey1T0cwyilAyFuPT/4CWbYfmom1aEkddf8Lc=
Received: by 10.42.162.65 with SMTP id w1mr2215687icx.334.1300483766076; Fri,
	18 Mar 2011 14:29:26 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.42.176.137 with HTTP; Fri, 18 Mar 2011 14:29:06 -0700 (PDT)
In-Reply-To: <AANLkTi=1fr0ZVD9WmsaBY_E3veZvdppTsJtVXY-1O88g@mail.gmail.com>
References: <6F3B187F-5497-4504-9EEB-99204CCC815B@vanille-media.de>
	<AANLkTi=1fr0ZVD9WmsaBY_E3veZvdppTsJtVXY-1O88g@mail.gmail.com>
From: Chris Larson <clarson@kergoth.com>
Date: Fri, 18 Mar 2011 14:29:06 -0700
X-Google-Sender-Auth: 7JEf9__3o4DUnlEnzzB-4QFIk4c
Message-ID: <AANLkTi=Rps4rd3aZPwCM2nTNWng0oU-Jzj_9kpkyXg7=@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: blacklist.bbclass
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
X-List-Received-Date: Fri, 18 Mar 2011 21:31:12 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Mar 18, 2011 at 1:33 PM, Frans Meulenbroeks
<fransmeulenbroeks@gmail.com> wrote:
> 2011/3/18 Dr. Michael Lauer <mickey@vanille-media.de>:
>> Salut,
>>
>> the blacklisting of packages as found in angstrom.bbclass
>> is pretty helpful and would be beneficial to all kinds
>> of distribution configurations in OE. Would there be
>> a strong objection of renaming this to blacklist.bbclass?
>>
>> Copying, of course, is also a possibility, but
>> in my opinion it would only be the second best choice.
>>
>> Cheers,
>>
>> :M:
>
> If blacklisting a certain package for all distro's is there then still
> a need to keep those blacklisted packages ????

Just because the class is named blacklist and *can* be used by any
distro doesn't mean we'd be globally blacklisting something for all
distros.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics


