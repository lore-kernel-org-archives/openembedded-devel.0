Received: from [209.85.217.20] (helo=mail-gx0-f20.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1KnZ1E-00015U-Ok
	for openembedded-devel@lists.openembedded.org;
	Wed, 08 Oct 2008 15:24:00 +0200
Received: by gxk13 with SMTP id 13so7871306gxk.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 08 Oct 2008 06:19:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to
	:subject:in-reply-to:mime-version:content-type
	:content-transfer-encoding:content-disposition:references;
	bh=aRzHYrlH2oth0cKGjCR9zT5TETwTkEKmuOEueDtkxyo=;
	b=UbmJSM81yKjSDJQApl2w5lkNcAoAysywVTtA1Nc/rH6krMVlOxnrgFDcLympbkgWD6
	vnef2kYfqTEIaPbLgRJoL48HNde/5xe8OIEosyz7WBH7WSN3B6dHzloozbElYzeqSjMv
	aFXsf75gGs6o9rjpy0wu+DPFcAeeAOLFvbwy4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:in-reply-to:mime-version
	:content-type:content-transfer-encoding:content-disposition
	:references;
	b=gRQEhOmM13+CDs+Esb5vzTKd9S6E4k/2hfLBJUrfynavntKDasHaPiaXOD0Lb/LCRK
	wQcn311IobfeocOy8Le1zmOTjThwl0nlVQ0x9C7BuwBATrmZYxGAHsaT0nBtKC0tUWfB
	v+J7BBT/txUFTVktLVJNqONiNsJaS/yW7fzNY=
Received: by 10.100.178.15 with SMTP id a15mr648306anf.3.1223471960383;
	Wed, 08 Oct 2008 06:19:20 -0700 (PDT)
Received: by 10.100.174.18 with HTTP; Wed, 8 Oct 2008 06:19:20 -0700 (PDT)
Message-ID: <c384c5ea0810080619w45ad0167x97c2b1f3b7c24a4b@mail.gmail.com>
Date: Wed, 8 Oct 2008 15:19:20 +0200
From: "Leon Woestenberg" <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <gci4to$pcf$1@ger.gmane.org>
MIME-Version: 1.0
References: <200810080751.15817.zecke@selfish.org> <gchpoa$kal$1@ger.gmane.org>
	<200810081303.35934.zecke@selfish.org> <gci4to$pcf$1@ger.gmane.org>
Subject: Re: ETA on git conversion
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
X-List-Received-Date: Wed, 08 Oct 2008 13:24:01 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Hello,

On Wed, Oct 8, 2008 at 1:18 PM, Koen Kooi <k.kooi@student.utwente.nl> wrote=
:
> On 08-10-2008 13:03, Holger Freyther wrote:
>> On Wednesday 08 October 2008 10:07:38 Koen Kooi wrote:
>>> On 08-10-2008 07:51, Holger Freyther wrote:
>>>>
>>>> we would like to switch to git by next wednesday. Jan L=FCbbe went thr=
ough
>>>> the hassle to fix two issues in my mtn2git.py and we are happy with th=
e
>>>> metadata and can even unite it with the data exported from bitkeeper.
>>>
Thanks for all the efforts.

Regarding the GIT phrasebook, as a starter:

I assume the GIT ssh public key must be generated with SSH, and not
some git (sub) command?


Regards,
--=20
Leon


