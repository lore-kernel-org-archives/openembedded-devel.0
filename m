Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1PKPkY-00059j-KU
	for openembedded-devel@lists.openembedded.org;
	Mon, 22 Nov 2010 07:19:41 +0100
Received: by yxd5 with SMTP id 5so4108197yxd.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 21 Nov 2010 22:18:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=FV4vtODLcOVB+2Ozs9IUXjkk1sxsdmWoeuuBKsJ8coA=;
	b=pylOUxxtQdnHIY0sF7fXjcC2w/pLhgHWgcrWyAXTAmY6ttjSLdmsss3YcrmWolduxl
	Qs7YlQYvlqYSVX2ysmpF9P9Y4Aqo/1QD4nzc7aWIbJmteyHRxWfgD4n6XX+WxUQFLbJ8
	ODDVXie4YSMOL78hKV3JmSbeIunBlKsTceRhU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=MDBn7enhAziKQzxUQCSelJNGc4XXc0j7fYafY6WGPNonEpzjgPsU+gQ4+3eCeaKqtT
	Ob1TX6MYe6PmGrfP4z6CdASv5xPpnneKApZKmZkLfR8tRpxwtfsgS4JlT/3SfBwZlshx
	eKsy77ilCg0PurPMosx1Z1FmMTTp7Q8nmWLHk=
Received: by 10.91.51.19 with SMTP id d19mr6668747agk.183.1290406706051; Sun,
	21 Nov 2010 22:18:26 -0800 (PST)
MIME-Version: 1.0
Received: by 10.90.120.8 with HTTP; Sun, 21 Nov 2010 22:18:05 -0800 (PST)
In-Reply-To: <4CE9607C.1050506@balister.org>
References: <4CE739F6.5020303@balister.org>
	<AANLkTinq6+aKi37C5RvuaK6Ae7BT_vUZx6J39NHKz8t2@mail.gmail.com>
	<4CE9607C.1050506@balister.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 21 Nov 2010 22:18:05 -0800
Message-ID: <AANLkTimbBH=VHTzhrutw3pQvSpr0m38ehroYRRWcVa1C@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.213.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Commit for the release
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
X-List-Received-Date: Mon, 22 Nov 2010 06:19:45 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 21, 2010 at 10:10 AM, Philip Balister <philip@balister.org> wro=
te:
> On 11/20/2010 11:53 PM, Khem Raj wrote:
>>
>> On Fri, Nov 19, 2010 at 7:01 PM, Philip Balister<philip@balister.org>
>> =C2=A0wrote:
>>>
>>> Khem, I'd like this commit to go into the release branch. Any objection=
s?
>>>
>>>
>>> http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=3Dc59afd9=
fd456766c473c4fb7f7cc4db3e8623c39
>>>
>>
>> Looks good to me. Do you want me to cherry pick it ?
>
> Yes. Along with 8d91e8a1b6876c6b07cabbd94439eb9bdc295d87 (Thanks Eric).
>
> Khem, have you thought about reviewing dev and merging from it, as long a=
s
> there are no major changes? I'm concerned we may miss some commits that n=
eed
> to go in the release TAG.

yes I am looking at it constantly and pulling in changes that
are needed as per me and I expect other devs to propose the
changes too as they understand will be needed to release branch

>
> Philip
>
>>
>>> Philip
>>>
>>> _______________________________________________
>>> Openembedded-devel mailing list
>>> Openembedded-devel@lists.openembedded.org
>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>>
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


