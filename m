Received: from mail-qw0-f47.google.com ([209.85.216.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cargoudel@gmail.com>) id 1P4kJh-0002ew-GE
	for openembedded-devel@lists.openembedded.org;
	Sun, 10 Oct 2010 03:03:15 +0200
Received: by qwd6 with SMTP id 6so1057893qwd.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 09 Oct 2010 18:02:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:sender:received
	:in-reply-to:references:from:date:x-google-sender-auth:message-id
	:subject:to:content-type:content-transfer-encoding;
	bh=o1alFExvfuAwbdqjFt/5SGaVNIGgdNuLzDC/+KeuW6s=;
	b=IWhwRiMGafB2TAyS2OAKSqqOGK+5dwAb1KAXrwBCN3GE0FkTy/VqspXudSEfA3XghO
	qc9y1dwUTRspKDKgifIZvxKPKey15dwMHjHXDBB/p5Lg7p5AqR3LbxgzdgqP0OpKPfaF
	K4tfcxn7Uzkift/UTUu3vBxTJfzchuBUgI3C0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type
	:content-transfer-encoding;
	b=EAY3qv/vo8j6X8QcF/fgrdWH4skrUFyMHN7atfWRe93A56rCz1OqsJ5OEblXNOQsSD
	T+mgpElvg4sTqR9SHPimoy+O6UBkL8H23RUGfvChr8mS2OfkIgWgnSehMjayeNROsAOr
	uZnn7yjOiQtBXJ9wNMU1cF0LioZuxGxe+HjbE=
Received: by 10.224.215.67 with SMTP id hd3mr3138253qab.61.1286672563927; Sat,
	09 Oct 2010 18:02:43 -0700 (PDT)
MIME-Version: 1.0
Sender: cargoudel@gmail.com
Received: by 10.229.121.17 with HTTP; Sat, 9 Oct 2010 18:02:23 -0700 (PDT)
In-Reply-To: <AANLkTinbNucPm-bK52mrOhjOo9mJfWHUBkBct6KXCXsm@mail.gmail.com>
References: <AANLkTinFs+k=b-UowmKXY9kWFvSdv772K1n7B+uzkJHL@mail.gmail.com>
	<AANLkTinpUwuVykASgF2gj=3QRTmGpa5mZpS6_TwrLpGj@mail.gmail.com>
	<AANLkTinbNucPm-bK52mrOhjOo9mJfWHUBkBct6KXCXsm@mail.gmail.com>
From: "R.T. McGee" <67800@udel.edu>
Date: Sat, 9 Oct 2010 21:02:23 -0400
X-Google-Sender-Auth: uW_VdFU5ifdMEb3t8ktOW1EIs_A
Message-ID: <AANLkTim84G8gG5T3AmHBkTK9S_8qiu-SanMqtKkA-E3Q@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.216.47
X-SA-Exim-Mail-From: cargoudel@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: FA526 / CNS2132 / TS-7500 build configuration
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
X-List-Received-Date: Sun, 10 Oct 2010 01:03:15 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

I got this all setup, and I even got openjdk compiled and working. For
anyone who is interested check it out on the wiki
http://wiki.openembedded.net/index.php/TS-7500

Also I posted the machine configurations here
http://mirror.lug.udel.edu/pub/lug-udel/projects/ts7500/  Is this the
right place to request these be added to the openembedded git tree?

On Sat, Oct 9, 2010 at 8:55 PM, R.T. McGee <67800@udel.edu> wrote:
> I got this all setup, and I even got openjdk compiled and working. For
> anyone who is interested check it out on the wiki
> http://wiki.openembedded.net/index.php/TS-7500
>
> Also I posted the machine configurations here
> http://mirror.lug.udel.edu/pub/lug-udel/projects/ts7500/ =A0Is this the
> right place to request these be added to the openembedded git tree?
>
> On Sat, Oct 9, 2010 at 8:47 PM, R.T. McGee <67800@udel.edu> wrote:
>> I got this all setup, and I even got openjdk compiled and working. For
>> anyone who is interested check it out on the wiki
>> http://wiki.openembedded.net/index.php/TS-7500
>>
>> Also I posted the machine configurations here
>> http://mirror.lug.udel.edu/pub/lug-udel/projects/ts7500/ =A0Is this the
>> right place to request these be added to the openembedded git tree?
>>
>> On Sun, Sep 19, 2010 at 7:15 PM, R.T. McGee <67800@udel.edu> wrote:
>>> The Faraday FA526 core is used in ARM processors like the Semi STR8132
>>> / Cavium CNS2132 which is in my Technologic Systems TS-7500 board in
>>> addition to some NAS boxes out there. From what I have read, it
>>> basically resembles a ARM920T but has NO thumb interworking support
>>> which makes it not fully EABI compliant (
>>> http://www.mail-archive.com/openocd-development@lists.berlios.de/msg058=
56.html
>>> ). I have build a few tool chains manually that produce working code
>>> using a configuration meant for a OABI style armv4 which makes sense
>>> since it uses NO thumb instructions, but I am not sure this is
>>> optimal.
>>>
>>> What is the best way to move forward to setup a OpenEmbedded
>>> distro/machine configuration for something like the TS-7500 or a
>>> general FA526 configuration? =A0I guess, one option is setup OABI ARMv4
>>> style setup but this was removed from things like angstrom a while
>>> ago. Switching to OABI just to get rid of thumb seems a little silly.
>>>
>>> It would be nice to figure out a way to use EABI ARMv4T toolkit but
>>> pass flags like -mapcs-32 -mno-thumb-interwork (just a guess) to GCC
>>> to insure no thumb instructions (other weird things are discussed in
>>> http://wiki.debian.org/ArmEabiPort#Otherscenarios ). =A0The linker
>>> option -fix-v4bx looks promising for the linker also. A lot of things
>>> are possible solutions, but whats the cleanest way to work it into
>>> OpenEmbedded's build system?
>>>
>>> Any suggestion would be helpful. Thanks.
>>>
>>
>


