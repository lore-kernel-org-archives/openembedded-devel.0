Received: from [209.85.198.245] (helo=rv-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1LcMfK-0003RB-Fq
	for openembedded-devel@lists.openembedded.org;
	Wed, 25 Feb 2009 17:31:22 +0100
Received: by rv-out-0708.google.com with SMTP id b17so94476rvf.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Feb 2009 08:28:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=2t2puoKyN8Y/tChpQT82IQtgC9ODK7p8q4h70BwlSjg=;
	b=WR2YSncZt0A/5mJf0tMBUSgF8XvtSDH+S+QAkV5oUj9dRnDeXR8w7MLv560boRYVoK
	wMobsTB/Bvw8QqYmaUoXXiG9VxS8hmPPhYWhZvSN9FuDszFhDxqJyb17c2VjGY+MgehN
	LYW++Pj+/Q6OHD6JRSzXf/i3dUQLLI5eArTkA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=kHACMk0GBRWIChZFtW6FrQWi3IFAr+cNKgybjNOGRu1sISBLuOBDH1znDyf/kNWt3D
	KJoap8BJFqJF8RJ3Lpx/YHI0De5nsQBM3lybYXNOYkNDUyLFuLEn8kwkpQRM90jmfV08
	L1+XL8xJLzlRWwNGWeON4w3kUGEto1J16O0gY=
MIME-Version: 1.0
Received: by 10.141.168.2 with SMTP id v2mr129547rvo.47.1235579290919; Wed, 25 
	Feb 2009 08:28:10 -0800 (PST)
In-Reply-To: <49A55A59.5080409@balister.org>
References: <f46da1cf0902201818r3fcf3432oc14929b5f455bbe7@mail.gmail.com>
	<f96d234e0902240651r7ad36677h8e828964308e2b50@mail.gmail.com>
	<49A55A59.5080409@balister.org>
Date: Wed, 25 Feb 2009 11:28:10 -0500
Message-ID: <f96d234e0902250828x6e72a8b6kc0a4285125f27b0e@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: Documentation/User Manual questions
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
X-List-Received-Date: Wed, 25 Feb 2009 16:31:22 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 25, 2009 at 9:48 AM, Philip Balister <philip@balister.org> wrot=
e:
> Cliff Brake wrote:
>>
>> On Fri, Feb 20, 2009 at 9:18 PM, Theodore A. Roth <taroth@gmail.com>
>> wrote:
>>
>>> 2: Was the documentation branch really last updated on May 9, 2008? Is
>>> there a newer branch I have not yet discovered?
>>
>> Yes, this is likely correct. =A0Documentation is not OE's strong point.
>> But the combination of various docs available cover things pretty
>> well:
>>
>> http://wiki.openembedded.net/index.php/Documentation
>
> I notice you keep copies of the manual on your website. Last week Koen
> suggested we add docs.openembedded.org to DNS. Would it make sense to go
> ahead and add this address and use it for "static" copies of documentatio=
n?

I have a script that automatically updates the docs and rsyncs them to
my web site.  I can adjust that as soon as docs.oe.org comes on line.
Given the reliability of OE infrastructure in the past, it was just a
lot easier to use my own server, but it seems like things are
stabilizing now.

Thanks,
Cliff

--=20
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Cliff Brake
http://bec-systems.com


