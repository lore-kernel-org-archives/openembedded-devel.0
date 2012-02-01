Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <leonid.titov@gmail.com>) id 1RsfMJ-0000ny-QG
	for openembedded-devel@lists.openembedded.org;
	Wed, 01 Feb 2012 19:56:43 +0100
Received: by lahc1 with SMTP id c1so827256lah.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 Feb 2012 10:48:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=W1cJINtREXEC2TkhulfmMoRvpNW8N6pPu4ruIOMl30E=;
	b=JpzfPYD3/VsiU9hGN6mM6ib3Q8aQ+fy/QkxmflUPlMOVmvvGqoYEFUXw6lZ+2FfMJc
	1eK3ft3utBOByAtQK4RTqIcVJl4OuPpa+KFfXyGycwiECnUMcYUBLIU/h7v6E2yUDXzH
	Ek4oYqkPjae/uomLwXDhbI+MXxVshBOr9bcw4=
MIME-Version: 1.0
Received: by 10.112.24.4 with SMTP id q4mr7121997lbf.80.1328122128371; Wed, 01
	Feb 2012 10:48:48 -0800 (PST)
Received: by 10.152.24.197 with HTTP; Wed, 1 Feb 2012 10:48:48 -0800 (PST)
In-Reply-To: <CAMKF1so7cMo0qiOPLuJrpk7kNuyk3dYEEZpM8nSGFKXMuUdoGQ@mail.gmail.com>
References: <4F291A06.4000406@gmail.com>
	<CAMKF1so7cMo0qiOPLuJrpk7kNuyk3dYEEZpM8nSGFKXMuUdoGQ@mail.gmail.com>
Date: Wed, 1 Feb 2012 22:48:48 +0400
Message-ID: <CANLRtZyE_ctYhoJmZd5KUJt70SG=ZU7T1TJCF12viQQgSM063Q@mail.gmail.com>
From: Leonid Titov <leonid.titov@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: Can't build openembedded: fail in picosam9_git.bb
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
X-List-Received-Date: Wed, 01 Feb 2012 18:56:43 -0000
Content-Type: text/plain; charset=KOI8-R
Content-Transfer-Encoding: quoted-printable

I do have a conf/machine/picosam9.conf. It and recipe are exact as in
repo (http://cgit.openembedded.org/openembedded/tree/conf/machine/picosam9.=
conf
and http://cgit.openembedded.org/openembedded/tree/recipes/linux/picosam9_g=
it.bb).

2012/2/1, Khem Raj <raj.khem@gmail.com>:
> 2012/2/1 Leonid Titov <leonid.titov@gmail.com>:
>> I've got a problem with building console-image for MACHINE=3Dpicosam9. I=
t
>> fails while processing picosam9_git.bb with these messages:
>
> do you have machine conf file for picosam9 ?
> recipes and machine confs  are different files.
> you have to show us both files here. That said
> your error is a fetching error which means something
> is wrong with either your SRC_URI or the remote server
> which is feeding the sources of this recipe
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


--=20
=F3 =D5=D7=C1=D6=C5=CE=C9=C5=CD,
  =EC=C5=CF=CE=C9=C4.


