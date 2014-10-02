Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-yh0-f48.google.com (mail-yh0-f48.google.com
	[209.85.213.48])
	by mail.openembedded.org (Postfix) with ESMTP id 1726D6FD16
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  2 Oct 2014 07:25:15 +0000 (UTC)
Received: by mail-yh0-f48.google.com with SMTP id v1so489947yhn.21
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 02 Oct 2014 00:25:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=pQkMCOc1SodPqdUZfIuZn9CrMQK+XC8SKBUJosLuZUk=;
	b=YEELzRVANVuiL7akbLfAt8lQfG1CgPzDtlEyC9oVDbS/M3TGOjV6DtIW5rzs4/bMzp
	X+fcxwqnqUZEbr6gE7ynXqjOeC6kiRznEABWMF/nZk9GJdvr3uXffkNnyYEjVRTVdjCe
	YYrTPfHUwXwXO44XIJ2t+f8XuhGlSJ8Tw/CbFyp+3Y0g7IZM6dX/hS+IKTq9OR5nBteo
	nT9MIX5C+oojtJycMhUjw7hYnjEq+mCBfeiM3goDsscRx4MZxIgVvKVw4ZmxUrXdB83S
	tp0YPU1g5zB7qsSqMxe5hTpiRiy3VWuLCd2nWjfLeZTxqoXIcPtYcCHz5lOrLunT+xoc
	HOSA==
MIME-Version: 1.0
X-Received: by 10.220.111.73 with SMTP id r9mr45827915vcp.20.1412234716182;
	Thu, 02 Oct 2014 00:25:16 -0700 (PDT)
Received: by 10.52.171.233 with HTTP; Thu, 2 Oct 2014 00:25:16 -0700 (PDT)
In-Reply-To: <CADHREMC7m2Pwdhvq3tytSiwahaPF=Vf_q5dNio27PAw-meGFTQ@mail.gmail.com>
References: <CADHREMC7m2Pwdhvq3tytSiwahaPF=Vf_q5dNio27PAw-meGFTQ@mail.gmail.com>
Date: Thu, 2 Oct 2014 09:25:16 +0200
Message-ID: <CALbNGRS1JF1NwQq=JKUKDJhA5H49Ga-EYC-zwFZSNC4ABdY-Ww@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: James Bober <tartarus37@gmail.com>, 
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: gphoto2 & libgphoto2 for the Intel Edison
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
X-List-Received-Date: Thu, 02 Oct 2014 07:25:21 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Oct 1, 2014 at 11:27 PM, James Bober <tartarus37@gmail.com> wrote:
> Dear Sir,
> I am attempting to incorporate gphoto2 and libgphoto2 on my newly-acquired
> Intel Edison. I discovered an appropriate package for libgphoto2 here:
>
> https://github.com/openembedded/meta-oe/tree/master/meta-oe/recipes-graphics/gphoto2
>
> but nothing for the command line client, gphoto2.
>
> I am rather new at working with the Edison, so any help and insights would
> be much appreciated.
>
> Thanks,
> Jim Bober
> Springfield, VA  USA
Sorry but I have no experience with ghoto2. I forward this to meta-oe
mailing list (which is the place for questions like this).

Andreas

