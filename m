Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PuYw9-0003Tl-LD
	for openembedded-devel@lists.openembedded.org;
	Wed, 02 Mar 2011 00:25:03 +0100
Received: by fxm8 with SMTP id 8so5188333fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 Mar 2011 15:23:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=wwLNko95m4Gvf83watDpt2YoQJwAVvj0pwUx1WvLKaY=;
	b=WSf30FkGGqmjaIz2Ok/5ER7hYuY9aJ1/4VgQg59CWb1sO+C0rsQJGxFQiPXS77DczP
	QxRgPd9NfkwKhGo8K9KDmt0Sj1j1HYcLCYYMP8Q0zV5gr6iZf/RWoT2AmEkxq/aTEdlt
	SZiB/vVFjUZQ4THHGWLPDwrm8ce4gkpsPUeyw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	b=Y99JERAE90YGoLjOTZdZzTOeMxIl6wpz9vtJQ3elM/nqp7l3qlreYhtXghzRH4CAgb
	HaZvjdezVQMaUNAZ1sq8eAv2xO7z1wTQtdrg956kcZMGum1hWp9yDuZhX3gdRT1tvJrR
	ZdoIy/LK9CMEb9Q22FINOih8e924iJHxzrYLg=
Received: by 10.223.93.140 with SMTP id v12mr6528912fam.96.1299021815324; Tue,
	01 Mar 2011 15:23:35 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.30.151 with HTTP; Tue, 1 Mar 2011 15:22:21 -0800 (PST)
In-Reply-To: <ikjrjg$pqg$1@dough.gmane.org>
References: <4D6D6AC7.40203@mentor.com> <ikjrjg$pqg$1@dough.gmane.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 1 Mar 2011 15:22:21 -0800
Message-ID: <AANLkTikgoznfDHzuyBRk4FXkr9cLgo6C7+v6JDwYxXuy@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Koen Kooi <k.kooi@student.utwente.nl>
Subject: Re: OpenEmbedded Release-2011.03 !
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
X-List-Received-Date: Tue, 01 Mar 2011 23:25:03 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Mar 1, 2011 at 2:22 PM, Koen Kooi <k.kooi@student.utwente.nl> wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> On 01-03-11 22:53, Tom Rini wrote:
>> Hello all,
>>
>> First, I'd like to thank everyone that's been performing build and run
>> testing on the test-release-2011.03 branch and fixing up the issues
>> we've run into.
>>
>> With that said, I've pushed the final commit (and revert) and the tag
>> for the 2011.03 release of OpenEmbedded.
>
> Awesome! Thanks for all your work!
>
> I've been talking with Stefan and we'd like to do a maintenance branch
> based on the tag to support angstrom 2008 for Buglabs and TI and
> deprecate it in .dev. Can we host that branch on oe.org to make it
> usuable for other interest parties as well?

Yes I think thats a fine idea. At the same time I would suggest to
stop supporting stable/2009
and have a EOL defined for the new branch too.

>
> regards,
>
> Koen
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
>
> iD8DBQFNbXGuMkyGM64RGpERAoh3AJ4uOL29v7+G+F5vG+GKVxRh0woXuACggwk2
> CSFl717rJ3ocLLj9GkyuVfk=
> =t2fw
> -----END PGP SIGNATURE-----
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


