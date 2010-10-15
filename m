Received: from mail-vw0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <vwyodapink@gmail.com>) id 1P6eCG-00025G-UP
	for openembedded-devel@lists.openembedded.org;
	Fri, 15 Oct 2010 08:55:25 +0200
Received: by vws3 with SMTP id 3so296204vws.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Oct 2010 23:54:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=mnHmti4YQ8rcHzQh2wsShwERLrH6yKX3480G6j9ndpE=;
	b=cGGQKZ5NtmIfDBU4tlzL5curdW+lqr4THqLRsi8ZJM4/DC9qCwLO1zkpPn+UEkbo3i
	IA8ZPeMmEEl4+sG61DGmx6CUaC9G2kEx/fH8PPui+NW8OpaueKgFmMEprHEpYgFDgFHv
	5MqWrZMZkv0FsG+LMBLgW/gXcF/I167Ce40P4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=rIe0ks+yqaxNlIQEJCH24NUkwM2+27zY/9pUmYfyaGtzAvqkTa1e8gFDycHJhi5XqV
	D6C5hmoTe182/E4+Mxe3HWrQ7sPb1Q4qj3vVs2jJ/2lKUCaMlTfFo+mbuFpo0ODXzBli
	GeGcsi10EzMnhOUZ/y6MM5t353iPPevBaEAuk=
MIME-Version: 1.0
Received: by 10.220.179.203 with SMTP id br11mr148205vcb.23.1287125688380;
	Thu, 14 Oct 2010 23:54:48 -0700 (PDT)
Received: by 10.220.176.8 with HTTP; Thu, 14 Oct 2010 23:54:48 -0700 (PDT)
In-Reply-To: <AANLkTi=xVYpiS1ehpE+YeLsu9AiWHNUC74WuKh=LD1Pv@mail.gmail.com>
References: <AANLkTikORoazgt01ok+x+1fmv_9U5Ui7okbbUOBb-6Ft@mail.gmail.com>
	<AANLkTi=xVYpiS1ehpE+YeLsu9AiWHNUC74WuKh=LD1Pv@mail.gmail.com>
Date: Thu, 14 Oct 2010 23:54:48 -0700
Message-ID: <AANLkTikb+KR3hFvPx_b_mop2xf17+3jT=gFeef3Heyj4@mail.gmail.com>
From: "J. L. " <vwyodapink@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.212.47
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
X-List-Received-Date: Fri, 15 Oct 2010 06:55:28 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 30, 2010 at 1:07 PM, J. L. <vwyodapink@gmail.com> wrote:
> On Wed, Sep 29, 2010 at 1:09 PM, J. L. <vwyodapink@gmail.com> wrote:
>> I originally posted this on the gumstix mailing list and was told I
>> should ask here. I was wondering how come there is no libgcc-dev.ipk
>> that gets created though its in the work directory? I was trying to
>> compile a program on my machine and was giving me complaints about
>> libgcc-dev missing. Is this suppose to happen or? Thanks for any info
>> or help on this.
>>
>> JL
>
> Is there an easy way to gcc to build the libgcc-dev package? I am
> honestly clueless as to how to even attempt to getting that to be
> added into the builds.
>
>
>>
>>
>> ---------- Forwarded message ----------
>> From: Steve Sakoman <sakoman@gmail.com>
>> Date: Wed, Sep 29, 2010 at 12:59 PM
>> Subject: Re: [Gumstix-users] question about libgcc-dev
>> To: "General mailing list for gumstix users."
>> <gumstix-users@lists.sourceforge.net>
>>
>>
>> On Wed, Sep 29, 2010 at 12:07 PM, J. L. <vwyodapink@gmail.com> wrote:
>>> On Wed, Sep 29, 2010 at 6:54 AM, Steve Sakoman <sakoman@gmail.com> wrot=
e:
>>>> On Wed, Sep 29, 2010 at 2:20 AM, J. L. <vwyodapink@gmail.com> wrote:
>>>>> I was trying to install libpcap-dev and libpcre-dev and when I did
>>>>> they both said that libgcc-dev was an unmet dependency. I have tried
>>>>> searching and can not seem to figure out what provides that? I am sur=
e
>>>>> this is a really basic one that I am missing. Thanks if you can let m=
e
>>>>> know what to build to get that.
>>>>
>>>> The gcc recipe provides libgcc-dev
>>>
>>> I checked in the tmp and it only builds a libgcc1_4.3.3 which I
>>> already had on the system when it gave that error. I also dont see
>>> anything saying its a dev for anything in the gcc tmp build. Am I
>>> still missing something obvious here?
>>
>> I found it by searching through the tmp directory:
>>
>> $ ls -l tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.3.3-r17.1/packages-=
split/
>> | grep libgcc-dev
>>
>> drwxrwxr-x 2 sakoman sakoman 4096 2010-09-17 20:22 libgcc-dev
>>
>> But you are correct, the recipe doesn't seem to put an ipk in the
>> deploy directory. =A0Not sure why!
>>
>> Might be better to ask this question to the experts on the OE mailing li=
st.
>>
>> Steve
>>
>> ------------------------------------------------------------------------=
------
>> Start uncovering the many advantages of virtual appliances
>> and start using them to simplify application deployment and
>> accelerate your shift to cloud computing.
>> http://p.sf.net/sfu/novell-sfdev2dev
>> _______________________________________________
>> gumstix-users mailing list
>> gumstix-users@lists.sourceforge.net
>> https://lists.sourceforge.net/lists/listinfo/gumstix-users
>>
>

Well tried to figure out how to add it on my own and just kept
breaking the build, so hopefully someone may have time to look and
figure out why no libgcc-dev is created to install on the image. There
are packages that complain when installing them after the image is
built that this is missing from the image. I know of one other on the
gumstix mailinglist that has run into the same thing.

Thanks for your time.


