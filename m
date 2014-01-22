Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ob0-f181.google.com (mail-ob0-f181.google.com
	[209.85.214.181])
	by mail.openembedded.org (Postfix) with ESMTP id 1C0D96B389
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Jan 2014 14:34:10 +0000 (UTC)
Received: by mail-ob0-f181.google.com with SMTP id va2so481848obc.40
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Jan 2014 06:34:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=PljVeV0OHnln2DRhVVjAsKrlsznxVD60NSa+VS6OMFE=;
	b=euglZFMrBQoyXx/FAQFgvrNXu9X11R3YHZIQYUZ1X3cIIxsgFUbbnutBG3VYS/pPJz
	iv5PTn0DRHxnz+I3btOajP++5DY5hM14myu8GHZHeGLMHVTQh/DjbAlO8l1T2j54lVro
	V8+o6860+qdNVX7OBGfY3t8E3XZxHu+B3HynYvDtGMHhjWjx20ZCa4OO1dI1s4lGypih
	nzrLZfUmM2iGehLEINxFEHfOEx/8lZIG0qHLvq3cJFjCiBgwDf4kbOz1aJcL8ocfsiBr
	MC9irVS7c/8pOL2cSzjSMeGhyMttA9vzIP51ZPYp4v19HbCf0KEzF+i5m+/CzjH748e5
	wGPg==
MIME-Version: 1.0
X-Received: by 10.182.233.77 with SMTP id tu13mr1549931obc.58.1390401251141;
	Wed, 22 Jan 2014 06:34:11 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.182.232.166 with HTTP; Wed, 22 Jan 2014 06:34:11 -0800 (PST)
In-Reply-To: <CAP9ODKqBucf99MSJphErZw1dsu6CKqGTQzxXrGSVxQbanJ8iSQ@mail.gmail.com>
References: <cover.1389979930.git.paul.eggleton@linux.intel.com>
	<d81dfc5a3416ffd765d53e5ea4089b7f2018d94f.1389979930.git.paul.eggleton@linux.intel.com>
	<CAP9ODKqBucf99MSJphErZw1dsu6CKqGTQzxXrGSVxQbanJ8iSQ@mail.gmail.com>
Date: Wed, 22 Jan 2014 12:34:11 -0200
X-Google-Sender-Auth: HyxFHnDnrUPd99wDJ1wuIuWiXSg
Message-ID: <CAP9ODKqdORh5PieRD6-uWB0zpnV1t_H3G0qoA_PuthakCZQ6OA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Cc: Bruce Ashfield <bruce.ashfield@windriver.com>
Subject: Re: [meta-filesystems][PATCH 1/1] aufs-util: add new recipe
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
X-List-Received-Date: Wed, 22 Jan 2014 14:34:10 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Jan 22, 2014 at 12:31 PM, Otavio Salvador
<otavio@ossystems.com.br> wrote:
> On Fri, Jan 17, 2014 at 3:36 PM, Paul Eggleton
> <paul.eggleton@linux.intel.com> wrote:
>> Introducing the aufs-util target recipe. This would be used in
>> conjuction with the aufs kernel feature to provide union mounts suitable
>> for live boot applications.
>>
>> Only the target binaries are currently packages, with man pages,
>> libraries and other artifacts skipped in this initial integration.
>>
>> (Integration work done by Bruce Ashfield <bruce.ashfield@windriver.com>
>> and Chen Qi <Qi.Chen@windriver.com> .)
>>
>> Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
>> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>> Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
>
>
> Reviewed-by: Otavio Salvador <otavio@ossystems.com.br>

Too early ... I read Martin and Koen comments and I missed those
improvements. So please ignore my 'review'.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

