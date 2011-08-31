Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1Qyl9o-0002u0-Es
	for openembedded-devel@lists.openembedded.org;
	Wed, 31 Aug 2011 15:48:44 +0200
Received: by bkbzu17 with SMTP id zu17so807098bkb.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 31 Aug 2011 06:43:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=QiXEtRJcM2T5wKWNcT+PCI+rg9s8XANBmYgq2fIs8uc=;
	b=t4sGq6kasR6X/SaZ+dSuHbtd8ny5+BdszgyNSwmTZzmX2Vnl2Xy33c8HY1OEbpaXTc
	SzQxavE0AiPhGbrvnFCUEuabwwz9vIaYVLeAIupSCJrqWB8Y0DfryTKu9OteSHllkt6y
	gD2Pm3etoeVfQJiW7qtjYXIoWEEcxiiAAXg4s=
MIME-Version: 1.0
Received: by 10.204.157.25 with SMTP id z25mr288782bkw.212.1314798230083; Wed,
	31 Aug 2011 06:43:50 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.204.156.217 with HTTP; Wed, 31 Aug 2011 06:43:50 -0700 (PDT)
In-Reply-To: <j3ld1i$l0g$1@dough.gmane.org>
References: <1314745564-3331-1-git-send-email-schnitzeltony@gmx.de>
	<j3kn1n$tqr$1@dough.gmane.org>
	<1314785183.3769.22.camel@mattotaupa>
	<j3l22l$5ti$1@dough.gmane.org>
	<20110831115548.GB3273@chargestorm.se>
	<j3l8ni$kr3$1@dough.gmane.org>
	<CAP9ODKrs1WvLOpHNKsJu0Uf7_8zFQ_GPrPz=+ttdy5tces2gjw@mail.gmail.com>
	<j3lad2$v75$2@dough.gmane.org>
	<CAP9ODKrOqJ12xba98J=2PAdk7p+pK=gGO0e01wuy_xTMZjsRcg@mail.gmail.com>
	<j3ld1i$l0g$1@dough.gmane.org>
Date: Wed, 31 Aug 2011 10:43:50 -0300
X-Google-Sender-Auth: DBO8xERw7392Kug_TBmsYpK5Qak
Message-ID: <CAP9ODKpupMXbfao42zScW4aJB2X0FHwEzBBDyMH_mdCyqYAJaw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Subject: Re: `PR = "r0"`: Add or not to add?
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
X-List-Received-Date: Wed, 31 Aug 2011 13:48:44 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 31, 2011 at 10:30, Koen Kooi <koen@dominion.thruhere.net> wrote=
:
>> Besides, this is also on the policy
>
> The OE classic policy maybe, not on the meta-oe policy[1].

ETOOMANYPOLICIES

>> so or you change the policy or you follow it. Otherwise makes no sense t=
o
>> have a policy if the person who merge the patches do not follow it.
>
> - From http://wiki.openembedded.org/index.php/Category:Policy I read:
>
> http://wiki.openembedded.org/index.php/Commit_Patch_Message_Guidelines
> http://wiki.openembedded.org/index.php/Commit_Policy
> http://wiki.openembedded.org/index.php/Commit_log_example
> http://wiki.openembedded.org/index.php/Styleguide
> http://wiki.openembedded.org/index.php/Versioning_Policy
>
> And none of those say PR =3D r0 is wanted behaviour. OTOH it doesn't say =
it's
> unwanted either.

So until it is explicit we might keep PR =3D r0 as it seems most people
prefer this way.

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


