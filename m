Received: from mail-qy0-f175.google.com ([209.85.216.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.rini@gmail.com>) id 1RUtb0-000233-Ce
	for openembedded-devel@lists.openembedded.org;
	Mon, 28 Nov 2011 06:17:38 +0100
Received: by qyk30 with SMTP id 30so1206805qyk.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 27 Nov 2011 21:11:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=HioELGKrPqdOhbLNEXnK6TNcegUV4aeYgsArDG7J3Oc=;
	b=NawbblrGtg7FlotKLI+61XbtVWdfwXIRsqTq4/muQxs2q9bT7msbNh/xVrlKLz69vU
	9j1gS6oMM/IJmwhr3SSHscvLxSBersBte4F37EqUabKYKtikXL4MAmLWyFvNrJjjsEXS
	DzTyI+f9X40AWKbrotkkMyS9u8DQHHbhCJUlo=
MIME-Version: 1.0
Received: by 10.229.46.4 with SMTP id h4mr3511663qcf.188.1322457060416; Sun,
	27 Nov 2011 21:11:00 -0800 (PST)
Received: by 10.229.94.72 with HTTP; Sun, 27 Nov 2011 21:11:00 -0800 (PST)
In-Reply-To: <jatlso$idi$1@dough.gmane.org>
References: <CA+M6bX=PYZ+2vb32ZmT3SirqHdKpCtD90QqtHhQiWSp38f1kVA@mail.gmail.com>
	<jatlso$idi$1@dough.gmane.org>
Date: Sun, 27 Nov 2011 22:11:00 -0700
Message-ID: <CA+M6bXnQN9Q62w22sjiVaqkdipaXPgujR_FTWPE8N24z=MAW4A@mail.gmail.com>
From: Tom Rini <tom.rini@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: Documentation problems
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
X-List-Received-Date: Mon, 28 Nov 2011 05:17:38 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 27, 2011 at 8:44 AM, Koen Kooi <koen@dominion.thruhere.net> wro=
te:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Op 27-11-11 03:40, Tom Rini schreef:
>> Hey all,
>>
>> As things stand today, the wiki is out of date and a number of folks
>> refuse to work on it.
>
> Does it actually need to be a wiki? Or rather: do web edits need to show =
up
> immediately?

If spam is eliminated, does it still matter, today?

>> Paul Menzel has mentioned that ikiwiki has been mentioned before and tha=
t
>> lets us have the website in a repository. =A0Do folks have other ideas?
>
> I really like the idea of storing the content in git since it gives us 2
> things we need for documentation: backups and a pull model.

The number one thing we lack today is people willing to document.
Everyone, myself included, who has said we need X done to the public
documentation today, has generally found a point at which they stop
wanting to keep things up to date.  Why?  What would change that?
Does anyone reading this know people that _like_ editing wikis?  Can
we ask them what keeps them engaged in the process?

--=20
Tom


