Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f43.google.com (mail-yh0-f43.google.com
	[209.85.213.43])
	by mail.openembedded.org (Postfix) with ESMTP id BE04165DA3
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 11 Oct 2014 15:53:44 +0000 (UTC)
Received: by mail-yh0-f43.google.com with SMTP id f73so2557322yha.2
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 11 Oct 2014 08:53:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=/XOeyxOg1yLhBwgQ6EUiYDKUH+WvQctzJWDMcL9WSEM=;
	b=mgcldBftVhY2IinJY6S0Hv63B6OWdeOYPAv/LzyB6eaGeDg1VT5cPrVVZ7Mzc08zlB
	HKwDn4Ip+8qQA0Sv80vJv3fm9taUOtO3A5g7W8NksGNp/MwMNcCG5Pr6k55+3T9o+wVf
	scfusxbY8ABox1WLPoDSDtJKruUIqaYburwhkTHqOD4ALj1GGt2S/kEUYoI4oDxKV4/h
	CBT5Pare6B1K3T4rumoZaD24ChzZrBMNNxPt5HukYs964WNRAj0GwWr5XwSW9dgox68g
	9QITnDQyJZuiSG4VVUwk5CWJDjqSAdRTfN5kkv/yBtLTAWq9CWGBGteJzykt+XeXNwGL
	7eOg==
MIME-Version: 1.0
X-Received: by 10.236.200.165 with SMTP id z25mr18697229yhn.102.1413042825336; 
	Sat, 11 Oct 2014 08:53:45 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.170.172.70 with HTTP; Sat, 11 Oct 2014 08:53:45 -0700 (PDT)
In-Reply-To: <20141010214424.GA3000@jama>
References: <543810C5.9030502@windriver.com>
	<20141010214424.GA3000@jama>
Date: Sat, 11 Oct 2014 12:53:45 -0300
X-Google-Sender-Auth: i5lFIGCmM4Uxi6B74bsOGL7LMlk
Message-ID: <CAP9ODKrGx=QsmXSJuTNBgzjN-PgDGs3=rtqpLu7inBdUEzfP3g@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>
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
X-List-Received-Date: Sat, 11 Oct 2014 15:53:56 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Oct 10, 2014 at 6:44 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
> On Sat, Oct 11, 2014 at 01:00:53AM +0800, Robert Yang wrote:
>> Hello,
>>
>> When will the meta-openembedded have a dizzy branch, please ?
>
> It would be nice to get at least some of QA issues fixed before we
> branch. Currently we have more than 438 issues.

I agree we ought to fix the QA issues but this shouldn't delay the
branching; we can backport those fixes once proved fine on master.

> But other than that, it's almost ready (thanks Otavio + Armin for
> stepping up to maintain it), please send the READMEs update again when
> you can, so that I can create the branch together with right READMEs.

Armin, do you want to do the patch and add my name? or should I do and
add yours? Two patches seems overkill :)

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

