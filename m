Received: from mail-ob0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1UcExT-0003kZ-5I
	for openembedded-devel@lists.openembedded.org;
	Tue, 14 May 2013 15:08:03 +0200
Received: by mail-ob0-f175.google.com with SMTP id wd6so482057obb.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 May 2013 05:49:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=JB6n3/GA3YMWSiZ909LoLvONxkYrLow7mhzKid36T9c=;
	b=oAroHmXIkm68xi8mxeoYpvgTdyxpNUBA4NMFhQrvn5xVbuJjviK2RUcvEehyTQux5x
	Drr1MB7K4RkIZ+DDqSdokrZwuHk2Tf5ZRC1ZlKh2wqnG+Dme1eBjQADP9DyGo9WCXHVz
	JvmSLffFEHByMAkfyC/zFe02774XN1yaopOdwLdkB+eXt+1yNIpDEeYrPbo2soNJzdqH
	D2uZTu2xjObOg4NSOHIJJ8S/6YHPtkiWr7XP8UT2sw6d7ZjOyloXTKNwUiHlwiLTgW3y
	efG83tANUJ+X5Ys4CjXJumy0kJC7FrLqXXCe4XNf54RXaPYXRFwNXJa+xLnwI/Z8oIsI
	2SqA==
MIME-Version: 1.0
X-Received: by 10.60.116.3 with SMTP id js3mr14231229oeb.142.1368535786309;
	Tue, 14 May 2013 05:49:46 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.89.226 with HTTP; Tue, 14 May 2013 05:49:46 -0700 (PDT)
In-Reply-To: <CAJTo0LbtaJUfc0j5hcw2H_Xoz8RBS5a=2594E3WCpu2yKSFVmg@mail.gmail.com>
References: <1368481622-5465-1-git-send-email-otavio@ossystems.com.br>
	<20130513215201.GF3187@jama>
	<CAP9ODKpXcX5H6ndoz9ikz+0cUE9RPC7AvvAt8iKD+vHnoqXyqQ@mail.gmail.com>
	<CAJTo0LZ-ng_=n_RcWcdhJY3E4ZgnFUiDCKpgBsLwLbOg6ExjSg@mail.gmail.com>
	<CAP9ODKrKMLrCNhWbO9GMvR9UsN4871gJFQTjsVjZ8thcTr9boQ@mail.gmail.com>
	<CAJTo0LbtaJUfc0j5hcw2H_Xoz8RBS5a=2594E3WCpu2yKSFVmg@mail.gmail.com>
Date: Tue, 14 May 2013 09:49:46 -0300
X-Google-Sender-Auth: kX7JgoFplMWQ6MAsIFiUUmMQ_HU
Message-ID: <CAP9ODKpxALx9dwkK1r9V8Cny9_TDVtbibAcScZc2SWHC6M2k9g@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: Re: [meta-oe PATCH] bigbuckbunny: Add 480p, 720p and 1080p movies
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
X-List-Received-Date: Tue, 14 May 2013 13:08:06 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, May 14, 2013 at 9:37 AM, Burton, Ross <ross.burton@intel.com> wrote:
> On 14 May 2013 12:13, Otavio Salvador <otavio@ossystems.com.br> wrote:
>> On Tue, May 14, 2013 at 6:59 AM, Burton, Ross <ross.burton@intel.com> wrote:
>>> On 13 May 2013 22:56, Otavio Salvador <otavio@ossystems.com.br> wrote:
>>>> I pondered about it but I think it is of generic use. I don't think we
>>>> need to have meta-multimedia to be able to use it.
>> We can add it as well. What about we have these all in:
>>
>> meta-multimedia/recipes-support/media-samples/*?
>>
>> So we can have Big Buck Bunny, Sintel and others here.
>
> Sure.  Have a look at Guacamayo, that has recipes for Sintel and some
> freely distributable music.

Awesome, let's move it to meta-oe so we can share these.

--
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


