Received: from mail-lb0-f175.google.com ([209.85.217.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SPouN-0006Ut-Or
	for openembedded-devel@lists.openembedded.org;
	Thu, 03 May 2012 07:48:55 +0200
Received: by lbol5 with SMTP id l5so841706lbo.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 02 May 2012 22:39:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=DfQFMUxqn4A3nstMGh59eskIqV3yHQoQWzVFoKA/l9o=;
	b=BMk8bpx/I4SD7vjA2RQLBb8EVToqIY2azzrU4JB+VovprRN2iLLZahW6Qa+TkZAmbA
	91nK71TwxO+0Aq+frEamy4+WiPxyNQRQURl+0NV5wM5HhDNdk6yacCmblQF+8PbKWlos
	4br5sUNLpNw+VtlaR1fMjLPjDwzIw1zN9I2uk61Upa66Wp7cZXSk5ZdzdHxBv1PCeeu+
	yTA19F+jRD1qVKg2kmZi0+xAVXiM2Wa/JDiv2johIa3mS5UCdm3Jg1/BeRRhRImTGK/2
	KbTVjt9ENgegrnDgLe7elZIilZSO+3TmVffdKmCfGFm80yWFQep+Vdn7VvwbUUr8Vi1D
	Q9nQ==
Received: by 10.152.111.198 with SMTP id ik6mr709606lab.38.1336023550666; Wed,
	02 May 2012 22:39:10 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.152.129.134 with HTTP; Wed, 2 May 2012 22:38:40 -0700 (PDT)
In-Reply-To: <20120503053023.GB4658@jama.jama.net>
References: <1335951932-6143-1-git-send-email-koen@dominion.thruhere.net>
	<1335951932-6143-4-git-send-email-koen@dominion.thruhere.net>
	<20120502095150.GA3682@jama.jama.net>
	<CAMKF1spM9urWo1VBXG=qdWOcC_5_2kw-vBGqWv3Lg0xBPWiADA@mail.gmail.com>
	<788719CB-F74E-4219-85AC-82BE71D2068F@dominion.thruhere.net>
	<20120502182913.GA4658@jama.jama.net> <4FA1A48A.2040605@gmail.com>
	<20120502221055.GB4581@denix.org>
	<CAMKF1so1Qi3D==OqBFjLo6AEaJR6318NdJs7vVuqYb=T=c-xHQ@mail.gmail.com>
	<20120503053023.GB4658@jama.jama.net>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 2 May 2012 22:38:40 -0700
Message-ID: <CAMKF1sqNC0c4kf_6XtezstqCEHkOTdvw-pdPZy6Kt0QuXBkm9Q@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe/denzil][PATCH 4/6] gcc-4.5: Match with OE-Core on building procedure for libgcc and gcc-runtime
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
X-List-Received-Date: Thu, 03 May 2012 05:48:55 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, May 2, 2012 at 10:30 PM, Martin Jansa <martin.jansa@gmail.com> wrot=
e:
> On Wed, May 02, 2012 at 05:04:42PM -0700, Khem Raj wrote:
>> On Wed, May 2, 2012 at 3:10 PM, Denys Dmytriyenko <denis@denix.org> wrot=
e:
>> >> good and as Koen is nodding I assume angstrom is fine too. So I think
>> >> we should drop the layer from master.
>> >
>> > Yes, but not immediately - give one or two week notice, please :) Actu=
ally,
>> > this should be considered as a notice and the actual commit to remove =
should
>> > be executed later, if nobody says otherwise... Basically, sending an R=
FC patch
>> > for review that deletes gcc-4.5 and waiting few days should do it.
>>
>> OK consider that as notice then
>
> Maybe keep empty layer (without recipes) at least for a while so that
> people doesn't have to update bblayers.conf immediately with next update.
>

ok.

> Cheers,
>
> --
> Martin 'JaMa' Jansa =C2=A0 =C2=A0 jabber: Martin.Jansa@gmail.com
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


