Received: from mail-ew0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <vwyodapink@gmail.com>) id 1P1PQA-00049P-P1
	for openembedded-devel@lists.openembedded.org;
	Thu, 30 Sep 2010 22:08:04 +0200
Received: by ewy7 with SMTP id 7so1048005ewy.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Sep 2010 13:07:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=J+dCf+qLyFGsf0hhymdvUOKnea6gBfa7G6xeJ3Q4TS0=;
	b=oM1Fnmblmga18ioznf5zf1k4Z0mfoA2iH1vlpLVdDAmiNm/yOLwi2knGdE0txxCHXm
	5swroNot4Vv6oqvmb7MgNL0P1OQjlo+6XBERBVkiZPEihlVwn+gsO1gYsYhm7yylotJP
	sN0KLwC24dmx428SwCFQ0jyTTjjOdAqdbq86A=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=HhGcFEz+iUQ8bxBzKK0TMEHqewZsXOGfQgBvdcYbACbwHj3pQoRiMjRYdVOOIZP9XT
	FEcKoeZOFNMk4pjYFLlgph67epcXnlBSbSqQ3bpex+cHTqHL75Y4wWAeMNCFLyR0WlR6
	47h7lHAwdwZ76b7QZlDkfX82tZw9iy6sp0eMQ=
MIME-Version: 1.0
Received: by 10.213.101.1 with SMTP id a1mr4775587ebo.82.1285877269979; Thu,
	30 Sep 2010 13:07:49 -0700 (PDT)
Received: by 10.220.195.72 with HTTP; Thu, 30 Sep 2010 13:07:49 -0700 (PDT)
In-Reply-To: <AANLkTikORoazgt01ok+x+1fmv_9U5Ui7okbbUOBb-6Ft@mail.gmail.com>
References: <AANLkTikORoazgt01ok+x+1fmv_9U5Ui7okbbUOBb-6Ft@mail.gmail.com>
Date: Thu, 30 Sep 2010 13:07:49 -0700
Message-ID: <AANLkTi=xVYpiS1ehpE+YeLsu9AiWHNUC74WuKh=LD1Pv@mail.gmail.com>
From: "J. L. " <vwyodapink@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.215.47
X-SA-Exim-Mail-From: vwyodapink@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: libgcc-dev.ipk not created Fwd: [Gumstix-users] question about libgcc-dev
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
X-List-Received-Date: Thu, 30 Sep 2010 20:08:04 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 29, 2010 at 1:09 PM, J. L. <vwyodapink@gmail.com> wrote:
> I originally posted this on the gumstix mailing list and was told I
> should ask here. I was wondering how come there is no libgcc-dev.ipk
> that gets created though its in the work directory? I was trying to
> compile a program on my machine and was giving me complaints about
> libgcc-dev missing. Is this suppose to happen or? Thanks for any info
> or help on this.
>
> JL

Is there an easy way to gcc to build the libgcc-dev package? I am
honestly clueless as to how to even attempt to getting that to be
added into the builds.


>
>
> ---------- Forwarded message ----------
> From: Steve Sakoman <sakoman@gmail.com>
> Date: Wed, Sep 29, 2010 at 12:59 PM
> Subject: Re: [Gumstix-users] question about libgcc-dev
> To: "General mailing list for gumstix users."
> <gumstix-users@lists.sourceforge.net>
>
>
> On Wed, Sep 29, 2010 at 12:07 PM, J. L. <vwyodapink@gmail.com> wrote:
>> On Wed, Sep 29, 2010 at 6:54 AM, Steve Sakoman <sakoman@gmail.com> wrote=
:
>>> On Wed, Sep 29, 2010 at 2:20 AM, J. L. <vwyodapink@gmail.com> wrote:
>>>> I was trying to install libpcap-dev and libpcre-dev and when I did
>>>> they both said that libgcc-dev was an unmet dependency. I have tried
>>>> searching and can not seem to figure out what provides that? I am sure
>>>> this is a really basic one that I am missing. Thanks if you can let me
>>>> know what to build to get that.
>>>
>>> The gcc recipe provides libgcc-dev
>>
>> I checked in the tmp and it only builds a libgcc1_4.3.3 which I
>> already had on the system when it gave that error. I also dont see
>> anything saying its a dev for anything in the gcc tmp build. Am I
>> still missing something obvious here?
>
> I found it by searching through the tmp directory:
>
> $ ls -l tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.3.3-r17.1/packages-s=
plit/
> | grep libgcc-dev
>
> drwxrwxr-x 2 sakoman sakoman 4096 2010-09-17 20:22 libgcc-dev
>
> But you are correct, the recipe doesn't seem to put an ipk in the
> deploy directory. =A0Not sure why!
>
> Might be better to ask this question to the experts on the OE mailing lis=
t.
>
> Steve
>
> -------------------------------------------------------------------------=
-----
> Start uncovering the many advantages of virtual appliances
> and start using them to simplify application deployment and
> accelerate your shift to cloud computing.
> http://p.sf.net/sfu/novell-sfdev2dev
> _______________________________________________
> gumstix-users mailing list
> gumstix-users@lists.sourceforge.net
> https://lists.sourceforge.net/lists/listinfo/gumstix-users
>


