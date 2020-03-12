Return-Path: <nick83ola@gmail.com>
Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com
	[209.85.167.66])
	by mail.openembedded.org (Postfix) with ESMTP id 051F46010F
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Mar 2020 08:51:08 +0000 (UTC)
Received: by mail-lf1-f66.google.com with SMTP id b186so4006298lfg.11
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Mar 2020 01:51:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=6M/hl0gXu2NRruaJrC6u/BBzQj7CnUJjrWgrpRjpLHc=;
	b=szEfXLUTKAC3JJdr57AZxKoOM7eIK7pJ+waz4EzkNRK81kTC5aG38ZS9hLDHYpvrVs
	SG78KHpT7nwILT5C9VWx/OwKCyqS39FpPPQAE4IcBsCv8BPn1nMxyD5EN0K5Bl/HWSzW
	TkW1ZBCmw9wKJj9SZxnqovn05Oq8kr40UpkEeQ77m7KoQDE99n9k0L7jUfoct0fXXz76
	szN0wYsZzYNAyUUSjDTLHO4WZBCgN4cof2c26KO/ld1y5bK5nUBmYaroFGIrQKEvzSnb
	Y8tJDZhM9uBR04dMKZezoR0cNN7m1Ba3fWyvzc+oOq2uT9+IRgLBkiW4GR6sjoBlSqXf
	Ed+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=6M/hl0gXu2NRruaJrC6u/BBzQj7CnUJjrWgrpRjpLHc=;
	b=dhSfYT4oo+lZJV5SfugHTc3ACIC42M/UhBimYlCbSuDoMe6jzprcMsY9VjdZIG0kNI
	+sKyaFhh32T3Z3NVktnd1+vPC+nYOcqmzcUhUle4X9/wcxoIIESiCgH1RL+cMJlrIZiH
	TFIK1Sdksg4csLM4POe78yujo0bRgYBpnoXFpyS1tuDG1cxSu3Cpo9smt3vxbNYUyVwy
	nDwrrxEUYsy6nXFliERvdDDjHPgUp0B6TTd0G6C1B+VPIfYXUpfv053WyJfSRmpqro8n
	jAv/YUWWqQ022xcs5bHPmuOxGwEgf0G/AAxnIjikS6RKQ8poBvZghaNRZ917/CLpzmDS
	5SSA==
X-Gm-Message-State: ANhLgQ07JyNhlxlY5IjH2TAfVws4lhV5RNVsDLxyBVZ9S/CAqWRYKWnD
	EkhPEVB0IM9/LglNYLCSFKXlueF0ngcukJ9k+ONME0ID
X-Google-Smtp-Source: ADFU+vvaOwxqBQ9WDw8ciTlhN44GFlSLu0vvAF1tJ+URKi7EeeXySp4PKEoKjEeei95g6F8p+hM6879alFG4n6j3XUM=
X-Received: by 2002:a05:6512:10cf:: with SMTP id
	k15mr4848055lfg.142.1584003068857; 
	Thu, 12 Mar 2020 01:51:08 -0700 (PDT)
MIME-Version: 1.0
References: <20200311070359.18480-1-nick83ola@gmail.com>
	<CANx9H-Ctq14Tj8DyHnN3-X3bB=8XXncAQiiVhRiALtLW4Rszjg@mail.gmail.com>
In-Reply-To: <CANx9H-Ctq14Tj8DyHnN3-X3bB=8XXncAQiiVhRiALtLW4Rszjg@mail.gmail.com>
From: nick83ola <nick83ola@gmail.com>
Date: Thu, 12 Mar 2020 08:50:57 +0000
Message-ID: <CABPh3UNyYWiP0pVLkDG_738E+wCxQ38-kgogg5LX00LUnadd4g@mail.gmail.com>
To: Tim Orling <ticotimo@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>,
	Parthiban Nallathambi <parthitce@gmail.com>
Subject: Re: [meta-python][PATCH 1/3] python3-cycler: add recipe for 0.10.0
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 12 Mar 2020 08:51:09 -0000
Content-Type: text/plain; charset="UTF-8"

Hi TIm,
nice work I'll have a look into it

Thanks for sharing
Nick


On Wed, 11 Mar 2020 at 14:47, Tim Orling <ticotimo@gmail.com> wrote:
>
> FWIW, I had made significant progress towards getting ptest enabled for Matplotlib, although a bit out of date now [1]. Which included a recipe for cycler. It also unbundled a bunch of dependencies, like libagg.
>
> The ptests do require a fair amount of ram, so standard qemu settings will epically fail.
>
> [1]
> https://git.openembedded.org/meta-openembedded-contrib/log/?h=timo/python-matplotlib-2.1.2-WIP
>
> On Wed, Mar 11, 2020 at 12:04 AM Nicola Lunghi <nick83ola@gmail.com> wrote:
>>
>> This is a dependency for python3-matplotlib
>>
>> Signed-off-by: Nicola Lunghi <nick83ola@gmail.com>
>> ---
>>  .../python/python3-cycler_0.10.0.bb              | 16 ++++++++++++++++
>>  1 file changed, 16 insertions(+)
>>  create mode 100644 meta-python/recipes-devtools/python/python3-cycler_0.10.0.bb
>>
>> diff --git a/meta-python/recipes-devtools/python/python3-cycler_0.10.0.bb b/meta-python/recipes-devtools/python/python3-cycler_0.10.0.bb
>> new file mode 100644
>> index 000000000..cd21be8ac
>> --- /dev/null
>> +++ b/meta-python/recipes-devtools/python/python3-cycler_0.10.0.bb
>> @@ -0,0 +1,16 @@
>> +SUMMARY = "Composable style cycles"
>> +HOMEPAGE = "http://github.com/matplotlib/cycler"
>> +LICENSE = "BSD"
>> +LIC_FILES_CHKSUM = "file://LICENSE;md5=7713fe42cd766b15c710e19392bfa811"
>> +
>> +SRC_URI[md5sum] = "4cb42917ac5007d1cdff6cccfe2d016b"
>> +SRC_URI[sha256sum] = "cd7b2d1018258d7247a71425e9f26463dfb444d411c39569972f4ce586b0c9d8"
>> +
>> +inherit pypi setuptools3
>> +
>> +RDEPENDS_${PN} += "\
>> +    python3-core \
>> +    python3-six \
>> +"
>> +
>> +BBCLASSEXTEND = "native nativesdk"
>> --
>> 2.20.1
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

