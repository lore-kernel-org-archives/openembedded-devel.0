Received: from mail-vw0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lamiaposta71@gmail.com>) id 1RRprm-000230-Kw
	for openembedded-devel@lists.openembedded.org;
	Sat, 19 Nov 2011 19:42:18 +0100
Received: by vbbey12 with SMTP id ey12so1257844vbb.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 19 Nov 2011 10:35:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=Nhb+6d6U6Lo3QxKUxjzfVxwsgW84rD6beKUGm4csqvE=;
	b=YIi3wYnkl0YiCEQdCM70jUCKbRpkJP2jdm6oJFwhQVNlPcSYGSefXiqRD+j4jqy+p7
	RZJ3zw4QWxXWWkkYytoSUZYssGWBQ/khfvoNria2Yk8a3aFWS3vTnsT3/e+0TEyj3PmC
	K7w9/Harz1NwNm4XYJaZf1xDxH9O5ctvjb88Y=
MIME-Version: 1.0
Received: by 10.224.186.199 with SMTP id ct7mr3461393qab.41.1321727749754;
	Sat, 19 Nov 2011 10:35:49 -0800 (PST)
Received: by 10.229.88.195 with HTTP; Sat, 19 Nov 2011 10:35:49 -0800 (PST)
In-Reply-To: <CAPOJ94M00kuN24yqsqBByzxmykM55Pb6F2d8=ixtmF97GHKbOw@mail.gmail.com>
References: <CAFU7RzMFc2jtHKRAHQYBykpBTAVhpEKh+01yKUZFXr6Et+LDFA@mail.gmail.com>
	<4EC76361.9070604@eukrea.com>
	<CAPOJ94M00kuN24yqsqBByzxmykM55Pb6F2d8=ixtmF97GHKbOw@mail.gmail.com>
Date: Sat, 19 Nov 2011 19:35:49 +0100
Message-ID: <CAFU7RzPDy78SA4iXELBv7+0C-nDaQzSt7fStakAu-xBu8-rNKA@mail.gmail.com>
From: Raffaele Recalcati <lamiaposta71@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: dm3730 question
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
X-List-Received-Date: Sat, 19 Nov 2011 18:42:18 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 19, 2011 at 1:36 PM, Peter Bigot <bigotp@acm.org> wrote:
> On Sat, Nov 19, 2011 at 2:05 AM, Eric B=C3=A9nard <eric@eukrea.com> wrote=
:
>> Hi Raffaele,
>>
>> Le 19/11/2011 08:28, Raffaele Recalcati a =C3=A9crit :
>>>
>>> At the moment I have a arago image running am37xx (without dsp) on my
>>> desk with 2.6.37.
>>> Can anybody point me the right branch for OE in order to move also
>>> with dm3730 to 2.6.37 kernel?
>>> The MACHINE can be either beagle-xm or dm3730-evm.
>>> The confusion is created by the MACHINE=3Dbeagleboard that I don't know
>>> if support dm3730 cpu.
>>
>> current oe-core builds a 3.0.x kernel which runs fine on beagleboard.
>> http://git.angstrom-distribution.org/cgi-bin/cgit.cgi/meta-texasinstrume=
nts/tree/recipes-kernel/linux/linux_3.0.bb
>>
>> Yo can get it easily with
>> http://git.angstrom-distribution.org/cgi-bin/cgit.cgi/setup-scripts/
>
> To my knowledge, until
> https://lists.yoctoproject.org/pipermail/meta-ti/2011-November/000124.htm=
l
> is addressed anybody starting a new oe-core based effort (one that
> doesn't have the old TI tools zip file already downloaded) will have
> problems getting the DSP stuff to work.

Monday I hope this point will be explained.
Thx anyway for the information.


