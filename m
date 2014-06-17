Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yk0-f170.google.com (mail-yk0-f170.google.com
	[209.85.160.170])
	by mail.openembedded.org (Postfix) with ESMTP id 2B3B76FFAB
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Jun 2014 20:55:14 +0000 (UTC)
Received: by mail-yk0-f170.google.com with SMTP id q9so5652483ykb.15
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Jun 2014 13:55:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:content-type;
	bh=CUNUvbwKHV897RXoHapn0E01nR1bR1tqka5/XrwHnSI=;
	b=vNDbiejnVmHTkJ1Rj7JiAep3p8ylV7xuLbjNLpaBdw862r3A8qtHkcyKuIfMv/WPZm
	77NyHVtHYYL1gdK3rii1AcO56J6mU7c6mSCAL8Jz0dfDqBHZcofmyjSX2ofCzeZclsmu
	GQVtNd9RZB+YFyey4TudNRsuGhaXs6lqOw4cS+UnQnLskl8PhD5ZkVtZW9Q/mS+qy0Ha
	0DTqrkxp6XSt9bR75XwJyws7BW44qvCStzdGGipPIsui8dtdFTca5yeBmfbv8HK6JLwL
	PQkMPOcY3YJ/APcFGY2aTw5xV6zyr3EAQBwO/HhC7Yx2FBPbjv1PrxlkPV3qnOBaMad2
	Fc2w==
MIME-Version: 1.0
X-Received: by 10.236.74.33 with SMTP id w21mr47282254yhd.87.1403038514735;
	Tue, 17 Jun 2014 13:55:14 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.170.209.68 with HTTP; Tue, 17 Jun 2014 13:55:14 -0700 (PDT)
In-Reply-To: <20140616134850.GP2428@jama>
References: <20140430143741.GL2486@jama>
	<CAFeBWL5HuWex48xB_JZX_C7RMhzgfH93=AVJAkO7Qk7DUToFxg@mail.gmail.com>
	<20140505164514.GM2486@jama> <536A7C42.6030502@balister.org>
	<20140511145337.GE22774@jama> <20140616134850.GP2428@jama>
Date: Tue, 17 Jun 2014 17:55:14 -0300
X-Google-Sender-Auth: 9iE29ihitC4bNWS8B3D6Qm0iMp0
Message-ID: <CAP9ODKr8=FnXhWranpckyRrPrHzpfCW-fYLxF4S1o_7sYRMFVA@mail.gmail.com>
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
X-List-Received-Date: Tue, 17 Jun 2014 20:55:22 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Jun 16, 2014 at 10:48 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> On Sun, May 11, 2014 at 04:53:37PM +0200, Martin Jansa wrote:
>> On Wed, May 07, 2014 at 11:32:34AM -0700, Philip Balister wrote:
>> > On 05/05/2014 09:45 AM, Martin Jansa wrote:
>> > > On Mon, May 05, 2014 at 09:32:04AM -0700, Adam Lee wrote:
>> > >> Hi JaMa, what does it take to be a maintainer?
>> > >>
>> > >> Do I need to build check all the packages everyday?
>> > >
>> > > Definitely no everyday, there are more patches coming in just after the
>> > > release, but later it's something like 1-5 patches in month.
>> > >
>> > > So it doesn't need much time, but it's always good when it's done by
>> > > someone else then master maintainer (to setup separate builds etc).
>> > >
>> > > Possibly more time is spent on watching the ML, because many people
>> > > don't read README file and instead of following the proper procedure for
>> > > backports to relase branches they just say somewhere in ML "BTW: also
>> > > merge this to dora".
>> > >
>> > > You can also have some co-maintainer if you find way to split the work
>> > > without duplicating it.
>> >
>> > Adam,
>> >
>> > I'd be glad to help scan the list for backport requests.
>>
>> Can one of you send README update patch?
>
> There are first few backport requests and we still don't have official
> daisy maintainer and README update.

I didn't find any. Or are you preparing a list to send?

> Can anyone please volunteer and send README update patch?

Is anyone willing to take it? I can help but I don't want to be the only one.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

