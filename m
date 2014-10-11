Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f47.google.com (mail-pa0-f47.google.com
	[209.85.220.47])
	by mail.openembedded.org (Postfix) with ESMTP id ED22465DA3
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 11 Oct 2014 16:22:37 +0000 (UTC)
Received: by mail-pa0-f47.google.com with SMTP id rd3so3511125pab.34
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 11 Oct 2014 09:22:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=ID1eij7+kvWob6rmqJRRkZPuqyA02sJV3xEdeG+f9V8=;
	b=SFxdHQGmmFhfvug3y6n7mAiOjs+Ua7JFCMYL7dnvC3G0PumZ/SERsdoPVHmLVYk7gj
	tDm7DaUVDulP5tNnNl9FN2/4ZWM8KTNhZLVpsTIrJVp8BCyt3OCIoZqIsCyuDrLrLEtq
	ysOZphNfPdZ6pyXLGmZeQcrVZH0Cx6TYK6UCz1T5fTZUGi57p3NZsD/nCjM+r4Rz/NbV
	SghD5qORZ0gpD2KZxyWNpSjL2vq+TpyTD1t8useOGkWXStmyzvwmnYgJKQbZFRfUKRz7
	VlE1B35GhtU5hgluSyEDH1dME/gjEpgpQG5uxTqnQJF+gR9j5wZC97uRb/upZk09zmMO
	v/0A==
X-Received: by 10.66.119.175 with SMTP id kv15mr12950690pab.30.1413044558703; 
	Sat, 11 Oct 2014 09:22:38 -0700 (PDT)
Received: from ?IPv6:2601:c:9380:601:a46c:f0a0:98a1:8de1?
	([2601:c:9380:601:a46c:f0a0:98a1:8de1])
	by mx.google.com with ESMTPSA id on3sm6508778pdb.71.2014.10.11.09.22.36
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 11 Oct 2014 09:22:37 -0700 (PDT)
Message-ID: <5439594A.1050800@gmail.com>
Date: Sat, 11 Oct 2014 09:22:34 -0700
From: akuster808 <akuster808@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.1.2
MIME-Version: 1.0
To: "otavio@ossystems.com.br >> Otavio Salvador" <otavio@ossystems.com.br>
References: <543810C5.9030502@windriver.com>	<20141010214424.GA3000@jama>
	<CAP9ODKrGx=QsmXSJuTNBgzjN-PgDGs3=rtqpLu7inBdUEzfP3g@mail.gmail.com>
In-Reply-To: <CAP9ODKrGx=QsmXSJuTNBgzjN-PgDGs3=rtqpLu7inBdUEzfP3g@mail.gmail.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	openembedded-devel@lists.openembedded.org
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
X-List-Received-Date: Sat, 11 Oct 2014 16:22:38 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit



On 10/11/2014 08:53 AM, Otavio Salvador wrote:
> On Fri, Oct 10, 2014 at 6:44 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
>> On Sat, Oct 11, 2014 at 01:00:53AM +0800, Robert Yang wrote:
>>> Hello,
>>>
>>> When will the meta-openembedded have a dizzy branch, please ?
>>
>> It would be nice to get at least some of QA issues fixed before we
>> branch. Currently we have more than 438 issues.
>
> I agree we ought to fix the QA issues but this shouldn't delay the
> branching; we can backport those fixes once proved fine on master.
>
>> But other than that, it's almost ready (thanks Otavio + Armin for
>> stepping up to maintain it), please send the READMEs update again when
>> you can, so that I can create the branch together with right READMEs.
>
> Armin, do you want to do the patch and add my name? or should I do and
> add yours? Two patches seems overkill :)

I can do it.

What email do you want me to use?

- Armin

