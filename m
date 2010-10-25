Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1PAUB5-0003mT-1m
	for openembedded-devel@lists.openembedded.org;
	Mon, 25 Oct 2010 23:02:02 +0200
Received: by iwn42 with SMTP id 42so61265iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Oct 2010 14:01:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=/dtwtNMe7HaqVTdAV7ceO6/+SZ6Ytkv/TG4qxSRtCWA=;
	b=Kzx36jCCrbwdGOsATIGs1ZZ9YpWD+ICg/CCsi88Uor5p6dCm18xb7IQ+P6jRtRmbVL
	6eKDF/mmiISNbbFHdQQZ5E1A/boJkqNDf4mfPVjjVRs1BPyPyhVEycpw+LddSxYdy2Je
	V4wmBHhyh4bR9n76Y3BxlbggNHkZJUS0Ol86U=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=NXCtD1ittr5TTq5a7K0SXpmGrF2w0bpnvtG3qy0JE9Zi6w0jJtyhyL6o5UuJA7BmK0
	jeis5E4yvwkiFekwaNNvXJLuvwEp9oOv+sOA+K/OV2zB1ZQ6T4AYq46vMmSYxZiA3uRu
	gcLv9BQoqTVFKV6owdPP4bphh8z0EKYSCD/Zk=
MIME-Version: 1.0
Received: by 10.231.172.70 with SMTP id k6mr748731ibz.125.1288040474755; Mon,
	25 Oct 2010 14:01:14 -0700 (PDT)
Received: by 10.231.32.10 with HTTP; Mon, 25 Oct 2010 14:01:14 -0700 (PDT)
In-Reply-To: <1288039756.11526.42.camel@mattotaupa>
References: <1288039756.11526.42.camel@mattotaupa>
Date: Mon, 25 Oct 2010 23:01:14 +0200
Message-ID: <AANLkTinguuX3AbHpRGUnH97qZcpB_z70NaQjcw9ZsjmD@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: commit access for Andreas Oberritter
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
X-List-Received-Date: Mon, 25 Oct 2010 21:02:02 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

2010/10/25 Paul Menzel <paulepanter@users.sourceforge.net>:
> Dear OE developers,
>
>
> I am proposing commit access for Andreas Oberritter. He submitted a lot
> of patches lately [2] which are in my opinion of good quality and adhere
> to the commit policy=B9. He is very responsive too and incorporates the
> suggestions quickly.
>
> As I am no developer my proposal needs two votes in favor of my request
> as documented on the New Dev page [1].
>
>
> Thanks,
>
> Paul
>
>
> =B9 Only nitpick is, that v2, v3, =85 information belongs under the =BB--=
=AB in
> my opinion. ;-)
>
>
> [1] http://wiki.openembedded.org/index.php/New_Dev
> [2] http://patchwork.openembedded.org/project/openembedded/list/?submitte=
r=3D630&state=3D*&archive=3Dboth
>
> _______________________________________________

Well I've been reviewing (and pushing) quite some of his patches. They
are good quality, so he has my vote.

Frans


