Received: from mail-ew0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <agnel.joel@gmail.com>) id 1QthyT-0004qZ-Oi
	for openembedded-devel@lists.openembedded.org;
	Wed, 17 Aug 2011 17:24:10 +0200
Received: by ewy5 with SMTP id 5so429178ewy.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Aug 2011 08:19:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=CMkP5CU/OFeHNU4SN1zYyAGYTUm1P1wXIdjL8N1gN6I=;
	b=WA+hAfqR1Iv46mPeTjdPlqRyeL6dNy54WwNH6wUgI1omerdPy6+OehlZVgAKwWyZ6j
	TBAhduuvTSLMJ/+b1IA0Z4+a5ARNq67NQQI+kBrLeawGvlguqOKbFLx8lB4f+m0VSYFY
	WZBDi9+aLjudQTjubUA1/Ag4TXULhhMHYMUmo=
MIME-Version: 1.0
Received: by 10.213.26.216 with SMTP id f24mr1219611ebc.2.1313594370784; Wed,
	17 Aug 2011 08:19:30 -0700 (PDT)
Received: by 10.213.106.8 with HTTP; Wed, 17 Aug 2011 08:19:30 -0700 (PDT)
In-Reply-To: <j2fqe3$jor$3@dough.gmane.org>
References: <j2e2rb$g94$2@dough.gmane.org>
	<CAD=GYpZcqHkLF4AL561ERypO9FSmy87_7iec0-Ph359-DrSAGA@mail.gmail.com>
	<j2fqe3$jor$3@dough.gmane.org>
Date: Wed, 17 Aug 2011 10:19:30 -0500
Message-ID: <CAD=GYpZn2nq6d8=DDG=oj4jOFQC6=WeMTn+cNcEb-QEhCW8FzA@mail.gmail.com>
From: Joel A Fernandes <agnel.joel@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: "Kooi, Koen" <k-kooi@ti.com>
Subject: Re: meta-oe patch status
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
X-List-Received-Date: Wed, 17 Aug 2011 15:24:10 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Aug 17, 2011 at 2:25 AM, Koen Kooi <koen@dominion.thruhere.net> wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Op 16-08-11 22:11, Joel A Fernandes schreef:
>> Hi Koen,
>>
>> Could you pull the first 4 commits from: git://github.com/joelagnel/meta-openembedded.git (branch for-koen)
>>
>> These are for gedit and their dependencies, I have verified them with a build.
>>
>> 02f0fee libgnomeprint: Imported from OE classic 8031b13 libgnomecups: Imported from OE Classic d9d57d5 gtksourceview: Imported from OE classic cad106a gedit: Imported from OE classic
>
> Can you please send them here for review first?

Sure, I will post them here as an RFC

thank you,

Joel


> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
>
> iD8DBQFOS20DMkyGM64RGpERAlWNAJ93N6pP9yHMEibKNCMvQ5lLo4cXCACeLfJj
> 83bcU10oO4xfoMNmvs1xQdU=
> =r6ep
> -----END PGP SIGNATURE-----
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


