Received: from [209.85.221.172] (helo=mail-qy0-f172.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jhautbois@gmail.com>) id 1MMhfF-0000yh-LN
	for openembedded-devel@lists.openembedded.org;
	Fri, 03 Jul 2009 14:14:49 +0200
Received: by qyk2 with SMTP id 2so2438156qyk.24
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 03 Jul 2009 05:02:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=87cKptzQCPTzfekvVgp3Mtj0OrxCIj+2Gwp3xe0WlI4=;
	b=AKlzqFfoCNInWFU2elQ0Jom4xsjq+c5SRQEc/1nxX3DcPknAxl9zhqo8sl/y4bh9vk
	/5oAIw+r0hHWqocKEv/H26XszOZfSqWXrQzSmSRdWMIei2FNL5bP4xwPGkKX6xqaCOIs
	+2woqD3BBoz5RMOYF7PgeONpCO3raZ6yctI0Q=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=VvUSllLaw4ufKsqKDDUW5U/8v3Rr/ctrZIdBbzYBYfLBFjI4O92pu7iFthEQBpmIpa
	pRB4h7YNi65aj0RWaTbOvM49wLWa2V1mimj6eNJD2z+PfewuxaoH25Ixi74qGn+rhWk1
	0EsU0013JAYYZMwmh5H3tZIKkBsgArye6fYs4=
MIME-Version: 1.0
Received: by 10.224.28.81 with SMTP id l17mr1779590qac.301.1246622560376; Fri, 
	03 Jul 2009 05:02:40 -0700 (PDT)
In-Reply-To: <1246617033.26610.65.camel@mill.internal.reciva.com>
References: <8cad0aa0907030319m60d8da2awa7a5f1685db0ee9a@mail.gmail.com>
	<1246617033.26610.65.camel@mill.internal.reciva.com>
Date: Fri, 3 Jul 2009 14:02:40 +0200
Message-ID: <8cad0aa0907030502o2d6c494cq76adf8ea124161b9@mail.gmail.com>
From: Jean-Michel Hautbois <jhautbois@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [GLibc]Version 2.8 and timerfd_* syscalls
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
X-List-Received-Date: Fri, 03 Jul 2009 12:14:49 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2009/7/3 Phil Blundell <philb@gnu.org>:
> On Fri, 2009-07-03 at 12:19 +0200, Jean-Michel Hautbois wrote:
>> When I modify my local.conf file, specifying:
>> PREFERRED_VERSION_glibc =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ?=3D "2.8"
>> PREFERRED_VERSION_glibc-initial =A0 =A0 =A0 =A0 ?=3D "2.8"
>
> There doesn't appear to be any recipe for glibc 2.8 in the repository.
> Maybe you could try using 2.9 instead. =A0If this isn't suitable then
> perhaps you would like to contribute a recipe for 2.8.
>

OK, I have the same message with 2.9.
I could try to contribute a recipe, but for that, I will need some
help, because I don't know how to do this in a short time ?

How can I know which recipes are are in the repository ?

Thx and Regards.
JM


