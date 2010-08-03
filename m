Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OgK1J-0004gi-0b
	for openembedded-devel@lists.openembedded.org;
	Tue, 03 Aug 2010 18:07:14 +0200
Received: by bwz10 with SMTP id 10so2408243bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 03 Aug 2010 09:07:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=eEMoTaVrOEbky75PLbEm0FDAhd/+JsW0OJMraqF7IuE=;
	b=SMaxdNVFWUFHylC+3IpzWzMCa1XzNQ3POzRv7ssvt+D6vf38MXEsnqDUdAkhEFfy/h
	ompiK69zYz2XOdL2Ffkdfi3UBYMXz7EgpbROOsxsSW0ttFWIkT88WaHank6cgg0NlFqr
	VPBO8PhQO2v0Ov6iRaaaPG+S0Xtz8ldOb2ZLs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=DOOU+1D413y/fa1lXVsiEPYa+oDmythskCj32u4D4oiCFemXd3MmCa7HgDKXLiTVEo
	b069TBkYgIJJ+Kpfy5bsuj+RDSBUNy48qCVwj2x0y19F7t+qcGC1QtozMv0+gYZTbro0
	QeqdRmfRUOI4mA1rv5ermzhH3B7D0rOTLcHKE=
MIME-Version: 1.0
Received: by 10.204.140.219 with SMTP id j27mr5374133bku.153.1280851626533; 
	Tue, 03 Aug 2010 09:07:06 -0700 (PDT)
Received: by 10.204.60.208 with HTTP; Tue, 3 Aug 2010 09:07:06 -0700 (PDT)
In-Reply-To: <4C583098.5050007@zenlinux.com>
References: <1280808074-13861-1-git-send-email-sgarman@zenlinux.com>
	<AANLkTimKyWgQyN0T6VExcAjE0=M2kuCLvbq-hEYJ70Fc@mail.gmail.com>
	<4C583098.5050007@zenlinux.com>
Date: Tue, 3 Aug 2010 18:07:06 +0200
Message-ID: <AANLkTi=PPJGv=zL6GwUVL78xER7oMTMFuPuy_QK=h=+4@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.47
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [PATCH] tar: Upgrade to v1.23
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
X-List-Received-Date: Tue, 03 Aug 2010 16:07:14 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/8/3 Scott Garman <sgarman@zenlinux.com>

> On 08/02/2010 11:14 PM, Frans Meulenbroeks wrote:
>
>> 2010/8/3 Scott Garman<sgarman@zenlinux.com>
>>
>>  From: Scott Garman<scott.a.garman@intel.com>
>>>
>>> * Addresses CVE-2010-0624
>>>
>>>
>> Please have a look at
>> http://wiki.openembedded.net/index.php/Commit_Policy
>>
>> And especially this section:
>>
>
> Hi Frans,
>
> Thanks for sending me these pointers. However, I'm a bit unclear on what
> needs improvement. The subject line of this patch email corresponds to the
> first line of the commit message, doesn't it?
>
> To go case-by-case:
>
>   * Have a clear commit message (example
>> <http://wiki.openembedded.net/index.php/Commit_log_example>):
>>     - The first line of commit is a summary of the changes.
>>
>
> Which in this case is:
>
> tar: Upgrade to v1.23
>
>      - The first line should start with the name of the recipe the
>> change affects.
>>
>
Ah ofcourse actually that was what I was missing.
Will push it in a few minutes if not done yet.

Frans

