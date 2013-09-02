Return-Path: <cazfi74@gmail.com>
Received: from mail-vb0-f42.google.com (mail-vb0-f42.google.com
	[209.85.212.42])
	by mail.openembedded.org (Postfix) with ESMTP id 213B66BEF8
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  2 Sep 2013 23:38:21 +0000 (UTC)
Received: by mail-vb0-f42.google.com with SMTP id e12so3559583vbg.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 02 Sep 2013 16:38:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=IRGQ2+ET+WOTWdEmKsntTgzT9qsBvRBgC8er5w9e9Y0=;
	b=UzvSLORj5aBf4tQeT7fxWatvnSj84GzIDbWPherTQIkNRYo9fn8Oqhh/H9wa+GibLT
	m3/fK0Z8wNa5tgBqQ/v/rQxkOszEGuiVLuOuMGb8zzyZK6GEqyQ5nnDxFfk2eooWh/CM
	Pa+ktEYu11Hjun7GOnjutsMh/xK3OiE0v3TADazTZMvUXdNNKs9KnrLEJUwW+dSydioV
	Unro4UvABEGmDSDJ+Y2/cT8FsgAx3gSTH9YaIweAp0yx0VBJOt/t6dWuO+UxEVhsytwt
	tUzgic0FDx9rIay2pf4WLcq2/2CnGHQJq2N3eh3VFgt3ISrRz6WMuH++SgE8LuGyunAi
	o9rA==
MIME-Version: 1.0
X-Received: by 10.52.119.228 with SMTP id kx4mr316043vdb.12.1378165100849;
	Mon, 02 Sep 2013 16:38:20 -0700 (PDT)
Received: by 10.58.86.69 with HTTP; Mon, 2 Sep 2013 16:38:20 -0700 (PDT)
In-Reply-To: <20130829182913.GQ3544@jama>
References: <cover.1377791377.git.Martin.Jansa@gmail.com>
	<ce667a200941cb8764ff7ce563650571fc3b3378.1377791377.git.Martin.Jansa@gmail.com>
	<CAF6bG8e1DwCb-59==JnD5jgwWbND2SRiSo=WPXC-673jvLQ00Q@mail.gmail.com>
	<20130829182913.GQ3544@jama>
Date: Tue, 3 Sep 2013 02:38:20 +0300
Message-ID: <CAF6bG8cNn0YOyDMiceqnYu98+sSFNTm52UGXFV8qNEW=dWd-DQ@mail.gmail.com>
From: Marko Lindqvist <cazfi74@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [WIP][PATCH 02/66] libmikmod: upgrade to 3.2.0
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
X-List-Received-Date: Mon, 02 Sep 2013 23:38:22 -0000
Content-Type: text/plain; charset=UTF-8

On 29 August 2013 21:29, Martin Jansa <martin.jansa@gmail.com> wrote:
> On Thu, Aug 29, 2013 at 07:27:54PM +0300, Marko Lindqvist wrote:
>> On 29 August 2013 18:50, Martin Jansa <martin.jansa@gmail.com> wrote:
>> > * 3.3 is only beta
>> > * 3.1.12 was failing to build with texinfo-5, see
>> >   http://sourceforge.net/p/mikmod/mercurial/ci/1fd17189f82561a3a0e343aef05e5cf0b39b8f26/
>>
>>  As libSDL-mixer dependency, and thus recursive dependency for many
>> recipes in meta-games, this is important for me. In my local tree I've
>> solved the build issue by simply patching doc building part away. Let
>> me know if you want that patch (say, to go in to stable branch instead
>> of full version upgrade)
>
> I was thinking about it, but if you confirm that 3.2.0 doesn't break any
> of your games I'm fine with it.

 Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>


 - ML

