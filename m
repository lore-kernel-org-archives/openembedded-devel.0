Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rep.dot.nop@gmail.com>) id 1OLfyM-00082H-R6
	for openembedded-devel@lists.openembedded.org;
	Mon, 07 Jun 2010 19:18:51 +0200
Received: by fxm9 with SMTP id 9so2384867fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 07 Jun 2010 10:14:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:received:date:from:to:cc
	:subject:message-id:references:mime-version:content-type
	:content-disposition:in-reply-to:user-agent;
	bh=8osOHgealqioLXKzZ0jrCiB8/nFj14I7/vXI53E+OF4=;
	b=emMKYLqSneZQkO7nN3f3+bH/NM1uhwERRuT6qo52SVrNKhoiqtwOUrL63lNzWFlrCy
	92cY0hZdqn5llXj/NNvXLHlGeUBcAs0n2ALUVGit5vwTvFGe4BKL/6sFcIvU/tZlK35G
	3VnVxhiFj0cF59Su3EcHOPZS5131txnH+JfDw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=Vz60littyrq3FcyDKiDay9leyHhLuYxGLFNn4IHar8i/KXHGrSJtKBTAWT/5NQDMsZ
	YJ7pqJZ9zO8HWAToqtOO7eJk3vvK5445GE56ETjWC7D7oD/cTUBbtuahAMLsZNNDpF25
	HMzbBnRnGHgWgvyBshfpSD18LQZa8OkMohCsc=
Received: by 10.223.17.150 with SMTP id s22mr15476105faa.14.1275930870732;
	Mon, 07 Jun 2010 10:14:30 -0700 (PDT)
Received: from s42.loc (85-127-91-171.dynamic.xdsl-line.inode.at
	[85.127.91.171])
	by mx.google.com with ESMTPS id y12sm21140820faj.17.2010.06.07.10.14.29
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 07 Jun 2010 10:14:29 -0700 (PDT)
Received: from cow by s42.loc with local (Exim 4.71)
	(envelope-from <rep.dot.nop@gmail.com>)
	id 1OLfuI-000494-M3; Mon, 07 Jun 2010 19:14:38 +0200
Date: Mon, 7 Jun 2010 19:14:38 +0200
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100607171438.GI14941@mx.loc>
References: <1275510896-30845-1-git-send-email-raj.khem@gmail.com>
	<1275510896-30845-8-git-send-email-raj.khem@gmail.com>
	<AANLkTilJ62g8nmoiOrRbKBMDhUs7RtjMNgxwW3ntzink@mail.gmail.com>
	<AANLkTilsZ7Qvc77yWK0hCi9W3yhkxo0f6f7olvxILH7X@mail.gmail.com>
	<20100607141124.GB4570@gmail.com>
	<AANLkTimqgq8R1SX5GVRZCNRiD_PHEGvSznh6b3WqEVuC@mail.gmail.com>
	<AANLkTik72pLFWJcKgQYSTLNl7TRZB4YyFt-yhYCy_uR4@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <AANLkTik72pLFWJcKgQYSTLNl7TRZB4YyFt-yhYCy_uR4@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: rep.dot.nop@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 07/16] grep-2.6.3: Add recipe.
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
X-List-Received-Date: Mon, 07 Jun 2010 17:18:51 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jun 07, 2010 at 04:22:54PM +0200, Jan Paesmans wrote:
>Hi Khem,
>
>Just a wild and stupid idea, could it be that bitbake doesn't take
>dependencies into account for unpacking the source?

unpackers are completely ignored. Look at the default depends:
virtual/coreutils, shasum, stagemanager
Missing feature (and a can of worms, dependency wise; you end up with a
somewhat sane set iff you rely on the unpacker e.g. xz being pre-configured,
autotools-wise. Don't try to use xz_git for such stuff, believe me ;).

>Regards,
>
>Jan
>
>On Mon, Jun 7, 2010 at 4:19 PM, Jan Paesmans <jan.paesmans@gmail.com> wrote:
>> Hi Khem,
>>
>> Updated to latest org.openembedded.dev and tried building the latest
>> grep-native.
>> I added the inherit to gettext but there seems to be something wrong.
>> The new grep bb file needs xz-native.
>> It is specified in the dependencies but for some reason bitbake
>> doesn't take the dependency into account and grep-native fails with a
>> missing xz.
>> First running 'bitbake xz-native' by hand and then running 'bitbake
>> grep-native' succeeds.
>> This indicates that xz-native is indeed the correct dependency but for
>> some reason it is not taken into account.
>>
>> Regards, Jan
>>
>> On Mon, Jun 7, 2010 at 4:11 PM, Khem Raj <raj.khem@gmail.com> wrote:
>>> On (07/06/10 09:35), Jan Paesmans wrote:
>>>> Hi,
>>>> I was having problems with building grep both native and for target on
>>>> our build system.
>>>> Seems that there is a dependency missing on gettext. Adding gettext to
>>>> the inherit directive solves the build failure.
>>>
>>> thanks for report. I will test a fix today.
>>> -Khem
>>>
>>
>
>_______________________________________________
>Openembedded-devel mailing list
>Openembedded-devel@lists.openembedded.org
>http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


