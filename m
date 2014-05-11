Return-Path: <otavio.salvador@gmail.com>
X-Greylist: delayed 300 seconds by postgrey-1.34 at layers.openembedded.org;
	Sun, 11 May 2014 23:08:10 UTC
Received: from mail-yk0-f174.google.com (unknown [209.85.160.174])
	by mail.openembedded.org (Postfix) with ESMTP id 4491765FE3
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 11 May 2014 23:08:10 +0000 (UTC)
Received: by mail-yk0-f174.google.com with SMTP id 9so5313043ykp.5
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 11 May 2014 16:08:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=+suOfI64qui9oJN/EcKeoavlHSesBbG1vGemE5UGAbI=;
	b=tvyRAMQXGqCgsVj/PMMabiJSkIOw5Sxh7E6fjaS6MOf9P/Pz1eyE2W1LgCzqg12kiZ
	ZSkRlHnMboSWg6KZ0F3O3SwK1wloST5npV3sQEFGHIOVJODh8nAI+TvO5LAHGwu5KNpc
	6e3taWIgn1TSGUHp09jLY+v1TLOjRVGHPk1rFK8tUNidk2KrilRZjY3ICvDJ4c7+vUaI
	Gp+MJfaILp0ImUCRgNuor/1x7NdbfjQJCtqoEcBqOsLtWOY2d+IBcq1gYv9h669YxmoL
	oKlLiPhiZLZHKQcTTTyqtNtYe/6boswmxQTtbW3phxl8jqt5IzJk03GwVIY5fam9d5ee
	9PVQ==
MIME-Version: 1.0
X-Received: by 10.236.198.243 with SMTP id v79mr35909230yhn.87.1399849391130; 
	Sun, 11 May 2014 16:03:11 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.170.166.213 with HTTP; Sun, 11 May 2014 16:03:10 -0700 (PDT)
In-Reply-To: <536A7C42.6030502@balister.org>
References: <20140430143741.GL2486@jama>
	<CAFeBWL5HuWex48xB_JZX_C7RMhzgfH93=AVJAkO7Qk7DUToFxg@mail.gmail.com>
	<20140505164514.GM2486@jama> <536A7C42.6030502@balister.org>
Date: Sun, 11 May 2014 20:03:10 -0300
X-Google-Sender-Auth: bmrJdC-zLwDNg5N1cIGh6-hk2M8
Message-ID: <CAP9ODKp==v+uOyjYbEFuBx0k16+BnmiNZGr2+HAXqAu_CZ+Jtw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: daisy branch for meta-openembedded, meta-qt5 / maintainer wanted
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
X-List-Received-Date: Sun, 11 May 2014 23:08:16 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, May 7, 2014 at 3:32 PM, Philip Balister <philip@balister.org> wrote:
> On 05/05/2014 09:45 AM, Martin Jansa wrote:
>> On Mon, May 05, 2014 at 09:32:04AM -0700, Adam Lee wrote:
>>> Hi JaMa, what does it take to be a maintainer?
>>>
>>> Do I need to build check all the packages everyday?
>>
>> Definitely no everyday, there are more patches coming in just after the
>> release, but later it's something like 1-5 patches in month.
>>
>> So it doesn't need much time, but it's always good when it's done by
>> someone else then master maintainer (to setup separate builds etc).
>>
>> Possibly more time is spent on watching the ML, because many people
>> don't read README file and instead of following the proper procedure for
>> backports to relase branches they just say somewhere in ML "BTW: also
>> merge this to dora".
>>
>> You can also have some co-maintainer if you find way to split the work
>> without duplicating it.
>
> Adam,
>
> I'd be glad to help scan the list for backport requests.

Me too.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

