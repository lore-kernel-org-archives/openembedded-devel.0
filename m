Received: from [209.85.218.165] (helo=mail-bw0-f165.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Lc3dW-0006Ww-6p
	for openembedded-devel@lists.openembedded.org;
	Tue, 24 Feb 2009 21:12:14 +0100
Received: by bwz9 with SMTP id 9so5734615bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Feb 2009 12:09:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type:content-transfer-encoding;
	bh=K4O9iFNevg9omBx0zPVcnOM5/VKPJHjYom4514YiiOU=;
	b=CH7h7j6N/4rfShl3wIO2VdVxPVXdco+NHCf/z0gXC5Rz7mFfb5PWIhs9zUIlRj4I5w
	4uy9ecR7hUEe7aibCqToXkUz1oQ/8tGe1lTuMmoTp6Z4hjnxIuL4sZfbj8pRwO9s6nN6
	y8r/UKdf56ARUG2FlCuzWT3pEFW9mxBGBCGs0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=HRL9jbwLd5scNxCV5+mkC37h9MxUlR+InuFZ7MW++H73B5SAtRzUZaGviW9/a/XtY0
	zQn81CH91HdR2h230PBmbROxKQ78agN8JwwVSWc76R+VYpWffaIcTIa0CCflXoraqJDE
	AY2KJWZOekp5ynvukonnMsrHvUYMVY3VnVOIc=
MIME-Version: 1.0
Received: by 10.223.105.9 with SMTP id r9mr52061fao.66.1235506147947; Tue, 24 
	Feb 2009 12:09:07 -0800 (PST)
Date: Tue, 24 Feb 2009 21:09:07 +0100
Message-ID: <ac9c93b10902241209l692eebe3n26da3e66dae7bea3@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] [Doc] getting_oe.xml: Update documentation.
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
X-List-Received-Date: Tue, 24 Feb 2009 20:12:14 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

>
> On Tue, Feb 24, 2009 at 7:23 AM, Cliff Brake <cliff.brake@gmail.com> wrot=
e:
>> Thanks for the patch. ?Can you reply with the no line wraps, or attach
>> the patch to an email as the following is corrupt?
>
> Patch included as an attachment.
>
> I have also been pushing my changes to the troth-doc branch here:
>
> =A0http://github.com/troth/oe-ts7xxx/tree/troth-doc
>
>>
>> I also have not figured out a good way to easily send patches through
>> gmail, so let me know when you figure it out :-)
>
> I don't think it is possible. Gmail is "too smart" for us. :-)

It is possible with gmail, but not with the web interface.
I've submitted patches to LKML through gmail.
Just follow Documentation/email-clients.txt

In my case I used alpine to send the message, make sure you disable wrappin=
g.

FM.


