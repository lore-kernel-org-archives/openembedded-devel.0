Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ig0-f176.google.com (mail-ig0-f176.google.com
	[209.85.213.176])
	by mail.openembedded.org (Postfix) with ESMTP id 5DBE76A9D4
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 11 Oct 2014 18:00:47 +0000 (UTC)
Received: by mail-ig0-f176.google.com with SMTP id hn15so6308192igb.9
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 11 Oct 2014 11:00:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=+28P9lEC00IbxoAkO86OwU2E/OkJuYZV4vhEugI+FwM=;
	b=cSckt2gkb+2nHS52MxjUIxpAQuarnKVP6mRNVFFswEH6kYRC5UaKZPlyiVdUGYGCmQ
	TV2n8F51V3ziy4xaKTMWB+4bHFF7pHsb1wTF1H6bo4rLpv0uavQd047TLJ2r+rfMOeA6
	6ozBeD08q2rTocfHH6D2w3Mie66XmS/mqO35ziIZE7VQvkl762RBkUfl1TeAlouv97wm
	lRKtW/fKdUoPT6PGKVaAQ0nqO7FC+Pf2YPsHwMOnVmFxDea3z6FSeNRiYzPJo3sQPBZ/
	5cbOwZ/PYm9rieSCv0PTveWfy/Hbfi5nJ9e73roHLB1gYf6jSNo96QfVGuMf+EIafQnZ
	VJJw==
MIME-Version: 1.0
X-Received: by 10.43.154.145 with SMTP id le17mr23999279icc.71.1413050448436; 
	Sat, 11 Oct 2014 11:00:48 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.107.130.69 with HTTP; Sat, 11 Oct 2014 11:00:48 -0700 (PDT)
In-Reply-To: <5439594A.1050800@gmail.com>
References: <543810C5.9030502@windriver.com> <20141010214424.GA3000@jama>
	<CAP9ODKrGx=QsmXSJuTNBgzjN-PgDGs3=rtqpLu7inBdUEzfP3g@mail.gmail.com>
	<5439594A.1050800@gmail.com>
Date: Sat, 11 Oct 2014 15:00:48 -0300
X-Google-Sender-Auth: 9fO9QGLlKZa8XOux6PQucoHx4Hk
Message-ID: <CAP9ODKp09D7GoH2GMXtX9ysE=Upep-mUtpmcd2jdsLP2W8ivfw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: akuster808 <akuster808@gmail.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: When will the meta-openembedded have a dizzy branch, please ?
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 11 Oct 2014 18:00:52 -0000
Content-Type: text/plain; charset=UTF-8

On Sat, Oct 11, 2014 at 1:22 PM, akuster808 <akuster808@gmail.com> wrote:
>
>
> On 10/11/2014 08:53 AM, Otavio Salvador wrote:
>>
>> On Fri, Oct 10, 2014 at 6:44 PM, Martin Jansa <martin.jansa@gmail.com>
>> wrote:
>>>
>>> On Sat, Oct 11, 2014 at 01:00:53AM +0800, Robert Yang wrote:
>>>>
>>>> Hello,
>>>>
>>>> When will the meta-openembedded have a dizzy branch, please ?
>>>
>>>
>>> It would be nice to get at least some of QA issues fixed before we
>>> branch. Currently we have more than 438 issues.
>>
>>
>> I agree we ought to fix the QA issues but this shouldn't delay the
>> branching; we can backport those fixes once proved fine on master.
>>
>>> But other than that, it's almost ready (thanks Otavio + Armin for
>>> stepping up to maintain it), please send the READMEs update again when
>>> you can, so that I can create the branch together with right READMEs.
>>
>>
>> Armin, do you want to do the patch and add my name? or should I do and
>> add yours? Two patches seems overkill :)
>
>
> I can do it.
>
> What email do you want me to use?

otavio@ossystems.com.br as usual :)

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

